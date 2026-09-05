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

enum TeachingStyle {
  storyNarrative,
  dialogueConversation,
  interactiveStudio,
  phoneticSoundboard,
}

enum DrillType {
  singleChoice,
  pairMatch,
  fillGap,
  trueFalse,
  tapTranslation,
}

class DrillPair {
  final String french;
  final String english;

  const DrillPair({required this.french, required this.english});
}

/// An interactive smartboard exercise/drill for classwork
class P4InteractiveExercise {
  final String prompt;
  final DrillType type;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;
  final List<DrillPair>? pairs;
  final List<String>? wordBank;
  final String? sentenceWithGap;
  final String? correctGapWord;

  const P4InteractiveExercise({
    required this.prompt,
    this.type = DrillType.singleChoice,
    this.options = const [],
    this.correctOptionIndex = 0,
    required this.explanation,
    this.pairs,
    this.wordBank,
    this.sentenceWithGap,
    this.correctGapWord,
  });
}

/// An evaluation or classwork question for whole-class smartboard discussion
class P4EvaluationQuestion {
  final int? questionNumber;
  final String question;
  final String answer;
  final String? hint;

  const P4EvaluationQuestion({
    this.questionNumber,
    String? question,
    String? questionText,
    String? answer,
    String? expectedAnswer,
    this.hint,
  })  : question = question ?? questionText ?? '',
        answer = answer ?? expectedAnswer ?? '';
}

/// A homework assignment task
class P4AssignmentTask {
  final int? taskNumber;
  final String category; // e.g. "Written", "Oral/Role-play", "Drawing & Design"
  final String instruction;

  const P4AssignmentTask({
    this.taskNumber,
    String? category,
    String? topic,
    String? instruction,
    String? instructions,
  })  : category = category ?? topic ?? 'Devoir',
        instruction = instruction ?? instructions ?? '';
}

/// Backward compatibility alias for homework tasks
typedef P4HomeworkTask = P4AssignmentTask;

/// Alias for interactive classwork exercises
typedef P4ClassworkExercise = P4InteractiveExercise;

/// A grammar explanation note for curriculum rules and conjugations
class P4GrammarNote {
  final String ruleTitle;
  final String explanation;
  final List<String> examples;

  const P4GrammarNote({
    required this.ruleTitle,
    required this.explanation,
    required this.examples,
  });
}

/// Complete lesson model for a Primary 4 French curriculum week
class P4Lesson {
  final int term;
  final int week;
  final String topic;
  final String subtitle;
  String get title => topic;
  String get theme => subtitle;
  final P4PatternType patternType;
  final TeachingStyle teachingStyle;
  final List<String> objectives;
  final String culturalInsight;
  final List<P4VocabItem> vocabItems;
  final List<P4GrammarNote>? grammarNotes;
  final List<P4InteractiveExercise> classworkExercises;
  final List<P4EvaluationQuestion> evaluationQuestions;
  final List<P4AssignmentTask> assignmentTasks;
  List<P4AssignmentTask> get homeworkTasks => assignmentTasks;
  final Map<String, dynamic>? patternData;

  const P4Lesson({
    required this.term,
    required this.week,
    required this.topic,
    required this.subtitle,
    required this.patternType,
    this.teachingStyle = TeachingStyle.interactiveStudio,
    required this.objectives,
    required this.culturalInsight,
    required this.vocabItems,
    this.grammarNotes,
    required this.classworkExercises,
    required this.evaluationQuestions,
    List<P4AssignmentTask>? assignmentTasks,
    List<P4AssignmentTask>? homeworkTasks,
    this.patternData,
  }) : assignmentTasks = assignmentTasks ?? homeworkTasks ?? const [];
}
