import 'package:flutter/material.dart';

/// Supported topic-specific pedagogical pattern types for Primary 4
enum P4PatternType {
  borderMapAndAlphabet, // Week 1: Nigeria border countries & French alphabet A-E
  greetingTimeDial,     // Week 2: Morning/Evening/Night & Formal/Informal greetings
  magicWordsCourtesy,   // Week 3: Polite expressions & La bise culture
  identitySentenceLab,  // Week 4: Name, nationality & subject pronouns
  midTermReview,        // Week 5: Mid-term oral recap
  midTermBreak,         // Week 6: Mid-term break intermission
  numberAndAgeStudio,   // Week 7: Numbers 1-20 & Age/Gender builder
  farewellTimeMatcher,  // Week 8: Time-specific farewells & well-wishes
  dialogueSequencer,    // Week 9: Gratitude & step-by-step conversation builder
  idCardWorkshop,       // Week 10: "Carte d'Identité" builder & presentation podium
  termRevisionRally,    // Week 11: Comprehensive Term 1 revision
  vacationCelebration,  // Week 12/13: Term wrap-up & vacation
}

/// A vocabulary or phonetic term with English translation and pronunciation
class P4VocabItem {
  final String french;
  final String phonetics;
  final String english;
  final String? usageNote;
  final IconData? icon;
  final String? audioKey;
  final String? imageAsset;

  const P4VocabItem({
    required this.french,
    required this.phonetics,
    required this.english,
    this.usageNote,
    this.icon,
    this.audioKey,
    this.imageAsset,
  });
}

/// An interactive smartboard exercise/drill for classwork
class P4InteractiveExercise {
  final String prompt;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;

  const P4InteractiveExercise({
    required this.prompt,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
  });
}

/// An evaluation or classwork question for whole-class smartboard discussion
class P4EvaluationQuestion {
  final String question;
  final String answer;
  final String? hint;

  const P4EvaluationQuestion({
    required this.question,
    required this.answer,
    this.hint,
  });
}

/// A homework assignment task
class P4AssignmentTask {
  final String category; // e.g. "Written", "Oral/Role-play", "Drawing & Design"
  final String instruction;

  const P4AssignmentTask({
    required this.category,
    required this.instruction,
  });
}

/// Complete lesson model for a Primary 4 French curriculum week
class P4Lesson {
  final int term;
  final int week;
  final String topic;
  final String subtitle;
  final P4PatternType patternType;
  final List<String> objectives;
  final String culturalInsight;
  final List<P4VocabItem> vocabItems;
  final List<P4InteractiveExercise> classworkExercises;
  final List<P4EvaluationQuestion> evaluationQuestions;
  final List<P4AssignmentTask> assignmentTasks;
  final Map<String, dynamic>? patternData;

  const P4Lesson({
    required this.term,
    required this.week,
    required this.topic,
    required this.subtitle,
    required this.patternType,
    required this.objectives,
    required this.culturalInsight,
    required this.vocabItems,
    required this.classworkExercises,
    required this.evaluationQuestions,
    required this.assignmentTasks,
    this.patternData,
  });
}
