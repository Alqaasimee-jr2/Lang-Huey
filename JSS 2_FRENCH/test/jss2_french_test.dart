import 'package:flutter_test/flutter_test.dart';
import 'package:jss2_french/data/jss2_term1_lessons.dart';
import 'package:jss2_french/data/jss2_term2_lessons.dart';
import 'package:jss2_french/models/jss2_lesson_model.dart';

void main() {
  group('JSS2 French Term 1 Curriculum Integrity Tests', () {
    test('Term 1 must contain exactly 9 lessons (8 instructional + 1 revision rally)', () {
      expect(JSS2Term1Lessons.weeks.length, 9);
      for (int i = 0; i < 9; i++) {
        expect(JSS2Term1Lessons.weeks[i].weekNumber, i + 1);
        expect(JSS2Term1Lessons.weeks[i].termNumber, 1);
      }
    });

    test('Every Term 1 lesson has at least 4 pedagogical objectives and cultural insights', () {
      for (final lesson in JSS2Term1Lessons.weeks) {
        expect(lesson.objectives.length >= 4, isTrue, reason: 'Week ${lesson.weekNumber} must have >= 4 objectives');
        expect(lesson.culturalInsight.isNotEmpty, isTrue);
        expect(lesson.teacherFacilitatorPrompt.isNotEmpty, isTrue);
      }
    });

    test('Every Term 1 lesson has rich vocabulary with phonetics and non-empty audioKey', () {
      for (final lesson in JSS2Term1Lessons.weeks) {
        expect(lesson.vocabulary.isNotEmpty, isTrue);
        for (final v in lesson.vocabulary) {
          expect(v.french.isNotEmpty, isTrue);
          expect(v.phonetics.isNotEmpty, isTrue);
          expect(v.english.isNotEmpty, isTrue);
          expect(v.audioKey.isNotEmpty, isTrue);
        }
      }
    });

    test('Every Term 1 lesson has interactive exercises with valid correctOptionIndex', () {
      for (final lesson in JSS2Term1Lessons.weeks) {
        expect(lesson.exercises.isNotEmpty, isTrue);
        for (final ex in lesson.exercises) {
          expect(ex.prompt.isNotEmpty, isTrue);
          expect(ex.options.length >= 2, isTrue);
          expect(ex.correctOptionIndex >= 0 && ex.correctOptionIndex < ex.options.length, isTrue);
          expect(ex.explanation.isNotEmpty, isTrue);
        }
      }
    });

    test('Every Term 1 lesson has evaluation questions and comprehensive grammar note', () {
      for (final lesson in JSS2Term1Lessons.weeks) {
        expect(lesson.evaluation.isNotEmpty, isTrue);
        for (final eq in lesson.evaluation) {
          expect(eq.question.isNotEmpty, isTrue);
          expect(eq.answer.isNotEmpty, isTrue);
          expect(eq.hint.isNotEmpty, isTrue);
        }
        expect(lesson.grammarNote.title.isNotEmpty, isTrue);
        expect(lesson.grammarNote.explanation.isNotEmpty, isTrue);
        expect(lesson.grammarNote.examples.isNotEmpty, isTrue);
      }
    });
  });

  group('JSS2 French Term 2 Curriculum Integrity Tests', () {
    test('Term 2 must contain exactly 9 lessons (8 instructional + 1 revision rally)', () {
      expect(JSS2Term2Lessons.weeks.length, 9);
      for (int i = 0; i < 9; i++) {
        expect(JSS2Term2Lessons.weeks[i].weekNumber, i + 1);
        expect(JSS2Term2Lessons.weeks[i].termNumber, 2);
      }
    });

    test('Every Term 2 lesson has at least 4 pedagogical objectives and cultural insights', () {
      for (final lesson in JSS2Term2Lessons.weeks) {
        expect(lesson.objectives.length >= 4, isTrue, reason: 'Week ${lesson.weekNumber} must have >= 4 objectives');
        expect(lesson.culturalInsight.isNotEmpty, isTrue);
        expect(lesson.teacherFacilitatorPrompt.isNotEmpty, isTrue);
      }
    });

    test('Every Term 2 lesson has rich vocabulary with phonetics and non-empty audioKey', () {
      for (final lesson in JSS2Term2Lessons.weeks) {
        expect(lesson.vocabulary.isNotEmpty, isTrue);
        for (final v in lesson.vocabulary) {
          expect(v.french.isNotEmpty, isTrue);
          expect(v.phonetics.isNotEmpty, isTrue);
          expect(v.english.isNotEmpty, isTrue);
          expect(v.audioKey.isNotEmpty, isTrue);
        }
      }
    });

    test('Every Term 2 lesson has interactive exercises with valid correctOptionIndex', () {
      for (final lesson in JSS2Term2Lessons.weeks) {
        expect(lesson.exercises.isNotEmpty, isTrue);
        for (final ex in lesson.exercises) {
          expect(ex.prompt.isNotEmpty, isTrue);
          expect(ex.options.length >= 2, isTrue);
          expect(ex.correctOptionIndex >= 0 && ex.correctOptionIndex < ex.options.length, isTrue);
          expect(ex.explanation.isNotEmpty, isTrue);
        }
      }
    });

    test('Every Term 2 lesson has evaluation questions and comprehensive grammar note', () {
      for (final lesson in JSS2Term2Lessons.weeks) {
        expect(lesson.evaluation.isNotEmpty, isTrue);
        for (final eq in lesson.evaluation) {
          expect(eq.question.isNotEmpty, isTrue);
          expect(eq.answer.isNotEmpty, isTrue);
          expect(eq.hint.isNotEmpty, isTrue);
        }
        expect(lesson.grammarNote.title.isNotEmpty, isTrue);
        expect(lesson.grammarNote.explanation.isNotEmpty, isTrue);
        expect(lesson.grammarNote.examples.isNotEmpty, isTrue);
      }
    });

    test('Pattern types are properly mapped across all 18 weeks (Terms 1 & 2)', () {
      expect(JSS2Term1Lessons.weeks[0].patternType, JSS2PatternType.spatialPositionStudio);
      expect(JSS2Term1Lessons.weeks[8].patternType, JSS2PatternType.term1RevisionRally);

      expect(JSS2Term2Lessons.weeks[0].patternType, JSS2PatternType.listAndInventoryStudio);
      expect(JSS2Term2Lessons.weeks[1].patternType, JSS2PatternType.merchantsAndGoodsStudio);
      expect(JSS2Term2Lessons.weeks[2].patternType, JSS2PatternType.shoppingAndBargainingStudio);
      expect(JSS2Term2Lessons.weeks[3].patternType, JSS2PatternType.needsAndUtilityStudio);
      expect(JSS2Term2Lessons.weeks[4].patternType, JSS2PatternType.pharmacyAndHealthStudio);
      expect(JSS2Term2Lessons.weeks[5].patternType, JSS2PatternType.wardrobeAndStyleStudio);
      expect(JSS2Term2Lessons.weeks[6].patternType, JSS2PatternType.comparisonAndChoiceStudio);
      expect(JSS2Term2Lessons.weeks[7].patternType, JSS2PatternType.productQuantityQualityStudio);
      expect(JSS2Term2Lessons.weeks[8].patternType, JSS2PatternType.term2RevisionRally);
    });
  });
}
