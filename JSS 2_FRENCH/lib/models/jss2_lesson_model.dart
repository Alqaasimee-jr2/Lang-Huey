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

enum JSS2PatternType {
  // Term 1 Teaching & Revision Patterns
  spatialPositionStudio,          // Week 1: Demander et expliquer la position (sur, sous, devant, derrière, etc.)
  locatingPlacesStudio,           // Week 2: Situer les lieux (près de, loin de, en face de, contractions du/de la)
  indoorWelcomingGuidingStudio,   // Week 3: Accueillir et guider quelqu’un dans un espace intérieur (RDC, étages)
  directionsAndWayfindingStudio,  // Week 4: Demander/indiquer le chemin (tout droit, tournez à gauche, traversez)
  transportModesStudio,           // Week 5: Les moyens de transport (règle EN vs À)
  publicTransitRouteStudio,       // Week 6: Expliquer un trajet en transport public (lignes, arrêts, correspondances)
  schedulesAndTimetablesStudio,   // Week 7: Demander/indiquer des horaires (tableau des départs, heures)
  transportTroubleshootingStudio, // Week 8: Réagir à un problème de transport (retards, pannes, réclamations)
  term1RevisionRally,             // Week 9: Grand Rallye de Révision du 1er Trimestre

  // Term 2 Teaching & Revision Patterns
  listAndInventoryStudio,         // Week 1: Établir des listes/inventaires (courses, fournitures, comptage)
  merchantsAndGoodsStudio,        // Week 2: Les commerçants et marchandises (boucher, boulanger, modes de présentation)
  shoppingAndBargainingStudio,    // Week 3: Acheter et marchander (prix, négociation, espèces/carte)
  needsAndUtilityStudio,          // Week 4: Exprimer un besoin et son utilité (avoir besoin de, ça sert à...)
  pharmacyAndHealthStudio,        // Week 5: À la pharmacie (symptômes, médicaments, posologie)
  wardrobeAndStyleStudio,         // Week 6: Vêtements, chaussures et accessoires (tailles, matières, motifs)
  comparisonAndChoiceStudio,      // Week 7: Apprécier, comparer, choisir (plus/moins/aussi... que, hésitations)
  productQuantityQualityStudio,   // Week 8: Quantité et qualité des produits (poids métriques, mesures, fraîcheur)
  term2RevisionRally,             // Week 9: Grand Rallye de Révision du 2e Trimestre

  // Term 3 Teaching & Revision Patterns
  mathCalculationsStudio,         // Week 1: Opérations de calcul simple (addition, soustraction, multiplication, division)
  foodAndDrinksStudio,            // Week 2: Nourriture et boissons (plats africains & français, repas quotidiens)
  cookingRecipesStudio,           // Week 3: Recettes de cuisine (impératif culinaire, étapes de recette, ingrédients)
  restaurantCafeStudio,           // Week 4: Au restaurant/café (réservation, commande, addition, politesse)
  integratedRolePlayStudio,       // Week 5 (Projet): Jeux de rôle intégrés (transport, marché, pharmacie, restaurant)
  consolidationExercisesStudio,   // Week 6 (Révision): Révision générale unités 17–20, exercices de consolidation
  guidedConversationsStudio,      // Week 7 (Oral): Évaluation orale — conversations guidées sur tous thèmes
  examPrepStudio,                 // Week 8 (Exam Prep): Préparation aux examens, expression écrite & orale
  term3RevisionRally,             // Week 9 (Grand Bilan): Grand Rallye Final — Championnat de l'Année Complète
}

class JSS2VocabItem {
  final String french;
  final String phonetics;
  final String english;
  final String usageNote;
  final IconData icon;
  final String audioKey;

  const JSS2VocabItem({
    required this.french,
    required this.phonetics,
    required this.english,
    required this.usageNote,
    required this.icon,
    required this.audioKey,
  });
}

class JSS2InteractiveExercise {
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

  const JSS2InteractiveExercise({
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

class JSS2EvaluationQuestion {
  final String question;
  final String answer;
  final String hint;

  const JSS2EvaluationQuestion({
    required this.question,
    required this.answer,
    required this.hint,
  });
}

class JSS2AssignmentTask {
  final String category;
  final String instruction;
  final String? exampleResponse;

  const JSS2AssignmentTask({
    required this.category,
    required this.instruction,
    this.exampleResponse,
  });
}

class JSS2GrammarNote {
  final String title;
  final String explanation;
  final List<String> examples;

  const JSS2GrammarNote({
    required this.title,
    required this.explanation,
    required this.examples,
  });
}

class JSS2LessonModel {
  final int weekNumber;
  final int termNumber;
  final String theme;
  final String frenchTitle;
  final String englishSubtitle;
  final String teacherFacilitatorPrompt;
  final List<String> objectives;
  final String culturalInsight;
  final JSS2PatternType patternType;
  final TeachingStyle teachingStyle;
  final List<JSS2VocabItem> vocabulary;
  final List<JSS2InteractiveExercise> exercises;
  final List<JSS2EvaluationQuestion> evaluation;
  final List<JSS2AssignmentTask> homework;
  final JSS2GrammarNote grammarNote;

  const JSS2LessonModel({
    required this.weekNumber,
    required this.termNumber,
    required this.theme,
    required this.frenchTitle,
    required this.englishSubtitle,
    required this.teacherFacilitatorPrompt,
    required this.objectives,
    required this.culturalInsight,
    required this.patternType,
    this.teachingStyle = TeachingStyle.interactiveStudio,
    required this.vocabulary,
    required this.exercises,
    required this.evaluation,
    required this.homework,
    required this.grammarNote,
  });
}
