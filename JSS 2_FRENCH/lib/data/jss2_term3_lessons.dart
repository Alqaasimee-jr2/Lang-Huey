import 'package:flutter/material.dart';
import '../models/jss2_lesson_model.dart';

/// JSS 2 French — Troisième Trimestre (Third Term)
/// 9 High-Impact Instructional & Revision Weeks
/// Nigerian NERDC Curriculum — Scheme of Work Aligned
class JSS2Term3Lessons {
  static final List<JSS2LessonModel> weeks = [
    // ─────────────────────────────────────────────────────
    // WEEK 1 — Unité 17: Opérations de calcul simple
    // ─────────────────────────────────────────────────────
    JSS2LessonModel(
      weekNumber: 1,
      termNumber: 3,
      theme: 'Unité 17',
      frenchTitle: 'Les Opérations de Calcul Simple',
      englishSubtitle: 'Simple Arithmetic Operations in French',
      teacherFacilitatorPrompt:
          'Begin by counting aloud with pupils (1–30). Introduce the four operations — addition, subtraction, multiplication, division — using classroom objects (pencils, books). Write a sum on the board and ask "Combien font...?" Pupils respond using "font / égalent". Move to the interactive calculator studio.',
      objectives: [
        'Name and perform the four basic arithmetic operations in French.',
        'Use "font" and "égalent" correctly in number sentences.',
        'Read and write numbers 1–1000 in French.',
        'Apply arithmetic language in real-life market contexts.',
      ],
      culturalInsight:
          'In Francophone West Africa (Côte d\'Ivoire, Bénin, Sénégal), arithmetic lessons in primary and JSS are often conducted entirely in French. Knowing numbers and operations fluently is essential for market transactions, taxi fares, and school exams. The word "calcul" (calculation) is used daily in Nigerian Francophone schools.',
      patternType: JSS2PatternType.mathCalculationsStudio,
      teachingStyle: TeachingStyle.interactiveStudio,
      vocabulary: [
        JSS2VocabItem(
          french: 'l\'addition',
          phonetics: '[la.di.sjɔ̃]',
          english: 'addition',
          usageNote: 'Deux plus trois font cinq. — 2 + 3 = 5',
          icon: Icons.add_circle_outline_rounded,
          audioKey: 't3w1_addition',
        ),
        JSS2VocabItem(
          french: 'la soustraction',
          phonetics: '[la sus.tʁak.sjɔ̃]',
          english: 'subtraction',
          usageNote: 'Dix moins quatre font six. — 10 − 4 = 6',
          icon: Icons.remove_circle_outline_rounded,
          audioKey: 't3w1_soustraction',
        ),
        JSS2VocabItem(
          french: 'la multiplication',
          phonetics: '[la mylt.i.pli.ka.sjɔ̃]',
          english: 'multiplication',
          usageNote: 'Trois fois quatre font douze. — 3 × 4 = 12',
          icon: Icons.close_rounded,
          audioKey: 't3w1_multiplication',
        ),
        JSS2VocabItem(
          french: 'la division',
          phonetics: '[la di.vi.zjɔ̃]',
          english: 'division',
          usageNote: 'Vingt divisé par quatre font cinq. — 20 ÷ 4 = 5',
          icon: Icons.horizontal_rule_rounded,
          audioKey: 't3w1_division',
        ),
        JSS2VocabItem(
          french: 'font / égalent',
          phonetics: '[fɔ̃] / [e.ɡal]',
          english: 'equal / make',
          usageNote: 'Both mean "equals" in arithmetic. "Font" is more colloquial.',
          icon: Icons.drag_handle_rounded,
          audioKey: 't3w1_font_egalent',
        ),
        JSS2VocabItem(
          french: 'plus / moins',
          phonetics: '[ply] / [mwɛ̃]',
          english: 'plus / minus',
          usageNote: '"plus" before a vowel: [plyz]. Ex: cinq plus un.',
          icon: Icons.swap_horiz_rounded,
          audioKey: 't3w1_plus_moins',
        ),
        JSS2VocabItem(
          french: 'fois / divisé par',
          phonetics: '[fwa] / [di.vi.ze paʁ]',
          english: 'times / divided by',
          usageNote: 'Six fois trois font dix-huit.',
          icon: Icons.calculate_rounded,
          audioKey: 't3w1_fois_divise',
        ),
        JSS2VocabItem(
          french: 'le résultat',
          phonetics: '[lə ʁe.zyl.ta]',
          english: 'the result',
          usageNote: 'Quel est le résultat ? — What is the result?',
          icon: Icons.star_outline_rounded,
          audioKey: 't3w1_resultat',
        ),
      ],
      exercises: [
        JSS2InteractiveExercise(
          prompt: '"Cinq plus sept ___" — Quelle est la bonne formule ?',
          options: ['font douze', 'font onze', 'font treize', 'sont douze'],
          correctOptionIndex: 0,
          explanation: '"Cinq plus sept font douze." — 5 + 7 = 12. Use "font" for arithmetic results.',
        ),
        JSS2InteractiveExercise(
          prompt: 'Comment dit-on "3 × 4 = 12" en français ?',
          options: ['Trois divisé par quatre font douze', 'Trois fois quatre font douze', 'Trois plus quatre font douze', 'Trois moins quatre font douze'],
          correctOptionIndex: 1,
          explanation: '"Fois" = times (×). Trois fois quatre font douze.',
        ),
        JSS2InteractiveExercise(
          prompt: '"Vingt divisé par cinq ___"',
          options: ['font quatre', 'font cinq', 'font dix', 'font trois'],
          correctOptionIndex: 0,
          explanation: '20 ÷ 5 = 4. "font quatre" is correct.',
        ),
        JSS2InteractiveExercise(
          prompt: 'Quel mot signifie "subtraction" ?',
          options: ["l'addition", 'la division', 'la soustraction', 'la multiplication'],
          correctOptionIndex: 2,
          explanation: '"La soustraction" means subtraction. Dix moins quatre font six.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'l\'addition', english: 'addition'),
            DrillPair(french: 'la soustraction', english: 'subtraction'),
            DrillPair(french: 'la multiplication', english: 'multiplication'),
            DrillPair(french: 'la division', english: 'division'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (addition):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['l\'addition', 'la soustraction', 'la multiplication', 'la division'],
          correctWord: 'l\'addition',
          explanation: 'Correct! "l\'addition" translates to "addition".',
        ),
      ],
      evaluation: [
        JSS2EvaluationQuestion(
          question: 'Comment dit-on "8 + 5 = 13" en français ?',
          answer: 'Huit plus cinq font treize.',
          hint: 'Use "plus" for + and "font" for =.',
        ),
        JSS2EvaluationQuestion(
          question: 'Traduis cette phrase : "Fifteen divided by three equals five."',
          answer: 'Quinze divisé par trois font cinq.',
          hint: '"Divisé par" = divided by. "Font" = equals.',
        ),
        JSS2EvaluationQuestion(
          question: 'Quelles sont les quatre opérations arithmétiques en français ?',
          answer: "L'addition, la soustraction, la multiplication, la division.",
          hint: 'Think: add, subtract, multiply, divide.',
        ),
      ],
      homework: [
        JSS2AssignmentTask(
          category: 'Calcul écrit',
          instruction: 'Write five arithmetic sentences in French using all four operations (+, −, ×, ÷). Use "font" for each result.',
          exampleResponse: 'Neuf plus six font quinze. / Vingt moins huit font douze.',
        ),
        JSS2AssignmentTask(
          category: 'Marché',
          instruction: 'You bought 3 oranges at ₦50 each and paid with ₦200. Write the transaction in French using arithmetic language.',
          exampleResponse: 'Trois fois cinquante font cent cinquante. Deux cents moins cent cinquante font cinquante. J\'ai cinquante nairas de monnaie.',
        ),
      ],
      grammarNote: JSS2GrammarNote(
        title: 'Arithmetic Sentences: "Font" vs "Égalent"',
        explanation:
            'In French arithmetic, "font" (from "faire") is the most common spoken form for "equals". "Égalent" is more formal/written. Both are correct. Numbers before a vowel: "plus" is pronounced [plyz] (liaison). "Vingt" in compound numbers: vingt-et-un (21), vingt-deux (22).',
        examples: [
          'Cinq plus trois font huit. (5 + 3 = 8)',
          'Douze moins sept font cinq. (12 − 7 = 5)',
          'Six fois neuf font cinquante-quatre. (6 × 9 = 54)',
          'Trente divisé par cinq font six. (30 ÷ 5 = 6)',
          'Quel est le résultat de cent moins quarante-cinq ? — Font cinquante-cinq.',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 2 — Unité 18: Nourriture et boissons
    // ─────────────────────────────────────────────────────
    JSS2LessonModel(
      weekNumber: 2,
      termNumber: 3,
      theme: 'Unité 18',
      frenchTitle: 'La Nourriture et les Boissons',
      englishSubtitle: 'Food & Drinks — African & French Table',
      teacherFacilitatorPrompt:
          'Show images of both Nigerian/West African dishes and French dishes. Ask pupils "Qu\'est-ce que tu manges au petit-déjeuner ?" Then drill the verb MANGER and BOIRE in all persons. Introduce "J\'aime / Je n\'aime pas / Je préfère". Move to the interactive food explorer studio.',
      objectives: [
        'Name common foods and drinks in French with correct articles.',
        'Conjugate MANGER and BOIRE correctly in the present tense.',
        'Express food preferences using aimer, préférer, adorer, détester.',
        'Describe the three daily meals: petit-déjeuner, déjeuner, dîner.',
      ],
      culturalInsight:
          'West African Francophone cuisine blends beautifully with French cooking traditions. Dishes like "le riz au gras" (jollof rice), "la sauce gombo" (okra soup), and "l\'attiéké" (cassava couscous) are commonly discussed in French lessons across Nigeria and West Africa. French pupils learn about "les crêpes", "la baguette", and "le fromage". JSS2 lessons bridge both worlds.',
      patternType: JSS2PatternType.foodAndDrinksStudio,
      teachingStyle: TeachingStyle.storyNarrative,
      vocabulary: [
        JSS2VocabItem(
          french: 'le petit-déjeuner',
          phonetics: '[lə p(ə).ti de.ʒœ.ne]',
          english: 'breakfast',
          usageNote: 'Je prends le petit-déjeuner à 7 heures.',
          icon: Icons.wb_sunny_rounded,
          audioKey: 't3w2_petit_dejeuner',
        ),
        JSS2VocabItem(
          french: 'le déjeuner',
          phonetics: '[lə de.ʒœ.ne]',
          english: 'lunch',
          usageNote: 'Nous déjeunons à midi.',
          icon: Icons.lunch_dining_rounded,
          audioKey: 't3w2_dejeuner',
        ),
        JSS2VocabItem(
          french: 'le dîner',
          phonetics: '[lə di.ne]',
          english: 'dinner / supper',
          usageNote: 'On dîne en famille le soir.',
          icon: Icons.nightlight_round,
          audioKey: 't3w2_diner',
        ),
        JSS2VocabItem(
          french: 'le riz / le pain',
          phonetics: '[lə ʁi] / [lə pɛ̃]',
          english: 'rice / bread',
          usageNote: 'Je mange du riz avec de la sauce. / Je mange du pain grillé.',
          icon: Icons.rice_bowl_rounded,
          audioKey: 't3w2_riz_pain',
        ),
        JSS2VocabItem(
          french: 'la viande / le poisson',
          phonetics: '[la vjɑ̃d] / [lə pwa.sɔ̃]',
          english: 'meat / fish',
          usageNote: 'Je mange de la viande de poulet. / Du poisson fumé.',
          icon: Icons.set_meal_rounded,
          audioKey: 't3w2_viande_poisson',
        ),
        JSS2VocabItem(
          french: 'les légumes / les fruits',
          phonetics: '[le le.ɡym] / [le fʁɥi]',
          english: 'vegetables / fruits',
          usageNote: 'Je mange des légumes et des fruits chaque jour.',
          icon: Icons.eco_rounded,
          audioKey: 't3w2_legumes_fruits',
        ),
        JSS2VocabItem(
          french: "l'eau / le jus / le lait",
          phonetics: '[lo] / [lə ʒy] / [lə lɛ]',
          english: 'water / juice / milk',
          usageNote: "Je bois de l'eau. / du jus d'orange. / du lait.",
          icon: Icons.local_drink_rounded,
          audioKey: 't3w2_eau_jus_lait',
        ),
        JSS2VocabItem(
          french: 'J\'aime / Je préfère',
          phonetics: '[ʒɛm] / [ʒə pʁe.fɛʁ]',
          english: 'I like / I prefer',
          usageNote: 'J\'aime le riz. Je préfère le poisson à la viande.',
          icon: Icons.favorite_rounded,
          audioKey: 't3w2_jaime_prefere',
        ),
      ],
      exercises: [
        JSS2InteractiveExercise(
          prompt: 'Je ___ du riz au gras chaque midi. (manger)',
          options: ['mange', 'manges', 'mangeons', 'mangent'],
          correctOptionIndex: 0,
          explanation: '"Je mange" — 1st person singular present tense of MANGER.',
        ),
        JSS2InteractiveExercise(
          prompt: "Nous ___ du jus d'orange au petit-déjeuner. (boire)",
          options: ['buvons', 'boit', 'boivons', 'buves'],
          correctOptionIndex: 0,
          explanation: '"Boire" is irregular. Nous buvons (we drink).',
        ),
        JSS2InteractiveExercise(
          prompt: '"Je _____ le poisson à la viande." (prefer)',
          options: ['préfère', 'préférons', 'préfèrent', 'aimez'],
          correctOptionIndex: 0,
          explanation: '"Je préfère" = I prefer.',
        ),
        JSS2InteractiveExercise(
          prompt: "Quel article partitif utilise-t-on avec \"eau\" ? (Je bois ___ eau.)",
          options: ['du', 'de la', "de l'", 'des'],
          correctOptionIndex: 2,
          explanation: '"Eau" starts with a vowel → de l\'eau.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'le petit-déjeuner', english: 'breakfast'),
            DrillPair(french: 'le déjeuner', english: 'lunch'),
            DrillPair(french: 'le dîner', english: 'dinner / supper'),
            DrillPair(french: 'le riz / le pain', english: 'rice / bread'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (breakfast):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['le petit-déjeuner', 'le déjeuner', 'le dîner', 'le riz / le pain'],
          correctWord: 'le petit-déjeuner',
          explanation: 'Correct! "le petit-déjeuner" translates to "breakfast".',
        ),
      ],
      evaluation: [
        JSS2EvaluationQuestion(
          question: 'Conjugue le verbe BOIRE à toutes les personnes du singulier.',
          answer: 'Je bois, Tu bois, Il/Elle boit.',
          hint: 'BOIRE is irregular. Singular: bois / bois / boit.',
        ),
        JSS2EvaluationQuestion(
          question: 'Décris ton dîner préféré en deux phrases en français.',
          answer: 'Le soir, je mange du riz avec de la sauce tomate et du poulet. Je bois de l\'eau fraîche.',
          hint: 'Use: je mange du/de la/de l\'/des + food. Je bois + drink.',
        ),
        JSS2EvaluationQuestion(
          question: 'Quelle est la différence entre "le déjeuner" et "le dîner" ?',
          answer: 'Le déjeuner est le repas de midi. Le dîner est le repas du soir.',
          hint: 'Déjeuner = midday meal. Dîner = evening meal.',
        ),
      ],
      homework: [
        JSS2AssignmentTask(
          category: 'Mon journal alimentaire',
          instruction: 'Write a food diary for one full day in French. Describe what you eat and drink at breakfast, lunch, and dinner.',
          exampleResponse: 'Au petit-déjeuner, je mange du pain et je bois du lait. À midi, je mange du riz et des légumes.',
        ),
        JSS2AssignmentTask(
          category: 'Préférences alimentaires',
          instruction: 'Write 3 sentences expressing food preferences using: j\'aime, je n\'aime pas, je préfère.',
          exampleResponse: "J'aime le riz au gras. Je n'aime pas les épinards. Je préfère le jus d'orange à l'eau.",
        ),
      ],
      grammarNote: JSS2GrammarNote(
        title: "Partitive Articles with Food: DU / DE LA / DE L' / DES",
        explanation:
            'When talking about eating or drinking an unspecified quantity, use the partitive article. DU (masculine), DE LA (feminine), DE L\' (before vowel/h), DES (plural). After negation → always DE / D\'.',
        examples: [
          'Je mange du riz. (masculine)',
          'Je bois de la limonade. (feminine)',
          "Elle mange de l'avocat. (vowel)",
          'Nous mangeons des fruits. (plural)',
          'Il ne mange pas de poisson. (negation)',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 3 — Unité 19: Recettes de cuisine
    // ─────────────────────────────────────────────────────
    JSS2LessonModel(
      weekNumber: 3,
      termNumber: 3,
      theme: 'Unité 19',
      frenchTitle: 'Les Recettes de Cuisine',
      englishSubtitle: 'Cooking Recipes — Following & Explaining Dishes',
      teacherFacilitatorPrompt:
          'Display a simple 4-step recipe on the smartboard (e.g., Nigerian Fried Plantain in French). Highlight the imperative mood for each instruction: "Coupez les plantains. Faites chauffer l\'huile. Faites frire..." Pupils sequence the steps, then write their own 3-step recipe.',
      objectives: [
        'Read and understand recipe instructions in French.',
        'Use the imperative mood (vous-form) for culinary commands.',
        'Name common cooking verbs: couper, mélanger, faire cuire, faire frire, ajouter.',
        'Write a simple recipe in French with quantities and steps.',
      ],
      culturalInsight:
          'French cuisine is UNESCO-listed as intangible cultural heritage. In West Africa, recipes are increasingly written in French — from "la sauce arachide" (groundnut soup) to "le foufou" preparation. This unit bridges Nigerian and French culinary traditions.',
      patternType: JSS2PatternType.cookingRecipesStudio,
      teachingStyle: TeachingStyle.storyNarrative,
      vocabulary: [
        JSS2VocabItem(
          french: 'couper / trancher',
          phonetics: '[ku.pe] / [tʁɑ̃.ʃe]',
          english: 'to cut / to slice',
          usageNote: 'Coupez les oignons en petits morceaux.',
          icon: Icons.content_cut_rounded,
          audioKey: 't3w3_couper_trancher',
        ),
        JSS2VocabItem(
          french: 'mélanger / remuer',
          phonetics: '[me.lɑ̃.ʒe] / [ʁə.mɥe]',
          english: 'to mix / to stir',
          usageNote: 'Mélangez bien tous les ingrédients.',
          icon: Icons.blender_rounded,
          audioKey: 't3w3_melanger_remuer',
        ),
        JSS2VocabItem(
          french: 'faire cuire / faire frire',
          phonetics: '[fɛʁ kɥiʁ] / [fɛʁ fʁiʁ]',
          english: 'to cook / to fry',
          usageNote: "Faites cuire à feu doux. / Faites frire dans l'huile chaude.",
          icon: Icons.local_fire_department_rounded,
          audioKey: 't3w3_faire_cuire_frire',
        ),
        JSS2VocabItem(
          french: 'ajouter / verser',
          phonetics: '[a.ʒu.te] / [vɛʁ.se]',
          english: 'to add / to pour',
          usageNote: 'Ajoutez du sel. / Versez l\'eau dans la casserole.',
          icon: Icons.add_rounded,
          audioKey: 't3w3_ajouter_verser',
        ),
        JSS2VocabItem(
          french: 'les ingrédients',
          phonetics: '[le ɛ̃.ɡʁe.djɑ̃]',
          english: 'the ingredients',
          usageNote: 'Voici les ingrédients nécessaires.',
          icon: Icons.list_alt_rounded,
          audioKey: 't3w3_ingredients',
        ),
        JSS2VocabItem(
          french: 'la casserole / la poêle',
          phonetics: '[la kas.ʁɔl] / [la pwal]',
          english: 'the saucepan / the frying pan',
          usageNote: "Chauffez la poêle avant d'ajouter l'huile.",
          icon: Icons.soup_kitchen_rounded,
          audioKey: 't3w3_casserole_poele',
        ),
        JSS2VocabItem(
          french: "d'abord / ensuite / enfin",
          phonetics: "[da.bɔʁ] / [ɑ̃.sɥit] / [ɑ̃.fɛ̃]",
          english: 'first / then / finally',
          usageNote: 'Sequencing words essential for recipe writing.',
          icon: Icons.format_list_numbered_rounded,
          audioKey: 't3w3_dabord_ensuite_enfin',
        ),
        JSS2VocabItem(
          french: 'le feu doux / vif',
          phonetics: '[lə fø du] / [fø vif]',
          english: 'low / high heat',
          usageNote: 'Faites cuire à feu doux pendant 20 minutes.',
          icon: Icons.thermostat_rounded,
          audioKey: 't3w3_feu_doux_vif',
        ),
      ],
      exercises: [
        JSS2InteractiveExercise(
          prompt: 'Dans une recette, quelle forme du verbe utilise-t-on ? "___ les tomates."',
          options: ['Coupez (impératif)', 'Couper (infinitif)', 'Je coupe (présent)', 'Coupé (participe)'],
          correctOptionIndex: 0,
          explanation: 'Recipes use the imperative (vous-form): "Coupez, Ajoutez, Mélangez..."',
        ),
        JSS2InteractiveExercise(
          prompt: 'Remets dans l\'ordre : "d\'abord, ensuite, enfin"',
          options: ["d'abord → ensuite → enfin", "enfin → d'abord → ensuite", "ensuite → enfin → d'abord", "enfin → ensuite → d'abord"],
          correctOptionIndex: 0,
          explanation: "d'abord (first) → ensuite (then) → enfin (finally).",
        ),
        JSS2InteractiveExercise(
          prompt: 'Choisissez le bon verbe : "___ du sel dans la soupe."',
          options: ['Ajoutez', 'Coupez', 'Faites frire', 'Versez'],
          correctOptionIndex: 0,
          explanation: '"Ajoutez du sel" = Add some salt.',
        ),
        JSS2InteractiveExercise(
          prompt: 'Quel ustensile utilise-t-on pour frire ?',
          options: ['une poêle', 'une cuillère', 'un couteau', 'un four'],
          correctOptionIndex: 0,
          explanation: '"Faites frire dans une poêle." A frying pan (poêle) is used for frying.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'couper / trancher', english: 'to cut / to slice'),
            DrillPair(french: 'mélanger / remuer', english: 'to mix / to stir'),
            DrillPair(french: 'faire cuire / faire frire', english: 'to cook / to fry'),
            DrillPair(french: 'ajouter / verser', english: 'to add / to pour'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (to cut / to slice):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['couper / trancher', 'mélanger / remuer', 'faire cuire / faire frire', 'ajouter / verser'],
          correctWord: 'couper / trancher',
          explanation: 'Correct! "couper / trancher" translates to "to cut / to slice".',
        ),
      ],
      evaluation: [
        JSS2EvaluationQuestion(
          question: 'Écris 3 étapes d\'une recette de riz blanc en français. Utilise l\'impératif.',
          answer: "D'abord, lavez le riz. Ensuite, faites bouillir de l'eau avec du sel. Enfin, faites cuire le riz à feu doux pendant 20 minutes.",
          hint: "Use: d'abord, ensuite, enfin. Verbs: lavez, faites bouillir, faites cuire.",
        ),
        JSS2EvaluationQuestion(
          question: 'Quelle est la différence entre "faire cuire" et "faire frire" ?',
          answer: '"Faire cuire" = to cook (general: boil, bake, steam). "Faire frire" = specifically to fry in oil.',
          hint: 'Frire involves oil. Cuire is more general cooking.',
        ),
        JSS2EvaluationQuestion(
          question: 'Nomme 3 verbes de cuisine importants et donne un exemple pour chacun.',
          answer: 'Couper : Coupez les oignons. Mélanger : Mélangez bien. Ajouter : Ajoutez du poivre.',
          hint: 'Think: cutting, mixing, adding.',
        ),
      ],
      homework: [
        JSS2AssignmentTask(
          category: 'Ma recette préférée',
          instruction: 'Write a simple recipe (4–5 steps) for your favourite Nigerian or French dish in French. Include ingredients list and step-by-step instructions using the imperative.',
          exampleResponse: "Ingrédients : des plantains mûrs, de l'huile, du sel. Étapes : D'abord, épluchez les plantains. Coupez-les en tranches. Faites chauffer l'huile. Faites frire jusqu'à dorées.",
        ),
        JSS2AssignmentTask(
          category: 'Vocabulaire de cuisine',
          instruction: 'Draw and label 5 kitchen utensils in French with their articles (le/la/les).',
          exampleResponse: 'La casserole, la poêle, le couteau, la cuillère, le four.',
        ),
      ],
      grammarNote: JSS2GrammarNote(
        title: 'The Imperative Mood (Vous-form) for Recipes',
        explanation:
            'French recipes use the vous-form imperative (same as present indicative without "vous"). For -ER verbs: vous coupez → Coupez! For irregular verbs: Faire → Faites. Être → Soyez.',
        examples: [
          'Coupez les légumes en morceaux.',
          'Ajoutez du sel et du poivre.',
          'Faites cuire à feu moyen.',
          'Mélangez bien tous les ingrédients.',
          'Versez dans les assiettes et servez chaud.',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 4 — Unité 20: Au restaurant/café
    // ─────────────────────────────────────────────────────
    JSS2LessonModel(
      weekNumber: 4,
      termNumber: 3,
      theme: 'Unité 20',
      frenchTitle: 'Au Restaurant et au Café',
      englishSubtitle: 'At the Restaurant & Café — Booking, Ordering & Paying',
      teacherFacilitatorPrompt:
          'Set up a "restaurant" scenario in the classroom: one pupil as waiter, others as customers. Present the menu on the smartboard. Pupils practise: making a reservation, ordering, requesting the bill. Drill the key expressions before opening the interactive restaurant studio.',
      objectives: [
        'Make a restaurant reservation by phone and in person in French.',
        'Read a restaurant menu and place a food/drink order correctly.',
        'Use polite conditional forms: "Je voudrais / Pourriez-vous / L\'addition, s\'il vous plaît."',
        'Handle complaints and compliments about food and service.',
      ],
      culturalInsight:
          'French dining etiquette is a cultural institution: asking for "l\'addition" (the bill), saying "Bon appétit !" before eating, keeping hands (not elbows) on the table. In Francophone West African restaurants, these French protocols mix with local customs. Tipping (le pourboire) is appreciated but not mandatory.',
      patternType: JSS2PatternType.restaurantCafeStudio,
      teachingStyle: TeachingStyle.conversationalDialogue,
      vocabulary: [
        JSS2VocabItem(
          french: 'Je voudrais réserver une table',
          phonetics: '[ʒə vu.dʁɛ ʁe.zɛʁ.ve yn tabl]',
          english: 'I would like to book a table',
          usageNote: 'Use: pour [number] personnes, pour ce soir.',
          icon: Icons.calendar_today_rounded,
          audioKey: 't3w4_reserver_table',
        ),
        JSS2VocabItem(
          french: 'la carte / le menu',
          phonetics: '[la kaʁt] / [lə mə.ny]',
          english: 'the à la carte menu / set menu',
          usageNote: '"La carte" = choose individual dishes. "Le menu" = fixed price set meal.',
          icon: Icons.menu_book_rounded,
          audioKey: 't3w4_carte_menu',
        ),
        JSS2VocabItem(
          french: 'Je prends / Je voudrais',
          phonetics: '[ʒə pʁɑ̃] / [ʒə vu.dʁɛ]',
          english: "I'll have / I would like",
          usageNote: '"Je prends" is direct. "Je voudrais" is more polite.',
          icon: Icons.restaurant_menu_rounded,
          audioKey: 't3w4_je_prends_voudrais',
        ),
        JSS2VocabItem(
          french: "l'entrée / le plat / le dessert",
          phonetics: "[lɑ̃.tʁe] / [lə pla] / [lə de.sɛʁ]",
          english: 'starter / main course / dessert',
          usageNote: 'A typical French meal: entrée → plat principal → dessert.',
          icon: Icons.dinner_dining_rounded,
          audioKey: 't3w4_entree_plat_dessert',
        ),
        JSS2VocabItem(
          french: "L'addition, s'il vous plaît !",
          phonetics: '[la.di.sjɔ̃ sil vu plɛ]',
          english: 'The bill, please!',
          usageNote: 'Never say "la facture" in a restaurant — use "l\'addition".',
          icon: Icons.receipt_long_rounded,
          audioKey: 't3w4_addition_svp',
        ),
        JSS2VocabItem(
          french: 'Ça coûte combien ? / C\'est combien ?',
          phonetics: '[sa kut kɔ̃.bjɛ̃]',
          english: 'How much does it cost?',
          usageNote: 'Natural in restaurants and cafés.',
          icon: Icons.attach_money_rounded,
          audioKey: 't3w4_combien_cout',
        ),
        JSS2VocabItem(
          french: 'C\'est délicieux ! / Pas assez cuit.',
          phonetics: '[se de.li.sjø] / [pa a.se kɥi]',
          english: "It's delicious! / Undercooked.",
          usageNote: 'C\'est trop salé / trop sucré / pas assez chaud.',
          icon: Icons.star_rate_rounded,
          audioKey: 't3w4_delicieux_critique',
        ),
        JSS2VocabItem(
          french: 'le serveur / la serveuse',
          phonetics: '[lə sɛʁ.vœʁ] / [la sɛʁ.vøz]',
          english: 'waiter / waitress',
          usageNote: 'Excusez-moi, monsieur / madame — to get attention.',
          icon: Icons.support_agent_rounded,
          audioKey: 't3w4_serveur_serveuse',
        ),
      ],
      exercises: [
        JSS2InteractiveExercise(
          prompt: 'Pour demander la note au restaurant, on dit :',
          options: ["L'addition, s'il vous plaît !", 'La facture, s\'il vous plaît !', 'Le menu, s\'il vous plaît !', 'Le pourboire, s\'il vous plaît !'],
          correctOptionIndex: 0,
          explanation: 'In restaurants, always say "L\'addition" not "la facture".',
        ),
        JSS2InteractiveExercise(
          prompt: '"Je voudrais réserver ___ pour deux personnes."',
          options: ['une table', 'une carte', 'un menu', 'un plat'],
          correctOptionIndex: 0,
          explanation: '"Réserver une table" = to book a table.',
        ),
        JSS2InteractiveExercise(
          prompt: 'Quelle est la différence entre "la carte" et "le menu" ?',
          options: [
            '"La carte" = choose dishes individually; "le menu" = fixed price meal',
            '"La carte" = fixed price; "le menu" = choose individually',
            'Ce sont des synonymes exacts',
            '"La carte" = desserts only',
          ],
          correctOptionIndex: 0,
          explanation: '"À la carte" you choose individual dishes. "Le menu" is a set price for multiple courses.',
        ),
        JSS2InteractiveExercise(
          prompt: "L'ordre d'un repas français typique est :",
          options: ['Entrée → plat → dessert', 'Dessert → plat → entrée', 'Plat → entrée → dessert', 'Dessert → entrée → plat'],
          correctOptionIndex: 0,
          explanation: 'Classic French meal order: Entrée → Plat principal → Dessert.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Je voudrais réserver une table', english: 'I would like to book a table'),
            DrillPair(french: 'la carte / le menu', english: 'the à la carte menu / set menu'),
            DrillPair(french: 'Je prends / Je voudrais', english: 'I'),
            DrillPair(french: 'Ça coûte combien ? / C\'est combien ?', english: 'How much does it cost?'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (I would like to book a table):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Je voudrais réserver une table', 'la carte / le menu', 'Je prends / Je voudrais', 'Ça coûte combien ? / C\'est combien ?'],
          correctWord: 'Je voudrais réserver une table',
          explanation: 'Correct! "Je voudrais réserver une table" translates to "I would like to book a table".',
        ),
      ],
      evaluation: [
        JSS2EvaluationQuestion(
          question: 'Écris un dialogue de 4 répliques entre un client et un serveur dans un restaurant.',
          answer: 'Client : Bonjour, je voudrais une table pour deux, s\'il vous plaît. Serveur : Bien sûr, par ici. Voici la carte. Client : Je prends le poulet rôti et un jus d\'orange. Serveur : Très bien. Bon appétit !',
          hint: 'Include: greeting, ordering, drink, thank you.',
        ),
        JSS2EvaluationQuestion(
          question: 'Comment dit-on "The food is delicious but a little too salty" en français ?',
          answer: 'Le repas est délicieux mais un peu trop salé.',
          hint: 'délicieux = delicious, trop salé = too salty, un peu = a little.',
        ),
        JSS2EvaluationQuestion(
          question: 'Pourquoi dit-on "l\'addition" et non "la facture" au restaurant ?',
          answer: '"L\'addition" is the specific term used in French restaurants for the bill. "La facture" is an invoice used in business/shops contexts.',
          hint: 'Both mean "bill" but context matters in French.',
        ),
      ],
      homework: [
        JSS2AssignmentTask(
          category: 'Dialogue de restaurant',
          instruction: 'Write a 6-line dialogue between a customer and a waiter at a French café.',
          exampleResponse: "Client : Bonjour ! Avez-vous une table libre ? Serveur : Oui, bien sûr. Client : Je voudrais un café et un croissant. Serveur : Voilà. Client : L'addition, s'il vous plaît. Serveur : Ça fait 2 euros 50.",
        ),
        JSS2AssignmentTask(
          category: 'Menu design',
          instruction: 'Design a simple French restaurant menu: 2 entrées, 3 plats, 2 desserts, 3 boissons with French names and imaginary prices.',
          exampleResponse: 'ENTRÉES : Salade niçoise (1500₦), Soupe de légumes (1200₦). PLATS : Poulet rôti (3500₦), Riz au gras (2800₦).',
        ),
      ],
      grammarNote: JSS2GrammarNote(
        title: 'The Conditional "Je voudrais" — Polite Requests',
        explanation:
            '"Je voudrais" (I would like) is the conditional form of VOULOIR. It is the standard polite way to order in French restaurants. "Je veux" (I want) sounds abrupt and can be rude. Also use: "Pourriez-vous..." (Could you...).',
        examples: [
          'Je voudrais une table pour trois.',
          'Je voudrais le menu à 5000 nairas.',
          "Pourriez-vous m'apporter l'addition ?",
          'Auriez-vous une table en terrasse ?',
          "Nous voudrions commander, s'il vous plaît.",
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 5 — Projet oral et écrit: Jeux de rôle intégrés
    // ─────────────────────────────────────────────────────
    JSS2LessonModel(
      weekNumber: 5,
      termNumber: 3,
      theme: 'Projet Oral & Écrit',
      frenchTitle: 'Les Jeux de Rôle Intégrés',
      englishSubtitle: 'Integrated Role-Plays: Transport, Market, Pharmacy & Restaurant',
      teacherFacilitatorPrompt:
          'Divide class into 4 groups. Each group draws a scenario card: Transport, Market, Pharmacy, Restaurant. Groups have 8 minutes to prepare their role-play scripts using vocabulary from the year. Then each group performs 2–3 minutes in front of the class. Score using the rubric on the smartboard.',
      objectives: [
        'Perform a 2–3 minute role-play dialogue fluently in French.',
        'Integrate vocabulary and expressions from all three terms.',
        'Use appropriate register (polite conditional, imperative, questions).',
        'Demonstrate comprehension by responding to improvised questions.',
      ],
      culturalInsight:
          'Role-play (jeux de rôle) is a cornerstone of communicative language teaching, rooted in the "méthode directe". Nigerian JSS French classrooms increasingly adopt this method to move beyond rote learning. Real-world scenario practice prepares pupils for BECE/JSCE oral examinations and real-life travel to Francophone countries.',
      patternType: JSS2PatternType.integratedRolePlayStudio,
      teachingStyle: TeachingStyle.conversationalDialogue,
      vocabulary: [
        JSS2VocabItem(
          french: 'Excusez-moi, pourriez-vous…',
          phonetics: '[ɛk.sky.ze mwa pu.ʁje vu]',
          english: 'Excuse me, could you…',
          usageNote: 'Universal polite opener for any scenario.',
          icon: Icons.record_voice_over_rounded,
          audioKey: 't3w5_excusez_moi',
        ),
        JSS2VocabItem(
          french: 'Je voudrais… / J\'ai besoin de…',
          phonetics: '[ʒə vu.dʁɛ] / [ʒe bə.zwɛ̃ də]',
          english: 'I would like… / I need…',
          usageNote: 'Two key expressions for any interaction.',
          icon: Icons.shopping_bag_rounded,
          audioKey: 't3w5_voudrais_besoin',
        ),
        JSS2VocabItem(
          french: 'Quel est le prix de… / Ça coûte combien ?',
          phonetics: '[kɛl ɛ lə pʁi də] / [sa kut kɔ̃.bjɛ̃]',
          english: 'What is the price of… / How much?',
          usageNote: 'Market and restaurant bargaining.',
          icon: Icons.sell_rounded,
          audioKey: 't3w5_prix_combien',
        ),
        JSS2VocabItem(
          french: 'Où se trouve… / Comment aller à… ?',
          phonetics: '[u sə tʁuv] / [kɔ.mɑ̃ a.le a]',
          english: 'Where is… / How do I get to…?',
          usageNote: 'Transport and directions scenarios.',
          icon: Icons.location_on_rounded,
          audioKey: 't3w5_ou_se_trouve',
        ),
        JSS2VocabItem(
          french: 'J\'ai mal à… / Il me faut…',
          phonetics: '[ʒe mal a] / [il mə fo]',
          english: 'I have a pain in… / I need…',
          usageNote: 'Pharmacy and health scenario.',
          icon: Icons.health_and_safety_rounded,
          audioKey: 't3w5_jai_mal_il_me_faut',
        ),
        JSS2VocabItem(
          french: 'Pourriez-vous répéter, s\'il vous plaît ?',
          phonetics: '[pu.ʁje vu ʁe.pe.te sil vu plɛ]',
          english: 'Could you repeat, please?',
          usageNote: 'Essential during oral exams and real conversations.',
          icon: Icons.replay_rounded,
          audioKey: 't3w5_repeter_svp',
        ),
        JSS2VocabItem(
          french: 'Je ne comprends pas / Plus lentement',
          phonetics: '[ʒə nə kɔ̃.pʁɑ̃ pa] / [ply lɑ̃t.mɑ̃]',
          english: "I don't understand / More slowly",
          usageNote: 'Communication repair strategies in oral exams.',
          icon: Icons.help_outline_rounded,
          audioKey: 't3w5_comprends_pas',
        ),
        JSS2VocabItem(
          french: 'Merci beaucoup ! / De rien.',
          phonetics: '[mɛʁ.si bo.ku] / [də ʁjɛ̃]',
          english: "Thank you very much! / You're welcome.",
          usageNote: 'Always close interactions politely.',
          icon: Icons.handshake_rounded,
          audioKey: 't3w5_merci_de_rien',
        ),
      ],
      exercises: [
        JSS2InteractiveExercise(
          prompt: 'Scénario : Pharmacie — Le client dit "J\'ai mal à la gorge." Le pharmacien répond :',
          options: [
            '"Je vous recommande ce sirop. Prenez-en 3 fois par jour."',
            '"Voici la carte du restaurant."',
            '"Tournez à gauche au carrefour."',
            '"Le kilo de tomates coûte 200 nairas."',
          ],
          correctOptionIndex: 0,
          explanation: 'The pharmacist recommends a syrup for a sore throat.',
        ),
        JSS2InteractiveExercise(
          prompt: 'Scénario : Marché — "Combien coûte ce pagne ?" La vendeuse dit :',
          options: [
            '"Ça fait 3500 nairas. Je peux vous faire un bon prix !"',
            '"Le prochain bus part dans 10 minutes."',
            '"Je voudrais une table pour deux."',
            '"Prenez ce médicament deux fois par jour."',
          ],
          correctOptionIndex: 0,
          explanation: 'At the market, the seller quotes a price and offers a deal.',
        ),
        JSS2InteractiveExercise(
          prompt: 'Pour réparer une incompréhension en conversation, on dit :',
          options: [
            '"Pourriez-vous répéter plus lentement, s\'il vous plaît ?"',
            '"L\'addition, s\'il vous plaît !"',
            '"Prenez le bus numéro 12."',
            '"Ajoutez du sel et remuez."',
          ],
          correctOptionIndex: 0,
          explanation: 'Communication repair = asking someone to repeat or slow down.',
        ),
        JSS2InteractiveExercise(
          prompt: 'Scénario : Restaurant — Après avoir mangé, le client dit :',
          options: [
            '"C\'était délicieux ! L\'addition, s\'il vous plaît."',
            '"J\'ai besoin d\'un sirop pour la toux."',
            '"Prenez la deuxième rue à gauche."',
            '"Voici mon ordonnance."',
          ],
          correctOptionIndex: 0,
          explanation: 'After a meal, compliment the food and ask for the bill.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Excusez-moi, pourriez-vous…', english: 'Excuse me, could you…'),
            DrillPair(french: 'Je voudrais… / J\'ai besoin de…', english: 'I would like… / I need…'),
            DrillPair(french: 'Quel est le prix de… / Ça coûte combien ?', english: 'What is the price of… / How much?'),
            DrillPair(french: 'Où se trouve… / Comment aller à… ?', english: 'Where is… / How do I get to…?'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (Excuse me, could you…):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Excusez-moi, pourriez-vous…', 'Je voudrais… / J\'ai besoin de…', 'Quel est le prix de… / Ça coûte combien ?', 'Où se trouve… / Comment aller à… ?'],
          correctWord: 'Excusez-moi, pourriez-vous…',
          explanation: 'Correct! "Excusez-moi, pourriez-vous…" translates to "Excuse me, could you…".',
        ),
      ],
      evaluation: [
        JSS2EvaluationQuestion(
          question: 'Choisis UN scénario et écris un dialogue de 6 répliques : Transport, Marché, Pharmacie, ou Restaurant.',
          answer: '[Transport] Voyageur : Excusez-moi, où est la gare ? Passant : Continuez tout droit, c\'est à 5 minutes. Voyageur : Merci ! Y a-t-il un bus pour Lagos ? Passant : Oui, le bus 47 part toutes les heures. Voyageur : À quelle heure part le prochain ? Passant : Dans vingt minutes, quai numéro 3.',
          hint: 'Use vocabulary from your chosen scenario. Be polite.',
        ),
        JSS2EvaluationQuestion(
          question: 'Cite 2 expressions utiles pour chaque scénario : Transport, Marché, Pharmacie, Restaurant.',
          answer: 'Transport: "Où est l\'arrêt de bus ?" / "À quelle heure part le train ?". Marché: "C\'est combien ?" / "Faites-moi un bon prix." Pharmacie: "J\'ai mal à la tête." / "Avez-vous un médicament contre la fièvre ?" Restaurant: "Je voudrais une table." / "L\'addition, s\'il vous plaît !"',
          hint: 'Think of one question and one statement per scenario.',
        ),
        JSS2EvaluationQuestion(
          question: 'Pourquoi les jeux de rôle sont-ils importants en classe de français ?',
          answer: 'Role-plays develop oral fluency, confidence, and the ability to use language in real-life situations. They prepare pupils for oral examinations and authentic French communication.',
          hint: 'Think: oral skills, real life, exam preparation.',
        ),
      ],
      homework: [
        JSS2AssignmentTask(
          category: 'Script de jeu de rôle',
          instruction: 'Write a complete 8-line role-play script for ONE scenario (Transport, Market, Pharmacy, or Restaurant). Practice reading it aloud with a family member.',
          exampleResponse: 'See in-class dialogue examples for each scenario.',
        ),
        JSS2AssignmentTask(
          category: 'Révision vocabulaire',
          instruction: 'Make a vocabulary revision chart with 4 columns (one per scenario). Write 5 key expressions for each scenario.',
          exampleResponse: 'Transport | Marché | Pharmacie | Restaurant — 5 expressions each.',
        ),
      ],
      grammarNote: JSS2GrammarNote(
        title: 'Communicative Repair Strategies in French',
        explanation:
            'In oral communication, it is natural to not understand. Key phrases for when you don\'t understand, want confirmation, or need clarification.',
        examples: [
          "Pourriez-vous répéter, s'il vous plaît ?",
          "Parlez plus lentement, s'il vous plaît.",
          "Je n'ai pas compris.",
          'Qu\'est-ce que vous avez dit ?',
          'Pouvez-vous épeler ce mot ?',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 6 — Révision générale des unités 17–20
    // ─────────────────────────────────────────────────────
    JSS2LessonModel(
      weekNumber: 6,
      termNumber: 3,
      theme: 'Révision Générale',
      frenchTitle: 'Révision des Unités 17 à 20',
      englishSubtitle: 'Consolidation Exercises — Units 17 to 20',
      teacherFacilitatorPrompt:
          'Use this week as a high-energy consolidation session. Rotate through 4 stations: (1) Number Calculation Sprint, (2) Food Vocab Flash Cards, (3) Recipe Imperative Builder, (4) Restaurant Dialogue Reconstruction. Each station is 8 minutes.',
      objectives: [
        'Recall and apply vocabulary and structures from all Term 3 units (17–20).',
        'Identify and correct common errors in arithmetic sentences, food articles, recipe imperatives, and restaurant dialogues.',
        'Complete a full mock evaluation covering all four units.',
        'Build confidence and fluency for the oral and written examinations.',
      ],
      culturalInsight:
          'Consolidation weeks (semaines de révision) are built into the French academic calendar before major examinations (baccalauréat, brevet). Nigerian JSS pupils benefit from this structured approach — reviewing, recycling, and reinforcing before their BECE/JSCE assessments.',
      patternType: JSS2PatternType.consolidationExercisesStudio,
      teachingStyle: TeachingStyle.interactiveStudio,
      vocabulary: [
        JSS2VocabItem(
          french: 'Réviser / consolider',
          phonetics: '[ʁe.vi.ze] / [kɔ̃.sɔ.li.de]',
          english: 'to revise / to consolidate',
          usageNote: 'Je dois réviser mes leçons.',
          icon: Icons.refresh_rounded,
          audioKey: 't3w6_reviser_consolider',
        ),
        JSS2VocabItem(
          french: 'les opérations',
          phonetics: '[le.z‿ɔ.pe.ʁa.sjɔ̃]',
          english: 'the operations',
          usageNote: 'Les quatre opérations de base en mathématiques.',
          icon: Icons.calculate_rounded,
          audioKey: 't3w6_operations',
        ),
        JSS2VocabItem(
          french: 'le repas / la recette',
          phonetics: '[lə ʁə.pa] / [la ʁə.sɛt]',
          english: 'the meal / the recipe',
          usageNote: 'Préparer un repas. Suivre une recette de cuisine.',
          icon: Icons.restaurant_rounded,
          audioKey: 't3w6_repas_recette',
        ),
        JSS2VocabItem(
          french: 'commander / payer',
          phonetics: '[kɔ.mɑ̃.de] / [pe.je]',
          english: 'to order / to pay',
          usageNote: 'Je commande un plat. Je paie en espèces.',
          icon: Icons.point_of_sale_rounded,
          audioKey: 't3w6_commander_payer',
        ),
        JSS2VocabItem(
          french: "J'aime / Je n'aime pas",
          phonetics: '[ʒɛm] / [ʒə nɛm pa]',
          english: "I like / I don't like",
          usageNote: "Food preferences: J'aime le chocolat.",
          icon: Icons.thumbs_up_down_rounded,
          audioKey: 't3w6_aime_naime_pas',
        ),
        JSS2VocabItem(
          french: 'Bon appétit !',
          phonetics: '[bɔ.n‿a.pe.ti]',
          english: 'Enjoy your meal!',
          usageNote: 'Said before eating in French culture.',
          icon: Icons.celebration_rounded,
          audioKey: 't3w6_bon_appetit',
        ),
        JSS2VocabItem(
          french: 'une erreur / une faute',
          phonetics: '[yn ɛ.ʁœʁ] / [yn fot]',
          english: 'a mistake / an error',
          usageNote: 'During revision: corrigez vos erreurs.',
          icon: Icons.warning_amber_rounded,
          audioKey: 't3w6_erreur_faute',
        ),
        JSS2VocabItem(
          french: 'Félicitations ! / Bravo !',
          phonetics: '[fe.li.si.ta.sjɔ̃] / [bʁa.vo]',
          english: 'Congratulations! / Well done!',
          usageNote: 'Used to celebrate correct answers during revision games.',
          icon: Icons.emoji_events_rounded,
          audioKey: 't3w6_felicitations_bravo',
        ),
      ],
      exercises: [
        JSS2InteractiveExercise(
          prompt: 'CALCUL — Vingt-cinq divisé par cinq font ___',
          options: ['cinq', 'quatre', 'six', 'sept'],
          correctOptionIndex: 0,
          explanation: '25 ÷ 5 = 5. "Font cinq."',
        ),
        JSS2InteractiveExercise(
          prompt: '"Je bois ___ eau fraîche." (article partitif correct)',
          options: ["de l'", 'du', 'de la', 'des'],
          correctOptionIndex: 0,
          explanation: '"Eau" starts with a vowel → "de l\'eau".',
        ),
        JSS2InteractiveExercise(
          prompt: 'Quelle est la forme correcte ? "___ les tomates."',
          options: ['Coupez (impératif)', 'Couper (infinitif)', 'Je coupe (présent)', 'Il coupe'],
          correctOptionIndex: 0,
          explanation: 'Recipes use the imperative vous-form: Coupez !',
        ),
        JSS2InteractiveExercise(
          prompt: '"Pour demander l\'addition on dit :"',
          options: ["L'addition, s'il vous plaît !", 'Le menu, s\'il vous plaît !', 'Le plat, s\'il vous plaît !', "L'entrée, s'il vous plaît !"],
          correctOptionIndex: 0,
          explanation: '"L\'addition" = the bill.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Réviser / consolider', english: 'to revise / to consolidate'),
            DrillPair(french: 'les opérations', english: 'the operations'),
            DrillPair(french: 'le repas / la recette', english: 'the meal / the recipe'),
            DrillPair(french: 'commander / payer', english: 'to order / to pay'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (to revise / to consolidate):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Réviser / consolider', 'les opérations', 'le repas / la recette', 'commander / payer'],
          correctWord: 'Réviser / consolider',
          explanation: 'Correct! "Réviser / consolider" translates to "to revise / to consolidate".',
        ),
      ],
      evaluation: [
        JSS2EvaluationQuestion(
          question: 'SPRINT FINAL (4 en 1) : (a) 7 × 8 = ? en français. (b) Article avec "lait" ? (c) Impératif de "mélanger". (d) Synonyme poli de "Je veux" au restaurant.',
          answer: '(a) Sept fois huit font cinquante-six. (b) du lait. (c) Mélangez ! (d) Je voudrais.',
          hint: 'Use the four units: calcul, articles partitifs, impératif, conditionnel.',
        ),
        JSS2EvaluationQuestion(
          question: 'Corrige les 3 fautes : "Je mange du viande avec la riz et je boire de jus."',
          answer: '"Je mange de la viande avec du riz et je bois du jus." (viande=feminine→de la, riz=masculine→du, boire→bois, jus→du jus)',
          hint: 'Check: gender of articles, verb conjugation, partitive articles.',
        ),
        JSS2EvaluationQuestion(
          question: 'Récapitulatif — Cite UN fait culturel lié à la nourriture ou aux restaurants en France.',
          answer: 'Possible answers: "Bon appétit" is said before meals; "l\'addition" is the correct restaurant term; French cuisine is UNESCO-listed; tipping (le pourboire) is optional.',
          hint: 'Think about dining customs, meal structure, or French cooking culture.',
        ),
      ],
      homework: [
        JSS2AssignmentTask(
          category: 'Fiche de révision',
          instruction: 'Create a one-page revision sheet: 5 arithmetic sentences, 5 food/drink sentences using partitive articles, 3 recipe steps (imperative), and 1 restaurant mini-dialogue.',
          exampleResponse: 'A comprehensive study sheet covering all 4 units (17–20).',
        ),
        JSS2AssignmentTask(
          category: 'Quiz familial',
          instruction: 'Test a family member at home: ask them 5 questions in French from any of the 4 units.',
          exampleResponse: 'Combien font 6 × 7 ? / Qu\'est-ce que tu bois le matin ?',
        ),
      ],
      grammarNote: JSS2GrammarNote(
        title: 'Term 3 Grammar Summary — Four Key Rules',
        explanation: 'Four grammar pillars from Term 3 Units 17–20 that must be mastered for examinations.',
        examples: [
          'CALCUL: Use "font" for arithmetic results. "Six plus quatre font dix."',
          'PARTITIF: DU (masc), DE LA (fem), DE L\' (vowel), DES (pl). Negation → DE/D\'.',
          'IMPÉRATIF: Vous-form without "vous". Coupez ! Mélangez ! Faites cuire !',
          'CONDITIONNEL: "Je voudrais" is polite. "Je veux" is abrupt.',
          'REPAIR: "Pourriez-vous répéter ?" to keep conversations going.',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 7 — Évaluation orale: Conversations guidées
    // ─────────────────────────────────────────────────────
    JSS2LessonModel(
      weekNumber: 7,
      termNumber: 3,
      theme: 'Évaluation Orale',
      frenchTitle: 'Les Conversations Guidées',
      englishSubtitle: 'Guided Oral Conversations — BECE/JSCE Oral Format',
      teacherFacilitatorPrompt:
          'This is an oral assessment week. Display the scenario card and rubric on the smartboard. Call pupils 1–2 at a time to perform their guided conversation (2–3 minutes). Assess: pronunciation, fluency, vocabulary range, communication strategies, and register. Record scores on the digital rubric.',
      objectives: [
        'Perform an oral conversation in French without preparation cards.',
        'Respond spontaneously to questions on transport, food, shopping, and health.',
        'Demonstrate correct pronunciation of French nasals, liaison, and accents.',
        'Use all three terms\' vocabulary naturally in spoken context.',
      ],
      culturalInsight:
          'The BECE oral component in Nigeria tests real communicative competence. French examiners look for: natural flow, appropriate vocabulary, self-correction, and cultural awareness. In France, the "contrôle continu" (continuous assessment) means every oral interaction counts. Confidence in spoken French is a lifelong skill.',
      patternType: JSS2PatternType.guidedConversationsStudio,
      teachingStyle: TeachingStyle.conversationalDialogue,
      vocabulary: [
        JSS2VocabItem(
          french: 'la prononciation',
          phonetics: '[la pʁɔ.nɔ̃.sja.sjɔ̃]',
          english: 'pronunciation',
          usageNote: 'Clear pronunciation is key for oral exams.',
          icon: Icons.record_voice_over_rounded,
          audioKey: 't3w7_prononciation',
        ),
        JSS2VocabItem(
          french: 'la liaison',
          phonetics: '[la lja.zɔ̃]',
          english: 'liaison (linking sounds)',
          usageNote: 'Les_enfants [le.z‿ɑ̃.fɑ̃]. Sound linking between words.',
          icon: Icons.link_rounded,
          audioKey: 't3w7_liaison',
        ),
        JSS2VocabItem(
          french: "le ton / l'intonation",
          phonetics: '[lə tɔ̃] / [lɛ̃.tɔ.na.sjɔ̃]',
          english: 'tone / intonation',
          usageNote: 'French questions rise in intonation: Tu viens ? ↗',
          icon: Icons.trending_up_rounded,
          audioKey: 't3w7_ton_intonation',
        ),
        JSS2VocabItem(
          french: 'Pardon ? / Comment ?',
          phonetics: '[paʁ.dɔ̃] / [kɔ.mɑ̃]',
          english: "Pardon? / What? (didn't hear)",
          usageNote: 'Polite way to ask someone to repeat.',
          icon: Icons.hearing_rounded,
          audioKey: 't3w7_pardon_comment',
        ),
        JSS2VocabItem(
          french: "C'est-à-dire… / En d'autres termes…",
          phonetics: "[sɛ.ta.diʁ] / [ɑ̃ dotʁ tɛʁm]",
          english: 'That is to say… / In other words…',
          usageNote: 'Discourse markers to rephrase or clarify.',
          icon: Icons.swap_horizontal_circle_rounded,
          audioKey: 't3w7_cest_a_dire',
        ),
        JSS2VocabItem(
          french: 'Oui, exactement / Tout à fait',
          phonetics: '[wi ɛɡ.zak.tə.mɑ̃] / [tu.t‿a fɛ]',
          english: 'Yes, exactly / Absolutely',
          usageNote: 'Agreeing confidently in conversation.',
          icon: Icons.check_circle_rounded,
          audioKey: 't3w7_oui_exactement',
        ),
        JSS2VocabItem(
          french: 'Eh bien… / En fait…',
          phonetics: '[e bjɛ̃] / [ɑ̃ fɛ]',
          english: 'Well… / Actually…',
          usageNote: 'Filler phrases for thinking time in conversations.',
          icon: Icons.chat_bubble_outline_rounded,
          audioKey: 't3w7_eh_bien_en_fait',
        ),
        JSS2VocabItem(
          french: "Je suis d'accord / Je ne suis pas d'accord",
          phonetics: "[ʒə sɥi da.kɔʁ] / [ʒə nə sɥi pa da.kɔʁ]",
          english: 'I agree / I disagree',
          usageNote: 'Express agreement and disagreement in discussions.',
          icon: Icons.balance_rounded,
          audioKey: 't3w7_daccord_pas_daccord',
        ),
      ],
      exercises: [
        JSS2InteractiveExercise(
          prompt: "ORAL DRILL — Quelle phrase peut-on utiliser si on n'a pas entendu ?",
          options: ['Pardon ? Pourriez-vous répéter ?', 'Bon appétit !', "L'addition, s'il vous plaît !", 'Coupez les oignons !'],
          correctOptionIndex: 0,
          explanation: '"Pardon ? Pourriez-vous répéter ?" is the polite way to ask for repetition.',
        ),
        JSS2InteractiveExercise(
          prompt: 'LIAISON — Laquelle de ces phrases contient une liaison obligatoire ?',
          options: ['Les_enfants arrivent.', 'Le garçon mange.', 'Elle parle bien.', 'Il travaille ici.'],
          correctOptionIndex: 0,
          explanation: '"Les_enfants" → liaison obligatoire: [le.z‿ɑ̃.fɑ̃].',
        ),
        JSS2InteractiveExercise(
          prompt: 'Quel est un bon marqueur discursif pour gagner du temps à l\'oral ?',
          options: ['Eh bien… / En fait…', "L'addition !", 'Vingt plus huit', 'Coupez et mélangez'],
          correctOptionIndex: 0,
          explanation: '"Eh bien..." and "En fait..." give thinking time while sounding natural.',
        ),
        JSS2InteractiveExercise(
          prompt: 'INTONATION — En français, les questions oui/non ont généralement :',
          options: ['Une intonation montante ↗', 'Une intonation descendante ↘', 'Une intonation plate →', 'Aucune intonation'],
          correctOptionIndex: 0,
          explanation: 'Yes/no questions in French typically have a rising intonation.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'la prononciation', english: 'pronunciation'),
            DrillPair(french: 'la liaison', english: 'liaison (linking sounds)'),
            DrillPair(french: 'Pardon ? / Comment ?', english: 'Pardon? / What? (didn'),
            DrillPair(french: 'Oui, exactement / Tout à fait', english: 'Yes, exactly / Absolutely'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (pronunciation):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['la prononciation', 'la liaison', 'Pardon ? / Comment ?', 'Oui, exactement / Tout à fait'],
          correctWord: 'la prononciation',
          explanation: 'Correct! "la prononciation" translates to "pronunciation".',
        ),
      ],
      evaluation: [
        JSS2EvaluationQuestion(
          question: 'Donne DEUX marqueurs discursifs utiles à l\'oral et explique quand les utiliser.',
          answer: '"Eh bien…" — use when you need a moment to think. "En fait…" — use to clarify or correct. Both sound natural and buy thinking time.',
          hint: 'Think: words French speakers use to hesitate naturally.',
        ),
        JSS2EvaluationQuestion(
          question: 'Qu\'est-ce que la liaison en français ? Donne un exemple.',
          answer: 'Liaison is the pronunciation of a normally silent final consonant when the next word starts with a vowel. Example: "Nous_allons" [nu.z‿a.lɔ̃], "Les_amis" [le.z‿a.mi].',
          hint: 'Think: final consonant + next word starting with vowel → sound joins.',
        ),
        JSS2EvaluationQuestion(
          question: 'Tu parles avec quelqu\'un et tu ne comprends pas. Que fais-tu ?',
          answer: 'Je dis : "Pardon ? Je n\'ai pas compris. Pourriez-vous répéter plus lentement, s\'il vous plaît ?" — This is a communication repair strategy.',
          hint: 'Use a polite repair phrase. Don\'t stay silent!',
        ),
      ],
      homework: [
        JSS2AssignmentTask(
          category: 'Pratique orale à la maison',
          instruction: 'Record yourself (audio/video) performing a 2-minute French conversation on ONE topic: food, transport, shopping, or health. Listen back and note any pronunciation errors.',
          exampleResponse: 'Self-assessment: What did I say well? What do I need to improve?',
        ),
        JSS2AssignmentTask(
          category: 'Fiche de sons difficiles',
          instruction: 'Practice these French sounds by repeating each 10 times aloud: [ʁ] (r), [y] (u), [œ] (eu), [ɔ̃] (on), [ɑ̃] (an), [ɛ̃] (in).',
          exampleResponse: '[ʁ] → restaurant. [y] → du. [œ] → bleu. [ɔ̃] → bon. [ɑ̃] → manger. [ɛ̃] → pain.',
        ),
      ],
      grammarNote: JSS2GrammarNote(
        title: 'French Oral Fluency: Liaison, Intonation & Fillers',
        explanation:
            'Three pillars of natural spoken French that examiners assess in oral evaluations. (1) LIAISON: linking final consonant to next vowel. (2) INTONATION: rising for questions, falling for statements. (3) FILLERS: natural pause words.',
        examples: [
          'LIAISON: Nous_allons [nu.z‿a.lɔ̃] / Les_enfants [le.z‿ɑ̃.fɑ̃]',
          'INTONATION QUESTION: Tu veux du café ? ↗',
          'INTONATION STATEMENT: Je ne veux pas de café. ↘',
          'FILLERS: "Eh bien...", "En fait...", "Bon...", "Voyons..."',
          'REPAIR: "Pardon ?", "C\'est-à-dire...", "Plus lentement s\'il vous plaît."',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 8 — Préparation aux examens
    // ─────────────────────────────────────────────────────
    JSS2LessonModel(
      weekNumber: 8,
      termNumber: 3,
      theme: 'Préparation aux Examens',
      frenchTitle: 'Préparez-vous aux Examens !',
      englishSubtitle: 'Exam Preparation — Written & Oral Expression',
      teacherFacilitatorPrompt:
          'This week simulates the BECE/JSCE French examination environment. Display the smartboard in "Exam Mode" with a countdown timer. Pupils complete sections: Section A (MCQ Vocabulary), Section B (Grammar Corrections), Section C (Guided Writing), Section D (Oral Prep).',
      objectives: [
        'Complete a full mock BECE/JSCE-style French examination under timed conditions.',
        'Identify and correct common grammatical errors in French sentences.',
        'Write a structured paragraph or short letter in French (guided writing).',
        'Demonstrate oral readiness for the spoken examination component.',
      ],
      culturalInsight:
          'The BECE in Nigeria is the gateway examination at the end of JSS3. French is a core subject testing: reading comprehension, vocabulary, grammar, guided composition, and listening/oral. Preparation at JSS2 builds the foundation. Understanding the exam format is as important as knowing the language.',
      patternType: JSS2PatternType.examPrepStudio,
      teachingStyle: TeachingStyle.interactiveStudio,
      vocabulary: [
        JSS2VocabItem(
          french: "l'examen / le brevet",
          phonetics: "[lɛɡ.za.mɛ̃] / [lə bʁə.vɛ]",
          english: 'the exam / the certificate',
          usageNote: 'Je prépare l\'examen de français.',
          icon: Icons.assignment_rounded,
          audioKey: 't3w8_examen_brevet',
        ),
        JSS2VocabItem(
          french: 'la compréhension écrite',
          phonetics: '[la kɔ̃.pʁe.ɑ̃.sjɔ̃ e.kʁit]',
          english: 'reading comprehension',
          usageNote: 'Lisez le texte et répondez aux questions.',
          icon: Icons.auto_stories_rounded,
          audioKey: 't3w8_comprehension_ecrite',
        ),
        JSS2VocabItem(
          french: "l'expression écrite",
          phonetics: "[lɛks.pʁɛ.sjɔ̃ e.kʁit]",
          english: 'written expression',
          usageNote: 'Écrivez un paragraphe de 50 mots sur votre journée.',
          icon: Icons.edit_note_rounded,
          audioKey: 't3w8_expression_ecrite',
        ),
        JSS2VocabItem(
          french: "la grammaire / l'orthographe",
          phonetics: "[la ɡʁa.mɛʁ] / [lɔʁ.tɔ.ɡʁaf]",
          english: 'grammar / spelling',
          usageNote: "Attention à la grammaire et à l'orthographe !",
          icon: Icons.spellcheck_rounded,
          audioKey: 't3w8_grammaire_orthographe',
        ),
        JSS2VocabItem(
          french: 'souligner / encercler / relier',
          phonetics: '[su.li.ɲe] / [ɑ̃.sɛʁ.kle] / [ʁə.lje]',
          english: 'to underline / to circle / to match',
          usageNote: 'Common exam instructions: Soulignez les verbes.',
          icon: Icons.draw_rounded,
          audioKey: 't3w8_souligner_encercler',
        ),
        JSS2VocabItem(
          french: 'Lisez attentivement',
          phonetics: '[li.ze a.tɑ̃.tiv.mɑ̃]',
          english: 'Read carefully',
          usageNote: 'Always read exam questions carefully before answering.',
          icon: Icons.visibility_rounded,
          audioKey: 't3w8_lisez_attentivement',
        ),
        JSS2VocabItem(
          french: 'complétez / transformez',
          phonetics: '[kɔ̃.ple.te] / [tʁɑ̃s.fɔʁ.me]',
          english: 'complete / transform',
          usageNote: 'Common instructions: Complétez les phrases.',
          icon: Icons.transform_rounded,
          audioKey: 't3w8_completez_transformez',
        ),
        JSS2VocabItem(
          french: 'Bonne chance !',
          phonetics: '[bɔn ʃɑ̃s]',
          english: 'Good luck!',
          usageNote: 'Said to someone before an exam.',
          icon: Icons.star_rounded,
          audioKey: 't3w8_bonne_chance',
        ),
      ],
      exercises: [
        JSS2InteractiveExercise(
          prompt: 'SECTION A — "Je ___ du pain ce matin." (completed action — manger)',
          options: ["ai mangé", 'mange', 'manges', 'mangeons'],
          correctOptionIndex: 0,
          explanation: '"J\'ai mangé" — passé composé for a completed action.',
        ),
        JSS2InteractiveExercise(
          prompt: 'SECTION B — Trouvez la faute : "Nous buvons du thé chaque jours."',
          options: ['"jours" doit être "jour" (pas de pluriel après "chaque")', '"buvons" est faux', '"du thé" est faux', '"et" est incorrect'],
          correctOptionIndex: 0,
          explanation: '"Chaque" is always singular: "chaque jour" not "chaque jours".',
        ),
        JSS2InteractiveExercise(
          prompt: 'SECTION C — Quelle structure commence un paragraphe formel en français ?',
          options: ["Une phrase d'introduction générale", 'Commencer directement par les détails', 'Toujours commencer par "Bonjour"', 'Commencer par une liste'],
          correctOptionIndex: 0,
          explanation: "A formal French paragraph begins with a general introductory sentence (phrase d'accroche).",
        ),
        JSS2InteractiveExercise(
          prompt: 'CONSIGNE EXAM — "Soulignez les adjectifs dans la phrase." Que faut-il faire ?',
          options: ['Underline all adjectives in the sentence', 'Circle all nouns', 'Match adjectives to nouns', 'Transform to plural'],
          correctOptionIndex: 0,
          explanation: '"Souligner" = to underline. Find and underline adjectives.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'la compréhension écrite', english: 'reading comprehension'),
            DrillPair(french: 'souligner / encercler / relier', english: 'to underline / to circle / to match'),
            DrillPair(french: 'Lisez attentivement', english: 'Read carefully'),
            DrillPair(french: 'complétez / transformez', english: 'complete / transform'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (reading comprehension):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['la compréhension écrite', 'souligner / encercler / relier', 'Lisez attentivement', 'complétez / transformez'],
          correctWord: 'la compréhension écrite',
          explanation: 'Correct! "la compréhension écrite" translates to "reading comprehension".',
        ),
      ],
      evaluation: [
        JSS2EvaluationQuestion(
          question: 'SECTION C (Rédaction guidée) — Écris 4 phrases sur ta journée scolaire en utilisant des verbes au présent.',
          answer: 'Le matin, je me réveille à six heures. Je prends le petit-déjeuner avec ma famille. À l\'école, j\'apprends le français et les mathématiques. Le soir, je fais mes devoirs et je lis un livre.',
          hint: 'Use verbs: se réveiller, prendre, apprendre, faire, lire. Time words: le matin, à l\'école, le soir.',
        ),
        JSS2EvaluationQuestion(
          question: 'Corrigez la lettre (4 fautes) : "Cher ami, Je suis tres content. Hier, j\'ai mangé du viandes et de le riz. C\'était tres bon !"',
          answer: '"très" (accent), "de la viande" (feminine→de la), "du riz" (not "de le"), "très" (accent again).',
          hint: 'Look for: missing accents, wrong partitive articles, wrong gender agreement.',
        ),
        JSS2EvaluationQuestion(
          question: 'Qu\'est-ce que le "passé composé" ? Donne un exemple avec MANGER.',
          answer: 'Le passé composé expresses a completed past action. Formation: avoir (present) + past participle. Example: J\'ai mangé du riz hier soir.',
          hint: 'Passé composé = present of avoir + past participle.',
        ),
      ],
      homework: [
        JSS2AssignmentTask(
          category: 'Révision finale — Mini-bilan',
          instruction: 'Create a "Year Review Cheat Sheet": List the 5 most important grammar rules from JSS2 French (Terms 1, 2, 3) with one example for each.',
          exampleResponse: 'Term 1: EN vs À for transport. Term 2: Partitive articles. Term 3: Imperative for recipes.',
        ),
        JSS2AssignmentTask(
          category: 'Lettre de révision',
          instruction: 'Write a 6-sentence informal letter in French to a friend: what you ate today, where you went, and what you will do tomorrow.',
          exampleResponse: "Cher ami, Aujourd'hui j'ai mangé du riz au marché. Je suis allé à l'école. Demain, je réviserai mon français. À bientôt !",
        ),
      ],
      grammarNote: JSS2GrammarNote(
        title: 'Passé Composé — Essential for BECE/JSCE',
        explanation:
            'The passé composé is the most tested past tense in Nigerian BECE French examinations. It describes completed past actions. Formation: Subject + AVOIR (present) + Past Participle. Common past participles: manger → mangé, boire → bu, faire → fait.',
        examples: [
          "J'ai mangé du riz hier. (I ate rice yesterday.)",
          "Nous avons bu de l'eau froide. (We drank cold water.)",
          'Elle est allée au marché. (She went to the market. — ÊTRE verb)',
          'Il a fait ses devoirs. (He did his homework.)',
          'Tu as acheté quoi ? (What did you buy?)',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 9 — Grand Rallye Final: Championnat de l'Année
    // ─────────────────────────────────────────────────────
    JSS2LessonModel(
      weekNumber: 9,
      termNumber: 3,
      theme: 'Grand Bilan Final',
      frenchTitle: "Le Grand Rallye de l'Année Complète",
      englishSubtitle: 'Annual Championship Rally — 3 Terms, All Units, One Grand Champion',
      teacherFacilitatorPrompt:
          'Final lesson of the year! Set up the 4-Team Championship Arena. Each round pulls questions from Terms 1, 2, and 3. Teams earn points for speed and accuracy. Use the buzzer SFX system. Final podium reveals the JSS2 French Champion. Award certificates and celebrate!',
      objectives: [
        'Recall and apply key vocabulary and grammar from all three terms.',
        'Compete as a team in a French language championship quiz.',
        'Celebrate one complete academic year of French language learning.',
        'Build motivation and enthusiasm for JSS3 French.',
      ],
      culturalInsight:
          'End-of-year celebrations (fêtes de fin d\'année) are deeply embedded in French culture — from school prize-giving ceremonies (remise des prix) to theatrical performances. In Francophone West Africa, the "fête scolaire" marks the end of the academic year with songs, dances, and awards.',
      patternType: JSS2PatternType.term3RevisionRally,
      teachingStyle: TeachingStyle.interactiveStudio,
      vocabulary: [
        JSS2VocabItem(
          french: 'Félicitations ! Bravo !',
          phonetics: '[fe.li.si.ta.sjɔ̃] / [bʁa.vo]',
          english: 'Congratulations! / Well done!',
          usageNote: 'Used at the end-of-year ceremony.',
          icon: Icons.emoji_events_rounded,
          audioKey: 't3w9_felicitations_bravo',
        ),
        JSS2VocabItem(
          french: 'le champion / la championne',
          phonetics: '[lə ʃɑ̃.pjɔ̃] / [la ʃɑ̃.pjɔn]',
          english: 'the champion (m/f)',
          usageNote: "L'équipe gagnante est le champion de l'année !",
          icon: Icons.military_tech_rounded,
          audioKey: 't3w9_champion',
        ),
        JSS2VocabItem(
          french: 'le podium / le trophée',
          phonetics: '[lə pɔ.djom] / [lə tʁɔ.fe]',
          english: 'the podium / the trophy',
          usageNote: "L'équipe 1 monte sur le podium et reçoit le trophée.",
          icon: Icons.workspace_premium_rounded,
          audioKey: 't3w9_podium_trophee',
        ),
        JSS2VocabItem(
          french: 'le score / les points',
          phonetics: '[lə skɔʁ] / [le pwɛ̃]',
          english: 'the score / the points',
          usageNote: "Quel est votre score ? / L'équipe B a dix points.",
          icon: Icons.scoreboard_rounded,
          audioKey: 't3w9_score_points',
        ),
        JSS2VocabItem(
          french: "L'équipe A/B/C/D",
          phonetics: '[le.ki:p]',
          english: 'Team A/B/C/D',
          usageNote: 'Divided into 4 teams for the championship.',
          icon: Icons.groups_rounded,
          audioKey: 't3w9_equipe',
        ),
        JSS2VocabItem(
          french: 'À vous de jouer !',
          phonetics: '[a vu də ʒwe]',
          english: 'Your turn to play!',
          usageNote: "Used to signal a team's turn in the rally.",
          icon: Icons.sports_esports_rounded,
          audioKey: 't3w9_a_vous_jouer',
        ),
        JSS2VocabItem(
          french: 'la remise des prix',
          phonetics: '[la ʁə.miz de pʁi]',
          english: 'prize-giving ceremony',
          usageNote: "La remise des prix de fin d'année.",
          icon: Icons.card_giftcard_rounded,
          audioKey: 't3w9_remise_des_prix',
        ),
        JSS2VocabItem(
          french: 'Bonne continuation !',
          phonetics: '[bɔn kɔ̃.ti.ny.a.sjɔ̃]',
          english: 'All the best! / Keep it up!',
          usageNote: 'Said at the end of the year or when parting ways.',
          icon: Icons.arrow_forward_rounded,
          audioKey: 't3w9_bonne_continuation',
        ),
      ],
      exercises: [
        JSS2InteractiveExercise(
          prompt: 'TERM 1 RECALL — "Pour aller à la gare, ___." (continue straight)',
          options: ['continuez tout droit', 'tournez à droite', 'prenez le bus', 'revenez en arrière'],
          correctOptionIndex: 0,
          explanation: '"Continuez tout droit" = keep going straight. Term 1: Demander/indiquer le chemin.',
        ),
        JSS2InteractiveExercise(
          prompt: 'TERM 2 RECALL — "J\'ai mal à la gorge." Le pharmacien dit :',
          options: ['Je vous recommande ce sirop.', 'Voici votre baguette.', 'Le bus part dans 5 minutes.', 'Prenez la première rue.'],
          correctOptionIndex: 0,
          explanation: 'Term 2: À la pharmacie. For a sore throat, the pharmacist recommends a syrup.',
        ),
        JSS2InteractiveExercise(
          prompt: 'TERM 3 RECALL — "Au restaurant, pour demander la note :"',
          options: ["L'addition, s'il vous plaît !", 'Une table pour deux !', 'Du riz, s\'il vous plaît !', 'Bon appétit !'],
          correctOptionIndex: 0,
          explanation: 'Term 3: Au restaurant. "L\'addition" is always the correct term for the bill.',
        ),
        JSS2InteractiveExercise(
          prompt: 'GRAND BILAN — Complétez : "Seize plus douze font ___."',
          options: ['vingt-huit', 'vingt-six', 'trente', 'vingt-quatre'],
          correctOptionIndex: 0,
          explanation: '16 + 12 = 28 = vingt-huit.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Félicitations ! Bravo !', english: 'Congratulations! / Well done!'),
            DrillPair(french: 'le champion / la championne', english: 'the champion (m/f)'),
            DrillPair(french: 'le podium / le trophée', english: 'the podium / the trophy'),
            DrillPair(french: 'le score / les points', english: 'the score / the points'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS2InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (Congratulations! / Well done!):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Félicitations ! Bravo !', 'le champion / la championne', 'le podium / le trophée', 'le score / les points'],
          correctWord: 'Félicitations ! Bravo !',
          explanation: 'Correct! "Félicitations ! Bravo !" translates to "Congratulations! / Well done!".',
        ),
      ],
      evaluation: [
        JSS2EvaluationQuestion(
          question: 'BILAN ANNUEL — Cite UN apprentissage clé de chaque trimestre de l\'année.',
          answer: 'T1 : Prépositions spatiales (sur, sous, devant) et transport (EN bus / À vélo). T2 : Articles partitifs (du, de la, de l\'...) et achats au marché. T3 : Impératif culinaire (Coupez ! Mélangez !) et "je voudrais" au restaurant.',
          hint: 'One grammar/vocab concept from each of the three terms.',
        ),
        JSS2EvaluationQuestion(
          question: 'Écris une phrase en français pour chaque thème : Transport, Nourriture, Restaurant.',
          answer: 'Transport: "Je prends le bus pour aller à l\'école." Nourriture: "J\'aime manger du riz avec de la sauce." Restaurant: "Je voudrais une table pour deux et l\'addition, s\'il vous plaît."',
          hint: 'Use vocabulary from each term\'s main theme.',
        ),
        JSS2EvaluationQuestion(
          question: 'Pourquoi est-il important d\'apprendre le français en Nigeria ?',
          answer: 'French is an official language of 8 of Nigeria\'s neighbouring countries (Bénin, Niger, Cameroon, Chad, etc.) and is one of the AU\'s official languages. It opens doors for trade, diplomacy, ECOWAS travel, higher education in Francophone countries, and international careers.',
          hint: 'Think: neighbouring countries, ECOWAS, trade, education, diplomacy.',
        ),
      ],
      homework: [
        JSS2AssignmentTask(
          category: "Lettre de fin d'année",
          instruction: 'Write a short letter (6–8 sentences) in French to your JSS3 self. Describe what you learned in JSS2 French and what you hope to achieve in JSS3.',
          exampleResponse: "Cher futur moi, Cette année, j'ai appris les prépositions, les transports, les achats, la cuisine et les restaurants. En JSS3, je veux parler encore mieux et réussir mon BECE. Bonne continuation !",
        ),
        JSS2AssignmentTask(
          category: 'Résumé annuel',
          instruction: 'Create an illustrated "Year in Review" mini-poster listing 10 French words or phrases you will never forget, with drawings and English translations.',
          exampleResponse: 'Personal choice — any 10 memorable expressions from the year.',
        ),
      ],
      grammarNote: JSS2GrammarNote(
        title: 'JSS2 French — A Year in Grammar: The 6 Pillars',
        explanation: 'Six grammar rules that anchor the entire JSS2 French curriculum across all three terms.',
        examples: [
          'T1: Spatial Prepositions — sur, sous, devant, derrière, dans, entre, à côté de.',
          'T1: Transport Rule — EN (closed vehicle). À (open/active): à vélo / à pied.',
          'T2: Partitive Articles — DU (m), DE LA (f), DE L\' (vowel), DES (pl). Négation → DE.',
          'T2: "avoir besoin de" + noun. "ça sert à" + infinitive.',
          'T3: Imperative (vous-form) for recipes — Coupez ! Faites cuire ! Mélangez !',
          'T3: "Je voudrais" (conditional) for polite requests. "Je veux" is too abrupt.',
        ],
      ),
    ),
  ];
}
