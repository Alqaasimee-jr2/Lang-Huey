import 'package:flutter_test/flutter_test.dart';
import 'package:jss2_french/data/jss2_term1_lessons.dart';
import 'package:jss2_french/data/jss2_term2_lessons.dart';
import 'package:jss2_french/data/jss2_term3_lessons.dart';
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
        expect(lesson.teachingStyle, isNotNull);
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

    test('Every Term 1 lesson has min 6 interactive drills with valid mechanics', () {
      for (final lesson in JSS2Term1Lessons.weeks) {
        expect(lesson.exercises.length, greaterThanOrEqualTo(6));
        for (final ex in lesson.exercises) {
          expect(ex.prompt.isNotEmpty, isTrue);
          expect(ex.explanation.isNotEmpty, isTrue);
          if (ex.type == DrillType.singleChoice || ex.type == DrillType.trueFalse) {
            expect(ex.options.length >= 2, isTrue);
            expect(ex.correctOptionIndex >= 0 && ex.correctOptionIndex < ex.options.length, isTrue);
          } else if (ex.type == DrillType.pairMatch) {
            expect(ex.pairs != null && ex.pairs!.isNotEmpty, isTrue);
          } else if (ex.type == DrillType.fillGap) {
            expect(ex.correctWord != null && ex.correctWord!.isNotEmpty, isTrue);
            expect(ex.wordBank != null && ex.wordBank!.isNotEmpty, isTrue);
          }
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
        expect(lesson.teachingStyle, isNotNull);
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

    test('Every Term 2 lesson has min 6 interactive drills with valid mechanics', () {
      for (final lesson in JSS2Term2Lessons.weeks) {
        expect(lesson.exercises.length, greaterThanOrEqualTo(6));
        for (final ex in lesson.exercises) {
          expect(ex.prompt.isNotEmpty, isTrue);
          expect(ex.explanation.isNotEmpty, isTrue);
          if (ex.type == DrillType.singleChoice || ex.type == DrillType.trueFalse) {
            expect(ex.options.length >= 2, isTrue);
            expect(ex.correctOptionIndex >= 0 && ex.correctOptionIndex < ex.options.length, isTrue);
          } else if (ex.type == DrillType.pairMatch) {
            expect(ex.pairs != null && ex.pairs!.isNotEmpty, isTrue);
          } else if (ex.type == DrillType.fillGap) {
            expect(ex.correctWord != null && ex.correctWord!.isNotEmpty, isTrue);
            expect(ex.wordBank != null && ex.wordBank!.isNotEmpty, isTrue);
          }
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
  });

  group('JSS2 French Term 3 Curriculum Integrity Tests', () {
    test('Term 3 must contain exactly 9 lessons (8 instructional + 1 grand rally)', () {
      expect(JSS2Term3Lessons.weeks.length, 9);
      for (int i = 0; i < 9; i++) {
        expect(JSS2Term3Lessons.weeks[i].weekNumber, i + 1);
        expect(JSS2Term3Lessons.weeks[i].termNumber, 3);
      }
    });

    test('Every Term 3 lesson has at least 4 pedagogical objectives and cultural insights', () {
      for (final lesson in JSS2Term3Lessons.weeks) {
        expect(lesson.objectives.length >= 4, isTrue, reason: 'Week ${lesson.weekNumber} must have >= 4 objectives');
        expect(lesson.culturalInsight.isNotEmpty, isTrue);
        expect(lesson.teacherFacilitatorPrompt.isNotEmpty, isTrue);
        expect(lesson.teachingStyle, isNotNull);
      }
    });

    test('Every Term 3 lesson has rich vocabulary with phonetics and non-empty audioKey', () {
      for (final lesson in JSS2Term3Lessons.weeks) {
        expect(lesson.vocabulary.isNotEmpty, isTrue);
        for (final v in lesson.vocabulary) {
          expect(v.french.isNotEmpty, isTrue);
          expect(v.phonetics.isNotEmpty, isTrue);
          expect(v.english.isNotEmpty, isTrue);
          expect(v.audioKey.isNotEmpty, isTrue);
        }
      }
    });

    test('Every Term 3 lesson has min 6 interactive drills with valid mechanics', () {
      for (final lesson in JSS2Term3Lessons.weeks) {
        expect(lesson.exercises.length, greaterThanOrEqualTo(6));
        for (final ex in lesson.exercises) {
          expect(ex.prompt.isNotEmpty, isTrue);
          expect(ex.explanation.isNotEmpty, isTrue);
          if (ex.type == DrillType.singleChoice || ex.type == DrillType.trueFalse) {
            expect(ex.options.length >= 2, isTrue);
            expect(ex.correctOptionIndex >= 0 && ex.correctOptionIndex < ex.options.length, isTrue);
          } else if (ex.type == DrillType.pairMatch) {
            expect(ex.pairs != null && ex.pairs!.isNotEmpty, isTrue);
          } else if (ex.type == DrillType.fillGap) {
            expect(ex.correctWord != null && ex.correctWord!.isNotEmpty, isTrue);
            expect(ex.wordBank != null && ex.wordBank!.isNotEmpty, isTrue);
          }
        }
      }
    });

    test('Every Term 3 lesson has evaluation questions and comprehensive grammar note', () {
      for (final lesson in JSS2Term3Lessons.weeks) {
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

    test('Pattern types are properly mapped across all 27 weeks (Terms 1, 2 & 3)', () {
      // Term 1
      expect(JSS2Term1Lessons.weeks[0].patternType, JSS2PatternType.spatialPositionStudio);
      expect(JSS2Term1Lessons.weeks[8].patternType, JSS2PatternType.term1RevisionRally);

      // Term 2
      expect(JSS2Term2Lessons.weeks[0].patternType, JSS2PatternType.listAndInventoryStudio);
      expect(JSS2Term2Lessons.weeks[8].patternType, JSS2PatternType.term2RevisionRally);

      // Term 3
      expect(JSS2Term3Lessons.weeks[0].patternType, JSS2PatternType.mathCalculationsStudio);
      expect(JSS2Term3Lessons.weeks[1].patternType, JSS2PatternType.foodAndDrinksStudio);
      expect(JSS2Term3Lessons.weeks[2].patternType, JSS2PatternType.cookingRecipesStudio);
      expect(JSS2Term3Lessons.weeks[3].patternType, JSS2PatternType.restaurantCafeStudio);
      expect(JSS2Term3Lessons.weeks[4].patternType, JSS2PatternType.integratedRolePlayStudio);
      expect(JSS2Term3Lessons.weeks[5].patternType, JSS2PatternType.consolidationExercisesStudio);
      expect(JSS2Term3Lessons.weeks[6].patternType, JSS2PatternType.guidedConversationsStudio);
      expect(JSS2Term3Lessons.weeks[7].patternType, JSS2PatternType.examPrepStudio);
      expect(JSS2Term3Lessons.weeks[8].patternType, JSS2PatternType.term3RevisionRally);
    });
  });
}
