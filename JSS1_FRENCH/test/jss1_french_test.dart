import 'package:flutter_test/flutter_test.dart';
import 'package:jss1_french/data/jss1_term1_lessons.dart';
import 'package:jss1_french/data/jss1_term2_lessons.dart';
import 'package:jss1_french/data/jss1_term3_lessons.dart';
import 'package:jss1_french/models/jss1_lesson_model.dart';
import 'package:jss1_french/services/jss1_audio_service.dart';
import 'package:jss1_french/theme/colors.dart';
import 'package:jss1_french/theme/text_styles.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('JSS1 French - Term 1 Curriculum & Data Model Tests', () {
    test('Term 1 contains exactly 9 complete instructional & revision weeks', () {
      expect(JSS1Term1Lessons.weeks.length, equals(9));
      for (int i = 0; i < 9; i++) {
        final lesson = JSS1Term1Lessons.weeks[i];
        expect(lesson.term, equals(1));
        expect(lesson.week, equals(i + 1));
        expect(lesson.topic.isNotEmpty, isTrue);
        expect(lesson.subtitle.isNotEmpty, isTrue);
        expect(lesson.objectives.isNotEmpty, isTrue);
        expect(lesson.culturalInsight.isNotEmpty, isTrue);
        expect(lesson.vocabItems.isNotEmpty, isTrue);
        expect(lesson.classworkExercises.isNotEmpty, isTrue);
        expect(lesson.evaluationQuestions.isNotEmpty, isTrue);
        expect(lesson.assignmentTasks.isNotEmpty, isTrue);
      }
    });

    test('All 9 weeks in Term 1 have valid and distinct pattern types mapped', () {
      final patternTypes = JSS1Term1Lessons.weeks.map((w) => w.patternType).toList();
      expect(patternTypes.length, equals(9));
      expect(patternTypes.contains(JSS1PatternType.classroomCommands), isTrue);
      expect(patternTypes.contains(JSS1PatternType.greetingStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.selfIntroStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.spellingAndDictation), isTrue);
      expect(patternTypes.contains(JSS1PatternType.presentOthersStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.characterPortraitStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.hobbiesAndLeisure), isTrue);
      expect(patternTypes.contains(JSS1PatternType.tastesAndPreferences), isTrue);
      expect(patternTypes.contains(JSS1PatternType.term1RevisionRally), isTrue);
    });

    test('All Term 1 vocabulary items have valid french, phonetics, and audio keys', () {
      for (final lesson in JSS1Term1Lessons.weeks) {
        for (final item in lesson.vocabItems) {
          expect(item.french.isNotEmpty, isTrue);
          expect(item.phonetics.isNotEmpty, isTrue);
          expect(item.english.isNotEmpty, isTrue);
          expect(item.audioKey.isNotEmpty, isTrue);
        }
      }
    });
  });

  group('JSS1 French - Term 2 Curriculum & Data Model Tests', () {
    test('Term 2 contains exactly 9 complete instructional & revision weeks', () {
      expect(JSS1Term2Lessons.weeks.length, equals(9));
      for (int i = 0; i < 9; i++) {
        final lesson = JSS1Term2Lessons.weeks[i];
        expect(lesson.term, equals(2));
        expect(lesson.week, equals(i + 1));
        expect(lesson.topic.isNotEmpty, isTrue);
        expect(lesson.subtitle.isNotEmpty, isTrue);
        expect(lesson.objectives.isNotEmpty, isTrue);
        expect(lesson.culturalInsight.isNotEmpty, isTrue);
        expect(lesson.vocabItems.isNotEmpty, isTrue);
        expect(lesson.classworkExercises.isNotEmpty, isTrue);
        expect(lesson.evaluationQuestions.isNotEmpty, isTrue);
        expect(lesson.assignmentTasks.isNotEmpty, isTrue);
      }
    });

    test('All 9 weeks in Term 2 map to the exact NERDC topics and pattern types', () {
      final patternTypes = JSS1Term2Lessons.weeks.map((w) => w.patternType).toList();
      expect(patternTypes.length, equals(9));
      expect(patternTypes.contains(JSS1PatternType.objectPropertiesStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.politeRequestsStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.professionsStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.clockTimeStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.dailyScheduleStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.calendarDatesStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.eventSequencerStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.weeklyRoutineStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.term2RevisionRally), isTrue);
    });

    test('All Term 2 vocabulary items have valid french, phonetics, and audio keys', () {
      for (final lesson in JSS1Term2Lessons.weeks) {
        for (final item in lesson.vocabItems) {
          expect(item.french.isNotEmpty, isTrue);
          expect(item.phonetics.isNotEmpty, isTrue);
          expect(item.english.isNotEmpty, isTrue);
          expect(item.audioKey.isNotEmpty, isTrue);
        }
      }
    });
  });

  group('JSS1 French - Term 3 Curriculum & Data Model Tests (Classes & Revision Only)', () {
    test('Term 3 contains exactly 9 complete instructional & revision weeks', () {
      expect(JSS1Term3Lessons.weeks.length, equals(9));
      for (int i = 0; i < 9; i++) {
        final lesson = JSS1Term3Lessons.weeks[i];
        expect(lesson.term, equals(3));
        expect(lesson.week, equals(i + 1));
        expect(lesson.topic.isNotEmpty, isTrue);
        expect(lesson.subtitle.isNotEmpty, isTrue);
        expect(lesson.objectives.isNotEmpty, isTrue);
        expect(lesson.culturalInsight.isNotEmpty, isTrue);
        expect(lesson.vocabItems.isNotEmpty, isTrue);
        expect(lesson.classworkExercises.isNotEmpty, isTrue);
        expect(lesson.evaluationQuestions.isNotEmpty, isTrue);
        expect(lesson.assignmentTasks.isNotEmpty, isTrue);
      }
    });

    test('All 9 weeks in Term 3 map to the exact NERDC topics and pattern types', () {
      final patternTypes = JSS1Term3Lessons.weeks.map((w) => w.patternType).toList();
      expect(patternTypes.length, equals(9));
      expect(patternTypes.contains(JSS1PatternType.weatherAndSeasonsStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.frequencyAdverbsStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.invitationsStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.commandsAndProhibitionsStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.permissionAndAdviceStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.directionsAndProceduresStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.communicativeRoleplayStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.writtenOralWorkshopStudio), isTrue);
      expect(patternTypes.contains(JSS1PatternType.term3AnnualGrandRally), isTrue);
    });

    test('All Term 3 vocabulary items have valid french, phonetics, and audio keys', () {
      for (final lesson in JSS1Term3Lessons.weeks) {
        for (final item in lesson.vocabItems) {
          expect(item.french.isNotEmpty, isTrue);
          expect(item.phonetics.isNotEmpty, isTrue);
          expect(item.english.isNotEmpty, isTrue);
          expect(item.audioKey.isNotEmpty, isTrue);
        }
      }
    });

    test('AudioService speed clamping and defaults', () async {
      final audio = JSS1AudioService();
      expect(audio.playbackSpeed, equals(1.0));

      await audio.setPlaybackSpeed(0.8);
      expect(audio.playbackSpeed, equals(0.8));

      await audio.setPlaybackSpeed(2.5); // Should clamp to max 1.5
      expect(audio.playbackSpeed, equals(1.5));

      await audio.setPlaybackSpeed(0.2); // Should clamp to min 0.5
      expect(audio.playbackSpeed, equals(0.5));
    });

    test('JSS1 Brand Colors and Typography Tokens integrity', () {
      expect(JSS1Colors.teal.toARGB32(), equals(0xFF0D7377));
      expect(JSS1Colors.turquoise.toARGB32(), equals(0xFF14BDCC));
      expect(JSS1Colors.gold.toARGB32(), equals(0xFFF4A832));
      expect(JSS1Colors.cream.toARGB32(), equals(0xFFF5F0E8));
      expect(JSS1Colors.charcoal.toARGB32(), equals(0xFF1C1C1C));

      expect(JSS1Text.heroHeading().fontSize, equals(34));
      expect(JSS1Text.heading().fontSize, equals(26));
      expect(JSS1Text.subheading().fontSize, equals(20));
      expect(JSS1Text.body().fontSize, equals(16));
    });
  });
}
