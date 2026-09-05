import 'package:flutter/material.dart';
import '../models/jss1_lesson_model.dart';

class JSS1Term1Lessons {
  static final List<JSS1Lesson> weeks = [
    // ==========================================
    // WEEK 1: LES MOTS UTILISÉS EN CLASSE
    // ==========================================
    JSS1Lesson(
      term: 1,
      week: 1,
      topic: 'Les Mots Utilisés en Classe (Classroom Instructions)',
      subtitle: 'Essential French classroom expressions, teacher commands, and polite student requests.',
      patternType: JSS1PatternType.classroomCommands,
      teachingStyle: TeachingStyle.interactiveStudio,
      objectives: [
        'Understand and respond immediately to French classroom directives (Levez-vous, Asseyez-vous, Ouvrez vos livres).',
        'Use polite classroom phrases to ask permission from the teacher (Puis-je sortir ?, S\'il vous plaît).',
        'Pronounce standard classroom instruction verbs with accurate French cadence.',
        'Distinguish singular/informal commands from plural/formal classroom directives.',
      ],
      culturalInsight:
          'In French-speaking schools across West Africa (Benin, Togo, Senegal, Ivory Coast), standing up when a teacher enters the room is a universal sign of respect followed by a collective "Bonjour, Monsieur/Madame !"',
      vocabItems: [
        JSS1VocabItem(
          french: 'Levez-vous !',
          phonetics: 'luh-vay voo',
          english: 'Stand up! (Plural/Formal)',
          usageNote: 'Teacher directive given to the entire class to rise.',
          icon: Icons.accessibility_new_rounded,
          audioKey: 'levez_vous',
        ),
        JSS1VocabItem(
          french: 'Asseyez-vous !',
          phonetics: 'ah-say-yay voo',
          english: 'Sit down! (Plural/Formal)',
          usageNote: 'Directive given to students to take their seats.',
          icon: Icons.chair_rounded,
          audioKey: 'asseyez_vous',
        ),
        JSS1VocabItem(
          french: 'Ouvrez vos livres !',
          phonetics: 'oo-vray voh leevr',
          english: 'Open your books!',
          usageNote: 'Used when starting a reading or textbook activity.',
          icon: Icons.menu_book_rounded,
          audioKey: 'ouvrez_vos_livres',
        ),
        JSS1VocabItem(
          french: 'Fermez vos cahiers !',
          phonetics: 'fair-may voh kah-yay',
          english: 'Close your notebooks!',
          usageNote: 'Used before a test, dictation, or oral drill.',
          icon: Icons.auto_stories_rounded,
          audioKey: 'fermez_vos_cahiers',
        ),
        JSS1VocabItem(
          french: 'Écoutez attentivement !',
          phonetics: 'ay-koo-tay ah-tahn-teev-mahn',
          english: 'Listen attentively!',
          usageNote: 'Calls for full auditory attention before an audio playback.',
          icon: Icons.hearing_rounded,
          audioKey: 'ecoutez_attentivement',
        ),
        JSS1VocabItem(
          french: 'Répétez après moi !',
          phonetics: 'ray-pay-tay ah-pray mwah',
          english: 'Repeat after me!',
          usageNote: 'Invites the class to do choral repetition drills.',
          icon: Icons.record_voice_over_rounded,
          audioKey: 'repetez_apres_moi',
        ),
        JSS1VocabItem(
          french: 'Regardez le tableau !',
          phonetics: 'ruh-gar-day luh tah-bloh',
          english: 'Look at the board / screen!',
          usageNote: 'Directs eyes toward the smartboard or chalkboard.',
          icon: Icons.tv_rounded,
          audioKey: 'regardez_le_tableau',
        ),
        JSS1VocabItem(
          french: 'Silence, s\'il vous plaît !',
          phonetics: 'see-lahns seel voo play',
          english: 'Silence, please!',
          usageNote: 'Standard polite call for quiet in the classroom.',
          icon: Icons.volume_off_rounded,
          audioKey: 'silence_sil_vous_plait',
        ),
        JSS1VocabItem(
          french: 'Puis-je sortir ?',
          phonetics: 'pwee-zhuh sor-teer',
          english: 'May I go out / step out?',
          usageNote: 'Polite student request to excuse oneself from class.',
          icon: Icons.exit_to_app_rounded,
          audioKey: 'puis_je_sortir',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'What should the class do when the teacher says "Levez-vous !" ?',
          options: ['Sit down quietly', 'Stand up', 'Open their notebooks', 'Leave the room'],
          correctOptionIndex: 1,
          explanation: '"Levez-vous !" is the imperative command for standing up as a group.',
        ),
        JSS1InteractiveExercise(
          prompt: 'Which phrase is the polite request to leave the classroom for a moment?',
          options: ['Asseyez-vous !', 'Regardez le tableau', 'Puis-je sortir ?', 'Répétez après moi'],
          correctOptionIndex: 2,
          explanation: '"Puis-je sortir ?" translates directly to "May I go out / step out?"',
        ),
        JSS1InteractiveExercise(
          prompt: 'When the teacher announces "Fermez vos cahiers !", students must:',
          options: ['Write down notes', 'Open their books', 'Close their notebooks', 'Read aloud'],
          correctOptionIndex: 2,
          explanation: '"Fermer" means to close, and "vos cahiers" refers to your notebooks.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Levez-vous !', english: 'Stand up! (Plural/Formal)'),
            DrillPair(french: 'Asseyez-vous !', english: 'Sit down! (Plural/Formal)'),
            DrillPair(french: 'Ouvrez vos livres !', english: 'Open your books!'),
            DrillPair(french: 'Fermez vos cahiers !', english: 'Close your notebooks!'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (Stand up! (Plural/Formal)):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Levez-vous !', 'Asseyez-vous !', 'Ouvrez vos livres !', 'Fermez vos cahiers !'],
          correctWord: 'Levez-vous !',
          explanation: 'Correct! "Levez-vous !" translates to "Stand up! (Plural/Formal)".',
        ),
        JSS1InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to polite formulas and authentic pronunciation is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to mastering French.',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "Listen attentively" en français ?',
          answer: 'Écoutez attentivement !',
          hint: 'Begins with the verb Écouter (Listen).',
        ),
        JSS1EvaluationQuestion(
          question: 'Quelle est la phrase française pour "Look at the board" ?',
          answer: 'Regardez le tableau !',
          hint: 'The word for board in French is "le tableau".',
        ),
        JSS1EvaluationQuestion(
          question: 'Quelle expression utilise un élève poli pour demander la permission de sortir ?',
          answer: 'Puis-je sortir, s\'il vous plaît ?',
          hint: 'Uses the modal "Puis-je...".',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Devoir Écrit',
          instruction: 'Write out the 8 major classroom commands in your French notebook with their English meanings.',
          exampleResponse: '1. Levez-vous ! = Stand up!\n2. Asseyez-vous ! = Sit down!\n3. Ouvrez vos livres ! = Open your books!',
        ),
        JSS1AssignmentTask(
          category: 'Pratique Orale',
          instruction: 'Practice reciting 5 teacher commands to a classmate and act out the required physical response.',
          exampleResponse: 'Say "Regardez le tableau !" and point toward the screen.',
        ),
      ],
      grammarNotes: [
        JSS1GrammarNote(
          title: 'L\'Impératif Présent (Classroom Orders)',
          rule: 'To give instructions to a group or to show respect to an adult, French uses the "Vous" form ending in -EZ (Levez, Asseyez, Ouvrez, Fermez, Écoutez, Répétez, Regardez).',
          examples: [
            'Écouter ➔ Écoutez ! (Listen!)',
            'Répéter ➔ Répétez ! (Repeat!)',
            'Regarder ➔ Regardez ! (Look!)',
          ],
        ),
      ],
    ),

