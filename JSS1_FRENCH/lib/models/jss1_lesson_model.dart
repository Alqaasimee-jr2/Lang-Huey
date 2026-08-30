import 'package:flutter/material.dart';

enum JSS1PatternType {
  // Term 1 Teaching & Revision Patterns
  classroomCommands,        // Week 1: Words used in the classroom
  greetingStudio,           // Week 2: Saluer (Formal & Informal Greetings, Polite Expressions)
  selfIntroStudio,          // Week 3: Se présenter (Name, Age, Nationality, Origin)
  spellingAndDictation,     // Week 4: Épeler un mot / Écrire un mot épelé (Alphabet, Dictation)
  presentOthersStudio,      // Week 5: Présenter quelqu’un (Voici, Il/Elle s'appelle, Polite forms)
  characterPortraitStudio,  // Week 6: Décrire quelqu’un (Height, Appearance, Character traits)
  hobbiesAndLeisure,        // Week 7: Parler de ses loisirs (Hobbies & Leisure activities)
  tastesAndPreferences,     // Week 8: Exprimer ses goûts et préférences (J'aime, Je n'aime pas, Je préfère)
  term1RevisionRally,       // Week 9: Comprehensive Term 1 Revision Rally
}

class JSS1VocabItem {
  final String french;
  final String phonetics;
  final String english;
  final String usageNote;
  final IconData icon;
  final String audioKey;

  const JSS1VocabItem({
    required this.french,
    required this.phonetics,
    required this.english,
    required this.usageNote,
    required this.icon,
    required this.audioKey,
  });
}

class JSS1InteractiveExercise {
  final String prompt;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;

  const JSS1InteractiveExercise({
    required this.prompt,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
  });
}

class JSS1EvaluationQuestion {
  final String question;
  final String answer;
  final String hint;

  const JSS1EvaluationQuestion({
    required this.question,
    required this.answer,
    required this.hint,
  });
}

class JSS1AssignmentTask {
  final String category;
  final String instruction;
  final String? exampleResponse;

  const JSS1AssignmentTask({
    required this.category,
    required this.instruction,
    this.exampleResponse,
  });
}

class JSS1GrammarNote {
  final String title;
  final String explanation;
  final List<String> examples;

  const JSS1GrammarNote({
    required this.title,
    String? explanation,
    String? rule,
    required this.examples,
  }) : explanation = explanation ?? rule ?? '';
}

class JSS1Lesson {
  final int term;
  final int week;
  final String topic;
  final String subtitle;
  final JSS1PatternType patternType;
  final List<String> objectives;
  final String culturalInsight;
  final List<JSS1VocabItem> vocabItems;
  final List<JSS1InteractiveExercise> classworkExercises;
  final List<JSS1EvaluationQuestion> evaluationQuestions;
  final List<JSS1AssignmentTask> assignmentTasks;
  final JSS1GrammarNote? grammarNote;
  final List<JSS1GrammarNote>? grammarNotes;

  const JSS1Lesson({
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
    this.grammarNote,
    this.grammarNotes,
  });
}
