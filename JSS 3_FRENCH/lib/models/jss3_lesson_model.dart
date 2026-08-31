import 'package:flutter/material.dart';

enum JSS3PatternType {
  // Term 1 Teaching & Revision Patterns
  personDescriptionStudio,         // Week 1: Décrire plus précisément une personne (physique, moral, adjectifs BANGS)
  landscapesLandmarksStudio,       // Week 2: Décrire un paysage et des lieux touristiques (sites nigérians & francophones)
  habitsAndRoutineStudio,          // Week 3: Expliquer ses habitudes (routine quotidienne, verbes pronominaux, adverbes de fréquence)
  pastMemoriesStudio,              // Week 4: Parler d’un événement passé / les souvenirs (passé composé vs imparfait)
  objectDescriptionStudio,         // Week 5: Décrire un objet (formes, couleurs, matières EN, usages)
  comparisonSuperlativesStudio,    // Week 6: Comparer (comparatifs et superlatifs, duel comparatif)
  datingTimeMeasurementStudio,     // Week 7: Dater et mesurer le temps (dates, heure, expressions temporelles: depuis, pendant, il y a)
  dayChronologicalNarrativeStudio, // Week 8: Raconter sa journée (récit chronologique, connecteurs d'abord/ensuite/enfin)
  term1RevisionRally,              // Week 9: Grand Rallye de Révision du 1er Trimestre (BECE JSS3 Prep)

  // Term 2 Teaching & Revision Patterns
  narratingPastEventsStudio,       // Week 1: Relater un événement passé (passé composé + imparfait + adverbes temporels)
  recentEventsVenirDeStudio,       // Week 2: Rapporter un fait récent (passé récent "venir de + infinitif", actualités)
  diaryAndNarrativeStudio,         // Week 3: Comprendre un récit / Écrire son journal intime (lecture & journal)
  nearFutureIntentionsStudio,      // Week 4: Dire ce que l’on va faire (futur proche "aller + infinitif", intentions)
  futurePlansAndAspirationsStudio, // Week 5: Faire des projets d'avenir (futur simple, ambitions, planification)
  term2ConsolidationStudio,        // Week 6: Consolidation orale et écrite (jeux de rôles, dialogues, ateliers)
  beceGrammarPrepStudio,           // Week 7: Préparation au BECE — Partie I : Grammaire & Conjugaison
  beceVocabEssayPrepStudio,        // Week 8: Préparation au BECE — Partie II : Vocabulaire, Compréhension & Rédaction
  term2RevisionRally,              // Week 9: Grand Bilan & Rallye de Révision du 2e Trimestre (BECE Simulation)
}

class JSS3VocabItem {
  final String french;
  final String phonetics;
  final String english;
  final String usageNote;
  final IconData icon;
  final String audioKey;

  const JSS3VocabItem({
    required this.french,
    required this.phonetics,
    required this.english,
    required this.usageNote,
    required this.icon,
    required this.audioKey,
  });
}

class JSS3InteractiveExercise {
  final String prompt;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;

  const JSS3InteractiveExercise({
    required this.prompt,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
  });
}

class JSS3EvaluationQuestion {
  final String question;
  final String answer;
  final String hint;

  const JSS3EvaluationQuestion({
    required this.question,
    required this.answer,
    required this.hint,
  });
}

class JSS3AssignmentTask {
  final String category;
  final String instruction;
  final String? exampleResponse;

  const JSS3AssignmentTask({
    required this.category,
    required this.instruction,
    this.exampleResponse,
  });
}

class JSS3GrammarNote {
  final String title;
  final String explanation;
  final List<String> examples;

  const JSS3GrammarNote({
    required this.title,
    required this.explanation,
    required this.examples,
  });
}

class JSS3LessonModel {
  final int weekNumber;
  final int termNumber;
  final String theme;
  final String frenchTitle;
  final String englishSubtitle;
  final String teacherFacilitatorPrompt;
  final List<String> objectives;
  final String culturalInsight;
  final JSS3PatternType patternType;
  final List<JSS3VocabItem> vocabulary;
  final List<JSS3InteractiveExercise> exercises;
  final List<JSS3EvaluationQuestion> evaluation;
  final List<JSS3AssignmentTask> homework;
  final JSS3GrammarNote grammarNote;

  const JSS3LessonModel({
    required this.weekNumber,
    required this.termNumber,
    required this.theme,
    required this.frenchTitle,
    required this.englishSubtitle,
    required this.teacherFacilitatorPrompt,
    required this.objectives,
    required this.culturalInsight,
    required this.patternType,
    required this.vocabulary,
    required this.exercises,
    required this.evaluation,
    required this.homework,
    required this.grammarNote,
  });
}
