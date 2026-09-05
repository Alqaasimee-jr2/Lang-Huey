import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:p5_french/data/p5_term1_lessons.dart';
import 'package:p5_french/data/p5_term2_lessons.dart';
import 'package:p5_french/data/p5_term3_lessons.dart';
import 'package:p5_french/models/p5_lesson_model.dart';

void main() {
  group('Primary 5 French Curriculum Data Integrity Tests', () {
    test('All 3 Terms contain exactly 13 weeks each (39 total weeks)', () {
      expect(P5Term1Lessons.weeks.length, equals(13));
      expect(P5Term2Lessons.weeks.length, equals(13));
      expect(P5Term3Lessons.weeks.length, equals(13));
    });

    test('All weeks in Term 1 have valid metadata, teachingStyle, and min 6 drills', () {
      for (int i = 0; i < P5Term1Lessons.weeks.length; i++) {
        final lesson = P5Term1Lessons.weeks[i];
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
      }
    });

    test('All weeks in Term 2 have valid metadata, teachingStyle, and min 6 drills', () {
      for (int i = 0; i < P5Term2Lessons.weeks.length; i++) {
        final lesson = P5Term2Lessons.weeks[i];
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
      }
    });

    test('All weeks in Term 3 have valid metadata, teachingStyle, and min 6 drills', () {
      for (int i = 0; i < P5Term3Lessons.weeks.length; i++) {
        final lesson = P5Term3Lessons.weeks[i];
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
      }
    });

    test('All 30 bespoke pattern types are distinctly assigned', () {
      final Set<P5PatternType> t1Patterns = P5Term1Lessons.weeks.map((w) => w.patternType).toSet();
      final Set<P5PatternType> t2Patterns = P5Term2Lessons.weeks.map((w) => w.patternType).toSet();
      final Set<P5PatternType> t3Patterns = P5Term3Lessons.weeks.map((w) => w.patternType).toSet();

      expect(t1Patterns.contains(P5PatternType.alphabetAndRevision), isTrue);
      expect(t1Patterns.contains(P5PatternType.numberStudio21to30), isTrue);
      expect(t1Patterns.contains(P5PatternType.numberStudio31to50), isTrue);
      expect(t1Patterns.contains(P5PatternType.numberStudio51to60), isTrue);
      expect(t1Patterns.contains(P5PatternType.presentOthers), isTrue);
      expect(t1Patterns.contains(P5PatternType.presentOthersDescriptor), isTrue);
      expect(t1Patterns.contains(P5PatternType.headAndFaceExplorer), isTrue);
      expect(t1Patterns.contains(P5PatternType.bodyAndPainClinic), isTrue);
      expect(t1Patterns.contains(P5PatternType.term1RevisionRally), isTrue);
      expect(t1Patterns.contains(P5PatternType.term1Vacation), isTrue);

      expect(t2Patterns.contains(P5PatternType.extendedFamily), isTrue);
      expect(t2Patterns.contains(P5PatternType.familyTreeAdvanced), isTrue);
      expect(t2Patterns.contains(P5PatternType.familyGathering), isTrue);
      expect(t2Patterns.contains(P5PatternType.neighborStudio), isTrue);
      expect(t2Patterns.contains(P5PatternType.communityActivity), isTrue);
      expect(t2Patterns.contains(P5PatternType.gratitudeStudio), isTrue);
      expect(t2Patterns.contains(P5PatternType.thankYouLetter), isTrue);
      expect(t2Patterns.contains(P5PatternType.weeklyTimetable), isTrue);
      expect(t2Patterns.contains(P5PatternType.term2RevisionRally), isTrue);
      expect(t2Patterns.contains(P5PatternType.term2Vacation), isTrue);

      expect(t3Patterns.contains(P5PatternType.dailyRoutineMorning), isTrue);
      expect(t3Patterns.contains(P5PatternType.dailyRoutineEvening), isTrue);
      expect(t3Patterns.contains(P5PatternType.sportsArena), isTrue);
      expect(t3Patterns.contains(P5PatternType.hobbiesLounge), isTrue);
      expect(t3Patterns.contains(P5PatternType.schoolSubjects), isTrue);
      expect(t3Patterns.contains(P5PatternType.classroomBorrowing), isTrue);
      expect(t3Patterns.contains(P5PatternType.professionsCareer), isTrue);
      expect(t3Patterns.contains(P5PatternType.foodAndBuffet), isTrue);
      expect(t3Patterns.contains(P5PatternType.term3RevisionRally), isTrue);
      expect(t3Patterns.contains(P5PatternType.term3Graduation), isTrue);
    });

    test('All audioKeys referenced in curriculum data exist as MP3 files on disk', () {
      final List<List<P5Lesson>> allTerms = [
        P5Term1Lessons.weeks,
        P5Term2Lessons.weeks,
        P5Term3Lessons.weeks,
      ];

      for (int t = 0; t < allTerms.length; t++) {
        final termNum = t + 1;
        final audioDir = Directory('assets/audio/p5_term$termNum');
        expect(audioDir.existsSync(), isTrue, reason: 'assets/audio/p5_term$termNum directory must exist');

        final existingFiles = audioDir
            .listSync()
            .whereType<File>()
            .map((f) => f.uri.pathSegments.last.replaceAll('.mp3', ''))
            .toSet();

        for (final lesson in allTerms[t]) {
          for (final item in lesson.vocabItems) {
            expect(
              existingFiles.contains(item.audioKey),
              isTrue,
              reason: 'Missing audio file for key: ${item.audioKey} in Term $termNum (Week ${lesson.week})',
            );
          }
        }
      }
    });
  });
}
