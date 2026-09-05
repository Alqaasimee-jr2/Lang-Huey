import 'package:flutter/material.dart';

enum P5PatternType {
  // Term 1 Patterns
  alphabetAndRevision,
  numberStudio21to30,
  numberStudio31to50,
  numberStudio51to60,
  presentOthers,
  presentOthersDescriptor,
  headAndFaceExplorer,
  bodyAndPainClinic,
  term1RevisionRally,
  term1Vacation,

  // Term 2 Patterns
  extendedFamily,
  familyTreeAdvanced,
  familyGathering,
  neighborStudio,
  communityActivity,
  gratitudeStudio,
  thankYouLetter,
  weeklyTimetable,
  term2RevisionRally,
  term2Vacation,

  // Term 3 Patterns
  dailyRoutineMorning,
  dailyRoutineEvening,
  sportsArena,
  hobbiesLounge,
  schoolSubjects,
  classroomBorrowing,
  professionsCareer,
  foodAndBuffet,
  term3RevisionRally,
  term3Graduation,
}

enum TeachingStyle {
  storyNarrative,       // Illustrated sequential story / narration
  conversationalDialogue,// Multi-turn dialogue / roleplay
  interactiveStudio,    // Tactile smartboard kinetic tool (clock, map, avatar, etc.)
  phoneticSoundboard,   // Soundboard ladder for alphabet, accents, numbers
}

enum DrillType {
  singleChoice,      // Tap translation / multiple choice
  pairMatch,         // Interactive pair matcher
  fillGap,           // Gap fill with word bank
  sentenceBuilder,   // Scrambled word chips into sentence tray
  trueFalse,         // VRAI (True) / FAUX (False)
  storyComprehension,// Story/dialogue event check
  listenAudio,       // Audio association
}

class DrillPair {
  final String french;
  final String english;
  const DrillPair({required this.french, required this.english});
}

class P5VocabItem {
  final String french;
  final String phonetics;
  final String english;
  final String usageNote;
  final IconData icon;
  final String audioKey;

  const P5VocabItem({
    required this.french,
    required this.phonetics,
    required this.english,
    required this.usageNote,
    required this.icon,
    required this.audioKey,
  });
}

class P5InteractiveExercise {
  final String prompt;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;
  final DrillType type;
  final String? frenchStimulus;
  final String? audioKey;
  final List<DrillPair>? pairs;
  final String? sentenceTemplate;
  final List<String>? wordBank;
  final String? correctWord;
  final List<String>? correctSentenceOrder;

  const P5InteractiveExercise({
    required this.prompt,
    this.options = const [],
    this.correctOptionIndex = 0,
    required this.explanation,
    this.type = DrillType.singleChoice,
    this.frenchStimulus,
    this.audioKey,
    this.pairs,
    this.sentenceTemplate,
    this.wordBank,
    this.correctWord,
    this.correctSentenceOrder,
  });
}

class P5EvaluationQuestion {
  final String question;
  final String answer;
  final String hint;

  const P5EvaluationQuestion({
    required this.question,
    required this.answer,
    required this.hint,
  });
}

class P5AssignmentTask {
  final String category;
  final String instruction;

  const P5AssignmentTask({
    required this.category,
    required this.instruction,
  });
}

class P5GrammarNote {
  final String title;
  final String explanation;
  final List<String> examples;

  const P5GrammarNote({
    required this.title,
    required this.explanation,
    required this.examples,
  });
}

class P5Lesson {
  final int term;
  final int week;
  final String topic;
  final String subtitle;
  final P5PatternType patternType;
  final TeachingStyle teachingStyle;
  final List<String> objectives;
  final String culturalInsight;
  final List<P5VocabItem> vocabItems;
  final List<P5InteractiveExercise> classworkExercises;
  final List<P5EvaluationQuestion> evaluationQuestions;
  final List<P5AssignmentTask> assignmentTasks;
  final P5GrammarNote? grammarNote;

  const P5Lesson({
    required this.term,
    required this.week,
    required this.topic,
    required this.subtitle,
    required this.patternType,
    this.teachingStyle = TeachingStyle.interactiveStudio,
    required this.objectives,
    required this.culturalInsight,
    required this.vocabItems,
    required this.classworkExercises,
    this.evaluationQuestions = const [],
    required this.assignmentTasks,
    this.grammarNote,
  });
}