    // ==========================================
    // WEEK 2: SALUER ET PRENDRE CONGÉ
    // ==========================================
    JSS1Lesson(
      term: 1,
      week: 2,
      topic: 'Saluer et Prendre Congé (Greetings & Politeness)',
      subtitle: 'Formal and informal greeting registers, responses to greetings, and polite parting expressions.',
      patternType: JSS1PatternType.greetingStudio,
      teachingStyle: TeachingStyle.conversationalDialogue,
      objectives: [
        'Distinguish formal greetings (Bonjour Monsieur/Madame, Comment allez-vous ?) from informal ones (Salut, Ça va ?).',
        'Respond accurately to inquiries about health and wellbeing (Très bien, merci ! Et vous ?).',
        'Use polite French formulas: S\'il vous plaît, Merci beaucoup, De rien, Enchanté(e).',
        'Bid farewell appropriately depending on context (Au revoir, À demain, Bonne journée).',
      ],
      culturalInsight:
          'In Francophone culture, entering a room or store without greeting everyone with a clear "Bonjour" is considered impolite. Handshakes and polite eye contact are customary.',
      vocabItems: [
        JSS1VocabItem(
          french: 'Bonjour Monsieur / Madame',
          phonetics: 'bohn-zhoor muh-syur / mah-dahm',
          english: 'Good morning / Good day Sir / Madam',
          usageNote: 'Standard polite formal morning/afternoon greeting.',
          icon: Icons.wb_sunny_rounded,
          audioKey: 'bonjour_monsieur_madame',
        ),
        JSS1VocabItem(
          french: 'Bonsoir !',
          phonetics: 'bohn-swahr',
          english: 'Good evening!',
          usageNote: 'Used from late afternoon (around 17h00) into the evening.',
          icon: Icons.nightlight_round,
          audioKey: 'bonsoir',
        ),
        JSS1VocabItem(
          french: 'Salut !',
          phonetics: 'sah-loo',
          english: 'Hi! / Bye! (Informal)',
          usageNote: 'Used only with close friends, classmates, and family.',
          icon: Icons.waving_hand_rounded,
          audioKey: 'salut',
        ),
        JSS1VocabItem(
          french: 'Comment allez-vous ?',
          phonetics: 'koh-mahn tah-lay voo',
          english: 'How are you? (Formal/Plural)',
          usageNote: 'Polite inquiry addressed to an adult, teacher, or group.',
          icon: Icons.how_to_reg_rounded,
          audioKey: 'comment_allez_vous',
        ),
        JSS1VocabItem(
          french: 'Comment vas-tu ? / Ça va ?',
          phonetics: 'koh-mahn vah too / sah vah',
          english: 'How are you? / How is it going? (Informal)',
          usageNote: 'Inquiry used between peers and classmates.',
          icon: Icons.sentiment_satisfied_alt_rounded,
          audioKey: 'comment_vas_tu',
        ),
        JSS1VocabItem(
          french: 'Très bien, merci ! Et vous ?',
          phonetics: 'tray byan mair-see ay voo',
          english: 'Very well, thank you! And you?',
          usageNote: 'Polite formal standard reply.',
          icon: Icons.thumb_up_rounded,
          audioKey: 'tres_bien_merci_et_vous',
        ),
        JSS1VocabItem(
          french: 'Enchanté / Enchantée',
          phonetics: 'ahn-shahn-tay',
          english: 'Pleased to meet you (Masc / Fem)',
          usageNote: 'Said upon meeting someone for the first time.',
          icon: Icons.handshake_rounded,
          audioKey: 'enchante',
        ),
        JSS1VocabItem(
          french: 'S\'il vous plaît / De rien',
          phonetics: 'seel voo play / duh ryan',
          english: 'Please / You are welcome',
          usageNote: 'Core courtesy formula for asking and acknowledging thanks.',
          icon: Icons.favorite_rounded,
          audioKey: 'sil_vous_plait_de_rien',
        ),
        JSS1VocabItem(
          french: 'Au revoir et à demain !',
          phonetics: 'oh ruh-vwahr ay ah duh-man',
          english: 'Goodbye and see you tomorrow!',
          usageNote: 'Standard dismissal at the end of the school day.',
          icon: Icons.departure_board_rounded,
          audioKey: 'au_revoir_et_a_demain',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'How do you greet your French teacher in the morning at school?',
          options: ['Salut mon ami !', 'Bonjour Monsieur / Madame', 'Bonsoir !', 'De rien'],
          correctOptionIndex: 1,
          explanation: '"Bonjour Monsieur/Madame" is the respectful formal register for educators.',
        ),
        JSS1InteractiveExercise(
          prompt: 'If a classmate asks "Comment vas-tu ?", the best reply is:',
          options: ['Au revoir !', 'Enchanté', 'Très bien, merci ! Et toi ?', 'S\'il vous plaît'],
          correctOptionIndex: 2,
          explanation: '"Très bien, merci ! Et toi ?" politely answers how you feel and inquires back.',
        ),
        JSS1InteractiveExercise(
          prompt: 'What do you say when being introduced to a new friend for the first time?',
          options: ['Fermez vos livres !', 'Enchanté(e) !', 'Puis-je sortir ?', 'Asseyez-vous !'],
          correctOptionIndex: 1,
          explanation: '"Enchanté" means "Pleased to meet you" or "Delighted to make your acquaintance".',
        ),
        JSS1InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Bonjour Monsieur / Madame', english: 'Good morning / Good day Sir / Madam'),
            DrillPair(french: 'Bonsoir !', english: 'Good evening!'),
            DrillPair(french: 'Salut !', english: 'Hi! / Bye! (Informal)'),
            DrillPair(french: 'Comment allez-vous ?', english: 'How are you? (Formal/Plural)'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (Good morning / Good day Sir / Madam):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Bonjour Monsieur / Madame', 'Bonsoir !', 'Salut !', 'Comment allez-vous ?'],
          correctWord: 'Bonjour Monsieur / Madame',
          explanation: 'Correct! "Bonjour Monsieur / Madame" translates to "Good morning / Good day Sir / Madam".',
        ),
        JSS1InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to polite formulas and authentic pronunciation is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to mastering French.',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "How are you?" formellement en français ?',
          answer: 'Comment allez-vous ?',
          hint: 'Uses the polite "Vous" form.',
        ),
        JSS1EvaluationQuestion(
          question: 'Quelle est la salutation appropriée le soir après 18h00 ?',
          answer: 'Bonsoir !',
          hint: 'The word "soir" means evening.',
        ),
        JSS1EvaluationQuestion(
          question: 'Quelle formule de politesse signifie "You are welcome" ?',
          answer: 'De rien ! (ou Je vous en prie !)',
          hint: 'Literally "Of nothing".',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Dialogue Écrit',
          instruction: 'Write a 4-line formal dialogue between a student (Amina) and her teacher (M. Tunde).',
          exampleResponse: 'Amina: Bonjour Monsieur Tunde !\nM. Tunde: Bonjour Amina ! Comment vas-tu ?\nAmina: Très bien, merci Monsieur ! Et vous ?\nM. Tunde: Je vais très bien, merci !',
        ),
      ],
      grammarNotes: [
        JSS1GrammarNote(
          title: 'Tu (Informal) vs. Vous (Formal)',
          rule: 'Use "Tu" for one peer, friend, classmate, child, or close relative. Use "Vous" for any teacher, adult, stranger, or two or more people.',
          examples: [
            'Comment vas-tu ? (Informal to friend)',
            'Comment allez-vous ? (Formal to teacher or group)',
          ],
        ),
      ],
    ),

    // ==========================================
    // WEEK 3: SE PRÉSENTER
    // ==========================================
    JSS1Lesson(
      term: 1,
      week: 3,
      topic: 'Se Présenter (Introducing Oneself)',
      subtitle: 'Giving personal identity: name, age, nationality, city of origin, and school class.',
      patternType: JSS1PatternType.selfIntroStudio,
      teachingStyle: TeachingStyle.conversationalDialogue,
      objectives: [
        'State your full name clearly using "Je m\'appelle..."',
        'State your age accurately using the verb AVOIR: "J\'ai 12 ans."',
        'Declare your nationality and country of origin: "Je suis nigérian(e), je viens du Nigeria."',
        'Describe your class level: "Je suis élève en classe de JSS1."',
      ],
      culturalInsight:
          'Nigerian students learning French are uniquely positioned because Nigeria is surrounded by French-speaking nations. Introducing oneself in French bridges international friendships across ECOWAS.',
      vocabItems: [
        JSS1VocabItem(
          french: 'Je m\'appelle...',
          phonetics: 'zhuh mah-pell',
          english: 'My name is...',
          usageNote: 'Standard formula using the pronominal verb s\'appeler.',
          icon: Icons.badge_rounded,
          audioKey: 'je_mappelle',
        ),
        JSS1VocabItem(
          french: 'J\'ai 12 ans.',
          phonetics: 'zhay dooz ahn',
          english: 'I am 12 years old.',
          usageNote: 'French uses AVOIR (to have) for expressing age.',
          icon: Icons.cake_rounded,
          audioKey: 'jai_douze_ans',
        ),
        JSS1VocabItem(
          french: 'Je suis nigérian / nigériane.',
          phonetics: 'zhuh swee nee-zhay-ryahn / nee-zhay-ryenn',
          english: 'I am Nigerian (Boy / Girl).',
          usageNote: 'Adjective of nationality agrees with gender.',
          icon: Icons.flag_rounded,
          audioKey: 'je_suis_nigerian',
        ),
        JSS1VocabItem(
          french: 'Je viens de Lagos / d\'Abuja.',
          phonetics: 'zhuh vyan duh lah-gohs / dah-boo-zhah',
          english: 'I come from Lagos / Abuja.',
          usageNote: 'Uses the verb VENIR DE to express geographical origin.',
          icon: Icons.location_on_rounded,
          audioKey: 'je_viens_de_lagos',
        ),
        JSS1VocabItem(
          french: 'J\'habite à Abuja.',
          phonetics: 'zhah-beet ah ah-boo-zhah',
          english: 'I live in Abuja.',
          usageNote: 'Uses the verb HABITER À for city of residence.',
          icon: Icons.home_rounded,
          audioKey: 'jhabite_a_abuja',
        ),
        JSS1VocabItem(
          french: 'Je suis élève en JSS1.',
          phonetics: 'zhuh swee ay-lev ahn zhay ess ess un',
          english: 'I am a student in JSS 1.',
          usageNote: 'Describes student academic level.',
          icon: Icons.school_rounded,
          audioKey: 'je_suis_eleve_en_jss1',
        ),
        JSS1VocabItem(
          french: 'Comment vous appelez-vous ?',
          phonetics: 'koh-mahn voo zah-play voo',
          english: 'What is your name? (Formal)',
          usageNote: 'Inquires about someone\'s identity formally.',
          icon: Icons.contact_page_rounded,
          audioKey: 'comment_vous_appelez_vous',
        ),
        JSS1VocabItem(
          french: 'Quel âge as-tu ?',
          phonetics: 'kell ahzh ah too',
          english: 'How old are you?',
          usageNote: 'Direct question to ask a peer\'s age.',
          icon: Icons.calendar_today_rounded,
          audioKey: 'quel_age_as_tu',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'How do you say "My name is Chidi" in French?',
          options: ['J\'ai Chidi', 'Je suis de Chidi', 'Je m\'appelle Chidi', 'Voici Chidi'],
          correctOptionIndex: 2,
          explanation: '"Je m\'appelle" is the standard phrase for stating one\'s name.',
        ),
        JSS1InteractiveExercise(
          prompt: 'Which verb is used in French to express one\'s age?',
          options: ['Être (To be)', 'Avoir (To have)', 'Faire (To do)', 'Aller (To go)'],
          correctOptionIndex: 1,
          explanation: 'In French, we say "J\'ai 12 ans" (literally "I have 12 years"), using the verb AVOIR.',
        ),
        JSS1InteractiveExercise(
          prompt: 'A female Nigerian student should declare her nationality as:',
          options: ['Je suis nigérian', 'Je suis nigériane', 'Je suis nigeria', 'J\'ai nigériane'],
          correctOptionIndex: 1,
          explanation: 'For a female speaker, the feminine form is "nigériane".',
        ),
        JSS1InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Je m\'appelle...', english: 'My name is...'),
            DrillPair(french: 'J\'ai 12 ans.', english: 'I am 12 years old.'),
            DrillPair(french: 'Je suis nigérian / nigériane.', english: 'I am Nigerian (Boy / Girl).'),
            DrillPair(french: 'Je viens de Lagos / d\'Abuja.', english: 'I come from Lagos / Abuja.'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (My name is...):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Je m\'appelle...', 'J\'ai 12 ans.', 'Je suis nigérian / nigériane.', 'Je viens de Lagos / d\'Abuja.'],
          correctWord: 'Je m\'appelle...',
          explanation: 'Correct! "Je m\'appelle..." translates to "My name is...".',
        ),
        JSS1InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to polite formulas and authentic pronunciation is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to mastering French.',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "I am 13 years old" en français ?',
          answer: 'J\'ai treize ans.',
          hint: 'The French number for 13 is "treize".',
        ),
        JSS1EvaluationQuestion(
          question: 'Quelle est la question française pour "What is your name?" ?',
          answer: 'Comment tu t\'appelles ? (ou Comment vous appelez-vous ?)',
          hint: 'Uses the verb s\'appeler.',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Carte d\'Identité (Student ID)',
          instruction: 'Design a French Student ID card in your notebook with Name, Age, Nationality, City, and Class.',
          exampleResponse: 'Nom : ADEBAYO\nPrénom : Tunde\nÂge : 12 ans\nNationalité : Nigérian\nVille : Lagos\nClasse : JSS 1',
        ),
      ],
      grammarNotes: [
        JSS1GrammarNote(
          title: 'Verbs for Self-Introduction',
          rule: 'S\'appeler (to be called), Avoir (to have age), Être (to be nationality/student), Habiter (to reside).',
          examples: [
            'S\'appeler ➔ Je m\'appelle Emeka',
            'Avoir ➔ J\'ai 12 ans',
            'Être ➔ Je suis élève / Je suis nigérian',
          ],
        ),
      ],
    ),

    // ==========================================
    // WEEK 4: ÉPELER UN MOT ET L'ORTHOGRAPHE
    // ==========================================
    JSS1Lesson(
      term: 1,
      week: 4,
      topic: 'Épeler un mot et l\'Orthographe (Spelling & Dictation)',
      subtitle: 'The French alphabet (A–Z), French accent marks, spelling names, and transcribing dictated words.',
      patternType: JSS1PatternType.spellingAndDictation,
      teachingStyle: TeachingStyle.phoneticSoundboard,
      objectives: [
        'Pronounce all 26 letters of the French alphabet with flawless French phonetics.',
        'Identify and pronounce the 5 key French accent marks (aigu, grave, circonflexe, cédille, tréma).',
        'Spell your first name, surname, and common French vocabulary aloud upon request.',
        'Accurately transcribe short dictated French words onto paper or smartboard.',
      ],
      culturalInsight:
          'French accents are not decorative ornaments; they change the pronunciation and meaning of words completely! For example, "ou" means "or", while "où" means "where".',
      vocabItems: [
        JSS1VocabItem(
          french: 'Comment ça s\'écrit ?',
          phonetics: 'koh-mahn sah say-kree',
          english: 'How is that written / spelled?',
          usageNote: 'Essential question when you need someone to spell a word.',
          icon: Icons.help_outline_rounded,
          audioKey: 'comment_ca_secrit',
        ),
        JSS1VocabItem(
          french: 'Ça s\'épèle...',
          phonetics: 'sah say-pell',
          english: 'It is spelled...',
          usageNote: 'Used before spelling out a word letter by letter.',
          icon: Icons.spellcheck_rounded,
          audioKey: 'ca_sepelle',
        ),
        JSS1VocabItem(
          french: 'L\'accent aigu (é)',
          phonetics: 'lahk-sahn ay-goo',
          english: 'Acute accent (e.g. école, élève)',
          usageNote: 'Points up and right, makes a closed sound /ay/.',
          icon: Icons.title_rounded,
          audioKey: 'accent_aigu',
        ),
        JSS1VocabItem(
          french: 'L\'accent grave (è, à, ù)',
          phonetics: 'lahk-sahn grahv',
          english: 'Grave accent (e.g. père, mère, où)',
          usageNote: 'Points down and right, gives open /eh/ sound.',
          icon: Icons.text_fields_rounded,
          audioKey: 'accent_grave',
        ),
        JSS1VocabItem(
          french: 'L\'accent circonflexe (ê, â, î, ô, û)',
          phonetics: 'lahk-sahn seer-kohn-fleks',
          english: 'Circumflex accent / "little hat" (e.g. fête, hôtel)',
          usageNote: 'Looks like a hat ^, often indicates historical dropped "s".',
          icon: Icons.change_history_rounded,
          audioKey: 'accent_circonflexe',
        ),
        JSS1VocabItem(
          french: 'La cédille (ç)',
          phonetics: 'lah say-deey',
          english: 'Cedilla (e.g. français, garçon)',
          usageNote: 'Little tail under "c", makes it sound like /s/ before a, o, u.',
          icon: Icons.brush_rounded,
          audioKey: 'la_cedille',
        ),
        JSS1VocabItem(
          french: 'Le tréma (ï, ë)',
          phonetics: 'luh tray-mah',
          english: 'Trema / Two dots (e.g. Naïja, Noël)',
          usageNote: 'Forces separate pronunciation of two adjacent vowels.',
          icon: Icons.more_horiz_rounded,
          audioKey: 'le_trema',
        ),
        JSS1VocabItem(
          french: 'En majuscule / En minuscule',
          phonetics: 'ahn mah-zhoos-kool / ahn mee-noos-kool',
          english: 'In uppercase (capital) / In lowercase',
          usageNote: 'Distinguishes letter casing during dictation.',
          icon: Icons.font_download_rounded,
          audioKey: 'en_majuscule_en_minuscule',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'What is the accent on the "e" in the word "élève" called?',
          options: ['L\'accent grave', 'L\'accent aigu', 'Le tréma', 'La cédille'],
          correctOptionIndex: 1,
          explanation: 'The accent (é) pointing up and to the right is "l\'accent aigu".',
        ),
        JSS1InteractiveExercise(
          prompt: 'What role does the cédille (ç) play in the word "français" ?',
          options: ['Makes "c" sound like /k/', 'Makes "c" sound like /s/', 'Makes the vowel silent', 'Double the letter'],
          correctOptionIndex: 1,
          explanation: 'A cédille turns a hard "c" into a soft /s/ sound before letters like a, o, and u.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Comment ça s\'écrit ?', english: 'How is that written / spelled?'),
            DrillPair(french: 'Ça s\'épèle...', english: 'It is spelled...'),
            DrillPair(french: 'L\'accent aigu (é)', english: 'Acute accent (e.g. école, élève)'),
            DrillPair(french: 'L\'accent grave (è, à, ù)', english: 'Grave accent (e.g. père, mère, où)'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (How is that written / spelled?):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Comment ça s\'écrit ?', 'Ça s\'épèle...', 'L\'accent aigu (é)', 'L\'accent grave (è, à, ù)'],
          correctWord: 'Comment ça s\'écrit ?',
          explanation: 'Correct! "Comment ça s\'écrit ?" translates to "How is that written / spelled?".',
        ),
        JSS1InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to polite formulas and authentic pronunciation is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to mastering French.',
        ),
        JSS1InteractiveExercise(
          prompt: 'What is the correct English translation for "Ça s\'épèle..."?',
          options: ['It is spelled...', 'How is that written / spelled?', 'Acute accent (e.g. école, élève)', 'Grave accent (e.g. père, mère, où)'],
          correctOptionIndex: 0,
          explanation: '"Ça s\'épèle..." translates to "It is spelled...".',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Comment épelle-t-on le mot "LIVRE" en français ?',
          answer: 'L - I - V - R - E (elle - ee - vay - air - uh)',
          hint: 'Spell each French letter aloud.',
        ),
        JSS1EvaluationQuestion(
          question: 'Quel accent trouve-t-on sur le mot "FÊTE" ?',
          answer: 'L\'accent circonflexe (^)',
          hint: 'Looks like a small triangle hat on top of the "e".',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Épellation & Orthographe',
          instruction: 'Spell your first name, surname, and your Nigerian state of origin letter-by-letter in French.',
          exampleResponse: 'O-B-I (O - Bé - I), L-A-G-O-S (Elle - A - Gé - O - Esse)',
        ),
      ],
      grammarNotes: [
        JSS1GrammarNote(
          title: 'The 5 French Accents',
          rule: 'É (aigu), È/À/Ù (grave), Ê/Â/Î/Ô/Û (circonflexe), Ç (cédille), Ï/Ë (tréma).',
          examples: [
            'École (accent aigu)',
            'Mère (accent grave)',
            'Hôtel (accent circonflexe)',
            'Garçon (cédille)',
            'Noël (tréma)',
          ],
        ),
      ],
    ),

    // ==========================================
    // WEEK 5: PRÉSENTER QUELQU’UN
    // ==========================================
    JSS1Lesson(
      term: 1,
      week: 5,
      topic: 'Présenter Quelqu’un (Introducing Someone Else)',
      subtitle: 'Introducing friends, classmates, and family members using "Voici...", "Il/Elle s\'appelle...", and third-person pronouns.',
      patternType: JSS1PatternType.presentOthersStudio,
      teachingStyle: TeachingStyle.conversationalDialogue,
      objectives: [
        'Introduce a third party using "Voici mon ami(e)..." or "C\'est..."',
        'State someone else\'s name, age, and nationality using 3rd person pronouns (Il / Elle).',
        'Apply correct gender concordance (Il est nigérian vs. Elle est nigériane).',
        'Introduce an adult or teacher with polite formula: "Je vous présente..."',
      ],
      culturalInsight:
          'Introducing friends and respecting elders is a cornerstone of Nigerian community values. In French, introducing an adult uses the respectful "Je vous présente M. / Mme...".',
      vocabItems: [
        JSS1VocabItem(
          french: 'Voici mon ami / mon amie',
          phonetics: 'vwah-see mohn ah-mee',
          english: 'Here is my friend (Boy / Girl)',
          usageNote: 'Pointing out and introducing a companion.',
          icon: Icons.person_add_alt_1_rounded,
          audioKey: 'voici_mon_ami',
        ),
        JSS1VocabItem(
          french: 'Il / Elle s\'appelle...',
          phonetics: 'eel / ell sah-pell',
          english: 'His / Her name is...',
          usageNote: 'Third person singular formulation.',
          icon: Icons.person_rounded,
          audioKey: 'il_elle_sappelle',
        ),
        JSS1VocabItem(
          french: 'Il a 13 ans / Elle a 12 ans.',
          phonetics: 'eel ah trehz ahn / ell ah dooz ahn',
          english: 'He is 13 / She is 12 years old.',
          usageNote: 'Third person age declaration using Avoir (a).',
          icon: Icons.cake_rounded,
          audioKey: 'il_a_treize_ans',
        ),
        JSS1VocabItem(
          french: 'Il est nigérian / Elle est nigériane.',
          phonetics: 'eel ay nee-zhay-ryahn / ell ay nee-zhay-ryenn',
          english: 'He is Nigerian / She is Nigerian.',
          usageNote: 'Third person nationality with gender agreement.',
          icon: Icons.flag_rounded,
          audioKey: 'il_est_nigerian',
        ),
        JSS1VocabItem(
          french: 'C\'est mon camarade de classe.',
          phonetics: 'say mohn kah-mah-rahd duh klahs',
          english: 'This is my classmate.',
          usageNote: 'Identifies a schoolmate.',
          icon: Icons.school_rounded,
          audioKey: 'cest_mon_camarade_de_classe',
        ),
        JSS1VocabItem(
          french: 'Je vous présente...',
          phonetics: 'zhuh voo pray-zahnt',
          english: 'I present to you... (Formal introduction)',
          usageNote: 'Polite formula used when introducing someone to an adult or class.',
          icon: Icons.record_voice_over_rounded,
          audioKey: 'je_vous_presente',
        ),
        JSS1VocabItem(
          french: 'Qui est-ce ?',
          phonetics: 'kee ess',
          english: 'Who is this / Who is that?',
          usageNote: 'Question to ask for someone\'s identity.',
          icon: Icons.help_center_rounded,
          audioKey: 'qui_est_ce',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'How do you introduce your female friend Fatima to the class?',
          options: ['Voici mon amie Fatima', 'Voici mon ami Fatima', 'Il s\'appelle Fatima', 'Je m\'appelle Fatima'],
          correctOptionIndex: 0,
          explanation: 'For a female friend, use the feminine form "mon amie".',
        ),
        JSS1InteractiveExercise(
          prompt: 'To say "He is 13 years old" in French, choose:',
          options: ['Il est 13 ans', 'Il a 13 ans', 'Elle a 13 ans', 'J\'ai 13 ans'],
          correctOptionIndex: 1,
          explanation: '"Il a 13 ans" correctly uses the third person masculine pronoun "Il" and the verb avoir "a".',
        ),
        JSS1InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Voici mon ami / mon amie', english: 'Here is my friend (Boy / Girl)'),
            DrillPair(french: 'Il / Elle s\'appelle...', english: 'His / Her name is...'),
            DrillPair(french: 'Il a 13 ans / Elle a 12 ans.', english: 'He is 13 / She is 12 years old.'),
            DrillPair(french: 'Il est nigérian / Elle est nigériane.', english: 'He is Nigerian / She is Nigerian.'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (Here is my friend (Boy / Girl)):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Voici mon ami / mon amie', 'Il / Elle s\'appelle...', 'Il a 13 ans / Elle a 12 ans.', 'Il est nigérian / Elle est nigériane.'],
          correctWord: 'Voici mon ami / mon amie',
          explanation: 'Correct! "Voici mon ami / mon amie" translates to "Here is my friend (Boy / Girl)".',
        ),
        JSS1InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to polite formulas and authentic pronunciation is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to mastering French.',
        ),
        JSS1InteractiveExercise(
          prompt: 'What is the correct English translation for "Il / Elle s\'appelle..."?',
          options: ['His / Her name is...', 'Here is my friend (Boy / Girl)', 'He is 13 / She is 12 years old.', 'He is Nigerian / She is Nigerian.'],
          correctOptionIndex: 0,
          explanation: '"Il / Elle s\'appelle..." translates to "His / Her name is...".',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "She is Nigerian" en français ?',
          answer: 'Elle est nigériane.',
          hint: 'Remember the feminine "e" on nigériane.',
        ),
        JSS1EvaluationQuestion(
          question: 'Quelle expression utilise-t-on pour demander "Who is this?" ?',
          answer: 'Qui est-ce ?',
          hint: 'Literally "Who is it?".',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Présentation Écrite',
          instruction: 'Write 4 sentences in French introducing your best friend in JSS1 (Name, Age, Class, City).',
          exampleResponse: 'Voici mon ami Chidi. Il s\'appelle Chidi. Il a 12 ans. Il est élève en JSS1. Il habite à Lagos.',
        ),
      ],
      grammarNotes: [
        JSS1GrammarNote(
          title: '3rd Person Pronouns: Il (He) & Elle (She)',
          rule: 'Il is masculine (Il s\'appelle, Il a, Il est). Elle is feminine (Elle s\'appelle, Elle a, Elle est).',
          examples: [
            'Il s\'appelle David. Il est nigérian.',
            'Elle s\'appelle Fatima. Elle est nigériane.',
          ],
        ),
      ],
    ),

    // ==========================================
    // WEEK 6: DÉCRIRE QUELQU’UN
    // ==========================================
    JSS1Lesson(
      term: 1,
      week: 6,
      topic: 'Décrire Quelqu’un (Describing Someone)',
      subtitle: 'Physical appearance (height, size, complexion) and moral character traits with adjective agreements.',
      patternType: JSS1PatternType.characterPortraitStudio,
      teachingStyle: TeachingStyle.storyNarrative,
      objectives: [
        'Describe physical stature: Grand(e), Petit(e), Mince, Gros(se).',
        'Describe facial and physical complexion: Teint clair, Teint noir, Beau/Belle.',
        'Express moral and intellectual qualities: Intelligent(e), Gentil(le), Travailleur/Travailleuse.',
        'Apply adjective gender agreement rules correctly (masculine vs. feminine endings).',
      ],
      culturalInsight:
          'Complimenting someone\'s work ethic ("travailleur/travailleuse") and kindness ("gentil/gentille") is highly valued in both Nigerian and Francophone school communities.',
      vocabItems: [
        JSS1VocabItem(
          french: 'Grand / Grande',
          phonetics: 'grahn / grahnd',
          english: 'Tall / Big (Masc / Fem)',
          usageNote: 'Physical stature adjective.',
          icon: Icons.height_rounded,
          audioKey: 'grand_grande',
        ),
        JSS1VocabItem(
          french: 'Petit / Petite',
          phonetics: 'puh-tee / puh-teet',
          english: 'Short / Small (Masc / Fem)',
          usageNote: 'Physical height adjective.',
          icon: Icons.vertical_align_bottom_rounded,
          audioKey: 'petit_petite',
        ),
        JSS1VocabItem(
          french: 'Mince / Gros / Grosse',
          phonetics: 'mans / groh / grohs',
          english: 'Slim / Big / Stout',
          usageNote: 'Physical build descriptors.',
          icon: Icons.accessibility_rounded,
          audioKey: 'mince_gros_grosse',
        ),
        JSS1VocabItem(
          french: 'Beau / Belle',
          phonetics: 'boh / bell',
          english: 'Handsome / Beautiful',
          usageNote: 'General aesthetic appearance.',
          icon: Icons.face_rounded,
          audioKey: 'beau_belle',
        ),
        JSS1VocabItem(
          french: 'Teint clair / Teint noir',
          phonetics: 'tan klehr / tan nwahr',
          english: 'Light complexion / Dark complexion',
          usageNote: 'Used for skin tone descriptions in West Africa.',
          icon: Icons.palette_rounded,
          audioKey: 'teint_clair_teint_noir',
        ),
        JSS1VocabItem(
          french: 'Intelligent / Intelligente',
          phonetics: 'an-tay-lee-zhahn / an-tay-lee-zhahnt',
          english: 'Intelligent / Smart (Masc / Fem)',
          usageNote: 'Praising cognitive ability.',
          icon: Icons.psychology_rounded,
          audioKey: 'intelligent_intelligente',
        ),
        JSS1VocabItem(
          french: 'Gentil / Gentille',
          phonetics: 'zhahn-tee / zhahn-teey',
          english: 'Kind / Gentle / Nice (Masc / Fem)',
          usageNote: 'Describes polite and caring behavior.',
          icon: Icons.volunteer_activism_rounded,
          audioKey: 'gentil_gentille',
        ),
        JSS1VocabItem(
          french: 'Travailleur / Travailleuse',
          phonetics: 'trah-vah-yur / trah-vah-yuhz',
          english: 'Hardworking (Masc / Fem)',
          usageNote: 'Describes dedicated, studious pupils.',
          icon: Icons.menu_book_rounded,
          audioKey: 'travailleur_travailleuse',
        ),
        JSS1VocabItem(
          french: 'Comment est-il / est-elle ?',
          phonetics: 'koh-mahn ay-teel / ay-tell',
          english: 'What is he / she like?',
          usageNote: 'Question to inquire about someone\'s appearance or character.',
          icon: Icons.search_rounded,
          audioKey: 'comment_est_il',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'How do you say "Amina is tall and intelligent" in French?',
          options: ['Amina est grand et intelligent', 'Amina est grande et intelligente', 'Amina a grand et intelligent', 'Amina est petit'],
          correctOptionIndex: 1,
          explanation: 'Both adjectives must agree with the feminine subject Amina: "grande et intelligente".',
        ),
        JSS1InteractiveExercise(
          prompt: 'The feminine form of the adjective "travailleur" (hardworking) is:',
          options: ['travailleure', 'travailleuse', 'travailleux', 'travail'],
          correctOptionIndex: 1,
          explanation: 'Adjectives ending in -eur in masculine generally become -euse in feminine.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Grand / Grande', english: 'Tall / Big (Masc / Fem)'),
            DrillPair(french: 'Petit / Petite', english: 'Short / Small (Masc / Fem)'),
            DrillPair(french: 'Mince / Gros / Grosse', english: 'Slim / Big / Stout'),
            DrillPair(french: 'Beau / Belle', english: 'Handsome / Beautiful'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (Tall / Big (Masc / Fem)):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Grand / Grande', 'Petit / Petite', 'Mince / Gros / Grosse', 'Beau / Belle'],
          correctWord: 'Grand / Grande',
          explanation: 'Correct! "Grand / Grande" translates to "Tall / Big (Masc / Fem)".',
        ),
        JSS1InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to polite formulas and authentic pronunciation is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to mastering French.',
        ),
        JSS1InteractiveExercise(
          prompt: 'What is the correct English translation for "Petit / Petite"?',
          options: ['Short / Small (Masc / Fem)', 'Tall / Big (Masc / Fem)', 'Slim / Big / Stout', 'Handsome / Beautiful'],
          correctOptionIndex: 0,
          explanation: '"Petit / Petite" translates to "Short / Small (Masc / Fem)".',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Quel est le féminin de l\'adjectif "beau" ?',
          answer: 'Belle',
          hint: 'Irregular feminine form.',
        ),
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "He is kind and hardworking" en français ?',
          answer: 'Il est gentil et travailleur.',
          hint: 'Uses the masculine forms of the adjectives.',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Portrait Écrit',
          instruction: 'Write a 4-line description of your French teacher or school principal in French.',
          exampleResponse: 'Mon professeur de français est grand. Il a le teint noir. Il est très intelligent, gentil et travailleur.',
        ),
      ],
      grammarNotes: [
        JSS1GrammarNote(
          title: 'Adjective Agreement (Accord des Adjectifs)',
          rule: 'In French, adjectives agree in gender (masculine/feminine) with the noun they describe. Usually, add -e to form the feminine.',
          examples: [
            'Grand ➔ Grande',
            'Intelligent ➔ Intelligente',
            'Gentil ➔ Gentille',
            'Travailleur ➔ Travailleuse',
          ],
        ),
      ],
    ),

    // ==========================================
    // WEEK 7: PARLER DE SES LOISIRS
    // ==========================================
    JSS1Lesson(
      term: 1,
      week: 7,
      topic: 'Parler de ses Loisirs (Hobbies & Leisure Activities)',
      subtitle: 'Expressing sports, pastimes, weekend activities using "Jouer à..." and "Faire de...".',
      patternType: JSS1PatternType.hobbiesAndLeisure,
      teachingStyle: TeachingStyle.interactiveStudio,
      objectives: [
        'Name common sports and pastimes in French (Le football, La musique, La lecture, Le vélo).',
        'Use the structure "Jouer à + sport/game" (Jouer au football, jouer aux jeux vidéo).',
        'Use the structure "Faire de + activity" (Faire du vélo, faire de la natation).',
        'Ask peers about their free-time hobbies: "Qu\'est-ce que tu fais pendant ton temps libre ?"',
      ],
      culturalInsight:
          'Football is the most popular sport across West Africa. In Francophone African countries like Senegal, Cameroon, and Ivory Coast, neighborhood street football ("le foot de rue") brings entire communities together.',
      vocabItems: [
        JSS1VocabItem(
          french: 'Jouer au football',
          phonetics: 'zhoo-ay oh foot-bohl',
          english: 'To play football / soccer',
          usageNote: 'Most popular team sport.',
          icon: Icons.sports_soccer_rounded,
          audioKey: 'jouer_au_football',
        ),
        JSS1VocabItem(
          french: 'Écouter de la musique',
          phonetics: 'ay-koo-tay duh lah moo-zeek',
          english: 'To listen to music (Afrobeats, Gospel, etc.)',
          usageNote: 'Auditory leisure activity.',
          icon: Icons.headphones_rounded,
          audioKey: 'ecouter_de_la_musique',
        ),
        JSS1VocabItem(
          french: 'Lire des livres / des romans',
          phonetics: 'leer day leevr / day roh-mahn',
          english: 'To read books / novels',
          usageNote: 'Literary hobby for quiet time.',
          icon: Icons.menu_book_rounded,
          audioKey: 'lire_des_livres',
        ),
        JSS1VocabItem(
          french: 'Regarder la télévision',
          phonetics: 'ruh-gar-day lah tay-lay-vee-zyohn',
          english: 'To watch television',
          usageNote: 'Screen leisure activity at home.',
          icon: Icons.tv_rounded,
          audioKey: 'regarder_la_television',
        ),
        JSS1VocabItem(
          french: 'Faire du vélo / Nager',
          phonetics: 'fair doo vay-loh / nah-zhay',
          english: 'To ride a bicycle / To swim',
          usageNote: 'Individual physical exercises.',
          icon: Icons.directions_bike_rounded,
          audioKey: 'faire_du_velo_nager',
        ),
        JSS1VocabItem(
          french: 'Dessiner et peindre',
          phonetics: 'day-see-nay ay pandr',
          english: 'To draw and paint',
          usageNote: 'Visual arts hobbies.',
          icon: Icons.palette_rounded,
          audioKey: 'dessiner_et_peindre',
        ),
        JSS1VocabItem(
          french: 'Chanter et danser',
          phonetics: 'shahn-tay ay dahn-say',
          english: 'To sing and dance',
          usageNote: 'Musical performance hobbies.',
          icon: Icons.music_note_rounded,
          audioKey: 'chanter_et_danser',
        ),
        JSS1VocabItem(
          french: 'Qu\'est-ce que tu fais pendant ton temps libre ?',
          phonetics: 'kess kuh too fay pahn-dahn tohn tahn leebr',
          english: 'What do you do in your free time?',
          usageNote: 'Open inquiry about hobbies.',
          icon: Icons.help_rounded,
          audioKey: 'quest_ce_que_tu_fais_temps_libre',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'Complete the sentence: "Pendant le week-end, j\'aime jouer ___ football."',
          options: ['du', 'au', 'à la', 'de la'],
          correctOptionIndex: 1,
          explanation: '"Jouer à + le football" contracts into "au football".',
        ),
        JSS1InteractiveExercise(
          prompt: 'Which hobby means "To ride a bicycle" in French?',
          options: ['Faire du vélo', 'Jouer au tennis', 'Regarder la télévision', 'Chanter'],
          correctOptionIndex: 0,
          explanation: '"Faire du vélo" translates to riding a bicycle.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Jouer au football', english: 'To play football / soccer'),
            DrillPair(french: 'Écouter de la musique', english: 'To listen to music (Afrobeats, Gospel, etc.)'),
            DrillPair(french: 'Lire des livres / des romans', english: 'To read books / novels'),
            DrillPair(french: 'Regarder la télévision', english: 'To watch television'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (To play football / soccer):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Jouer au football', 'Écouter de la musique', 'Lire des livres / des romans', 'Regarder la télévision'],
          correctWord: 'Jouer au football',
          explanation: 'Correct! "Jouer au football" translates to "To play football / soccer".',
        ),
        JSS1InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to polite formulas and authentic pronunciation is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to mastering French.',
        ),
        JSS1InteractiveExercise(
          prompt: 'What is the correct English translation for "Écouter de la musique"?',
          options: ['To listen to music (Afrobeats, Gospel, etc.)', 'To play football / soccer', 'To read books / novels', 'To watch television'],
          correctOptionIndex: 0,
          explanation: '"Écouter de la musique" translates to "To listen to music (Afrobeats, Gospel, etc.)".',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "I like to listen to music" en français ?',
          answer: 'J\'aime écouter de la musique.',
          hint: 'Uses the verb aimer + infinitive écouter.',
        ),
        JSS1EvaluationQuestion(
          question: 'Quelle est la préposition utilisée avec le verbe JOUER pour un jeu/sport ?',
          answer: 'La préposition "À" (au, à la, aux)',
          hint: 'Jouer à...',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Mon Emploi du Temps des Loisirs',
          instruction: 'List 3 activities you do on Saturday and Sunday in French.',
          exampleResponse: 'Le samedi, je joue au football avec mes amis. Le dimanche, j\'écoute de la musique et je lis des livres.',
        ),
      ],
      grammarNotes: [
        JSS1GrammarNote(
          title: 'Jouer à vs. Faire de',
          rule: 'Use JOUER + À for ball games, team sports, and board games (Jouer au football). Use FAIRE + DE for individual sports and general physical activities (Faire du vélo, faire de la natation).',
          examples: [
            'Jouer + à + le ➔ Jouer au football',
            'Faire + de + le ➔ Faire du vélo',
          ],
        ),
      ],
    ),

    // ==========================================
    // WEEK 8: EXPRIMER SES GOÛTS ET PRÉFÉRENCES
    // ==========================================
    JSS1Lesson(
      term: 1,
      week: 8,
      topic: 'Exprimer ses Goûts et Préférences (Likes & Preferences)',
      subtitle: 'Expressing positive and negative preferences: J\'adore, J\'aime, Je préfère, Je n\'aime pas, Je déteste.',
      patternType: JSS1PatternType.tastesAndPreferences,
      teachingStyle: TeachingStyle.conversationalDialogue,
      objectives: [
        'Express strong liking using "J\'adore..."',
        'Express moderate liking using "J\'aime beaucoup..."',
        'Express preference between two items using "Je préfère [A] à [B]"',
        'Express dislike and hatred using negation: "Je n\'aime pas..." and "Je déteste..."',
        'Justify preferences using "Parce que c\'est..." (Because it is...)',
      ],
      culturalInsight:
          'In French conversation, expressing strong enthusiasm with "J\'adore !" is very common. Justifying with "Parce que..." allows students to participate actively in debates.',
      vocabItems: [
        JSS1VocabItem(
          french: 'J\'adore !',
          phonetics: 'zhah-dor',
          english: 'I love / adore! (5/5 Stars)',
          usageNote: 'Highest level of enthusiastic appreciation.',
          icon: Icons.star_rounded,
          audioKey: 'jadore',
        ),
        JSS1VocabItem(
          french: 'J\'aime beaucoup...',
          phonetics: 'zhem boh-koo',
          english: 'I like very much... (4/5 Stars)',
          usageNote: 'Positive appreciation of a subject, food, or activity.',
          icon: Icons.thumb_up_alt_rounded,
          audioKey: 'jaime_beaucoup',
        ),
        JSS1VocabItem(
          french: 'Je préfère...',
          phonetics: 'zhuh pray-fehr',
          english: 'I prefer... (Comparison)',
          usageNote: 'Used to state a preference between options.',
          icon: Icons.compare_arrows_rounded,
          audioKey: 'je_prefere',
        ),
        JSS1VocabItem(
          french: 'Je n\'aime pas...',
          phonetics: 'zhuh nem pah',
          english: 'I do not like... (Negation)',
          usageNote: 'Standard negative preference using ne...pas.',
          icon: Icons.thumb_down_alt_rounded,
          audioKey: 'je_naime_pas',
        ),
        JSS1VocabItem(
          french: 'Je déteste !',
          phonetics: 'zhuh day-test',
          english: 'I hate / detest! (0/5 Stars)',
          usageNote: 'Strong rejection or dislike.',
          icon: Icons.sentiment_very_dissatisfied_rounded,
          audioKey: 'je_deteste',
        ),
        JSS1VocabItem(
          french: 'Pourquoi ? — Parce que...',
          phonetics: 'poor-kwah — parss kuh',
          english: 'Why? — Because...',
          usageNote: 'Asking and giving rationales for tastes.',
          icon: Icons.live_help_rounded,
          audioKey: 'pourquoi_parce_que',
        ),
        JSS1VocabItem(
          french: 'C\'est délicieux / intéressant / amusant',
          phonetics: 'say day-lee-syuh / an-tay-reh-sahn / ah-moo-zahn',
          english: 'It is delicious / interesting / fun',
          usageNote: 'Adjectives commonly used to justify opinions.',
          icon: Icons.emoji_emotions_rounded,
          audioKey: 'cest_delicieux_interessant',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'How do you say "I prefer French to Mathematics" in French?',
          options: [
            'J\'aime le français et les mathématiques',
            'Je préfère le français aux mathématiques',
            'Je déteste le français',
            'Je n\'aime pas les mathématiques'
          ],
          correctOptionIndex: 1,
          explanation: '"Je préfère [A] à [B]" is the proper comparative structure.',
        ),
        JSS1InteractiveExercise(
          prompt: 'To turn "J\'aime le riz" into the negative "I do not like rice", write:',
          options: ['Je n\'aime pas le riz', 'J\'aime pas de riz', 'Je ne riz pas', 'Je déteste de riz'],
          correctOptionIndex: 0,
          explanation: 'Negation wraps the verb: "ne + aime (n\'aime) + pas".',
        ),
        JSS1InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'J\'adore !', english: 'I love / adore! (5/5 Stars)'),
            DrillPair(french: 'J\'aime beaucoup...', english: 'I like very much... (4/5 Stars)'),
            DrillPair(french: 'Je préfère...', english: 'I prefer... (Comparison)'),
            DrillPair(french: 'Je n\'aime pas...', english: 'I do not like... (Negation)'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (I love / adore! (5/5 Stars)):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['J\'adore !', 'J\'aime beaucoup...', 'Je préfère...', 'Je n\'aime pas...'],
          correctWord: 'J\'adore !',
          explanation: 'Correct! "J\'adore !" translates to "I love / adore! (5/5 Stars)".',
        ),
        JSS1InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to polite formulas and authentic pronunciation is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to mastering French.',
        ),
        JSS1InteractiveExercise(
          prompt: 'What is the correct English translation for "J\'aime beaucoup..."?',
          options: ['I like very much... (4/5 Stars)', 'I love / adore! (5/5 Stars)', 'I prefer... (Comparison)', 'I do not like... (Negation)'],
          correctOptionIndex: 0,
          explanation: '"J\'aime beaucoup..." translates to "I like very much... (4/5 Stars)".',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "I love French because it is interesting" en français ?',
          answer: 'J\'adore le français parce que c\'est intéressant.',
          hint: 'Use J\'adore + parce que c\'est...',
        ),
        JSS1EvaluationQuestion(
          question: 'Quelle est la formule française pour demander "Why?" ?',
          answer: 'Pourquoi ?',
          hint: 'One word starting with Pour...',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Mes Goûts Personnels',
          instruction: 'Write 4 sentences in your notebook: 1 thing you love (J\'adore), 1 thing you like (J\'aime), 1 thing you prefer (Je préfère), and 1 thing you hate (Je déteste).',
          exampleResponse: 'J\'adore le français. J\'aime le football. Je préfère le riz au fufu. Je déteste le mensonge.',
        ),
      ],
      grammarNotes: [
        JSS1GrammarNote(
          title: 'French Negation: Ne... Pas',
          rule: 'Wrap the conjugated verb with "ne" (or "n\'" before vowels) and "pas".',
          examples: [
            'J\'aime ➔ Je n\'aime pas',
            'Je parle ➔ Je ne parle pas',
            'Il est ➔ Il n\'est pas',
          ],
        ),
      ],
    ),

    // ==========================================
    // WEEK 9: RÉVISION GÉNÉRALE DU PREMIER TRIMESTRE
    // ==========================================
    JSS1Lesson(
      term: 1,
      week: 9,
      topic: 'Révision Générale du Premier Trimestre (Term 1 Grand Revision Rally)',
      subtitle: 'Comprehensive synthesis and interactive speed rally across all 8 instructional topics taught in the term.',
      patternType: JSS1PatternType.term1RevisionRally,
      teachingStyle: TeachingStyle.interactiveStudio,
      objectives: [
        'Consolidate mastery of all classroom directives and polite expressions.',
        'Review formal and informal greetings and parting formulas.',
        'Perfect self-introduction and third-person introduction profiles.',
        'Master the French alphabet, accents, descriptions, hobbies, and preference scales.',
      ],
      culturalInsight:
          'End-of-term revision games build teamwork and collective confidence. In Nigerian secondary schools, class rallies inspire healthy academic competition and reinforce long-term memory.',
      vocabItems: [
        JSS1VocabItem(
          french: 'Le grand rallye de révision',
          phonetics: 'luh grahn rah-lee duh ray-vee-zyohn',
          english: 'The grand revision rally',
          usageNote: 'Theme of the comprehensive review station.',
          icon: Icons.sports_score_rounded,
          audioKey: 'grand_rallye_revision',
        ),
        JSS1VocabItem(
          french: 'Êtes-vous prêts ? — Oui, nous sommes prêts !',
          phonetics: 'eht voo pray — wee noo sohm pray',
          english: 'Are you ready? — Yes, we are ready!',
          usageNote: 'Call-and-response rally challenge prompt.',
          icon: Icons.campaign_rounded,
          audioKey: 'etes_vous_prets',
        ),
        JSS1VocabItem(
          french: 'Félicitations pour vos efforts !',
          phonetics: 'fay-lee-see-tah-syohn poor voh zay-for',
          english: 'Congratulations on your efforts!',
          usageNote: 'Encouraging praise for term completion.',
          icon: Icons.emoji_events_rounded,
          audioKey: 'felicitations_pour_vos_efforts',
        ),
        JSS1VocabItem(
          french: 'Champion de la classe !',
          phonetics: 'shahm-pyohn duh lah klahs',
          english: 'Class champion!',
          usageNote: 'Title for top participating team or student.',
          icon: Icons.military_tech_rounded,
          audioKey: 'champion_de_la_classe',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'Which phrase is used to introduce someone else to your teacher?',
          options: ['Je m\'appelle Tunde', 'Je vous présente mon ami', 'Puis-je sortir ?', 'Fermez vos cahiers'],
          correctOptionIndex: 1,
          explanation: '"Je vous présente..." is the polite formula for introducing a third person.',
        ),
        JSS1InteractiveExercise(
          prompt: 'Which verb is used in French to give one\'s age?',
          options: ['Être', 'Avoir', 'Faire', 'Aller'],
          correctOptionIndex: 1,
          explanation: 'Age uses the verb Avoir: "J\'ai 12 ans".',
        ),
        JSS1InteractiveExercise(
          prompt: 'What accent is on the "e" in "fête" ?',
          options: ['Accent aigu', 'Accent grave', 'Accent circonflexe', 'Tréma'],
          correctOptionIndex: 2,
          explanation: 'The circumflex (^) looks like a small hat on the vowel.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Le grand rallye de révision', english: 'The grand revision rally'),
            DrillPair(french: 'Êtes-vous prêts ? — Oui, nous sommes prêts !', english: 'Are you ready? — Yes, we are ready!'),
            DrillPair(french: 'Félicitations pour vos efforts !', english: 'Congratulations on your efforts!'),
            DrillPair(french: 'Champion de la classe !', english: 'Class champion!'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        JSS1InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (The grand revision rally):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Le grand rallye de révision', 'Êtes-vous prêts ? — Oui, nous sommes prêts !', 'Félicitations pour vos efforts !', 'Champion de la classe !'],
          correctWord: 'Le grand rallye de révision',
          explanation: 'Correct! "Le grand rallye de révision" translates to "The grand revision rally".',
        ),
        JSS1InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to polite formulas and authentic pronunciation is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to mastering French.',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Donnez 3 ordres de classe en français.',
          answer: 'Levez-vous, Asseyez-vous, Ouvrez vos livres.',
          hint: 'Review Week 1 vocabulary.',
        ),
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "I live in Lagos and I am Nigerian" en français ?',
          answer: 'J\'habite à Lagos et je suis nigérian(e).',
          hint: 'Review Week 3 self-introduction.',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Bilan de Révision',
          instruction: 'Write a full 6-sentence paragraph in French combining all topics (Greeting, Name, Age, Nationality, Physical/Character traits, and Favorite Hobby).',
          exampleResponse: 'Bonjour ! Je m\'appelle Emeka. J\'ai 12 ans et je suis nigérian. Je suis grand, intelligent et travailleur. Pendant mon temps libre, j\'adore jouer au football avec mes camarades de classe.',
        ),
      ],
      grammarNotes: [
        JSS1GrammarNote(
          title: 'Term 1 Core Grammar Summary',
          rule: '1. Imperative (-ez for vous).\n2. Subject pronouns (Je, Tu, Il, Elle, Vous, Nous).\n3. Verbs: S\'appeler, Avoir, Être, Habiter, Aimer, Jouer à, Faire de.\n4. Negation: Ne... pas.\n5. Adjective agreements (masculine vs. feminine).',
          examples: [
            'Je m\'appelle / Il s\'appelle',
            'J\'ai 12 ans / Il a 13 ans',
            'Je suis grand / Elle est grande',
            'J\'aime le football / Je n\'aime pas le bruit',
          ],
        ),
      ],
    ),
  ];
}
