import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:jss3_french/data/jss3_term2_lessons.dart';
import 'package:jss3_french/models/jss3_lesson_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('JSS 3 French Term 2 (Deuxième Trimestre) — Curriculum & Audio Integrity Tests', () {
    test('Term 2 has exactly 9 high-impact instructional and revision weeks', () {
      expect(JSS3Term2Lessons.weeks.length, equals(9));
      for (int i = 0; i < 9; i++) {
        expect(JSS3Term2Lessons.weeks[i].weekNumber, equals(i + 1));
        expect(JSS3Term2Lessons.weeks[i].termNumber, equals(2));
      }
    });

    test('Every lesson has at least 4 pedagogical objectives and cultural insight', () {
      for (final lesson in JSS3Term2Lessons.weeks) {
        expect(
          lesson.objectives.length,
          greaterThanOrEqualTo(4),
          reason: 'Week ${lesson.weekNumber} must have >= 4 objectives',
        );
        expect(
          lesson.culturalInsight.trim().isNotEmpty,
          isTrue,
          reason: 'Week ${lesson.weekNumber} must have a cultural insight note',
        );
        expect(
          lesson.teacherFacilitatorPrompt.trim().isNotEmpty,
          isTrue,
          reason: 'Week ${lesson.weekNumber} must have a teacher facilitator prompt',
        );
      }
    });

    test('Every lesson has exactly 8 rich vocabulary items with valid phonetics & audio keys', () {
      for (final lesson in JSS3Term2Lessons.weeks) {
        expect(
          lesson.vocabulary.length,
          equals(8),
          reason: 'Week ${lesson.weekNumber} must have exactly 8 vocabulary items',
        );
        for (final item in lesson.vocabulary) {
          expect(item.french.trim().isNotEmpty, isTrue);
          expect(item.phonetics.trim().isNotEmpty, isTrue);
          expect(item.english.trim().isNotEmpty, isTrue);
          expect(item.usageNote.trim().isNotEmpty, isTrue);
          expect(item.audioKey.trim().isNotEmpty, isTrue);
        }
      }
    });

    test('All 72 Term 2 neural audio MP3 assets exist on disk in assets/audio/jss3_term2/', () {
      const audioDir = 'assets/audio/jss3_term2';
      int verifiedCount = 0;

      for (final lesson in JSS3Term2Lessons.weeks) {
        for (final item in lesson.vocabulary) {
          final file = File('$audioDir/${item.audioKey}.mp3');
          expect(
            file.existsSync(),
            isTrue,
            reason: 'Audio asset missing: ${file.path}',
          );
          expect(
            file.lengthSync(),
            greaterThan(500),
            reason: 'Audio file too small: ${file.path}',
          );
          verifiedCount++;
        }
      }

      expect(verifiedCount, equals(72));
    });

    test('Every lesson has valid multiple-choice interactive exercises with explanations', () {
      for (final lesson in JSS3Term2Lessons.weeks) {
        expect(
          lesson.exercises.length,
          greaterThanOrEqualTo(4),
          reason: 'Week ${lesson.weekNumber} must have >= 4 exercises',
        );
        for (final ex in lesson.exercises) {
          expect(ex.prompt.trim().isNotEmpty, isTrue);
          expect(ex.options.length, greaterThanOrEqualTo(3));
          expect(ex.correctOptionIndex, greaterThanOrEqualTo(0));
          expect(ex.correctOptionIndex, lessThan(ex.options.length));
          expect(ex.explanation.trim().isNotEmpty, isTrue);
        }
      }
    });

    test('Every lesson has evaluation questions with hints and model answers', () {
      for (final lesson in JSS3Term2Lessons.weeks) {
        expect(
          lesson.evaluation.length,
          greaterThanOrEqualTo(3),
          reason: 'Week ${lesson.weekNumber} must have >= 3 evaluation questions',
        );
        for (final eval in lesson.evaluation) {
          expect(eval.question.trim().isNotEmpty, isTrue);
          expect(eval.answer.trim().isNotEmpty, isTrue);
          expect(eval.hint.trim().isNotEmpty, isTrue);
        }
      }
    });

    test('Every lesson has structured homework and comprehensive grammar notes', () {
      for (final lesson in JSS3Term2Lessons.weeks) {
        expect(
          lesson.homework.length,
          greaterThanOrEqualTo(2),
          reason: 'Week ${lesson.weekNumber} must have >= 2 homework tasks',
        );
        expect(lesson.grammarNote.title.trim().isNotEmpty, isTrue);
        expect(lesson.grammarNote.explanation.trim().isNotEmpty, isTrue);
        expect(lesson.grammarNote.examples.length, greaterThanOrEqualTo(2));
      }
    });

    test('Pattern types map correctly to all 9 Term 2 weeks', () {
      final expectedPatterns = [
        JSS3PatternType.narratingPastEventsStudio,
        JSS3PatternType.recentEventsVenirDeStudio,
        JSS3PatternType.diaryAndNarrativeStudio,
        JSS3PatternType.nearFutureIntentionsStudio,
        JSS3PatternType.futurePlansAndAspirationsStudio,
        JSS3PatternType.term2ConsolidationStudio,
        JSS3PatternType.beceGrammarPrepStudio,
        JSS3PatternType.beceVocabEssayPrepStudio,
        JSS3PatternType.term2RevisionRally,
      ];

      for (int i = 0; i < 9; i++) {
        expect(
          JSS3Term2Lessons.weeks[i].patternType,
          equals(expectedPatterns[i]),
          reason: 'Week ${i + 1} pattern mismatch',
        );
      }
    });
  });
}
