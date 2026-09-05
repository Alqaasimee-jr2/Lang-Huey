import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:jss3_french/data/jss3_term1_lessons.dart';
import 'package:jss3_french/models/jss3_lesson_model.dart';

void main() {
  group('JSS 3 French Term 1 — Curriculum & Data Integrity Tests', () {
    final lessons = JSS3Term1Lessons.weeks;

    test('Term 1 contains exactly 9 harmonized weekly lessons', () {
      expect(lessons.length, equals(9));
      for (int i = 0; i < lessons.length; i++) {
        expect(lessons[i].weekNumber, equals(i + 1));
        expect(lessons[i].termNumber, equals(1));
      }
    });

    test('Every lesson has at least 4 clear pedagogical objectives', () {
      for (final lesson in lessons) {
        expect(
          lesson.objectives.length,
          greaterThanOrEqualTo(4),
          reason: 'Week ${lesson.weekNumber} must have >= 4 objectives',
        );
        for (final obj in lesson.objectives) {
          expect(obj.trim().isNotEmpty, isTrue);
        }
      }
    });

    test('Every lesson has comprehensive teacher prompts and cultural insights', () {
      for (final lesson in lessons) {
        expect(lesson.teacherFacilitatorPrompt.trim().length, greaterThan(30));
        expect(lesson.culturalInsight.trim().length, greaterThan(30));
        expect(lesson.frenchTitle.trim().isNotEmpty, isTrue);
        expect(lesson.englishSubtitle.trim().isNotEmpty, isTrue);
      }
    });

    test('Every lesson has exactly 8 rich vocabulary items with phonetics and audioKey', () {
      int totalVocab = 0;
      for (final lesson in lessons) {
        expect(lesson.vocabulary.length, equals(8), reason: 'Week ${lesson.weekNumber} vocabulary count');
        totalVocab += lesson.vocabulary.length;
        for (final item in lesson.vocabulary) {
          expect(item.french.trim().isNotEmpty, isTrue);
          expect(item.phonetics.trim().isNotEmpty, isTrue);
          expect(item.english.trim().isNotEmpty, isTrue);
          expect(item.usageNote.trim().isNotEmpty, isTrue);
          expect(item.audioKey.trim().isNotEmpty, isTrue);
        }
      }
      expect(totalVocab, equals(72));
    });

    test('Every lesson has valid interactive exercises with correct indices', () {
      for (final lesson in lessons) {
        expect(lesson.exercises.length, greaterThanOrEqualTo(6));
        for (final ex in lesson.exercises) {
          expect(ex.prompt.trim().isNotEmpty, isTrue);
          if (ex.type == DrillType.singleChoice || ex.type == DrillType.trueFalse || ex.type == DrillType.tapTranslation) {
            expect(ex.options.length, greaterThanOrEqualTo(2));
            expect(ex.correctOptionIndex, greaterThanOrEqualTo(0));
            expect(ex.correctOptionIndex, lessThan(ex.options.length));
          } else if (ex.type == DrillType.pairMatch) {
            expect(ex.pairs, isNotNull);
            expect(ex.pairs!.length, greaterThanOrEqualTo(2));
          } else if (ex.type == DrillType.fillGap) {
            expect(ex.wordBank, isNotNull);
            expect(ex.wordBank!.length, greaterThanOrEqualTo(2));
            expect(ex.correctGapWord, isNotNull);
          }
          expect(ex.explanation.trim().isNotEmpty, isTrue);
        }
      }
    });

    test('Every lesson has evaluation questions with hints and model answers', () {
      for (final lesson in lessons) {
        expect(lesson.evaluation.length, greaterThanOrEqualTo(3));
        for (final eval in lesson.evaluation) {
          expect(eval.question.trim().isNotEmpty, isTrue);
          expect(eval.answer.trim().isNotEmpty, isTrue);
          expect(eval.hint.trim().isNotEmpty, isTrue);
        }
      }
    });

    test('Every lesson has structured homework and grammar notes', () {
      for (final lesson in lessons) {
        expect(lesson.homework.length, greaterThanOrEqualTo(2));
        for (final hw in lesson.homework) {
          expect(hw.category.trim().isNotEmpty, isTrue);
          expect(hw.instruction.trim().isNotEmpty, isTrue);
        }
        expect(lesson.grammarNote.title.trim().isNotEmpty, isTrue);
        expect(lesson.grammarNote.explanation.trim().isNotEmpty, isTrue);
        expect(lesson.grammarNote.examples.length, greaterThanOrEqualTo(3));
      }
    });

    test('All 72 Term 1 MP3 audio assets exist on disk', () {
      for (final lesson in lessons) {
        for (final item in lesson.vocabulary) {
          final audioFile = File('assets/audio/jss3_term1/${item.audioKey}.mp3');
          expect(
            audioFile.existsSync(),
            isTrue,
            reason: 'Audio asset missing: assets/audio/jss3_term1/${item.audioKey}.mp3',
          );
        }
      }
    });

    test('All 5 core sound effects exist on disk', () {
      final sfx = ['click', 'correct', 'incorrect', 'celebrate', 'whoosh'];
      for (final s in sfx) {
        final f = File('assets/audio/sfx_$s.mp3');
        expect(f.existsSync(), isTrue, reason: 'SFX missing: assets/audio/sfx_$s.mp3');
      }
    });

    test('Pattern types map correctly to all 9 weeks', () {
      final expectedPatterns = [
        JSS3PatternType.personDescriptionStudio,
        JSS3PatternType.landscapesLandmarksStudio,
        JSS3PatternType.habitsAndRoutineStudio,
        JSS3PatternType.pastMemoriesStudio,
        JSS3PatternType.objectDescriptionStudio,
        JSS3PatternType.comparisonSuperlativesStudio,
        JSS3PatternType.datingTimeMeasurementStudio,
        JSS3PatternType.dayChronologicalNarrativeStudio,
        JSS3PatternType.term1RevisionRally,
      ];

      for (int i = 0; i < lessons.length; i++) {
        expect(lessons[i].patternType, equals(expectedPatterns[i]));
      }
    });
  });
}
