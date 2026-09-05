import 'package:flutter_test/flutter_test.dart';
import 'package:lang_huey/data/p4_term1_lessons.dart';
import 'package:lang_huey/data/p4_term2_lessons.dart';
import 'package:lang_huey/data/p4_term3_lessons.dart';
import 'package:lang_huey/models/p4_lesson_model.dart';

void main() {
  group('Primary 4 French Curriculum Data Integrity Tests', () {
    test('All 3 Terms contain exactly 13 weeks each (39 total weeks)', () {
      expect(p4Term1Lessons.length, equals(13));
      expect(P4Term2Lessons.weeks.length, equals(13));
      expect(P4Term3Lessons.weeks.length, equals(13));
    });

    test('All weeks in Term 1 have valid metadata, teachingStyle, and min 6 drills', () {
      for (int i = 0; i < p4Term1Lessons.length; i++) {
        final lesson = p4Term1Lessons[i];
        expect(lesson.term, equals(1));
        expect(lesson.week, equals(i + 1));
        expect(lesson.topic.isNotEmpty, isTrue, reason: 'Week ${i + 1} topic is empty');
        expect(lesson.subtitle.isNotEmpty, isTrue, reason: 'Week ${i + 1} subtitle is empty');
        expect(lesson.objectives.isNotEmpty, isTrue, reason: 'Week ${i + 1} objectives are empty');
        expect(lesson.culturalInsight.isNotEmpty, isTrue, reason: 'Week ${i + 1} cultural insight is empty');
        expect(lesson.vocabItems.isNotEmpty, isTrue, reason: 'Week ${i + 1} vocab items are empty');
        expect(lesson.classworkExercises.length, greaterThanOrEqualTo(6), reason: 'Week ${i + 1} drills count < 6');
        expect(lesson.teachingStyle, isNotNull);
        expect(lesson.assignmentTasks.isNotEmpty, isTrue, reason: 'Week ${i + 1} assignments are empty');

        for (final drill in lesson.classworkExercises) {
          expect(drill.prompt.trim().isNotEmpty, isTrue);
          if (drill.type == DrillType.singleChoice || drill.type == DrillType.trueFalse || drill.type == DrillType.tapTranslation) {
            expect(drill.options.length, greaterThanOrEqualTo(2));
            expect(drill.correctOptionIndex, greaterThanOrEqualTo(0));
            expect(drill.correctOptionIndex, lessThan(drill.options.length));
          } else if (drill.type == DrillType.pairMatch) {
            expect(drill.pairs, isNotNull);
            expect(drill.pairs!.length, greaterThanOrEqualTo(2));
          } else if (drill.type == DrillType.fillGap) {
            expect(drill.wordBank, isNotNull);
            expect(drill.wordBank!.length, greaterThanOrEqualTo(2));
            expect(drill.correctGapWord, isNotNull);
          }
          expect(drill.explanation.trim().isNotEmpty, isTrue);
        }
      }
    });

    test('All weeks in Term 2 have valid metadata, teachingStyle, and min 6 drills', () {
      for (int i = 0; i < P4Term2Lessons.weeks.length; i++) {
        final lesson = P4Term2Lessons.weeks[i];
        expect(lesson.term, equals(2));
        expect(lesson.week, equals(i + 1));
        expect(lesson.topic.isNotEmpty, isTrue, reason: 'Week ${i + 1} topic is empty');
        expect(lesson.subtitle.isNotEmpty, isTrue, reason: 'Week ${i + 1} subtitle is empty');
        expect(lesson.objectives.isNotEmpty, isTrue, reason: 'Week ${i + 1} objectives are empty');
        expect(lesson.culturalInsight.isNotEmpty, isTrue, reason: 'Week ${i + 1} cultural insight is empty');
        expect(lesson.vocabItems.isNotEmpty, isTrue, reason: 'Week ${i + 1} vocab items are empty');
        expect(lesson.classworkExercises.length, greaterThanOrEqualTo(6), reason: 'Week ${i + 1} drills count < 6');
        expect(lesson.teachingStyle, isNotNull);
        expect(lesson.assignmentTasks.isNotEmpty, isTrue, reason: 'Week ${i + 1} assignments are empty');

        for (final drill in lesson.classworkExercises) {
          expect(drill.prompt.trim().isNotEmpty, isTrue);
          if (drill.type == DrillType.singleChoice || drill.type == DrillType.trueFalse || drill.type == DrillType.tapTranslation) {
            expect(drill.options.length, greaterThanOrEqualTo(2));
            expect(drill.correctOptionIndex, greaterThanOrEqualTo(0));
            expect(drill.correctOptionIndex, lessThan(drill.options.length));
          } else if (drill.type == DrillType.pairMatch) {
            expect(drill.pairs, isNotNull);
            expect(drill.pairs!.length, greaterThanOrEqualTo(2));
          } else if (drill.type == DrillType.fillGap) {
            expect(drill.wordBank, isNotNull);
            expect(drill.wordBank!.length, greaterThanOrEqualTo(2));
            expect(drill.correctGapWord, isNotNull);
          }
          expect(drill.explanation.trim().isNotEmpty, isTrue);
        }
      }
    });

    test('All weeks in Term 3 have valid metadata, teachingStyle, and min 6 drills', () {
      for (int i = 0; i < P4Term3Lessons.weeks.length; i++) {
        final lesson = P4Term3Lessons.weeks[i];
        expect(lesson.term, equals(3));
        expect(lesson.week, equals(i + 1));
        expect(lesson.topic.isNotEmpty, isTrue, reason: 'Week ${i + 1} topic is empty');
        expect(lesson.subtitle.isNotEmpty, isTrue, reason: 'Week ${i + 1} subtitle is empty');
        expect(lesson.objectives.isNotEmpty, isTrue, reason: 'Week ${i + 1} objectives are empty');
        expect(lesson.culturalInsight.isNotEmpty, isTrue, reason: 'Week ${i + 1} cultural insight is empty');
        expect(lesson.vocabItems.isNotEmpty, isTrue, reason: 'Week ${i + 1} vocab items are empty');
        expect(lesson.classworkExercises.length, greaterThanOrEqualTo(6), reason: 'Week ${i + 1} drills count < 6');
        expect(lesson.teachingStyle, isNotNull);
        expect(lesson.assignmentTasks.isNotEmpty, isTrue, reason: 'Week ${i + 1} assignments are empty');

        for (final drill in lesson.classworkExercises) {
          expect(drill.prompt.trim().isNotEmpty, isTrue);
          if (drill.type == DrillType.singleChoice || drill.type == DrillType.trueFalse || drill.type == DrillType.tapTranslation) {
            expect(drill.options.length, greaterThanOrEqualTo(2));
            expect(drill.correctOptionIndex, greaterThanOrEqualTo(0));
            expect(drill.correctOptionIndex, lessThan(drill.options.length));
          } else if (drill.type == DrillType.pairMatch) {
            expect(drill.pairs, isNotNull);
            expect(drill.pairs!.length, greaterThanOrEqualTo(2));
          } else if (drill.type == DrillType.fillGap) {
            expect(drill.wordBank, isNotNull);
            expect(drill.wordBank!.length, greaterThanOrEqualTo(2));
            expect(drill.correctGapWord, isNotNull);
          }
          expect(drill.explanation.trim().isNotEmpty, isTrue);
        }
      }
    });
  });
}
