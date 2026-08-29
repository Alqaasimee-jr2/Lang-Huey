import 'package:flutter/material.dart';
import '../models/p4_lesson_model.dart';

/// Primary 4 French - Third Term (Troisième Trimestre)
/// 100% Comprehensive Curriculum based on Nigerian NERDC Approved Schemes of Work
class P4Term3Lessons {
  static final List<P4Lesson> weeks = [
    // ==========================================
    // WEEK 1: Telling Time (L'heure)
    // ==========================================
    P4Lesson(
      term: 3,
      week: 1,
      topic: "Demander et Dire l'Heure",
      subtitle: "Theme: Daily Life & Time · Telling Time in French",
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: [
        "Pupils learn to ask the time using \"Quelle heure est-il ?\", state the exact hour using \"Il est ... heure(s)\", and identify \"Il est midi\" (12:00 PM) and \"Il est minuit\" (12:00 AM)."
      ],
      culturalInsight:
          "In France and Francophone countries, punctuality is highly valued, especially in schools and train stations. The SNCF (French National Railway) relies on precise hourly announcements!",
      vocabItems: [
        P4VocabItem(
          french: "L'heure",
          phonetics: "luhr",
          english: "The time / The hour",
          icon: Icons.access_time_rounded,
          audioKey: "lheure",
        ),
        P4VocabItem(
          french: "Quelle heure est-il ?",
          phonetics: "kel uhr eh-teel",
          english: "What time is it?",
          icon: Icons.help_outline_rounded,
          audioKey: "quelle_heure_est_il",
        ),
        P4VocabItem(
          french: "Il est une heure",
          phonetics: "eel eh oon uhr",
          english: "It is one o'clock (1:00)",
          icon: Icons.looks_one_rounded,
          audioKey: "il_est_une_heure",
        ),
        P4VocabItem(
          french: "Il est deux heures",
          phonetics: "eel eh duh-zuhr",
          english: "It is two o'clock (2:00)",
          icon: Icons.looks_two_rounded,
          audioKey: "il_est_deux_heures",
        ),
        P4VocabItem(
          french: "Il est trois heures",
          phonetics: "eel eh trwah-zuhr",
          english: "It is three o'clock (3:00)",
          icon: Icons.looks_3_rounded,
          audioKey: "il_est_trois_heures",
        ),
        P4VocabItem(
          french: "Il est six heures",
          phonetics: "eel eh see-zuhr",
          english: "It is six o'clock (6:00)",
          icon: Icons.looks_6_rounded,
          audioKey: "il_est_six_heures",
        ),
        P4VocabItem(
          french: "Il est midi",
          phonetics: "eel eh mee-dee",
          english: "It is midday / noon (12:00 PM)",
          icon: Icons.wb_sunny_rounded,
          audioKey: "il_est_midi",
        ),
        P4VocabItem(
          french: "Il est minuit",
          phonetics: "eel eh meen-wee",
          english: "It is midnight (12:00 AM)",
          icon: Icons.nightlight_round,
          audioKey: "il_est_minuit",
        ),
        P4VocabItem(
          french: "La montre",
          phonetics: "lah mohn-truh",
          english: "The wristwatch",
          icon: Icons.watch_rounded,
          audioKey: "la_montre",
        ),
        P4VocabItem(
          french: "L'horloge",
          phonetics: "lor-lozh",
          english: "The clock",
          icon: Icons.schedule_rounded,
          audioKey: "lhorloge",
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: "How to Tell the Time in French",
          explanation:
              "To state the time, start with \"Il est\" followed by the number of the hour and the word \"heure\" (for 1:00) or \"heures\" (for 2:00 to 12:00). Notice the liaison sound (z) between the number and 'heures'.",
          examples: [
            "Quelle heure est-il ? -> Il est une heure (1:00 - singular 'heure').",
            "Il est deux heures (2:00 - plural 'heures' with 'z' liaison).",
            "Special hours: 'Il est midi' (12:00 PM) and 'Il est minuit' (12:00 AM) do not use the word 'heures'.",
          ],
        ),
      ],
      classworkExercises: [
        P4InteractiveExercise(
          prompt: "How do you say 'It is two o'clock' in French?",
          options: [
            "Il est deux heures",
            "Il est midi",
            "Quelle heure est-il ?",
            "Il est une heure"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Il est deux heures\" means 'It is two o'clock'. Remember that for numbers greater than one, we write 'heures' with an 's'!",
        ),
        P4InteractiveExercise(
          prompt: "What does \"Il est midi\" mean in English?",
          options: [
            "It is midnight (12:00 AM)",
            "It is noon / midday (12:00 PM)",
            "It is one o'clock (1:00 PM)",
            "It is six o'clock (6:00 PM)"
          ],
          correctOptionIndex: 1,
          explanation:
              "\"Midi\" comes from 'mi' (middle) and 'di' (day), so \"Il est midi\" means 'It is noon / midday'!",
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          question: "Ask your partner what time it is in French.",
          answer: "Quelle heure est-il ?",
          hint: "Starts with 'Quelle heure...'",
        ),
        P4EvaluationQuestion(
          question: "If the clock shows 6:00, what will you say?",
          answer: "Il est six heures.",
          hint: "Number 6 is 'six', pronounced with liaison 'see-zuhr'.",
        ),
      ],
      assignmentTasks: [
        P4AssignmentTask(
          category: "Drawing & Written",
          instruction:
              "Draw 3 clocks in your notebook showing 1:00, 6:00, and 12:00 noon. Write the correct French sentence under each clock.",
        ),
        P4AssignmentTask(
          category: "Oral Practice",
          instruction:
              "Practice asking 3 family members at home \"Quelle heure est-il ?\" and telling them the time in French.",
        ),
      ],
    ),

    // ==========================================
    // WEEK 2: Daily Routine (Ma Routine Quotidienne)
    // ==========================================
    P4Lesson(
      term: 3,
      week: 2,
      topic: "Ma Routine Quotidienne et l'Emploi du Temps",
      subtitle: "Theme: Daily Habits · Chronological Routine & Reflexive Actions",
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: [
        "Pupils learn to describe their daily morning, afternoon, and bedtime actions in French, linking each activity to a specific time."
      ],
      culturalInsight:
          "French school pupils often have a mid-day lunch break called \"la pause déjeuner\" where they sit together and enjoy a balanced three-course meal with their friends.",
      vocabItems: [
        P4VocabItem(
          french: "Je me réveille",
          phonetics: "zhuh muh ray-vay",
          english: "I wake up",
          icon: Icons.alarm_rounded,
          audioKey: "je_me_reveille",
        ),
        P4VocabItem(
          french: "Je me lave",
          phonetics: "zhuh muh lahv",
          english: "I wash myself / I take a bath",
          icon: Icons.bathtub_rounded,
          audioKey: "je_me_lave",
        ),
        P4VocabItem(
          french: "Je m'habille",
          phonetics: "zhuh mah-bee",
          english: "I get dressed",
          icon: Icons.checkroom_rounded,
          audioKey: "je_mhabille",
        ),
        P4VocabItem(
          french: "Je prends le petit déjeuner",
          phonetics: "zhuh prahn luh puh-tee day-zhuh-nay",
          english: "I eat breakfast",
          icon: Icons.bakery_dining_rounded,
          audioKey: "je_prends_le_petit_dejeuner",
        ),
        P4VocabItem(
          french: "Je vais à l'école",
          phonetics: "zhuh vay ah lay-kohl",
          english: "I go to school",
          icon: Icons.school_rounded,
          audioKey: "je_vais_a_lecole",
        ),
        P4VocabItem(
          french: "J'étudie en classe",
          phonetics: "zhay-too-dee ahn klahs",
          english: "I study in class",
          icon: Icons.menu_book_rounded,
          audioKey: "jetudie_en_classe",
        ),
        P4VocabItem(
          french: "Je joue avec mes amis",
          phonetics: "zhuh zhoo ah-vek may-zah-mee",
          english: "I play with my friends",
          icon: Icons.sports_soccer_rounded,
          audioKey: "je_joue_avec_mes_amis",
        ),
        P4VocabItem(
          french: "Je dîne avec ma famille",
          phonetics: "zhuh deen ah-vek mah fah-mee",
          english: "I eat dinner with my family",
          icon: Icons.restaurant_rounded,
          audioKey: "je_dine_avec_ma_famille",
        ),
        P4VocabItem(
          french: "Je me couche / Je dors",
          phonetics: "zhuh muh koosh / zhuh dohr",
          english: "I go to bed / I sleep",
          icon: Icons.bedtime_rounded,
          audioKey: "je_me_couche",
        ),
        P4VocabItem(
          french: "Le matin et le soir",
          phonetics: "luh mah-tahn ay luh swahr",
          english: "Morning and evening",
          icon: Icons.wb_twilight_rounded,
          audioKey: "le_matin_et_le_soir",
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: "Connecting Routine Actions with Time (À + Time)",
          explanation:
              "To tell when you perform an action, use the preposition \"À\" (at) before the hour, followed by the routine sentence.",
          examples: [
            "À six heures, je me réveille (At 6:00, I wake up).",
            "À sept heures, je prends le petit déjeuner (At 7:00, I eat breakfast).",
            "À huit heures, je vais à l'école (At 8:00, I go to school).",
            "À vingt heures (huit heures du soir), je me couche (At 8:00 PM, I go to bed).",
          ],
        ),
      ],
      classworkExercises: [
        P4InteractiveExercise(
          prompt: "Complete the sentence: \"À six heures, je ______.\" (At 6:00, I wake up.)",
          options: [
            "me réveille",
            "vais à l'école",
            "me couche",
            "dîne"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Je me réveille\" means 'I wake up'. So the complete sentence is \"À six heures, je me réveille.\"",
        ),
        P4InteractiveExercise(
          prompt: "What is the French phrase for 'I go to bed'?",
          options: [
            "Je me couche",
            "Je me lave",
            "Je joue",
            "Je m'habille"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Je me couche\" means 'I go to bed / I lie down'.",
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          question: "Say in French: 'At seven o'clock, I go to school.'",
          answer: "À sept heures, je vais à l'école.",
          hint: "Combine 'À sept heures' + 'je vais à l'école'.",
        ),
        P4EvaluationQuestion(
          question: "What do you do at night before sleeping? (In French)",
          answer: "Je me couche / Je dors.",
          hint: "Use 'Je me couche'.",
        ),
      ],
      assignmentTasks: [
        P4AssignmentTask(
          category: "Written Routine Schedule",
          instruction:
              "Write a 4-step daily schedule in French in your notebook: 1. Wake up, 2. Breakfast, 3. School, 4. Sleep, with the time for each.",
        ),
      ],
    ),

    // ==========================================
    // WEEK 3: Food & Meals (Les Repas et la Nourriture)
    // ==========================================
    P4Lesson(
      term: 3,
      week: 3,
      topic: "Les Repas et les Aliments du Quotidien",
      subtitle: "Theme: Food & Nutrition · 3 Daily Meals & Common Foods",
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: [
        "Pupils learn the names of the 3 daily meals, identify common Nigerian and French staple foods and drinks, and use correct French gender articles (le, la, l', les)."
      ],
      culturalInsight:
          "Bread is an essential part of French heritage! The traditional French baguette was added to UNESCO's Intangible Cultural Heritage list in 2022.",
      vocabItems: [
        P4VocabItem(
          french: "Le repas",
          phonetics: "luh ruh-pah",
          english: "The meal",
          icon: Icons.dinner_dining_rounded,
          audioKey: "le_repas",
        ),
        P4VocabItem(
          french: "Le petit déjeuner",
          phonetics: "luh puh-tee day-zhuh-nay",
          english: "Breakfast (Morning meal)",
          icon: Icons.free_breakfast_rounded,
          audioKey: "le_petit_dejeuner",
        ),
        P4VocabItem(
          french: "Le déjeuner",
          phonetics: "luh day-zhuh-nay",
          english: "Lunch (Afternoon meal)",
          icon: Icons.lunch_dining_rounded,
          audioKey: "le_dejeuner",
        ),
        P4VocabItem(
          french: "Le dîner",
          phonetics: "luh deen-ay",
          english: "Dinner (Evening meal)",
          icon: Icons.ramen_dining_rounded,
          audioKey: "le_diner",
        ),
        P4VocabItem(
          french: "Le pain",
          phonetics: "luh pahn",
          english: "The bread",
          icon: Icons.breakfast_dining_rounded,
          audioKey: "le_pain",
        ),
        P4VocabItem(
          french: "Le riz",
          phonetics: "luh ree",
          english: "The rice",
          icon: Icons.rice_bowl_rounded,
          audioKey: "le_riz",
        ),
        P4VocabItem(
          french: "Le poulet",
          phonetics: "luh poo-lay",
          english: "The chicken",
          icon: Icons.kebab_dining_rounded,
          audioKey: "le_poulet",
        ),
        P4VocabItem(
          french: "Le poisson",
          phonetics: "luh pwah-sohn",
          english: "The fish",
          icon: Icons.set_meal_rounded,
          audioKey: "le_poisson",
        ),
        P4VocabItem(
          french: "La viande",
          phonetics: "lah vee-ahnd",
          english: "The meat / Beef",
          icon: Icons.outdoor_grill_rounded,
          audioKey: "la_viande",
        ),
        P4VocabItem(
          french: "L'eau",
          phonetics: "loh",
          english: "The water",
          icon: Icons.water_drop_rounded,
          audioKey: "leau",
        ),
        P4VocabItem(
          french: "Le lait",
          phonetics: "luh lay",
          english: "The milk",
          icon: Icons.local_cafe_rounded,
          audioKey: "le_lait",
        ),
        P4VocabItem(
          french: "Les fruits",
          phonetics: "lay frwee",
          english: "The fruits",
          icon: Icons.apple_rounded,
          audioKey: "les_fruits",
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: "Gender of Food Nouns (Le, La, L', Les)",
          explanation:
              "In French, every food noun has a grammatical gender. Use 'Le' for masculine foods, 'La' for feminine foods, 'L'' before vowels, and 'Les' for plurals.",
          examples: [
            "Masculine: Le pain, Le riz, Le poulet, Le poisson, Le lait.",
            "Feminine: La viande, La soupe, La banane.",
            "Vowel: L'eau, L'orange, L'œuf.",
            "Plural: Les fruits, Les légumes, Les œufs.",
          ],
        ),
      ],
      classworkExercises: [
        P4InteractiveExercise(
          prompt: "Which meal is eaten in the morning?",
          options: [
            "Le petit déjeuner",
            "Le dîner",
            "Le déjeuner",
            "Le repas"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Le petit déjeuner\" is breakfast, eaten in the morning. \"Le déjeuner\" is lunch and \"Le dîner\" is dinner.",
        ),
        P4InteractiveExercise(
          prompt: "What is the French word for 'The chicken'?",
          options: [
            "Le poulet",
            "Le poisson",
            "Le pain",
            "Le riz"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Le poulet\" is chicken. \"Le poisson\" is fish and \"Le pain\" is bread.",
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          question: "Name the 3 meals of the day in French.",
          answer: "Le petit déjeuner, le déjeuner, et le dîner.",
          hint: "Breakfast, lunch, dinner.",
        ),
        P4EvaluationQuestion(
          question: "How do you say 'The rice and the fish' in French?",
          answer: "Le riz et le poisson.",
          hint: "Both are masculine: 'Le riz et le poisson'.",
        ),
      ],
      assignmentTasks: [
        P4AssignmentTask(
          category: "Food Menu Project",
          instruction:
              "Draw a restaurant menu in your notebook with sections for 'Petit déjeuner', 'Déjeuner', and 'Dîner', listing 2 foods under each.",
        ),
      ],
    ),

    // ==========================================
    // WEEK 4: Hunger, Thirst & Preferences (Exprimer la Faim et les Préférences)
    // ==========================================
    P4Lesson(
      term: 3,
      week: 4,
      topic: "Exprimer la Faim, la Soif et ses Goûts",
      subtitle: "Theme: Needs & Preferences · J'ai faim / J'ai soif & Aimer/Vouloir",
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: [
        "Pupils learn to express physical states of hunger and thirst using \"Avoir faim\" and \"Avoir soif\", express food preferences with \"J'aime / Je n'aime pas\", and order food politely with \"Je veux... s'il vous plaît\"."
      ],
      culturalInsight:
          "Before starting any meal, French speakers warmly wish everyone \"Bon appétit !\" which means \"Enjoy your meal!\". After the meal, pupils say \"Merci pour le repas!\"",
      vocabItems: [
        P4VocabItem(
          french: "J'ai faim",
          phonetics: "zhay fahn",
          english: "I am hungry",
          icon: Icons.sentiment_dissatisfied_rounded,
          audioKey: "jai_faim",
        ),
        P4VocabItem(
          french: "J'ai soif",
          phonetics: "zhay swahf",
          english: "I am thirsty",
          icon: Icons.local_drink_rounded,
          audioKey: "jai_soif",
        ),
        P4VocabItem(
          french: "Bon appétit !",
          phonetics: "bohn ah-pay-tee",
          english: "Enjoy your meal!",
          icon: Icons.thumb_up_alt_rounded,
          audioKey: "bon_appetit",
        ),
        P4VocabItem(
          french: "Merci pour le repas",
          phonetics: "mair-see poor luh ruh-pah",
          english: "Thank you for the meal",
          icon: Icons.volunteer_activism_rounded,
          audioKey: "merci_pour_le_repas",
        ),
        P4VocabItem(
          french: "Je veux manger du riz",
          phonetics: "zhuh vuh mahn-zhay doo ree",
          english: "I want to eat rice",
          icon: Icons.restaurant_menu_rounded,
          audioKey: "je_veux_manger_du_riz",
        ),
        P4VocabItem(
          french: "Je veux boire de l'eau",
          phonetics: "zhuh vuh bwahr duh loh",
          english: "I want to drink water",
          icon: Icons.water_drop_rounded,
          audioKey: "je_veux_boire_de_leau",
        ),
        P4VocabItem(
          french: "J'aime le poulet",
          phonetics: "zhem luh poo-lay",
          english: "I like chicken",
          icon: Icons.favorite_rounded,
          audioKey: "jaime_le_poulet",
        ),
        P4VocabItem(
          french: "Je n'aime pas le poisson",
          phonetics: "zhuh nehm pah luh pwah-sohn",
          english: "I do not like fish",
          icon: Icons.cancel_rounded,
          audioKey: "je_naime_pas_le_poisson",
        ),
        P4VocabItem(
          french: "C'est délicieux !",
          phonetics: "say day-lee-syuh",
          english: "It is delicious!",
          icon: Icons.emoji_events_rounded,
          audioKey: "cest_delicieux",
        ),
        P4VocabItem(
          french: "Un verre d'eau",
          phonetics: "uhn vair doh",
          english: "A glass of water",
          icon: Icons.local_bar_rounded,
          audioKey: "un_verre_deau",
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: "Idiomatic Expressions with Verb AVOIR (Faim & Soif)",
          explanation:
              "In French, we use the verb 'Avoir' (to have) to express hunger and thirst: \"J'ai faim\" (I have hunger = I am hungry) and \"J'ai soif\" (I have thirst = I am thirsty). Do not use 'Je suis'!",
          examples: [
            "Correct: J'ai faim (I am hungry). Incorrect: Je suis faim.",
            "Correct: J'ai soif (I am thirsty). Incorrect: Je suis soif.",
            "Ordering: Je veux manger du riz, s'il vous plaît (I want to eat rice, please).",
            "Negative: Je n'aime pas le poisson (I don't like fish - 'ne... pas' wraps around 'aime').",
          ],
        ),
      ],
      classworkExercises: [
        P4InteractiveExercise(
          prompt: "How do you say 'I am thirsty' in French?",
          options: [
            "J'ai soif",
            "J'ai faim",
            "Je suis soif",
            "J'aime l'eau"
          ],
          correctOptionIndex: 0,
          explanation:
              "In French we use the verb 'Avoir', so 'I am thirsty' is \"J'ai soif\"!",
        ),
        P4InteractiveExercise(
          prompt: "What does \"Bon appétit !\" mean in English?",
          options: [
            "Enjoy your meal!",
            "Thank you very much!",
            "Goodbye, see you tomorrow!",
            "Good morning class!"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Bon appétit !\" is the polite French expression wished to everyone before beginning a meal.",
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          question: "Say in French: 'I am hungry, I want to eat bread.'",
          answer: "J'ai faim, je veux manger du pain.",
          hint: "Combine 'J'ai faim' + 'je veux manger du pain'.",
        ),
        P4EvaluationQuestion(
          question: "What polite phrase do you say after eating a meal?",
          answer: "Merci pour le repas !",
          hint: "Thank you for the meal.",
        ),
      ],
      assignmentTasks: [
        P4AssignmentTask(
          category: "Dialogue Role-Play",
          instruction:
              "Write a 3-line dialogue at the dinner table: Pupil 1 says 'J'ai faim', Pupil 2 offers 'Voici du riz', and Pupil 1 replies 'Merci, c'est délicieux !'.",
        ),
      ],
    ),

    // ==========================================
    // WEEK 5: Mid-Term Speed Oral Revision Rally (Révision du Mi-Trimestre)
    // ==========================================
    P4Lesson(
      term: 3,
      week: 5,
      topic: "Grande Révision Orale du Mi-Trimestre",
      subtitle: "Theme: Mid-Term Oral Speed Rally · Weeks 1–4 Recap",
      patternType: P4PatternType.midTermReview,
      objectives: [
        "Pupils participate in rapid interactive oral rallies across Time, Routine, Meals, and Food Preferences to solidify fluency and pronunciation."
      ],
      culturalInsight:
          "Speed oral drills build confidence and automatic recall, allowing pupils to communicate in French naturally without hesitating!",
      vocabItems: [
        P4VocabItem(
          french: "La révision orale",
          phonetics: "lah ray-vee-zyohn oh-rahl",
          english: "Oral revision rally",
          icon: Icons.record_voice_over_rounded,
          audioKey: "la_revision_orale",
        ),
        P4VocabItem(
          french: "L'heure et le temps",
          phonetics: "luhr ay luh tahn",
          english: "Time and routine",
          icon: Icons.timer_rounded,
          audioKey: "lheure_et_le_temps",
        ),
        P4VocabItem(
          french: "La nourriture et les repas",
          phonetics: "lah noo-ree-toor ay lay ruh-pah",
          english: "Food and meals",
          icon: Icons.fastfood_rounded,
          audioKey: "la_nourriture_et_les_repas",
        ),
        P4VocabItem(
          french: "J'ai faim et j'ai soif",
          phonetics: "zhay fahn ay zhay swahf",
          english: "I am hungry and thirsty",
          icon: Icons.mood_rounded,
          audioKey: "jai_faim_et_jai_soif",
        ),
        P4VocabItem(
          french: "Bonne chance !",
          phonetics: "bohn shahns",
          english: "Good luck!",
          icon: Icons.celebration_rounded,
          audioKey: "bonne_chance",
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: "Mid-Term Mastery Checklist",
          explanation:
              "Quick recap: 1. Telling time (Quelle heure est-il ? Il est ... heures). 2. Routine (À six heures, je me réveille). 3. Meals (Le petit déjeuner, le déjeuner, le dîner). 4. Hunger/Thirst (J'ai faim, j'ai soif).",
          examples: [
            "Il est midi (12:00 PM) / Il est minuit (12:00 AM).",
            "Je prends le petit déjeuner à sept heures.",
            "J'aime le poulet et le riz.",
            "Je veux boire de l'eau, s'il vous plaît.",
          ],
        ),
      ],
      classworkExercises: [
        P4InteractiveExercise(
          prompt: "Which pair correctly connects time and meals?",
          options: [
            "Le matin -> Le petit déjeuner",
            "Le matin -> Le dîner",
            "Le soir -> Le petit déjeuner",
            "L'après-midi -> Le petit déjeuner"
          ],
          correctOptionIndex: 0,
          explanation:
              "In the morning (\"le matin\"), we eat breakfast (\"le petit déjeuner\").",
        ),
        P4InteractiveExercise(
          prompt: "What is the correct response to \"Quelle heure est-il ?\" at 3:00?",
          options: [
            "Il est trois heures",
            "J'ai trois ans",
            "Il fait trois degrés",
            "Il est trois jours"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Il est trois heures\" is the correct way to say 'It is three o'clock'.",
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          question: "What are the 4 core topics we mastered in Weeks 1 to 4?",
          answer: "L'heure, la routine, les repas, et la faim/soif.",
          hint: "Time, routine, meals, hunger/thirst.",
        ),
      ],
      assignmentTasks: [
        P4AssignmentTask(
          category: "Mid-Term Review Card",
          instruction:
              "Practice reciting the 4 key phrases of Weeks 1-4 with a study partner for the teacher's oral check.",
        ),
      ],
    ),

    // ==========================================
    // WEEK 6: Mid-Term Break & Dining Culture (Pause et Culture Culinaire)
    // ==========================================
    P4Lesson(
      term: 3,
      week: 6,
      topic: "Pause du Mi-Trimestre et Savoir-Vivre à Table",
      subtitle: "Theme: Cultural Intermission · Table Manners & French Gastronomy",
      patternType: P4PatternType.midTermBreak,
      objectives: [
        "Pupils practice courteous dining role-plays, French table etiquette, and family meal conversations during the mid-term intermission."
      ],
      culturalInsight:
          "In Francophone West Africa and France, sharing a meal is a sign of hospitality, family unity, and mutual respect. Everyone waits until everyone is seated before saying 'Bon appétit!'",
      vocabItems: [
        P4VocabItem(
          french: "La pause",
          phonetics: "lah pohz",
          english: "The break / Intermission",
          icon: Icons.pause_circle_rounded,
          audioKey: "la_pause",
        ),
        P4VocabItem(
          french: "À table !",
          phonetics: "ah tah-bluh",
          english: "Food is ready! / Come to the table!",
          icon: Icons.table_bar_rounded,
          audioKey: "a_table",
        ),
        P4VocabItem(
          french: "S'il vous plaît",
          phonetics: "seel voo pleh",
          english: "Please (Polite)",
          icon: Icons.front_hand_rounded,
          audioKey: "sil_vous_plait",
        ),
        P4VocabItem(
          french: "Passe-moi le pain, s'il te plaît",
          phonetics: "pahs mwah luh pahn seel tuh pleh",
          english: "Pass me the bread, please",
          icon: Icons.pan_tool_alt_rounded,
          audioKey: "passe_moi_le_pain",
        ),
        P4VocabItem(
          french: "C'est très bon !",
          phonetics: "say treh bohn",
          english: "It is very good!",
          icon: Icons.thumb_up_rounded,
          audioKey: "cest_tres_bon",
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: "Courteous Table Requests in French",
          explanation:
              "To ask for something at the table politely, say \"Passe-moi... s'il te plaît\" (Pass me... please) and always say \"Merci !\" when receiving it.",
          examples: [
            "Passe-moi l'eau, s'il te plaît -> Voici l'eau -> Merci !",
            "Passe-moi le pain, s'il te plaît -> Voici le pain -> Merci beaucoup !",
          ],
        ),
      ],
      classworkExercises: [
        P4InteractiveExercise(
          prompt: "What does \"À table !\" mean when called by parents at home?",
          options: [
            "Come to the table / Food is ready!",
            "Go to sleep now!",
            "Wake up and go to school!",
            "Clean the blackboard!"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"À table !\" is the traditional call announcing that the meal is served and everyone should sit down to eat.",
        ),
        P4InteractiveExercise(
          prompt: "How do you politely ask someone to pass the water?",
          options: [
            "Passe-moi l'eau, s'il te plaît",
            "Je veux dormir",
            "Il est six heures",
            "J'ai mal à la tête"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Passe-moi l'eau, s'il te plaît\" means 'Pass me the water, please'.",
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          question: "Role-play asking for bread at the table in French.",
          answer: "Passe-moi le pain, s'il te plaît.",
          hint: "Use 'Passe-moi... s'il te plaît'.",
        ),
      ],
      assignmentTasks: [
        P4AssignmentTask(
          category: "Family Practice",
          instruction:
              "Use 'Bon appétit !' and 'Merci pour le repas !' at dinner with your family during the break.",
        ),
      ],
    ),

    // ==========================================
    // WEEK 7: Parts of the Body (Les Parties du Corps)
    // ==========================================
    P4Lesson(
      term: 3,
      week: 7,
      topic: "Découvrir les Parties du Corps Humain",
      subtitle: "Theme: Human Body & Anatomy · 9 Key Body Parts & Plural Forms",
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: [
        "Pupils identify and name 9 major body parts in French, apply the correct definite articles (le, la, l', les), and form descriptive body sentences."
      ],
      culturalInsight:
          "The famous French children's song \"Savez-vous planter les choux ?\" uses different body parts (avec le nez, avec le pied, avec les mains) to teach vocabulary rhythmically!",
      vocabItems: [
        P4VocabItem(
          french: "Le corps",
          phonetics: "luh kohr",
          english: "The body",
          icon: Icons.accessibility_new_rounded,
          audioKey: "le_corps",
        ),
        P4VocabItem(
          french: "La tête",
          phonetics: "lah teht",
          english: "The head",
          icon: Icons.face_rounded,
          audioKey: "la_tete",
        ),
        P4VocabItem(
          french: "Les yeux",
          phonetics: "lay zyuh",
          english: "The eyes (Singular: l'œil)",
          icon: Icons.visibility_rounded,
          audioKey: "les_yeux",
        ),
        P4VocabItem(
          french: "Le nez",
          phonetics: "luh nay",
          english: "The nose",
          icon: Icons.sentiment_satisfied_rounded,
          audioKey: "le_nez",
        ),
        P4VocabItem(
          french: "La bouche",
          phonetics: "lah boosh",
          english: "The mouth",
          icon: Icons.mood_rounded,
          audioKey: "la_bouche",
        ),
        P4VocabItem(
          french: "Les oreilles",
          phonetics: "lay zoh-ray",
          english: "The ears",
          icon: Icons.hearing_rounded,
          audioKey: "les_oreilles",
        ),
        P4VocabItem(
          french: "Le bras / Les bras",
          phonetics: "luh brah / lay brah",
          english: "The arm / The arms",
          icon: Icons.fitness_center_rounded,
          audioKey: "le_bras",
        ),
        P4VocabItem(
          french: "La main / Les mains",
          phonetics: "lah mahn / lay mahn",
          english: "The hand / The hands",
          icon: Icons.pan_tool_rounded,
          audioKey: "la_main",
        ),
        P4VocabItem(
          french: "La jambe / Les jambes",
          phonetics: "lah zhahnb / lay zhahnb",
          english: "The leg / The legs",
          icon: Icons.directions_walk_rounded,
          audioKey: "la_jambe",
        ),
        P4VocabItem(
          french: "Le pied / Les pieds",
          phonetics: "luh pyay / lay pyay",
          english: "The foot / The feet",
          icon: Icons.do_not_step_rounded,
          audioKey: "le_pied",
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: "Singular and Plural Forms of Body Parts",
          explanation:
              "Most body parts form their plural by adding 's' and changing 'Le/La' to 'Les'. Notice that 'Le bras' already ends in 's', so its spelling does not change in the plural. 'L'œil' has an irregular plural: 'Les yeux'.",
          examples: [
            "La main -> Les mains (The hands).",
            "Le pied -> Les pieds (The feet).",
            "La jambe -> Les jambes (The legs).",
            "Le bras -> Les bras (The arms - unchanged spelling).",
            "L'œil -> Les yeux (Irregular plural!).",
          ],
        ),
      ],
      classworkExercises: [
        P4InteractiveExercise(
          prompt: "What is the French word for 'The head'?",
          options: [
            "La tête",
            "La bouche",
            "Le nez",
            "Les yeux"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"La tête\" means 'The head'. \"La bouche\" is the mouth and \"Le nez\" is the nose.",
        ),
        P4InteractiveExercise(
          prompt: "Which body part has the irregular plural \"Les yeux\"?",
          options: [
            "L'œil (The eye)",
            "Le pied (The foot)",
            "Le bras (The arm)",
            "La main (The hand)"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"L'œil\" (one eye) becomes \"Les yeux\" (two eyes) in the plural!",
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          question: "Touch your nose and say the French word out loud.",
          answer: "Le nez.",
          hint: "Nose in French is 'Le nez'.",
        ),
        P4EvaluationQuestion(
          question: "Show your two hands and state the plural phrase in French.",
          answer: "Les mains.",
          hint: "Plural of 'La main' is 'Les mains'.",
        ),
      ],
      assignmentTasks: [
        P4AssignmentTask(
          category: "Drawing & Labeling Project",
          instruction:
              "Draw a stick figure in your notebook and label 6 body parts in French (la tête, les yeux, le nez, la bouche, les mains, les pieds).",
        ),
      ],
    ),

    // ==========================================
    // WEEK 8: Health, Pain & Hygiene (La Santé et l'Hygiène)
    // ==========================================
    P4Lesson(
      term: 3,
      week: 8,
      topic: "Exprimer la Douleur et Pratiquer l'Hygiène",
      subtitle: "Theme: Health & Well-being · J'ai mal à... & Daily Hygiene",
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: [
        "Pupils learn to express physical aches using \"Avoir mal à...\", identify common hygiene actions (washing hands, brushing teeth), and participate in doctor-patient role-plays."
      ],
      culturalInsight:
          "In French schools, hygiene and health education emphasize \"le lavage des mains\" (hand washing) before every meal and after play to maintain good health and stay strong.",
      vocabItems: [
        P4VocabItem(
          french: "Le docteur / Le médecin",
          phonetics: "luh dohk-tuhr / luh mayd-sahn",
          english: "The doctor",
          icon: Icons.medical_services_rounded,
          audioKey: "le_docteur",
        ),
        P4VocabItem(
          french: "Où as-tu mal ?",
          phonetics: "oo ah-too mahl",
          english: "Where does it hurt? / What is wrong?",
          icon: Icons.help_center_rounded,
          audioKey: "ou_as_tu_mal",
        ),
        P4VocabItem(
          french: "J'ai mal à la tête",
          phonetics: "zhay mahl ah lah teht",
          english: "I have a headache",
          icon: Icons.sick_rounded,
          audioKey: "jai_mal_a_la_tete",
        ),
        P4VocabItem(
          french: "J'ai mal aux dents",
          phonetics: "zhay mahl oh dahn",
          english: "I have a toothache",
          icon: Icons.sentiment_very_dissatisfied_rounded,
          audioKey: "jai_mal_aux_dents",
        ),
        P4VocabItem(
          french: "J'ai mal au ventre",
          phonetics: "zhay mahl oh vahn-truh",
          english: "I have a stomachache",
          icon: Icons.healing_rounded,
          audioKey: "jai_mal_au_ventre",
        ),
        P4VocabItem(
          french: "J'ai mal au pied",
          phonetics: "zhay mahl oh pyay",
          english: "My foot hurts",
          icon: Icons.do_not_step_rounded,
          audioKey: "jai_mal_au_pied",
        ),
        P4VocabItem(
          french: "Se laver les mains",
          phonetics: "suh lah-vay lay mahn",
          english: "To wash one's hands",
          icon: Icons.wash_rounded,
          audioKey: "se_laver_les_mains",
        ),
        P4VocabItem(
          french: "Se brosser les dents",
          phonetics: "suh broh-say lay dahn",
          english: "To brush one's teeth",
          icon: Icons.clean_hands_rounded,
          audioKey: "se_brosser_les_dents",
        ),
        P4VocabItem(
          french: "En bonne santé",
          phonetics: "ahn bohn sahn-tay",
          english: "In good health / Healthy",
          icon: Icons.favorite_rounded,
          audioKey: "en_bonne_sante",
        ),
        P4VocabItem(
          french: "Soigne-toi bien !",
          phonetics: "swahn-twah byahn",
          english: "Get well soon!",
          icon: Icons.health_and_safety_rounded,
          audioKey: "soigne_toi_bien",
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: "Expressing Pain: \"Avoir mal à...\" + Contractions",
          explanation:
              "To say where you hurt, use \"J'ai mal + à + [body part]\". Remember the contractions with preposition 'à':",
          examples: [
            "à + le ventre -> J'ai mal au ventre (masculine body part).",
            "à + la tête -> J'ai mal à la tête (feminine body part).",
            "à + les dents -> J'ai mal aux dents (plural body part).",
            "à + les yeux -> J'ai mal aux yeux (plural body part).",
          ],
        ),
      ],
      classworkExercises: [
        P4InteractiveExercise(
          prompt: "How do you say 'I have a headache' in French?",
          options: [
            "J'ai mal à la tête",
            "J'ai mal au ventre",
            "J'ai mal aux dents",
            "J'ai faim"
          ],
          correctOptionIndex: 0,
          explanation:
              "Since 'la tête' is feminine, we say \"J'ai mal à la tête\" for 'I have a headache'.",
        ),
        P4InteractiveExercise(
          prompt: "Which contraction is used for plural body parts like 'les dents'?",
          options: [
            "aux (J'ai mal aux dents)",
            "au (J'ai mal au dents)",
            "à la (J'ai mal à la dents)",
            "à le (J'ai mal à le dents)"
          ],
          correctOptionIndex: 0,
          explanation:
              "'À + les' contracts to 'aux', so we say \"J'ai mal aux dents\"!",
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          question: "Role-play: The doctor asks \"Où as-tu mal ?\". Tell the doctor your stomach hurts.",
          answer: "J'ai mal au ventre.",
          hint: "Use 'J'ai mal au ventre'.",
        ),
        P4EvaluationQuestion(
          question: "Name 2 healthy hygiene habits in French.",
          answer: "Se laver les mains et se brosser les dents.",
          hint: "Wash hands and brush teeth.",
        ),
      ],
      assignmentTasks: [
        P4AssignmentTask(
          category: "Doctor Clinic Role-Play",
          instruction:
              "Write a short 2-person dialogue: Doctor: 'Bonjour ! Où as-tu mal ?' Patient: 'Bonjour docteur, j'ai mal à la tête.' Doctor: 'Soigne-toi bien !'.",
        ),
      ],
    ),

    // ==========================================
    // WEEK 9: Clothes & Dressing (Les Vêtements et l'Habillement)
    // ==========================================
    P4Lesson(
      term: 3,
      week: 9,
      topic: "Les Vêtements et la Description des Habits",
      subtitle: "Theme: Fashion & Clothing · Articles of Clothing & Color Agreements",
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: [
        "Pupils identify common articles of clothing in French, state what they are wearing using \"Je porte...\", and match color adjectives to the gender and number of clothing items."
      ],
      culturalInsight:
          "Paris is globally celebrated as \"la capitale de la mode\" (the capital of fashion), renowned worldwide for stylish designs, elegant tailoring, and creative fashion shows.",
      vocabItems: [
        P4VocabItem(
          french: "Les vêtements",
          phonetics: "lay vayt-mahn",
          english: "The clothes / Clothing",
          icon: Icons.checkroom_rounded,
          audioKey: "les_vetements",
        ),
        P4VocabItem(
          french: "La chemise",
          phonetics: "lah shuh-meez",
          english: "The shirt",
          icon: Icons.dry_cleaning_rounded,
          audioKey: "la_chemise",
        ),
        P4VocabItem(
          french: "Le pantalon",
          phonetics: "luh pahn-tah-lohn",
          english: "The trousers / Pants",
          icon: Icons.airline_seat_legroom_extra_rounded,
          audioKey: "le_pantalon",
        ),
        P4VocabItem(
          french: "La robe",
          phonetics: "lah rohb",
          english: "The dress",
          icon: Icons.woman_2_rounded,
          audioKey: "la_robe",
        ),
        P4VocabItem(
          french: "La jupe",
          phonetics: "lah zhoop",
          english: "The skirt",
          icon: Icons.girl_rounded,
          audioKey: "la_jupe",
        ),
        P4VocabItem(
          french: "Les chaussures",
          phonetics: "lay shoh-soor",
          english: "The shoes",
          icon: Icons.snowshoeing_rounded,
          audioKey: "les_chaussures",
        ),
        P4VocabItem(
          french: "Le chapeau",
          phonetics: "luh shah-poh",
          english: "The hat",
          icon: Icons.face_retouching_natural_rounded,
          audioKey: "le_chapeau",
        ),
        P4VocabItem(
          french: "Je porte",
          phonetics: "zhuh pohrt",
          english: "I wear / I am wearing",
          icon: Icons.person_pin_rounded,
          audioKey: "je_porte",
        ),
        P4VocabItem(
          french: "Une chemise blanche",
          phonetics: "oon shuh-meez blahnsh",
          english: "A white shirt",
          icon: Icons.checkroom_rounded,
          audioKey: "une_chemise_blanche",
        ),
        P4VocabItem(
          french: "Un pantalon noir",
          phonetics: "uhn pahn-tah-lohn nwahr",
          english: "Black trousers",
          icon: Icons.accessibility_rounded,
          audioKey: "un_pantalon_noir",
        ),
        P4VocabItem(
          french: "Une robe rouge",
          phonetics: "oon rohb roozh",
          english: "A red dress",
          icon: Icons.style_rounded,
          audioKey: "une_robe_rouge",
        ),
        P4VocabItem(
          french: "Des chaussures marron",
          phonetics: "day shoh-soor mah-rohn",
          english: "Brown shoes",
          icon: Icons.hiking_rounded,
          audioKey: "des_chaussures_marron",
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: "Describing Clothing with Verb PORTER & Color Agreements",
          explanation:
              "To say what you are wearing, use \"Je porte + [article + clothing item + color]\". The color adjective goes AFTER the noun and agrees with its gender and number:",
          examples: [
            "Je porte une chemise blanche (feminine: blanche).",
            "Je porte un pantalon bleu (masculine: bleu).",
            "Je porte une robe rouge (feminine: rouge).",
            "Je porte des chaussures noires (feminine plural: noires).",
          ],
        ),
      ],
      classworkExercises: [
        P4InteractiveExercise(
          prompt: "How do you say 'I am wearing black trousers' in French?",
          options: [
            "Je porte un pantalon noir",
            "Je porte une robe rouge",
            "Je porte une chemise blanche",
            "J'ai un chapeau"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Je porte un pantalon noir\" means 'I am wearing black trousers'. The color 'noir' agrees with the masculine noun 'pantalon'.",
        ),
        P4InteractiveExercise(
          prompt: "What is the French word for 'The dress'?",
          options: [
            "La robe",
            "La jupe",
            "La chemise",
            "Le chapeau"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"La robe\" means 'The dress'. \"La jupe\" is the skirt and \"La chemise\" is the shirt.",
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          question: "Look at your school uniform and describe what you are wearing in French.",
          answer: "Je porte une chemise et un pantalon / une jupe.",
          hint: "Start with 'Je porte...'.",
        ),
        P4EvaluationQuestion(
          question: "What is the French feminine color for white when describing 'la chemise'?",
          answer: "Blanche (Une chemise blanche).",
          hint: "Feminine of 'blanc' is 'blanche'.",
        ),
      ],
      assignmentTasks: [
        P4AssignmentTask(
          category: "Fashion Design Sketch",
          instruction:
              "Draw your favorite outfit in your notebook and write a complete French sentence describing it (e.g. \"Je porte une chemise bleue et un pantalon noir.\").",
        ),
      ],
    ),

    // ==========================================
    // WEEK 10: Weather & Seasons (Le Temps et les Saisons)
    // ==========================================
    P4Lesson(
      term: 3,
      week: 10,
      topic: "Décrire le Temps Qu'il Fait et les Saisons",
      subtitle: "Theme: Weather & Climate · Weather Conditions & Nigerian/French Seasons",
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: [
        "Pupils learn to ask and describe the weather using \"Quel temps fait-il ? Il fait...\", distinguish between hot, cold, sunny, and rainy conditions, and compare Nigerian seasons with European seasons."
      ],
      culturalInsight:
          "In Nigeria, we experience the dry, dusty desert wind known as \"l'harmattan\" between November and February, while France experiences four distinct seasons (le printemps, l'été, l'automne, l'hiver).",
      vocabItems: [
        P4VocabItem(
          french: "Le temps qu'il fait",
          phonetics: "luh tahn keel feh",
          english: "The weather",
          icon: Icons.cloud_rounded,
          audioKey: "le_temps_quil_fait",
        ),
        P4VocabItem(
          french: "Quel temps fait-il ?",
          phonetics: "kel tahn feh-teel",
          english: "What is the weather like?",
          icon: Icons.question_mark_rounded,
          audioKey: "quel_temps_fait_il",
        ),
        P4VocabItem(
          french: "Il fait beau",
          phonetics: "eel feh boh",
          english: "The weather is beautiful / fine",
          icon: Icons.wb_sunny_rounded,
          audioKey: "il_fait_beau",
        ),
        P4VocabItem(
          french: "Il fait chaud",
          phonetics: "eel feh shoh",
          english: "It is hot",
          icon: Icons.whatshot_rounded,
          audioKey: "il_fait_chaud",
        ),
        P4VocabItem(
          french: "Il fait froid",
          phonetics: "eel feh frwah",
          english: "It is cold",
          icon: Icons.ac_unit_rounded,
          audioKey: "il_fait_froid",
        ),
        P4VocabItem(
          french: "Il pleut",
          phonetics: "eel pluh",
          english: "It is raining",
          icon: Icons.beach_access_rounded,
          audioKey: "il_pleut",
        ),
        P4VocabItem(
          french: "Il fait du vent",
          phonetics: "eel feh doo vahn",
          english: "It is windy",
          icon: Icons.air_rounded,
          audioKey: "il_fait_du_vent",
        ),
        P4VocabItem(
          french: "Le soleil et la pluie",
          phonetics: "luh soh-lay ay lah plwee",
          english: "The sun and the rain",
          icon: Icons.wb_cloudy_rounded,
          audioKey: "le_soleil_et_la_pluie",
        ),
        P4VocabItem(
          french: "La saison des pluies",
          phonetics: "lah say-zohn day plwee",
          english: "The rainy season",
          icon: Icons.thunderstorm_rounded,
          audioKey: "la_saison_des_pluies",
        ),
        P4VocabItem(
          french: "La saison sèche",
          phonetics: "lah say-zohn sehsh",
          english: "The dry season",
          icon: Icons.wb_sunny_outlined,
          audioKey: "la_saison_seche",
        ),
        P4VocabItem(
          french: "L'harmattan",
          phonetics: "lar-mah-tahn",
          english: "The harmattan season",
          icon: Icons.blur_on_rounded,
          audioKey: "lharmattan",
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: "Impersonal Weather Expressions with FAIRE",
          explanation:
              "In French, weather descriptions usually begin with the impersonal pronoun phrase \"Il fait\" + [adjective/noun]:",
          examples: [
            "Quel temps fait-il ? -> Il fait beau (It is fine weather).",
            "Il fait chaud (It is hot) / Il fait froid (It is cold).",
            "Il fait du vent (It is windy).",
            "Special verb: For rain, we use \"Il pleut\" from the verb 'pleuvoir'.",
          ],
        ),
      ],
      classworkExercises: [
        P4InteractiveExercise(
          prompt: "How do you say 'It is hot' in French?",
          options: [
            "Il fait chaud",
            "Il fait froid",
            "Il fait beau",
            "Il pleut"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Il fait chaud\" means 'It is hot'. \"Il fait froid\" means 'It is cold'.",
        ),
        P4InteractiveExercise(
          prompt: "What is the French word for 'It is raining'?",
          options: [
            "Il pleut",
            "Il fait du vent",
            "Il fait beau",
            "Il est midi"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Il pleut\" comes from the verb 'pleuvoir' and means 'It is raining'.",
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          question: "Look outside the classroom window and describe today's weather in French.",
          answer: "Aujourd'hui, il fait beau / il fait chaud / il pleut.",
          hint: "Use 'Il fait beau / chaud / pleut'.",
        ),
        P4EvaluationQuestion(
          question: "Name the 2 major Nigerian seasons in French.",
          answer: "La saison des pluies et la saison sèche (l'harmattan).",
          hint: "Rainy season and dry season.",
        ),
      ],
      assignmentTasks: [
        P4AssignmentTask(
          category: "Weather Reporter Project",
          instruction:
              "Draw a weather forecast chart for 3 days in your notebook with weather icons and French labels (e.g. Lundi: Il fait beau, Mardi: Il pleut, Mercredi: Il fait chaud).",
        ),
      ],
    ),

    // ==========================================
    // WEEK 11: Grand End-of-Year Speed Revision Rally (Grande Révision Annuelle)
    // ==========================================
    P4Lesson(
      term: 3,
      week: 11,
      topic: "Grande Révision Annuelle des Notions Clés",
      subtitle: "Theme: Master Speed Rally · Cumulative Recap (Terms 1, 2 & 3)",
      patternType: P4PatternType.termRevisionRally,
      objectives: [
        "Pupils review all fundamental skills of Primary 4 French (Greetings, Family, School, Time, Routine, Food, Body, Clothes, and Weather) through fast-paced oral team challenges."
      ],
      culturalInsight:
          "Reflecting on a whole year of language learning shows how far pupils have progressed—from their very first \"Bonjour !\" to holding vibrant everyday conversations!",
      vocabItems: [
        P4VocabItem(
          french: "La grande révision",
          phonetics: "lah grahnd ray-vee-zyohn",
          english: "The grand annual revision",
          icon: Icons.auto_awesome_rounded,
          audioKey: "la_grande_revision",
        ),
        P4VocabItem(
          french: "Salutations et présentations",
          phonetics: "sah-loo-tah-syohn ay pray-zahn-tah-syohn",
          english: "Greetings and introductions (Term 1)",
          icon: Icons.handshake_rounded,
          audioKey: "salutations_et_presentations",
        ),
        P4VocabItem(
          french: "La famille et l'école",
          phonetics: "lah fah-mee ay lay-kohl",
          english: "Family and school (Term 2)",
          icon: Icons.school_rounded,
          audioKey: "famille_et_ecole",
        ),
        P4VocabItem(
          french: "Le temps, le corps et les repas",
          phonetics: "luh tahn luh kohr ay lay ruh-pah",
          english: "Time, body, and meals (Term 3)",
          icon: Icons.restaurant_rounded,
          audioKey: "temps_corps_repas",
        ),
        P4VocabItem(
          french: "Bravo à tous !",
          phonetics: "brah-voh ah toos",
          english: "Well done to everyone!",
          icon: Icons.military_tech_rounded,
          audioKey: "bravo_a_tous",
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: "Primary 4 French Year-End Master Summary",
          explanation:
              "Over 3 terms, pupils have mastered: 1. Identity & Numbers 1-20 (Je m'appelle, J'ai 9 ans). 2. Family & Possessives (Mon père, ma mère). 3. School & Actions (Je vais à l'école, je lis). 4. Time & Daily Life (Quelle heure est-il ? J'ai faim, Je porte une chemise).",
          examples: [
            "Bonjour ! Je m'appelle Amina, je suis Nigériane et j'ai neuf ans.",
            "Voici mon père et ma mère. J'aime ma famille.",
            "À sept heures, je prends le petit déjeuner.",
            "Aujourd'hui, il fait beau et je porte une robe rouge.",
          ],
        ),
      ],
      classworkExercises: [
        P4InteractiveExercise(
          prompt: "Which sentence accurately introduces a 9-year-old Nigerian pupil?",
          options: [
            "Je m'appelle Kofi, je suis Nigérian et j'ai 9 ans",
            "J'ai faim à six heures du matin",
            "Il fait froid dans la cour de récréation",
            "Voici mon père et ma mère"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Je m'appelle Kofi, je suis Nigérian et j'ai 9 ans\" combines name, nationality, and age seamlessly!",
        ),
        P4InteractiveExercise(
          prompt: "What do you say when you have a stomachache in French?",
          options: [
            "J'ai mal au ventre",
            "J'ai mal à la tête",
            "J'ai mal aux dents",
            "J'ai faim"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"J'ai mal au ventre\" is the correct phrase for 'I have a stomachache'.",
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          question: "Deliver your complete 30-second French presentation (Name, Age, Family, Food, Time).",
          answer: "Bonjour ! Je m'appelle ..., j'ai ... ans. J'aime le riz et ma famille. Il est ... heures.",
          hint: "Combine greetings, identity, family, and preferences.",
        ),
      ],
      assignmentTasks: [
        P4AssignmentTask(
          category: "Annual Portfolio Review",
          instruction:
              "Review your French notebook from Term 1 to Term 3 to prepare for the end-of-year teacher evaluation.",
        ),
      ],
    ),

    // ==========================================
    // WEEK 12: Teacher Oral Evaluation & Review (Évaluation Orale et Bilan)
    // ==========================================
    P4Lesson(
      term: 3,
      week: 12,
      topic: "Bilan Annuel et Évaluation des Compétences",
      subtitle: "Theme: Evaluation & Portfolio Review · Oral Proficiency Checklist",
      patternType: P4PatternType.termRevisionRally,
      objectives: [
        "Teacher conducts oral speed checks, individual pronunciation evaluations, and portfolio reviews to celebrate every pupil's French speaking progress."
      ],
      culturalInsight:
          "Oral fluency and confident self-expression are the primary goals of the Nigerian primary French curriculum, preparing pupils for fluent conversations in JSS!",
      vocabItems: [
        P4VocabItem(
          french: "Le bilan annuel",
          phonetics: "luh bee-lahn ah-nwel",
          english: "The annual evaluation",
          icon: Icons.checklist_rtl_rounded,
          audioKey: "le_bilan_annuel",
        ),
        P4VocabItem(
          french: "L'évaluation orale",
          phonetics: "lay-vah-loo-ah-syohn oh-rahl",
          english: "Oral evaluation",
          icon: Icons.quiz_rounded,
          audioKey: "levaluation_orale",
        ),
        P4VocabItem(
          french: "Excellente prononciation",
          phonetics: "ek-seh-lahnt proh-nohn-syah-syohn",
          english: "Excellent pronunciation",
          icon: Icons.grade_rounded,
          audioKey: "excellente_prononciation",
        ),
        P4VocabItem(
          french: "Félicitations !",
          phonetics: "fay-lee-see-tah-syohn",
          english: "Congratulations!",
          icon: Icons.military_tech_rounded,
          audioKey: "felicitations",
        ),
        P4VocabItem(
          french: "Très bien réussi !",
          phonetics: "treh byahn ray-oo-see",
          english: "Very well done!",
          icon: Icons.verified_rounded,
          audioKey: "tres_bien_reussi",
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: "Teacher's 5-Point Oral Evaluation Criteria",
          explanation:
              "Pupils are evaluated on: 1. Pronunciation accuracy. 2. Fluency and confidence. 3. Correct gender articles (le/la/les). 4. Responsive question-and-answer speed. 5. Courteous expressions (Bonjour, Merci, S'il vous plaît).",
          examples: [
            "Point 1: Clear phonetics on nasal sounds (un, on, an).",
            "Point 2: Confident delivery without reading.",
            "Point 3: Proper agreement (un pantalon noir, une robe rouge).",
          ],
        ),
      ],
      classworkExercises: [
        P4InteractiveExercise(
          prompt: "Which phrase represents the highest teacher commendation in French?",
          options: [
            "Félicitations, très bien réussi !",
            "Répétez encore",
            "Silence s'il vous plaît",
            "Fermez vos livres"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Félicitations, très bien réussi !\" means 'Congratulations, very well done!'.",
        ),
        P4InteractiveExercise(
          prompt: "How should a pupil politely respond to teacher congratulations?",
          options: [
            "Merci beaucoup, Monsieur / Madame !",
            "Au revoir à demain",
            "J'ai faim",
            "Il fait froid"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Merci beaucoup, Monsieur / Madame !\" is the respectful and polite French response.",
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          question: "Respond to the teacher's greeting and answer: 'Comment t'appelles-tu et quel âge as-tu ?'",
          answer: "Bonjour Madame/Monsieur, je m'appelle ... et j'ai ... ans.",
          hint: "State your name and age politely in French.",
        ),
      ],
      assignmentTasks: [
        P4AssignmentTask(
          category: "Self-Assessment Reflection",
          instruction:
              "Write down your favorite French topic of the entire school year and why you enjoyed speaking it.",
        ),
      ],
    ),

    // ==========================================
    // WEEK 13: Year-End Graduation & Vacation Celebration (Célébration et Promotion)
    // ==========================================
    P4Lesson(
      term: 3,
      week: 13,
      topic: "Célébration de Fin d'Année et Promotion en 5e Année",
      subtitle: "Theme: Graduation & Holiday Celebration · Primary 4 French Mastery",
      patternType: P4PatternType.vacationCelebration,
      objectives: [
        "Pupils celebrate the successful completion of Primary 4 French, receive their honorary classroom graduation diploma, wish classmates happy holidays, and preview Primary 5 topics."
      ],
      culturalInsight:
          "At the end of the school year in Francophone schools, pupils celebrate \"la fête de fin d'année\" with songs, plays, and festive celebrations before departing for \"les grandes vacances\"!",
      vocabItems: [
        P4VocabItem(
          french: "Félicitations pour la 4e année !",
          phonetics: "fay-lee-see-tah-syohn poor lah kah-tree-ehm ah-nay",
          english: "Congratulations on completing Primary 4!",
          icon: Icons.workspace_premium_rounded,
          audioKey: "felicitations_p4",
        ),
        P4VocabItem(
          french: "Les grandes vacances",
          phonetics: "lay grahnd vah-kahns",
          english: "The long holidays / Summer vacation",
          icon: Icons.beach_access_rounded,
          audioKey: "les_grandes_vacances",
        ),
        P4VocabItem(
          french: "Bonnes vacances à tous !",
          phonetics: "bohn vah-kahns ah toos",
          english: "Happy holidays to everyone!",
          icon: Icons.celebration_rounded,
          audioKey: "bonnes_vacances_a_tous",
        ),
        P4VocabItem(
          french: "Bienvenue en 5e année !",
          phonetics: "byahn-vuh-noo ahn sank-ee-ehm ah-nay",
          english: "Welcome to Primary 5 (Grade 5)!",
          icon: Icons.trending_up_rounded,
          audioKey: "bienvenue_en_p5",
        ),
        P4VocabItem(
          french: "Le diplôme de français",
          phonetics: "luh deep-lohm duh frahn-say",
          english: "The French certificate / Diploma",
          icon: Icons.card_membership_rounded,
          audioKey: "le_diplome_de_francais",
        ),
        P4VocabItem(
          french: "Au revoir les amis !",
          phonetics: "oh ruh-vwahr lay zah-mee",
          english: "Goodbye friends!",
          icon: Icons.waving_hand_rounded,
          audioKey: "au_revoir_les_amis",
        ),
        P4VocabItem(
          french: "Vive le français !",
          phonetics: "veev luh frahn-say",
          english: "Long live French! / French is great!",
          icon: Icons.favorite_rounded,
          audioKey: "vive_le_francais",
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: "End-of-Year Well-Wishes & Future Preview",
          explanation:
              "Pupils can now exchange warm holiday greetings and look forward to Primary 5 French (where they will learn professions, shopping, transport, and past actions!):",
          examples: [
            "Bonnes vacances à tous les élèves et professeurs !",
            "À la rentrée en 5e année (See you at the resumption in Primary 5)!",
            "Vive le français à l'école !",
          ],
        ),
      ],
      classworkExercises: [
        P4InteractiveExercise(
          prompt: "What is the French expression for 'The long holidays / Vacation'?",
          options: [
            "Les grandes vacances",
            "La salle de classe",
            "L'arbre généalogique",
            "La pause déjeuner"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Les grandes vacances\" refers to the long end-of-year vacation.",
        ),
        P4InteractiveExercise(
          prompt: "How do you say 'Welcome to Primary 5' in French?",
          options: [
            "Bienvenue en 5e année !",
            "Bonjour les amis",
            "Au revoir le professeur",
            "Bon appétit"
          ],
          correctOptionIndex: 0,
          explanation:
              "\"Bienvenue en 5e année !\" means 'Welcome to Primary 5 (Grade 5)'!",
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          question: "Wish your entire class and teacher happy holidays in French.",
          answer: "Bonnes vacances à tous et à bientôt en 5e année !",
          hint: "Use 'Bonnes vacances à tous'.",
        ),
      ],
      assignmentTasks: [
        P4AssignmentTask(
          category: "Holiday French Diary",
          instruction:
              "During the holidays, practice greeting your friends in French and review your Primary 4 vocabulary ready for Primary 5!",
        ),
      ],
    ),
  ];
}
