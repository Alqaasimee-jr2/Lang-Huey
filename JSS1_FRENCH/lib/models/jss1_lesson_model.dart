import 'package:flutter/material.dart';

enum TeachingStyle {
  storyNarrative,          // Immersive French story with contextual comprehension
  conversationalDialogue,  // Turn-taking peer exchange with communicative focus
  interactiveStudio,       // Hands-on grammar/vocabulary exploratory studio
  phoneticSoundboard,      // Audio-guided pronunciation & phonetics lab
}

enum DrillType {
  singleChoice,      // 4-option multiple choice with instant feedback
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

  // Term 2 Teaching & Revision Patterns
  objectPropertiesStudio,   // Week 1: Exprimer les propriétés des objets (size, color, shape, texture)
  politeRequestsStudio,     // Week 2: Demander quelque chose à quelqu’un (polite requests, asking to see someone)
  professionsStudio,        // Week 3: Décrire les professions (jobs, duties, what people do)
  clockTimeStudio,          // Week 4: Demander et donner l’heure (telling time, hourly activities)
  dailyScheduleStudio,      // Week 5: Expliquer ce que l’on fait à certaines heures de la journée
  calendarDatesStudio,      // Week 6: Dire les dates (days, months, calendar dates)
  eventSequencerStudio,     // Week 7: Situer un événement par rapport à un autre (avant, après, pendant)
  weeklyRoutineStudio,      // Week 8: Demander et expliquer ce que l’on fait tous les jours de la semaine
  term2RevisionRally,       // Week 9: Comprehensive Term 2 Revision Rally

  // Term 3 Teaching & Revision Patterns
  weatherAndSeasonsStudio,        // Week 1: Demander et indiquer le temps qu’il fait
  frequencyAdverbsStudio,          // Week 2: Exprimer la fréquence d’une activité
  invitationsStudio,               // Week 3: Inviter quelqu’un (accepter et refuser)
  commandsAndProhibitionsStudio,   // Week 4: Donner un ordre, interdire, autoriser
  permissionAndAdviceStudio,       // Week 5: Demander la permission, conseiller
  directionsAndProceduresStudio,   // Week 6: Expliquer une démarche / donner un itinéraire
  communicativeRoleplayStudio,     // Week 7: Révision des fonctions communicatives & jeux de rôles
  writtenOralWorkshopStudio,       // Week 8: Atelier d'expression écrite et orale (BECE drill)
  term3AnnualGrandRally,           // Week 9: Grand Bilan Annuel & Remise des Diplômes JSS1
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
  final DrillType type;
  final String? frenchStimulus;
  final String? audioKey;
  final List<DrillPair>? pairs;
  final String? sentenceTemplate;
  final List<String>? wordBank;
  final String? correctWord;
  final List<String>? correctSentenceOrder;

  const JSS1InteractiveExercise({
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
  final TeachingStyle teachingStyle;
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
    this.teachingStyle = TeachingStyle.interactiveStudio,
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
