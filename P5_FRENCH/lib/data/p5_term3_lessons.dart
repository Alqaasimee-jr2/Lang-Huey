import 'package:flutter/material.dart';
import '../models/p5_lesson_model.dart';

class P5Term3Lessons {
  static const List<P5Lesson> weeks = [
    // ==========================================
    // WEEK 1: LES ACTIVITÉS QUOTIDIENNES (PART I: MATIN)
    // ==========================================
    P5Lesson(
      term: 3,
      week: 1,
      topic: 'Les Activités Quotidiennes (Partie I: La Routine du Matin)',
      subtitle: 'Morning Daily Routine Reflexive Verbs: Se réveiller, Se lever, Se laver, S\'habiller',
      patternType: P5PatternType.dailyRoutineMorning,
      objectives: [
        'Identify and conjugate core reflexive morning verbs: "se réveiller", "se lever", "se laver", "s\'habiller".',
        'State what time you perform morning actions: "Je me réveille à six heures".',
        'Describe morning breakfast: "Je prends le petit-déjeuner".',
        'Construct a sequential morning timeline from waking up to departing for school.',
      ],
      culturalInsight:
          'In Nigerian school mornings, waking up early at dawn, greeting parents respectfully, and dressing neatly in uniform are core virtues shared with Francophone school culture!',
      vocabItems: [
        P5VocabItem(
          french: 'Je me réveille',
          phonetics: 'zhuh muh ray-vay-yuh',
          english: 'I wake up',
          usageNote: 'First action of the morning.',
          icon: Icons.alarm_rounded,
          audioKey: 'je_me_reveille',
        ),
        P5VocabItem(
          french: 'Je me lève',
          phonetics: 'zhuh muh lev',
          english: 'I get out of bed',
          usageNote: 'Standing up from bed.',
          icon: Icons.wb_sunny_rounded,
          audioKey: 'je_me_leve',
        ),
        P5VocabItem(
          french: 'Je me lave',
          phonetics: 'zhuh muh lahv',
          english: 'I wash / bathe',
          usageNote: 'Morning hygiene.',
          icon: Icons.bathtub_rounded,
          audioKey: 'je_me_lave',
        ),
        P5VocabItem(
          french: 'Je m\'habille',
          phonetics: 'zhuh mah-bee-yuh',
          english: 'I get dressed (in school uniform)',
          usageNote: 'Putting on clothes.',
          icon: Icons.checkroom_rounded,
          audioKey: 'je_mhabille',
        ),
        P5VocabItem(
          french: 'Je prends le petit-déjeuner',
          phonetics: 'zhuh prahn luh puh-tee day-zhuh-nay',
          english: 'I have breakfast',
          usageNote: 'Eating morning meal.',
          icon: Icons.free_breakfast_rounded,
          audioKey: 'je_prends_le_petit_dejeuner',
        ),
        P5VocabItem(
          french: 'Je vais à l\'école',
          phonetics: 'zhuh vay ah lay-kohl',
          english: 'I go to school',
          usageNote: 'Departing for school.',
          icon: Icons.directions_walk_rounded,
          audioKey: 'je_vais_a_lecole',
        ),
        P5VocabItem(
          french: 'À six heures / À sept heures',
          phonetics: 'ah see zuhr / ah seht uhr',
          english: 'At 6:00 AM / At 7:00 AM',
          usageNote: 'Stating timestamps.',
          icon: Icons.access_time_rounded,
          audioKey: 'a_six_heures',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What is the first reflexive verb you do in the morning?',
          options: ['Je m\'habille', 'Je me réveille', 'Je vais à l\'école', 'Je dîne'],
          correctOptionIndex: 1,
          explanation: '"Je me réveille" (I wake up) is the initial action of the morning.',
        ),
        P5InteractiveExercise(
          prompt: 'Translate to French: "I get dressed at 7:00 AM."',
          options: [
            'Je me lave à six heures',
            'Je m\'habille à sept heures',
            'Je dors à huit heures',
            'Je mange à midi'
          ],
          correctOptionIndex: 1,
          explanation: '"Je m\'habille à sept heures" means "I get dressed at 7:00 AM".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Recite your morning routine in 4 chronological steps in French.',
          answer: '1. Je me réveille. 2. Je me lave. 3. Je m\'habille. 4. Je prends le petit-déjeuner.',
          hint: 'Je me réveille, je me lave...',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Daily Routine Chart',
          instruction: 'Write out your morning routine in French with the exact time you wake up and go to school.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Reflexive Verbs with "Je"',
        explanation:
            'Reflexive verbs show actions done to oneself. In the "Je" form, the verb takes the reflexive pronoun "me" (or "m\'" before a vowel): se réveiller -> je me réveille; s\'habiller -> je m\'habille.',
        examples: [
          'Je me réveille à six heures. (I wake up at 6:00)',
          'Je me lave avec du savon. (I wash with soap)',
          'Je m\'habille avec mon uniforme. (I dress in my uniform)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 2: LES ACTIVITÉS QUOTIDIENNES (PART II: SOIR)
    // ==========================================
    P5Lesson(
      term: 3,
      week: 2,
      topic: 'Les Activités Quotidiennes (Partie II: Après-midi & Soirée)',
      subtitle: 'Afternoon & Night Routine: Étudier, Rentrer, Faire les devoirs, Dîner, Se coucher',
      patternType: P5PatternType.dailyRoutineEvening,
      objectives: [
        'Identify afternoon and evening routine verbs: "étudier", "rentrer", "faire les devoirs", "dîner", "se coucher".',
        'Distinguish between meals: "le petit-déjeuner" (breakfast), "le déjeuner" (lunch), and "le dîner" (dinner).',
        'Express bedtime routine: "Je me couche à neuf heures".',
        'Describe an entire 24-hour day from morning to night.',
      ],
      culturalInsight:
          'Evenings in West Africa are times for completing homework, eating dinner with family, enjoying stories, and having early restful sleep before the next school day!',
      vocabItems: [
        P5VocabItem(
          french: 'J\'étudie à l\'école',
          phonetics: 'zhay-too-dee ah lay-kohl',
          english: 'I study at school',
          usageNote: 'Classroom learning.',
          icon: Icons.menu_book_rounded,
          audioKey: 'jetudie_a_lecole',
        ),
        P5VocabItem(
          french: 'Je déjeune à midi',
          phonetics: 'zhuh day-zhuhn ah mee-dee',
          english: 'I have lunch at 12:00 PM',
          usageNote: 'Midday meal.',
          icon: Icons.lunch_dining_rounded,
          audioKey: 'je_dejeune_a_midi',
        ),
        P5VocabItem(
          french: 'Je rentre à la maison',
          phonetics: 'zhuh rahntr ah lah may-zohn',
          english: 'I return home (after school)',
          usageNote: 'Afternoon return.',
          icon: Icons.home_rounded,
          audioKey: 'je_rentre_a_la_maison',
        ),
        P5VocabItem(
          french: 'Je fais mes devoirs',
          phonetics: 'zhuh fay may duh-vwahr',
          english: 'I do my homework',
          usageNote: 'Evening study.',
          icon: Icons.edit_note_rounded,
          audioKey: 'je_fais_mes_devoirs',
        ),
        P5VocabItem(
          french: 'Je dîne en famille',
          phonetics: 'zhuh deen ahn fah-meey',
          english: 'I have dinner with family',
          usageNote: 'Evening meal.',
          icon: Icons.restaurant_rounded,
          audioKey: 'je_dine_en_famille',
        ),
        P5VocabItem(
          french: 'Je me couche et je dors',
          phonetics: 'zhuh muh koosh ay zhuh dohr',
          english: 'I go to bed and I sleep',
          usageNote: 'Nighttime rest.',
          icon: Icons.bedtime_rounded,
          audioKey: 'je_me_couche_et_je_dors',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What does "Je fais mes devoirs" mean in English?',
          options: ['I play football', 'I do my homework', 'I eat lunch', 'I go to sleep'],
          correctOptionIndex: 1,
          explanation: '"Je fais mes devoirs" translates to "I do my homework".',
        ),
        P5InteractiveExercise(
          prompt: 'Which phrase means "I go to bed"?',
          options: ['Je me réveille', 'Je me couche', 'Je me lave', 'Je m\'habille'],
          correctOptionIndex: 1,
          explanation: '"Je me couche" means "I go to bed / I lie down".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Translate: "In the evening, I do my homework and I eat dinner."',
          answer: 'Le soir, je fais mes devoirs et je dîne.',
          hint: 'Le soir... devoirs... dîner.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Evening Schedule',
          instruction: 'Write 3 French sentences describing what you do after returning home from school.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 3: LES SPORTS ET LES LOISIRS (PART I)
    // ==========================================
    P5Lesson(
      term: 3,
      week: 3,
      topic: 'Les Sports et les Loisirs (Partie I: Les Sports)',
      subtitle: 'Sports Vocabulary & "Je joue au...": Football, Basketball, Natation, Course',
      patternType: P5PatternType.sportsArena,
      objectives: [
        'Name core sports in French: "le football", "le basketball", "la natation", "la course", "le tennis".',
        'Use the contraction "Je joue au..." (au football, au basketball) correctly.',
        'Express sport preferences: "J\'aime le football" vs "Je n\'aime pas le tennis".',
        'Participate in classroom smartboard sports matching quizzes.',
      ],
      culturalInsight:
          'Football is Nigeria\'s national sporting passion! Super Eagles fans love cheering in French: "Allez les champions !" and discussing sports with friends across Africa.',
      vocabItems: [
        P5VocabItem(
          french: 'Le football',
          phonetics: 'luh foot-bahl',
          english: 'Football / Soccer',
          usageNote: 'Most popular team sport.',
          icon: Icons.sports_soccer_rounded,
          audioKey: 'le_football',
        ),
        P5VocabItem(
          french: 'Le basketball',
          phonetics: 'luh bas-ket-bahl',
          english: 'Basketball',
          usageNote: 'Court ball game.',
          icon: Icons.sports_basketball_rounded,
          audioKey: 'le_basketball',
        ),
        P5VocabItem(
          french: 'La natation',
          phonetics: 'lah nah-tah-syohn',
          english: 'Swimming',
          usageNote: 'Water sport.',
          icon: Icons.pool_rounded,
          audioKey: 'la_natation',
        ),
        P5VocabItem(
          french: 'La course',
          phonetics: 'lah koors',
          english: 'Running / Track racing',
          usageNote: 'Athletics & sports day race.',
          icon: Icons.directions_run_rounded,
          audioKey: 'la_course',
        ),
        P5VocabItem(
          french: 'Le tennis',
          phonetics: 'luh tay-nees',
          english: 'Tennis',
          usageNote: 'Racket sport.',
          icon: Icons.sports_tennis_rounded,
          audioKey: 'le_tennis',
        ),
        P5VocabItem(
          french: 'Je joue au football',
          phonetics: 'zhuh zhoo oh foot-bahl',
          english: 'I play football',
          usageNote: 'Contracted phrase (à + le = au).',
          icon: Icons.sports_soccer_rounded,
          audioKey: 'je_joue_au_football',
        ),
        P5VocabItem(
          french: 'J\'aime le sport',
          phonetics: 'zhem luh spohr',
          english: 'I like sports',
          usageNote: 'Expressing love for sports.',
          icon: Icons.favorite_rounded,
          audioKey: 'jaime_le_sport',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'How do you say "I play football" in French?',
          options: [
            'Je joue le football',
            'Je joue au football',
            'Je mange le football',
            'Je nage au football'
          ],
          correctOptionIndex: 1,
          explanation: 'With sports using balls or games, we say "Je joue au..." (à + le = au).',
        ),
        P5InteractiveExercise(
          prompt: 'Which sport means "Swimming" in French?',
          options: ['La course', 'La natation', 'Le tennis', 'Le basketball'],
          correctOptionIndex: 1,
          explanation: '"La natation" means swimming.',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'State two sports you like and one sport you do not play.',
          answer: 'J\'aime le football et la natation. Je ne joue pas au tennis.',
          hint: 'J\'aime... Je ne joue pas au...',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Sports Profile',
          instruction: 'Draw your favorite sporting equipment in your notebook and label the sport in French with "Je joue au...".',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Playing Sports: "Jouer à + Article"',
        explanation:
            'When using the verb "jouer" (to play) with ball sports and games, the preposition "à" combines with the masculine article "le" to form "au": jouer + le football = jouer au football; jouer + le basketball = jouer au basketball.',
        examples: [
          'Je joue au football. (I play football)',
          'Je joue au tennis. (I play tennis)',
          'Je fais de la natation. (I do swimming)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 4: LES SPORTS ET LES LOISIRS (PART II)
    // ==========================================
    P5Lesson(
      term: 3,
      week: 4,
      topic: 'Les Sports et les Loisirs (Partie II: Loisirs & Invitations)',
      subtitle: 'Hobbies, Music, Reading & Play Invitations: "Veux-tu jouer avec moi ?"',
      patternType: P5PatternType.hobbiesLounge,
      objectives: [
        'Name creative leisure activities: "lire" (read), "dessiner" (draw), "chanter" (sing), "danser" (dance), "écouter de la musique".',
        'Invite a classmate to play using: "Veux-tu jouer avec moi ?".',
        'Accept invitations with "Oui, avec plaisir !" or decline politely with "Non, je ne peux pas".',
        'Express personal talent: "Je sais chanter / Je sais danser".',
      ],
      culturalInsight:
          'Inviting friends politely to play games or draw together builds lasting friendship on the playground. Saying "Oui, avec plaisir !" radiates enthusiasm and warmth!',
      vocabItems: [
        P5VocabItem(
          french: 'Lire un livre',
          phonetics: 'leer uhn leevr',
          english: 'To read a book',
          usageNote: 'Quiet leisure activity.',
          icon: Icons.auto_stories_rounded,
          audioKey: 'lire_un_livre',
        ),
        P5VocabItem(
          french: 'Dessiner et peindre',
          phonetics: 'day-see-nay ay pan-druh',
          english: 'To draw and paint',
          usageNote: 'Creative arts.',
          icon: Icons.palette_rounded,
          audioKey: 'dessiner_et_peindre',
        ),
        P5VocabItem(
          french: 'Chanter et danser',
          phonetics: 'shahn-tay ay dahn-say',
          english: 'To sing and dance',
          usageNote: 'Musical recreation.',
          icon: Icons.music_note_rounded,
          audioKey: 'chanter_et_danser',
        ),
        P5VocabItem(
          french: 'Écouter de la musique',
          phonetics: 'ay-koo-tay duh lah moo-zeek',
          english: 'To listen to music',
          usageNote: 'Relaxation hobby.',
          icon: Icons.headphones_rounded,
          audioKey: 'ecouter_de_la_musique',
        ),
        P5VocabItem(
          french: 'Veux-tu jouer avec moi ?',
          phonetics: 'vuh-too zhoo-ay ah-vek mwah',
          english: 'Do you want to play with me?',
          usageNote: 'Polite play invitation.',
          icon: Icons.person_add_rounded,
          audioKey: 'veux_tu_jouer_avec_moi',
        ),
        P5VocabItem(
          french: 'Oui, avec plaisir !',
          phonetics: 'wee ah-vek play-zeer',
          english: 'Yes, with pleasure!',
          usageNote: 'Enthusiastic acceptance.',
          icon: Icons.sentiment_very_satisfied_rounded,
          audioKey: 'oui_avec_plaisir',
        ),
        P5VocabItem(
          french: 'Non, je ne peux pas',
          phonetics: 'nohn zhuh nuh puh pah',
          english: 'No, I cannot (politely declining)',
          usageNote: 'Polite refusal.',
          icon: Icons.sentiment_neutral_rounded,
          audioKey: 'non_je_ne_peux_pas',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'How do you politely invite a classmate to play on the smartboard?',
          options: [
            'Au revoir',
            'Veux-tu jouer avec moi ?',
            'Fais mes devoirs',
            'Donne-moi ton livre'
          ],
          correctOptionIndex: 1,
          explanation: '"Veux-tu jouer avec moi ?" is the polite invitation phrase.',
        ),
        P5InteractiveExercise(
          prompt: 'What is the happy response to an invitation?',
          options: ['Non jamais', 'Oui, avec plaisir !', 'Au secours', 'Pardon'],
          correctOptionIndex: 1,
          explanation: '"Oui, avec plaisir !" means "Yes, with pleasure!".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Role-play an invitation exchange with a classmate in French.',
          answer: 'Pupil A: Veux-tu jouer avec moi ? Pupil B: Oui, avec plaisir !',
          hint: 'Veux-tu jouer... Oui, avec plaisir.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Hobby Journal',
          instruction: 'Write 3 French sentences about your favorite weekend hobbies (reading, dancing, singing).',
        ),
      ],
    ),

    // ==========================================
    // WEEK 5: EXAMEN DE MI-TRIMESTRE (SPEED RALLY)
    // ==========================================
    P5Lesson(
      term: 3,
      week: 5,
      topic: 'Examen de Mi-Trimestre (Mid-Term Oral Speed Rally)',
      subtitle: 'Mid-Term Speed Review & Team Buzzer Stations for Weeks 1 to 4',
      patternType: P5PatternType.term3RevisionRally,
      objectives: [
        'Consolidate daily routine reflexive verbs and time expressions.',
        'Review sports, hobbies, and social invitation phrases.',
        'Participate in classroom team speed buzzer challenges.',
      ],
      culturalInsight:
          'Mid-term speed rallies create high energy and team pride! Pupils review real-world scenarios from morning routines to playground games.',
      vocabItems: [
        P5VocabItem(
          french: 'La routine et les loisirs',
          phonetics: 'lah roo-teen ay lay lwah-zeer',
          english: 'Daily routine and leisure',
          usageNote: 'Consolidation theme.',
          icon: Icons.checklist_rounded,
          audioKey: 'la_routine_et_les_loisirs',
        ),
        P5VocabItem(
          french: 'Le champion du 3e trimestre',
          phonetics: 'luh shahm-pyohn doo trwah-zyem tree-mestr',
          english: 'Champion of Term 3',
          usageNote: 'Award badge.',
          icon: Icons.emoji_events_rounded,
          audioKey: 'le_champion_du_3e_trimestre',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What does "Je me réveille à six heures" mean?',
          options: [
            'I go to bed at 6:00',
            'I wake up at 6:00',
            'I play football at 6:00',
            'I eat dinner at 6:00'
          ],
          correctOptionIndex: 1,
          explanation: '"Je me réveille à six heures" means "I wake up at 6:00 AM".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Deliver a 30-second presentation of your morning routine and favorite sport.',
          answer: 'Pupils deliver presentations with fluency.',
          hint: 'Je me réveille... Je joue au football...',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Mid-Term Practice',
          instruction: 'Practice reciting your routine and sports vocabulary during the mid-term break.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 6: CONGÉ DE MI-TRIMESTRE (BREAK & REST)
    // ==========================================
    P5Lesson(
      term: 3,
      week: 6,
      topic: 'Congé de Mi-Trimestre (Mid-Term Break & Intermission)',
      subtitle: 'Mid-Term Rest, Sports & Preparation for School Subjects, Careers & Food',
      patternType: P5PatternType.term3Graduation,
      objectives: [
        'Enjoy a restful break with friends and sports.',
        'Prepare for Week 7 (School Subjects, Classroom Borrowing, Careers & Food).',
      ],
      culturalInsight:
          'A healthy mind thrives on balanced study and physical play! Enjoy your sports and relaxation during the mid-term break.',
      vocabItems: [
        P5VocabItem(
          french: 'Bon repos de mi-trimestre !',
          phonetics: 'bohn ruh-poh duh mee tree-mestr',
          english: 'Have a good mid-term rest!',
          usageNote: 'Holiday greeting.',
          icon: Icons.beach_access_rounded,
          audioKey: 'bon_repos_mi_trimestre',
        ),
        P5VocabItem(
          french: 'À très bientôt en classe !',
          phonetics: 'ah tray byan-toh ahn klahs',
          english: 'See you very soon in class!',
          usageNote: 'Return greeting.',
          icon: Icons.waving_hand_rounded,
          audioKey: 'a_tres_bientot_en_classe',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What French greeting wishes a peaceful rest during the break?',
          options: ['Bon repos !', 'Au revoir', 'Merci', 'Je dîne'],
          correctOptionIndex: 0,
          explanation: '"Bon repos !" wishes a good rest.',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'What does "Bon repos" mean?',
          answer: 'Good rest / restful break!',
          hint: 'Rest wish.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Holiday Reading',
          instruction: 'Read over your classroom objects and get ready for Week 7!',
        ),
      ],
    ),

    // ==========================================
    // WEEK 7: LES ACTIVITÉS À L'ÉCOLE (PART I: MATIÈRES)
    // ==========================================
    P5Lesson(
      term: 3,
      week: 7,
      topic: 'Les Activités à l\'École (Partie I: Les Matières Scolaires)',
      subtitle: 'Core School Subjects: Le Français, L\'Anglais, Les Mathématiques, Les Sciences',
      patternType: P5PatternType.schoolSubjects,
      objectives: [
        'Name core primary school subjects: "le français", "l\'anglais", "les mathématiques", "les sciences", "l\'histoire", "le sport".',
        'State subjects studied using: "J\'étudie le français et les mathématiques".',
        'Express subject preferences: "Ma matière préférée est le français".',
        'Identify which subjects occur on each day of the school timetable.',
      ],
      culturalInsight:
          'Learning French opens doors across 29 Francophone countries and international diplomacy! Pupils proudly share: "Le français est ma matière préférée !"',
      vocabItems: [
        P5VocabItem(
          french: 'Le français',
          phonetics: 'luh frahn-say',
          english: 'French language',
          usageNote: 'Our subject of study!',
          icon: Icons.translate_rounded,
          audioKey: 'le_francais',
        ),
        P5VocabItem(
          french: 'L\'anglais',
          phonetics: 'lahn-glay',
          english: 'English language',
          usageNote: 'National official language.',
          icon: Icons.language_rounded,
          audioKey: 'langlais',
        ),
        P5VocabItem(
          french: 'Les mathématiques (Les maths)',
          phonetics: 'lay mah-tay-mah-teek',
          english: 'Mathematics',
          usageNote: 'Numbers, arithmetic & shapes.',
          icon: Icons.calculate_rounded,
          audioKey: 'les_mathematiques',
        ),
        P5VocabItem(
          french: 'Les sciences',
          phonetics: 'lay see-ahns',
          english: 'Science',
          usageNote: 'Nature, experiments & biology.',
          icon: Icons.science_rounded,
          audioKey: 'les_sciences',
        ),
        P5VocabItem(
          french: 'L\'histoire',
          phonetics: 'lees-twahr',
          english: 'History',
          usageNote: 'Stories of Nigeria and the world.',
          icon: Icons.account_balance_rounded,
          audioKey: 'lhistoire',
        ),
        P5VocabItem(
          french: 'Ma matière préférée',
          phonetics: 'mah mah-tyair pray-fay-ray',
          english: 'My favorite subject',
          usageNote: 'Stating top preferred subject.',
          icon: Icons.star_rounded,
          audioKey: 'ma_matiere_preferee',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'How do you say "My favorite subject is French" in French?',
          options: [
            'J\'aime le sport',
            'Ma matière préférée est le français',
            'Je déteste les maths',
            'Voici mon livre'
          ],
          correctOptionIndex: 1,
          explanation: '"Ma matière préférée est le français" means "My favorite subject is French".',
        ),
        P5InteractiveExercise(
          prompt: 'Which subject teaches numbers, addition, and calculations?',
          options: ['L\'anglais', 'Les mathématiques', 'L\'histoire', 'Le dessin'],
          correctOptionIndex: 1,
          explanation: 'Mathematics is "les mathématiques".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'List 4 school subjects in French and state your favorite.',
          answer: 'Le français, l\'anglais, les mathématiques, les sciences. Ma matière préférée est...',
          hint: 'Le français, l\'anglais...',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Timetable Review',
          instruction: 'Write out your school timetable in your notebook with the French names of all your subjects.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 8: LES ACTIVITÉS À L'ÉCOLE (PART II: OBJETS DE CLASSE)
    // ==========================================
    P5Lesson(
      term: 3,
      week: 8,
      topic: 'Les Activités à l\'École (Partie II: Objets de Classe & Prêt)',
      subtitle: 'Classroom Objects & Polite Borrowing: "Prête-moi ton stylo, s\'il te plaît"',
      patternType: P5PatternType.classroomBorrowing,
      objectives: [
        'Identify classroom items: "le stylo", "le crayon", "le livre", "le cahier", "la règle", "la gomme", "le sac".',
        'Distinguish masculine objects ("mon stylo", "ton cahier") vs feminine objects ("ma règle", "ta gomme").',
        'Politely ask to borrow an item: "Prête-moi ton stylo, s\'il te plaît".',
        'Return items with grateful appreciation: "Merci beaucoup pour le prêt !".',
      ],
      culturalInsight:
          'Sharing classroom stationery politely and returning items safely demonstrates good character, respect, and camaraderie among classmates!',
      vocabItems: [
        P5VocabItem(
          french: 'Le stylo',
          phonetics: 'luh stee-loh',
          english: 'The pen (Masculine)',
          usageNote: 'Writing tool.',
          icon: Icons.edit_rounded,
          audioKey: 'le_stylo',
        ),
        P5VocabItem(
          french: 'Le crayon',
          phonetics: 'luh kray-yohn',
          english: 'The pencil (Masculine)',
          usageNote: 'Drawing and shading tool.',
          icon: Icons.create_rounded,
          audioKey: 'le_crayon',
        ),
        P5VocabItem(
          french: 'La règle',
          phonetics: 'lah reh-gluh',
          english: 'The ruler (Feminine)',
          usageNote: 'Measuring and straight lines.',
          icon: Icons.straighten_rounded,
          audioKey: 'la_regle',
        ),
        P5VocabItem(
          french: 'La gomme',
          phonetics: 'lah gohm',
          english: 'The eraser / rubber (Feminine)',
          usageNote: 'Erasing pencil marks.',
          icon: Icons.layers_clear_rounded,
          audioKey: 'la_gomme',
        ),
        P5VocabItem(
          french: 'Le livre et le cahier',
          phonetics: 'luh leevr ay luh kah-yay',
          english: 'The textbook and notebook',
          usageNote: 'Reading and writing books.',
          icon: Icons.book_rounded,
          audioKey: 'le_livre_et_le_cahier',
        ),
        P5VocabItem(
          french: 'Prête-moi ton stylo, s\'il te plaît',
          phonetics: 'pret-mwah tohn stee-loh seel tuh play',
          english: 'Lend me your pen, please',
          usageNote: 'Polite borrowing request.',
          icon: Icons.handshake_rounded,
          audioKey: 'prete_moi_ton_stylo',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'How do you ask to borrow a ruler in French with proper feminine possessive?',
          options: [
            'Prête-moi ton règle',
            'Prête-moi ta règle, s\'il te plaît',
            'Prends ma règle',
            'Où est la règle'
          ],
          correctOptionIndex: 1,
          explanation: 'Since "règle" is feminine ("la règle"), we say "ta règle".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Ask a classmate to borrow an eraser politely in French.',
          answer: 'Prête-moi ta gomme, s\'il te plaît.',
          hint: 'Prête-moi ta gomme...',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Stationery Checklist',
          instruction: 'Label 5 stationery items in your school bag in French with sticky notes.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Possessives: "Ton" vs "Ta"',
        explanation:
            'Use "ton" before masculine singular items (ton stylo, ton livre, ton crayon) and "ta" before feminine singular items (ta règle, ta gomme). Always add "s\'il te plaît" (please) for politeness!',
        examples: [
          'Prête-moi ton stylo, s\'il te plaît. (Masc: ton stylo)',
          'Prête-moi ta gomme, s\'il te plaît. (Fem: ta gomme)',
          'Voici ton cahier. (Masc: ton cahier)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 9: LES MÉTIERS ET LES PROFESSIONS
    // ==========================================
    P5Lesson(
      term: 3,
      week: 9,
      topic: 'Les Métiers et Professions (Future Career Dreams)',
      subtitle: 'Professions & Career Dreams: "Quand je serai grand(e), je veux être..."',
      patternType: P5PatternType.professionsCareer,
      objectives: [
        'Identify common professions: "le médecin", "l\'enseignant(e)", "l\'infirmier/ière", "le policier", "le pilote", "l\'ingénieur", "l\'avocat(e)".',
        'State your future dream profession: "Quand je serai grand(e), je veux être médecin".',
        'Distinguish masculine and feminine forms of professions (enseignant / enseignante, infirmier / infirmière).',
        'Explain how different professions help the community.',
      ],
      culturalInsight:
          'Nigerian children aspire to great professions that transform society—surgeons, tech innovators, pilots, teachers, and lawyers! French career vocabulary empowers global career dreams.',
      vocabItems: [
        P5VocabItem(
          french: 'Le médecin',
          phonetics: 'luh mayd-san',
          english: 'The doctor / Physician',
          usageNote: 'Heals the sick.',
          icon: Icons.medical_services_rounded,
          audioKey: 'le_medecin',
        ),
        P5VocabItem(
          french: 'L\'enseignant / L\'enseignante',
          phonetics: 'lahn-seh-nyahn / lahn-seh-nyahnt',
          english: 'The teacher (Male / Female)',
          usageNote: 'Educates pupils.',
          icon: Icons.school_rounded,
          audioKey: 'lenseignant',
        ),
        P5VocabItem(
          french: 'L\'infirmier / L\'infirmière',
          phonetics: 'lan-feer-myay / lan-feer-myair',
          english: 'The nurse (Male / Female)',
          usageNote: 'Cares for patients.',
          icon: Icons.local_hospital_rounded,
          audioKey: 'linfirmier',
        ),
        P5VocabItem(
          french: 'Le pilote',
          phonetics: 'luh pee-loht',
          english: 'The airplane pilot',
          usageNote: 'Flies aircraft across the skies.',
          icon: Icons.flight_rounded,
          audioKey: 'le_pilote',
        ),
        P5VocabItem(
          french: 'L\'ingénieur',
          phonetics: 'lan-zhay-nyuhr',
          english: 'The engineer',
          usageNote: 'Builds bridges, roads & technology.',
          icon: Icons.engineering_rounded,
          audioKey: 'lingenieur',
        ),
        P5VocabItem(
          french: 'Le policier',
          phonetics: 'luh poh-lee-syay',
          english: 'The police officer',
          usageNote: 'Protects the community.',
          icon: Icons.local_police_rounded,
          audioKey: 'le_policier',
        ),
        P5VocabItem(
          french: 'Je veux être...',
          phonetics: 'zhuh vuh z-etr',
          english: 'I want to be...',
          usageNote: 'Expressing future career ambition.',
          icon: Icons.stars_rounded,
          audioKey: 'je_veux_etre',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'How do you say "I want to be a doctor" in French?',
          options: [
            'Je veux être médecin',
            'Je suis pilote',
            'Mon père est fermier',
            'Voici la classe'
          ],
          correctOptionIndex: 0,
          explanation: '"Je veux être médecin" means "I want to be a doctor". Note that in French, professions do not take "un/une" after "être" (Je veux être médecin).',
        ),
        P5InteractiveExercise(
          prompt: 'What is the feminine form of "l\'enseignant" (male teacher)?',
          options: ['L\'infirmière', 'L\'enseignante', 'La policière', 'La pilote'],
          correctOptionIndex: 1,
          explanation: 'The feminine form of "l\'enseignant" is "l\'enseignante".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'What do you want to be when you grow up? Answer in a full French sentence.',
          answer: 'Quand je serai grand(e), je veux être [Profession].',
          hint: 'Quand je serai grand(e), je veux être...',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Career Dream Essay',
          instruction: 'Write 4 French sentences explaining what career you want to do in the future and why you want to help people.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Professions with "Être"',
        explanation:
            'In French, when stating one\'s profession or career dream after the verb "être", do NOT use the indefinite article "un/une": say "Je suis médecin" (NOT "Je suis un médecin") and "Je veux être ingénieur".',
        examples: [
          'Je veux être médecin. (I want to be a doctor)',
          'Elle veut être enseignante. (She wants to be a teacher)',
          'Il est pilote. (He is a pilot)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 10: LES ALIMENTS ET LES REPAS
    // ==========================================
    P5Lesson(
      term: 3,
      week: 10,
      topic: 'Les Aliments et les Repas (Food & French Dining)',
      subtitle: '3 Meals, Staple Foods, Hunger, Thirst & Dining Etiquette: "Bon appétit !"',
      patternType: P5PatternType.foodAndBuffet,
      objectives: [
        'Name the 3 daily meals: "le petit-déjeuner", "le déjeuner", "le dîner".',
        'Identify common foods and drinks: "le pain", "le riz", "le poulet", "le poisson", "les fruits", "l\'eau", "le jus".',
        'Express hunger and thirst: "J\'ai faim" (I am hungry), "J\'ai soif" (I am thirsty).',
        'Use dining expressions: "Bon appétit !" and "Merci pour le délicieux repas !".',
      ],
      culturalInsight:
          'Sharing delicious food—like Jollof rice, plantains, fresh fruits, and fruit juices—brings joyful celebrations! In French dining, saying "Bon appétit !" before eating is an essential polite blessing.',
      vocabItems: [
        P5VocabItem(
          french: 'Le riz',
          phonetics: 'luh ree',
          english: 'Rice (Jollof or white rice)',
          usageNote: 'Staple grain food.',
          icon: Icons.rice_bowl_rounded,
          audioKey: 'le_riz',
        ),
        P5VocabItem(
          french: 'Le pain',
          phonetics: 'luh pan',
          english: 'Bread',
          usageNote: 'Baked loaf / Agege bread.',
          icon: Icons.bakery_dining_rounded,
          audioKey: 'le_pain',
        ),
        P5VocabItem(
          french: 'Le poulet et le poisson',
          phonetics: 'luh poo-lay ay luh pwah-sohn',
          english: 'Chicken and fish',
          usageNote: 'Protein foods.',
          icon: Icons.set_meal_rounded,
          audioKey: 'le_poulet_et_le_poisson',
        ),
        P5VocabItem(
          french: 'Les fruits et les légumes',
          phonetics: 'lay frwee ay lay lay-goom',
          english: 'Fruits and vegetables',
          usageNote: 'Healthy vitamins.',
          icon: Icons.apple_rounded,
          audioKey: 'les_fruits_et_les_legumes',
        ),
        P5VocabItem(
          french: 'L\'eau et le jus',
          phonetics: 'loh ay luh zhoo',
          english: 'Water and juice',
          usageNote: 'Refreshing beverages.',
          icon: Icons.local_drink_rounded,
          audioKey: 'leau_et_le_jus',
        ),
        P5VocabItem(
          french: 'J\'ai faim / J\'ai soif',
          phonetics: 'zhay fan / zhay swahf',
          english: 'I am hungry / I am thirsty',
          usageNote: 'Physical appetite states.',
          icon: Icons.restaurant_rounded,
          audioKey: 'jai_faim_jai_soif',
        ),
        P5VocabItem(
          french: 'Bon appétit !',
          phonetics: 'bohn ah-pay-tee',
          english: 'Enjoy your meal!',
          usageNote: 'Traditional dining blessing.',
          icon: Icons.celebration_rounded,
          audioKey: 'bon_appetit',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What polite phrase do you say to everyone before eating a meal in French?',
          options: ['Au revoir', 'Bon appétit !', 'Bonne nuit', 'À bientôt'],
          correctOptionIndex: 1,
          explanation: '"Bon appétit !" wishes everyone a wonderful, enjoyable meal.',
        ),
        P5InteractiveExercise(
          prompt: 'How do you say "I am thirsty" in French?',
          options: ['J\'ai faim', 'J\'ai soif', 'J\'ai sommeil', 'J\'ai mal'],
          correctOptionIndex: 1,
          explanation: '"J\'ai soif" means "I am thirsty".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Name 3 foods and 2 drinks you love in French.',
          answer: 'Le riz, le poulet, le pain. L\'eau et le jus.',
          hint: 'Le riz, le poulet, l\'eau...',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Dining Menu',
          instruction: 'Design a French breakfast, lunch, and dinner menu in your notebook with pictures and prices.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 11: RÉVISION GÉNÉRALE DE L'ANNÉE
    // ==========================================
    P5Lesson(
      term: 3,
      week: 11,
      topic: 'Grand Rallye Annuel de Révision (Primary 5 Mastery)',
      subtitle: 'Comprehensive Year-End Speed Recap: Terms 1, 2 & 3',
      patternType: P5PatternType.term3RevisionRally,
      objectives: [
        'Recap all core Primary 5 competencies: Counting 1–60, Body Anatomy, Family, Neighbors, Politeness, Days, Daily Routine, Sports, School, Careers & Food.',
        'Participate in classroom team speed buzzer championship.',
        'Demonstrate oral speaking confidence and fluency.',
      ],
      culturalInsight:
          'The Annual Revision Rally celebrates a full year of French excellence! Pupils showcase how far they have grown from basic words to rich, fluent conversations.',
      vocabItems: [
        P5VocabItem(
          french: 'La révision générale annuelle',
          phonetics: 'lah ray-vee-zyohn zhay-nay-rahl ah-nwel',
          english: 'Annual grand revision',
          usageNote: 'Full year consolidation.',
          icon: Icons.checklist_rtl_rounded,
          audioKey: 'la_revision_generale_annuelle',
        ),
        P5VocabItem(
          french: 'Le grand champion de 5e année',
          phonetics: 'luh grahn shahm-pyohn duh sang-kyem ah-nay',
          english: 'Grand Primary 5 Champion',
          usageNote: 'Championship title.',
          icon: Icons.emoji_events_rounded,
          audioKey: 'le_grand_champion_5e_annee',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'Which phrase expresses what career you want to do in the future?',
          options: [
            'Je veux être ingénieur',
            'J\'ai mal à la tête',
            'Voici mon oncle',
            'Il fait froid'
          ],
          correctOptionIndex: 0,
          explanation: '"Je veux être ingénieur" states your future career dream.',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Deliver a 1-minute comprehensive oral introduction: Name, age, family, routine, favorite subject, and future career.',
          answer: 'Pupils deliver full capstone speaking presentations.',
          hint: 'Je m\'appelle... J\'ai... ans. Mon grand-père... Le matin je me réveille... Je veux être...',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Annual Portfolio Review',
          instruction: 'Organize your French notebook and flashcards in preparation for next week\'s final oral evaluation.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 12: ÉVALUATION ORALE ET BILAN ANNUEL
    // ==========================================
    P5Lesson(
      term: 3,
      week: 12,
      topic: 'Bilan et Évaluation Orale Annuelle',
      subtitle: 'Teacher-guided Speaking Assessment & Annual Achievement Portfolio',
      patternType: P5PatternType.term3RevisionRally,
      objectives: [
        'Conduct end-of-year speaking evaluations.',
        'Assess pronunciation accuracy, vocabulary breadth, and sentence structure.',
        'Award Primary 5 French Gold Achievement Badges.',
      ],
      culturalInsight:
          'Oral speaking evaluations validate each pupil\'s mastery of practical French communication in social, family, and educational settings.',
      vocabItems: [
        P5VocabItem(
          french: 'L\'évaluation finale',
          phonetics: 'lay-vah-loo-ah-syohn fee-nahl',
          english: 'The final speaking assessment',
          usageNote: 'Capstone evaluation.',
          icon: Icons.assignment_turned_in_rounded,
          audioKey: 'levaluation_finale',
        ),
        P5VocabItem(
          french: 'Excellent travail !',
          phonetics: 'ek-seh-lahn trah-vah-yuh',
          english: 'Excellent work!',
          usageNote: 'Teacher highest commendation.',
          icon: Icons.thumb_up_alt_rounded,
          audioKey: 'excellent_travail',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What does "Excellent travail !" mean?',
          options: ['Good morning', 'Excellent work!', 'See you soon', 'I am thirsty'],
          correctOptionIndex: 1,
          explanation: '"Excellent travail !" is high praise meaning "Excellent work!".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Deliver your final speaking showcase to your teacher and classmates.',
          answer: 'Pupils present with fluency and excellence.',
          hint: 'Fluency, clarity, pronunciation.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Graduation Prep',
          instruction: 'Get ready for next week\'s Grand Promotion & Graduation Celebration into Primary 6!',
        ),
      ],
    ),

    // ==========================================
    // WEEK 13: GRADUATION & PROMOTION EN 6E ANNÉE
    // ==========================================
    P5Lesson(
      term: 3,
      week: 13,
      topic: 'Remise des Diplômes et Passage en 6e Année (Primary 6)',
      subtitle: 'Congratulations on Completing Primary 5 French — Bienvenue en 6e Année !',
      patternType: P5PatternType.term3Graduation,
      objectives: [
        'Celebrate the triumphant completion of Primary 5 French Language!',
        'Award the Primary 5 French Certificate of Excellence.',
        'Welcome pupils to Primary 6 French (Advanced Dialogues & Grammar).',
      ],
      culturalInsight:
          'Félicitations pour votre succès éclatant ! Completing Primary 5 French marks a major educational milestone. You are now ready for Primary 6 French mastery!',
      vocabItems: [
        P5VocabItem(
          french: 'Félicitations pour votre réussite !',
          phonetics: 'fay-lee-see-tah-syohn poor voh-truh ray-oo-seet',
          english: 'Congratulations on your great success!',
          usageNote: 'Graduation celebration.',
          icon: Icons.celebration_rounded,
          audioKey: 'felicitations_reussite',
        ),
        P5VocabItem(
          french: 'Bienvenue en 6e année !',
          phonetics: 'byan-vuh-noo ahn see-zyem ah-nay',
          english: 'Welcome to Primary 6 (Grade 6)!',
          usageNote: 'Promotion welcome.',
          icon: Icons.school_rounded,
          audioKey: 'bienvenue_en_6e_annee',
        ),
        P5VocabItem(
          french: 'Excellentes vacances à tous !',
          phonetics: 'ek-seh-lahnt vah-kahns ah toos',
          english: 'Have a wonderful vacation everyone!',
          usageNote: 'Annual long vacation farewell.',
          icon: Icons.beach_access_rounded,
          audioKey: 'excellentes_vacances_a_tous',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What class are you promoted to after successfully completing Primary 5?',
          options: ['Primary 1', 'Primary 4', 'Primary 6 (6e année)', 'Preschool'],
          correctOptionIndex: 2,
          explanation: 'Congratulations! You are officially promoted to Primary 6 (6e année)!',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'What is your greatest achievement in French this academic year?',
          answer: 'Pupils share their favorite moments and skills gained across the 3 terms.',
          hint: 'Speaking, counting, sports, family, careers.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Holiday Reading',
          instruction: 'Enjoy a glorious long vacation and see you in Primary 6 French with flying colors!',
        ),
      ],
    ),
  ];
}
