import 'package:flutter/material.dart';
import '../models/p5_lesson_model.dart';

class P5Term1Lessons {
  static const List<P5Lesson> weeks = [
    // ==========================================
    // WEEK 1: RÉVISION - SALUTATIONS & ALPHABET
    // ==========================================
    P5Lesson(
      term: 1,
      week: 1,
      topic: "Révision - Les Salutations et l'Alphabet",
      subtitle: 'Welcome to Primary 5 French! Greetings, Alphabet Sounds & 1–20 Recap',
      patternType: P5PatternType.alphabetAndRevision,
      objectives: [
        'Recite the French alphabet with authentic French vowel and consonant sounds.',
        'Exchange appropriate greetings for different times of the day and situations.',
        'Count reliably from 1 to 20 in French without hesitation.',
        'Introduce yourself confidently stating name, age, and nationality.',
      ],
      culturalInsight:
          'In France and Francophone West Africa, greetings are an essential mark of respect. You must always say "Bonjour" before asking any question or beginning any transaction!',
      vocabItems: [
        P5VocabItem(
          french: 'Bonjour',
          phonetics: 'bohn-zhoor',
          english: 'Good morning / Hello',
          usageNote: 'Polite daytime greeting used with teachers, elders, and peers.',
          icon: Icons.wb_sunny_rounded,
          audioKey: 'bonjour',
        ),
        P5VocabItem(
          french: 'Bonsoir',
          phonetics: 'bohn-swahr',
          english: 'Good evening',
          usageNote: 'Used from late afternoon until nightfall.',
          icon: Icons.nightlight_round,
          audioKey: 'bonsoir',
        ),
        P5VocabItem(
          french: 'Salut !',
          phonetics: 'sah-loo',
          english: 'Hi / Bye (Informal)',
          usageNote: 'Casual greeting among classmates and close friends.',
          icon: Icons.waving_hand_rounded,
          audioKey: 'salut',
        ),
        P5VocabItem(
          french: 'Au revoir',
          phonetics: 'oh ruh-vwahr',
          english: 'Goodbye',
          usageNote: 'Standard polite departure expression.',
          icon: Icons.door_back_door_rounded,
          audioKey: 'au_revoir',
        ),
        P5VocabItem(
          french: 'Comment ça va ?',
          phonetics: 'koh-mahn sah vah',
          english: 'How are you?',
          usageNote: 'Friendly inquiry on well-being.',
          icon: Icons.sentiment_satisfied_alt_rounded,
          audioKey: 'comment_ca_va',
        ),
        P5VocabItem(
          french: 'Ça va très bien, merci !',
          phonetics: 'sah vah tray byan mair-see',
          english: 'I am doing very well, thank you!',
          usageNote: 'Polite, cheerful response.',
          icon: Icons.thumb_up_rounded,
          audioKey: 'ca_va_tres_bien_merci',
        ),
        P5VocabItem(
          french: 'Je m\'appelle...',
          phonetics: 'zhuh mah-pell',
          english: 'My name is...',
          usageNote: 'Used to state your full name.',
          icon: Icons.badge_rounded,
          audioKey: 'je_mappelle',
        ),
        P5VocabItem(
          french: 'J\'ai dix ans.',
          phonetics: 'zhay dees ahn',
          english: 'I am ten years old.',
          usageNote: 'Stating your age using the verb avoir.',
          icon: Icons.cake_rounded,
          audioKey: 'jai_dix_ans',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'Which greeting is used when arriving at school at 8:00 AM?',
          options: ['Bonsoir !', 'Bonjour !', 'Bonne nuit !', 'Au revoir !'],
          correctOptionIndex: 1,
          explanation: '"Bonjour" is the proper greeting from morning until late afternoon.',
        ),
        P5InteractiveExercise(
          prompt: 'How do you say "My name is" in French?',
          options: ['J\'ai...', 'Je suis...', 'Je m\'appelle...', 'Voici...'],
          correctOptionIndex: 2,
          explanation: '"Je m\'appelle" literally means "I call myself" and is used to state your name.',
        ),
        P5InteractiveExercise(
          prompt: 'What French number comes immediately after "Dix-neuf" (19)?',
          options: ['Dix-huit (18)', 'Vingt (20)', 'Seize (16)', 'Quinze (15)'],
          correctOptionIndex: 1,
          explanation: '19 is Dix-neuf, and 20 is Vingt.',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Recite your full introduction in French: Greeting, Name, and Age.',
          answer: 'Bonjour ! Je m\'appelle [Nom]. J\'ai dix ans.',
          hint: 'Start with Bonjour, then Je m\'appelle, then J\'ai... ans.',
        ),
        P5EvaluationQuestion(
          question: 'What is the phonetic sound of the letter "E" in the French alphabet?',
          answer: '"Euh" (sounds like the \'u\' in \'up\').',
          hint: 'Purse lips lightly and say euh.',
        ),
        P5EvaluationQuestion(
          question: 'Count out loud in French from 11 to 20.',
          answer: 'Onze, douze, treize, quatorze, quinze, seize, dix-sept, dix-huit, dix-neuf, vingt.',
          hint: 'Recite 11-20 series.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Spelling & Oral Practice',
          instruction: 'Practice spelling your first name in French letter by letter to a partner at home.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Alphabet & Self-Introduction Essentials',
        explanation:
            'In French, the letter names are pronounced as distinct vowels (A = ah, E = euh, I = ee, O = oh, U = ew). When stating age, French uses "J\'ai ... ans" (I have ... years), never "Je suis ...".',
        examples: [
          'Je m\'appelle Chinedu. (My name is Chinedu.)',
          'J\'ai dix ans. (I am 10 years old.)',
          'Comment vous appelez-vous ? (What is your name? - Formal)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 2: COMPTER DE 21 À 60 (PART I: 21–30)
    // ==========================================
    P5Lesson(
      term: 1,
      week: 2,
      topic: 'Compter de 21 à 60 (Partie I: 21–30)',
      subtitle: 'Mastering Numbers 21 to 30, Addition, Subtraction & Asking "Combien ?"',
      patternType: P5PatternType.numberStudio21to30,
      objectives: [
        'Count, pronounce, and write numbers from 21 to 30 in French correctly.',
        'Understand the hyphenation and conjunction rule for "vingt et un" vs "vingt-deux".',
        'Solve and state simple addition operations in French using "plus" and "font".',
        'Ask and answer quantity questions using "Combien de... ?".',
      ],
      culturalInsight:
          'In French numbers, 21 is written as "vingt et un" (twenty and one) with the word "et", while 22 to 29 use a hyphen (trait d\'union), such as "vingt-deux" and "vingt-trois"!',
      vocabItems: [
        P5VocabItem(
          french: 'Vingt et un (21)',
          phonetics: 'van-tay-uhn',
          english: 'Twenty-one (21)',
          usageNote: 'Notice the connector "et".',
          icon: Icons.looks_one_rounded,
          audioKey: 'num_21',
        ),
        P5VocabItem(
          french: 'Vingt-deux (22)',
          phonetics: 'van-duh',
          english: 'Twenty-two (22)',
          usageNote: 'Joined with a hyphen.',
          icon: Icons.looks_two_rounded,
          audioKey: 'num_22',
        ),
        P5VocabItem(
          french: 'Vingt-trois (23)',
          phonetics: 'van-twah',
          english: 'Twenty-three (23)',
          usageNote: 'Hyphenated tens and units.',
          icon: Icons.looks_3_rounded,
          audioKey: 'num_23',
        ),
        P5VocabItem(
          french: 'Vingt-cinq (25)',
          phonetics: 'van-sank',
          english: 'Twenty-five (25)',
          usageNote: 'Quarter century milestone number.',
          icon: Icons.looks_5_rounded,
          audioKey: 'num_25',
        ),
        P5VocabItem(
          french: 'Trente (30)',
          phonetics: 'trahnt',
          english: 'Thirty (30)',
          usageNote: 'The new base ten number.',
          icon: Icons.circle_rounded,
          audioKey: 'num_30',
        ),
        P5VocabItem(
          french: 'Combien ?',
          phonetics: 'kohm-byan',
          english: 'How many? / How much?',
          usageNote: 'Question word for counting and pricing.',
          icon: Icons.help_outline_rounded,
          audioKey: 'combien',
        ),
        P5VocabItem(
          french: 'Plus / Moins',
          phonetics: 'ploo / mwan',
          english: 'Plus / Minus',
          usageNote: 'Arithmetic operation operators in French.',
          icon: Icons.calculate_rounded,
          audioKey: 'plus_moins',
        ),
        P5VocabItem(
          french: 'Font (égale)',
          phonetics: 'fohn',
          english: 'Makes / Equals',
          usageNote: 'Used in math equations: Vingt plus cinq font vingt-cinq.',
          icon: Icons.drag_handle_rounded,
          audioKey: 'font_egale',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'How is the number 21 correctly written in French?',
          options: ['Vingt-un', 'Vingt et un', 'Vingt-et-un', 'Un-vingt'],
          correctOptionIndex: 1,
          explanation: 'In French, 21 uses the conjunction "et": "Vingt et un".',
        ),
        P5InteractiveExercise(
          prompt: 'Calculate in French: Vingt plus cinq font... ?',
          options: ['Vingt-trois (23)', 'Vingt-cinq (25)', 'Trente (30)', 'Vingt et un (21)'],
          correctOptionIndex: 1,
          explanation: '20 + 5 = 25 (Vingt plus cinq font vingt-cinq).',
        ),
        P5InteractiveExercise(
          prompt: 'Which French question asks "How many pencils do you have?"',
          options: [
            'Où sont les crayons ?',
            'Combien de crayons as-tu ?',
            'Comment s\'appellent les crayons ?',
            'Quel âge ont les crayons ?'
          ],
          correctOptionIndex: 1,
          explanation: '"Combien de crayons as-tu ?" translates directly to "How many pencils do you have?".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Count out loud in French from 21 to 30.',
          answer: 'Vingt et un, vingt-deux, vingt-trois, vingt-quatre, vingt-cinq, vingt-six, vingt-sept, vingt-huit, vingt-neuf, trente.',
          hint: 'Vingt et un... up to Trente.',
        ),
        P5EvaluationQuestion(
          question: 'Say this math equation in French: 20 + 8 = 28.',
          answer: 'Vingt plus huit font vingt-huit.',
          hint: 'Vingt plus huit font...',
        ),
        P5EvaluationQuestion(
          question: 'Translate to English: "Combien de livres y a-t-il ?"',
          answer: 'How many books are there?',
          hint: 'Combien means How many.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Math in French',
          instruction: 'Write out the French words for numbers 21 to 30 in your exercise book and create 3 addition sums.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Number Formation Rules (21–29)',
        explanation:
            'The number 21 always uses "et un" (Vingt et un). From 22 onwards (22 to 29), numbers are joined with a hyphen: vingt-deux, vingt-trois, vingt-quatre, vingt-cinq, vingt-six, vingt-sept, vingt-huit, vingt-neuf.',
        examples: [
          '21 = Vingt et un',
          '24 = Vingt-quatre',
          '30 = Trente',
          'Vingt plus dix font trente. (20 + 10 = 30)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 3: COMPTER DE 21 À 60 (PART II: 31–50)
    // ==========================================
    P5Lesson(
      term: 1,
      week: 3,
      topic: 'Compter de 21 à 60 (Partie II: 31–50)',
      subtitle: 'Numbers 31 to 50, Phone Numbers, Asking Prices & Store Purchases',
      patternType: P5PatternType.numberStudio31to50,
      objectives: [
        'Count, spell, and recognize numbers from 31 to 50 in French.',
        'Apply the tens pattern for Trente (30), Quarante (40), and Cinquante (50).',
        'State and ask prices of school items in Naira using "Combien coûte... ?".',
        'Read out Nigerian telephone numbers digit-by-digit in French.',
      ],
      culturalInsight:
          'In Francophone African markets and shops, negotiating and inquiring politely with "S\'il vous plaît, combien coûte ceci ?" is part of daily life. Prices and phone numbers are spoken clearly in tens and pairs!',
      vocabItems: [
        P5VocabItem(
          french: 'Trente et un (31)',
          phonetics: 'trahnt-ay-uhn',
          english: 'Thirty-one (31)',
          usageNote: 'Follows the "et un" rule for tens + 1.',
          icon: Icons.filter_1_rounded,
          audioKey: 'num_31',
        ),
        P5VocabItem(
          french: 'Trente-cinq (35)',
          phonetics: 'trahnt-sank',
          english: 'Thirty-five (35)',
          usageNote: 'Halfway between 30 and 40.',
          icon: Icons.filter_5_rounded,
          audioKey: 'num_35',
        ),
        P5VocabItem(
          french: 'Quarante (40)',
          phonetics: 'kah-rahnt',
          english: 'Forty (40)',
          usageNote: 'The new base ten number for 40.',
          icon: Icons.filter_4_rounded,
          audioKey: 'num_40',
        ),
        P5VocabItem(
          french: 'Quarante et un (41)',
          phonetics: 'kah-rahnt-ay-uhn',
          english: 'Forty-one (41)',
          usageNote: 'Tens plus one connector rule.',
          icon: Icons.filter_4_rounded,
          audioKey: 'num_41',
        ),
        P5VocabItem(
          french: 'Quarante-huit (48)',
          phonetics: 'kah-rahnt-weet',
          english: 'Forty-eight (48)',
          usageNote: 'Hyphenated combination.',
          icon: Icons.filter_8_rounded,
          audioKey: 'num_48',
        ),
        P5VocabItem(
          french: 'Cinquante (50)',
          phonetics: 'sank-ahnt',
          english: 'Fifty (50)',
          usageNote: 'Base fifty milestone.',
          icon: Icons.filter_5_rounded,
          audioKey: 'num_50',
        ),
        P5VocabItem(
          french: 'Combien coûte... ?',
          phonetics: 'kohm-byan koot',
          english: 'How much does ... cost?',
          usageNote: 'Essential phrase for shopping and market purchases.',
          icon: Icons.shopping_cart_rounded,
          audioKey: 'combien_coute',
        ),
        P5VocabItem(
          french: 'Le numéro de téléphone',
          phonetics: 'luh noo-may-roh duh tay-lay-fohn',
          english: 'The telephone number',
          usageNote: 'Recited digit-by-digit or in pairs.',
          icon: Icons.phone_rounded,
          audioKey: 'le_numero_de_telephone',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What is the French word for the number 40?',
          options: ['Trente', 'Quarante', 'Cinquante', 'Soixante'],
          correctOptionIndex: 1,
          explanation: '40 is "Quarante" in French.',
        ),
        P5InteractiveExercise(
          prompt: 'How do you ask the price of an exercise book in French?',
          options: [
            'Combien coûte le cahier ?',
            'Où est le cahier ?',
            'Quel est le nom du cahier ?',
            'Qui a le cahier ?'
          ],
          correctOptionIndex: 0,
          explanation: '"Combien coûte le cahier ?" means "How much does the notebook cost?".',
        ),
        P5InteractiveExercise(
          prompt: 'What is the result of "Trente plus quinze font... ?"',
          options: ['Quarante (40)', 'Quarante-cinq (45)', 'Cinquante (50)', 'Trente-cinq (35)'],
          correctOptionIndex: 1,
          explanation: '30 + 15 = 45 (Quarante-cinq).',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Say the numbers 30, 40, and 50 in French.',
          answer: 'Trente (30), Quarante (40), Cinquante (50).',
          hint: 'Tens from 30 to 50.',
        ),
        P5EvaluationQuestion(
          question: 'Translate: "Le livre coûte cinquante Naira."',
          answer: 'The book costs fifty Naira.',
          hint: 'Le livre = the book, cinquante = 50.',
        ),
        P5EvaluationQuestion(
          question: 'Read these digits in French: 0 - 8 - 0 - 3 - 4 - 5.',
          answer: 'Zéro, huit, zéro, trois, quatre, cinq.',
          hint: 'Digit by digit pronunciation.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Market Dialogue',
          instruction: 'Write a short 3-line dialogue asking the price of a pen ("le stylo") costing 35 Naira.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Asking Prices with "Combien coûte"',
        explanation:
            'To ask how much a single item costs, use "Combien coûte [l\'objet] ?". For plural items, use "Combien coûtent [les objets] ?". To reply, state "[L\'objet] coûte [nombre] Naira."',
        examples: [
          'Combien coûte le stylo ? (How much is the pen?)',
          'Le stylo coûte quarante Naira. (The pen costs 40 Naira.)',
          'Combien coûte la règle ? (How much is the ruler?)',
          'Elle coûte trente Naira. (It costs 30 Naira.)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 4: COMPTER DE 21 À 60 (PART III: 51–60)
    // ==========================================
    P5Lesson(
      term: 1,
      week: 4,
      topic: 'Compter de 21 à 60 (Partie III: 51–60)',
      subtitle: 'Numbers 51 to 60, Complete Tens Mastery (10–60) & Mental Arithmetic',
      patternType: P5PatternType.numberStudio51to60,
      objectives: [
        'Count, write, and identify numbers from 51 to 60 with complete confidence.',
        'Recite all base tens from 10 to 60 smoothly: Dix, Vingt, Trente, Quarante, Cinquante, Soixante.',
        'Perform mental subtraction and addition problems in French.',
        'Transcribe spoken French numbers 1 to 60 during dictation exercises.',
      ],
      culturalInsight:
          'The number 60 is "Soixante" (pronounced swah-sahnt). In the French numbering system, 60 is the pinnacle of the base-10 sequence before the compound counting series begins in higher classes!',
      vocabItems: [
        P5VocabItem(
          french: 'Cinquante et un (51)',
          phonetics: 'sank-ahnt-ay-uhn',
          english: 'Fifty-one (51)',
          usageNote: 'Tens plus one connector rule.',
          icon: Icons.pin_rounded,
          audioKey: 'num_51',
        ),
        P5VocabItem(
          french: 'Cinquante-cinq (55)',
          phonetics: 'sank-ahnt-sank',
          english: 'Fifty-five (55)',
          usageNote: 'Double five sequence.',
          icon: Icons.pin_rounded,
          audioKey: 'num_55',
        ),
        P5VocabItem(
          french: 'Cinquante-neuf (59)',
          phonetics: 'sank-ahnt-nuhf',
          english: 'Fifty-nine (59)',
          usageNote: 'Last number in the fifties.',
          icon: Icons.pin_rounded,
          audioKey: 'num_59',
        ),
        P5VocabItem(
          french: 'Soixante (60)',
          phonetics: 'swah-sahnt',
          english: 'Sixty (60)',
          usageNote: 'The milestone ten for Primary 5.',
          icon: Icons.stars_rounded,
          audioKey: 'num_60',
        ),
        P5VocabItem(
          french: 'Dix, Vingt, Trente',
          phonetics: 'dees, van, trahnt',
          english: '10, 20, 30',
          usageNote: 'First half of tens sequence.',
          icon: Icons.format_list_numbered_rounded,
          audioKey: 'tens_10_20_30',
        ),
        P5VocabItem(
          french: 'Quarante, Cinquante, Soixante',
          phonetics: 'kah-rahnt, sank-ahnt, swah-sahnt',
          english: '40, 50, 60',
          usageNote: 'Second half of tens sequence.',
          icon: Icons.format_list_numbered_rounded,
          audioKey: 'tens_40_50_60',
        ),
        P5VocabItem(
          french: 'Moins',
          phonetics: 'mwan',
          english: 'Minus / Subtract',
          usageNote: 'Mathematical subtraction word: Soixante moins dix font cinquante.',
          icon: Icons.remove_circle_outline_rounded,
          audioKey: 'moins',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What is the correct French pronunciation spelling for 60?',
          options: ['Cinquante', 'Soixante', 'Seize', 'Cent'],
          correctOptionIndex: 1,
          explanation: '60 is "Soixante" (pronounced swah-sahnt).',
        ),
        P5InteractiveExercise(
          prompt: 'Calculate in French: Soixante moins dix font... ?',
          options: ['Quarante (40)', 'Cinquante (50)', 'Trente (30)', 'Vingt (20)'],
          correctOptionIndex: 1,
          explanation: '60 - 10 = 50 (Soixante moins dix font cinquante).',
        ),
        P5InteractiveExercise(
          prompt: 'Which series represents the complete tens from 10 to 60?',
          options: [
            'Un, Deux, Trois, Quatre, Cinq, Six',
            'Dix, Vingt, Trente, Quarante, Cinquante, Soixante',
            'Onze, Douze, Treize, Quatorze, Quinze, Seize',
            'Vingt, Vingt-cinq, Trente, Trente-cinq, Quarante, Soixante'
          ],
          correctOptionIndex: 1,
          explanation: 'Dix (10), Vingt (20), Trente (30), Quarante (40), Cinquante (50), Soixante (60).',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Recite all six tens from 10 to 60 in French without stopping.',
          answer: 'Dix, Vingt, Trente, Quarante, Cinquante, Soixante.',
          hint: '10, 20, 30, 40, 50, 60.',
        ),
        P5EvaluationQuestion(
          question: 'What French number is "Cinquante-sept"?',
          answer: '57 (Fifty-seven).',
          hint: '50 + 7.',
        ),
        P5EvaluationQuestion(
          question: 'Say in French: 50 + 10 = 60.',
          answer: 'Cinquante plus dix font soixante.',
          hint: 'Cinquante plus dix font...',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Number Mastery',
          instruction: 'Write out the full counting series of tens (10, 20, 30, 40, 50, 60) and practice saying them in under 5 seconds!',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Mastery of French Tens (10 to 60)',
        explanation:
            'Mastering the six tens allows you to build any number up to 60 simply by attaching units 1 through 9. Remember: all "1" compounds use "et un" (21, 31, 41, 51), while 2 through 9 use hyphens.',
        examples: [
          '51 = Cinquante et un',
          '56 = Cinquante-six',
          '60 = Soixante',
          'Soixante moins vingt font quarante. (60 - 20 = 40)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 5: EXAMEN DE MI-TRIMESTRE (SPEED RALLY)
    // ==========================================
    P5Lesson(
      term: 1,
      week: 5,
      topic: 'Examen de Mi-Trimestre (Mid-Term Oral Speed Rally)',
      subtitle: 'Interactive Smartboard Oral Review & Speed Quiz for Weeks 1 to 4',
      patternType: P5PatternType.term1RevisionRally,
      objectives: [
        'Demonstrate mastery in greetings, French alphabet sounds, and self-introduction.',
        'Rapidly calculate and recite French numbers from 1 to 60.',
        'Participate in classroom team buzzer speed rounds.',
        'Earn the Primary 5 Mid-Term French Scholar Badge.',
      ],
      culturalInsight:
          'Mid-term review rallies build confidence! In French schools, pupils love game-based challenges ("jeux de mots") to test their memory and quick thinking.',
      vocabItems: [
        P5VocabItem(
          french: 'La révision de mi-trimestre',
          phonetics: 'lah ray-vee-zyohn duh mee tree-mestr',
          english: 'Mid-term revision',
          usageNote: 'Comprehensive review.',
          icon: Icons.checklist_rounded,
          audioKey: 'la_revision_de_mi_trimestre',
        ),
        P5VocabItem(
          french: 'Le champion / La championne',
          phonetics: 'luh shahm-pyohn / lah shahm-pyohn',
          english: 'The champion (Boy / Girl)',
          usageNote: 'Awarded to top performers in speed drills.',
          icon: Icons.emoji_events_rounded,
          audioKey: 'le_champion',
        ),
        P5VocabItem(
          french: 'Très rapide !',
          phonetics: 'tray rah-peed',
          english: 'Very fast / Quick response!',
          usageNote: 'Commendation for rapid answers.',
          icon: Icons.speed_rounded,
          audioKey: 'tres_rapide',
        ),
        P5VocabItem(
          french: 'Bravo à tous !',
          phonetics: 'brah-voh ah toos',
          english: 'Well done everyone!',
          usageNote: 'Classwide encouragement.',
          icon: Icons.celebration_rounded,
          audioKey: 'bravo_a_tous',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What number is "Quarante-deux plus dix" ?',
          options: ['Cinquante (50)', 'Cinquante-deux (52)', 'Soixante (60)', 'Quarante-cinq (45)'],
          correctOptionIndex: 1,
          explanation: '42 + 10 = 52 (Cinquante-deux).',
        ),
        P5InteractiveExercise(
          prompt: 'Which response correctly answers "Comment vous appelez-vous ?"',
          options: ['J\'ai dix ans', 'Je m\'appelle Tunde', 'Ça va bien', 'Bonsoir'],
          correctOptionIndex: 1,
          explanation: '"Je m\'appelle..." is the correct sentence to state your name.',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Solve in French: Trente-cinq plus vingt font combien ?',
          answer: 'Cinquante-cinq (55).',
          hint: '35 + 20 = 55.',
        ),
        P5EvaluationQuestion(
          question: 'Spell the word "BONJOUR" in French alphabet letter names.',
          answer: 'B (bay), O (oh), N (en), J (zhee), O (oh), U (ew), R (air).',
          hint: 'Bay, Oh, En, Zhee, Oh, Ew, Air.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Mid-Term Review',
          instruction: 'Teach a family member how to count from 21 to 30 in French over the weekend break.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 6: CONGÉ DE MI-TRIMESTRE (BREAK & REST)
    // ==========================================
    P5Lesson(
      term: 1,
      week: 6,
      topic: 'Congé de Mi-Trimestre (Mid-Term Break & Cultural Intermission)',
      subtitle: 'Rest, Cultural Song Exploration & Preparation for Part II',
      patternType: P5PatternType.term1Vacation,
      objectives: [
        'Enjoy a restful mid-term break while keeping French vocabulary fresh.',
        'Sing French counting and greeting songs.',
        'Prepare for Week 7 (Presenting Others, Family & Body Anatomy).',
      ],
      culturalInsight:
          'Children in France celebrate mid-term breaks with outdoor games, family meals, and storytelling with grandparents!',
      vocabItems: [
        P5VocabItem(
          french: 'Le congé',
          phonetics: 'luh kohn-zhay',
          english: 'The holiday / Break',
          usageNote: 'School vacation period.',
          icon: Icons.beach_access_rounded,
          audioKey: 'le_conge',
        ),
        P5VocabItem(
          french: 'Bon repos !',
          phonetics: 'bohn ruh-poh',
          english: 'Have a good rest!',
          usageNote: 'Said before a break.',
          icon: Icons.bedtime_rounded,
          audioKey: 'bon_repos',
        ),
        P5VocabItem(
          french: 'À bientôt !',
          phonetics: 'ah byan-toh',
          english: 'See you soon!',
          usageNote: 'Friendly parting wish.',
          icon: Icons.waving_hand_rounded,
          audioKey: 'a_bientot',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What does "Bon repos" mean when teachers dismiss pupils for mid-term break?',
          options: ['Good morning', 'Have a good rest / vacation', 'Happy birthday', 'Goodbye forever'],
          correctOptionIndex: 1,
          explanation: '"Bon repos" translates to "Have a good rest".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'What phrase do you say when you expect to see someone again soon?',
          answer: 'À bientôt ! (See you soon!).',
          hint: 'Parting phrase with "bientôt".',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Break Reading',
          instruction: 'Relax and get ready for Week 7 French: "Présenter les Autres" (Presenting Others)!',
        ),
      ],
    ),

    // ==========================================
    // WEEK 7: PRÉSENTER LES AUTRES (PART I)
    // ==========================================
    P5Lesson(
      term: 1,
      week: 7,
      topic: 'Présenter les Autres (Partie I: Identité et Relations)',
      subtitle: 'Introducing Friends & Family: "Voici...", "C\'est...", "Il/Elle s\'appelle..."',
      patternType: P5PatternType.presentOthers,
      objectives: [
        'Use "Voici..." (Here is) and "C\'est..." (This is) correctly to introduce other people.',
        'Differentiate accurately between third-person subject pronouns "Il" (He) and "Elle" (She).',
        'State relationships using possessive pronouns: "mon ami/amie", "mon frère", "ma sœur".',
        'Describe someone\'s personality using adjectives like "gentil" (masc) and "gentille" (fem).',
      ],
      culturalInsight:
          'When introducing someone in French, polite eye contact and a warm smile are customary. Saying "Je vous présente mon ami(e)" shows elegance and respect in social etiquette!',
      vocabItems: [
        P5VocabItem(
          french: 'Voici...',
          phonetics: 'vwah-see',
          english: 'Here is... / This is...',
          usageNote: 'Used to introduce someone standing nearby.',
          icon: Icons.person_pin_circle_rounded,
          audioKey: 'voici',
        ),
        P5VocabItem(
          french: 'C\'est mon ami / mon amie',
          phonetics: 'say mohn ah-mee',
          english: 'This is my friend (Boy / Girl)',
          usageNote: 'Stating friendship relationship.',
          icon: Icons.people_alt_rounded,
          audioKey: 'cest_mon_ami',
        ),
        P5VocabItem(
          french: 'Il s\'appelle...',
          phonetics: 'eel sah-pell',
          english: 'His name is... (He is called...)',
          usageNote: 'Used for boys and men.',
          icon: Icons.man_rounded,
          audioKey: 'il_sappelle',
        ),
        P5VocabItem(
          french: 'Elle s\'appelle...',
          phonetics: 'ell sah-pell',
          english: 'Her name is... (She is called...)',
          usageNote: 'Used for girls and women.',
          icon: Icons.woman_rounded,
          audioKey: 'elle_sappelle',
        ),
        P5VocabItem(
          french: 'Mon frère',
          phonetics: 'mohn frair',
          english: 'My brother',
          usageNote: 'Masculine sibling.',
          icon: Icons.boy_rounded,
          audioKey: 'mon_frere',
        ),
        P5VocabItem(
          french: 'Ma sœur',
          phonetics: 'mah suhr',
          english: 'My sister',
          usageNote: 'Feminine sibling.',
          icon: Icons.girl_rounded,
          audioKey: 'ma_soeur',
        ),
        P5VocabItem(
          french: 'Il est gentil',
          phonetics: 'eel ay zhahn-tee',
          english: 'He is kind / nice',
          usageNote: 'Masculine adjective.',
          icon: Icons.favorite_rounded,
          audioKey: 'il_est_gentil',
        ),
        P5VocabItem(
          french: 'Elle est gentille',
          phonetics: 'ell ay zhahn-teey',
          english: 'She is kind / nice',
          usageNote: 'Feminine adjective with double-l.',
          icon: Icons.favorite_border_rounded,
          audioKey: 'elle_est_gentille',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'Which sentence correctly introduces a girl named Zainab?',
          options: [
            'Il s\'appelle Zainab.',
            'Elle s\'appelle Zainab.',
            'Je m\'appelle Zainab.',
            'Tu t\'appelles Zainab.'
          ],
          correctOptionIndex: 1,
          explanation: 'For a female (she), we use "Elle s\'appelle".',
        ),
        P5InteractiveExercise(
          prompt: 'How do you say "This is my brother" in French?',
          options: ['C\'est ma sœur', 'C\'est mon frère', 'C\'est mon ami', 'Voici ma mère'],
          correctOptionIndex: 1,
          explanation: '"C\'est mon frère" means "This is my brother".',
        ),
        P5InteractiveExercise(
          prompt: 'Which adjective agrees correctly with "Elle est..." (She is kind)?',
          options: ['Gentil', 'Gentille', 'Gentils', 'Gentilles'],
          correctOptionIndex: 1,
          explanation: 'The feminine singular form of "gentil" is "gentille".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Introduce your classmate to the teacher: State their name and relationship.',
          answer: 'Voici mon ami(e). Il/Elle s\'appelle [Nom].',
          hint: 'Voici mon ami(e)... Il/Elle s\'appelle...',
        ),
        P5EvaluationQuestion(
          question: 'What pronoun do you use for "He" vs "She" in French?',
          answer: '"Il" for He, and "Elle" for She.',
          hint: 'Il / Elle.',
        ),
        P5EvaluationQuestion(
          question: 'Translate to English: "Voici ma sœur, elle est gentille."',
          answer: 'Here is my sister, she is kind/nice.',
          hint: 'Voici = Here is, ma sœur = my sister.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Family Introduction',
          instruction: 'Write 3 complete French sentences introducing a brother, sister, or friend with their name and personality.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Subject Pronouns & Adjective Agreement',
        explanation:
            'In French, "Il" refers to masculine persons (he) and "Elle" refers to feminine persons (she). Adjectives change their ending to match gender: "gentil" for males becomes "gentille" for females.',
        examples: [
          'Voici Paul. Il est gentil. (Here is Paul. He is kind.)',
          'Voici Fatima. Elle est gentille. (Here is Fatima. She is kind.)',
          'C\'est mon frère. (This is my brother.)',
          'C\'est ma sœur. (This is my sister.)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 8: PRÉSENTER LES AUTRES (PART II)
    // ==========================================
    P5Lesson(
      term: 1,
      week: 8,
      topic: 'Présenter les Autres (Partie II: Âge, Nationalité & Description)',
      subtitle: 'Stating Age, Nationality & Physical Descriptors: "Grand(e)", "Petit(e)"',
      patternType: P5PatternType.presentOthersDescriptor,
      objectives: [
        'State the age of another person using "Il a ... ans" or "Elle a ... ans".',
        'State the nationality of others with proper gender agreement: "nigérian" vs "nigériane".',
        'Describe physical appearance using common adjectives: "grand(e)" (tall), "petit(e)" (short).',
        'Perform an interactive 4-line presentation dialogue for a classmate on the smartboard.',
      ],
      culturalInsight:
          'In Nigeria, pupils come from diverse states and cultural backgrounds. When speaking French, a boy says "Je suis nigérian" and a girl says "Je suis nigériane", celebrating their shared national pride!',
      vocabItems: [
        P5VocabItem(
          french: 'Il a dix ans',
          phonetics: 'eel ah dees ahn',
          english: 'He is ten years old',
          usageNote: 'Stating a boy\'s age.',
          icon: Icons.cake_rounded,
          audioKey: 'il_a_dix_ans',
        ),
        P5VocabItem(
          french: 'Elle a neuf ans',
          phonetics: 'ell ah nuhf ahn',
          english: 'She is nine years old',
          usageNote: 'Stating a girl\'s age.',
          icon: Icons.cake_rounded,
          audioKey: 'elle_a_neuf_ans',
        ),
        P5VocabItem(
          french: 'Il est nigérian',
          phonetics: 'eel ay nee-zhay-ryahn',
          english: 'He is Nigerian',
          usageNote: 'Masculine nationality.',
          icon: Icons.flag_rounded,
          audioKey: 'il_est_nigerian',
        ),
        P5VocabItem(
          french: 'Elle est nigériane',
          phonetics: 'ell ay nee-zhay-ryahn',
          english: 'She is Nigerian',
          usageNote: 'Feminine nationality ending in -e.',
          icon: Icons.flag_circle_rounded,
          audioKey: 'elle_est_nigeriane',
        ),
        P5VocabItem(
          french: 'Il est grand / Elle est grande',
          phonetics: 'eel ay grahn / ell ay grahnd',
          english: 'He is tall / She is tall',
          usageNote: 'Physical height descriptor.',
          icon: Icons.height_rounded,
          audioKey: 'grand_grande',
        ),
        P5VocabItem(
          french: 'Il est petit / Elle est petite',
          phonetics: 'eel ay puh-tee / ell ay puh-teet',
          english: 'He is short / She is short',
          usageNote: 'Opposite of tall/big.',
          icon: Icons.vertical_align_bottom_rounded,
          audioKey: 'petit_petite',
        ),
        P5VocabItem(
          french: 'Il est fort / Elle est forte',
          phonetics: 'eel ay fohr / ell ay fohrt',
          english: 'He is strong / She is strong',
          usageNote: 'Physical strength descriptor.',
          icon: Icons.fitness_center_rounded,
          audioKey: 'fort_forte',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'Which sentence correctly states that Mary is Nigerian and 10 years old?',
          options: [
            'Il a dix ans et il est nigérian.',
            'Elle a dix ans et elle est nigériane.',
            'Je suis dix ans et je suis nigériane.',
            'Elle est dix ans et elle a nigériane.'
          ],
          correctOptionIndex: 1,
          explanation: '"Elle a dix ans et elle est nigériane" uses the correct verb avoir for age and feminine nationality.',
        ),
        P5InteractiveExercise(
          prompt: 'What is the feminine form of the adjective "grand" (tall)?',
          options: ['Grands', 'Grande', 'Grandes', 'Grandesse'],
          correctOptionIndex: 1,
          explanation: 'The feminine form adds an \'e\': "grande" (pronounced grahnd).',
        ),
        P5InteractiveExercise(
          prompt: 'How do you say "He is strong" in French?',
          options: ['Il est fort', 'Elle est forte', 'Il a fort', 'Je suis fort'],
          correctOptionIndex: 0,
          explanation: '"Il est fort" means "He is strong".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Deliver a complete 4-sentence profile of your best friend in French.',
          answer: 'Voici mon ami(e) [Nom]. Il/Elle a dix ans. Il/Elle est nigérian(e). Il/Elle est grand(e) et gentil(le).',
          hint: 'Name, age, nationality, physical/personality description.',
        ),
        P5EvaluationQuestion(
          question: 'Why does "nigérian" change to "nigériane" for a girl?',
          answer: 'Because French adjectives agree in gender with feminine nouns/pronouns by adding "e".',
          hint: 'Gender agreement rule.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Classmate Profile',
          instruction: 'Draw a portrait of a friend and write 4 descriptive French sentences under the drawing.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Verbs "Avoir" (Age) vs "Être" (Nationality & Appearance)',
        explanation:
            'Always remember: Use "avoir" for age (Il a dix ans / Elle a dix ans), but use "être" for nationality and physical traits (Il est nigérian / Elle est grande).',
        examples: [
          'Il a onze ans. (He is 11 years old.)',
          'Elle a dix ans. (She is 10 years old.)',
          'Il est grand et fort. (He is tall and strong.)',
          'Elle est petite et gentille. (She is short and kind.)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 9: PARTIES DU CORPS HUMAIN (PART I: LA TÊTE)
    // ==========================================
    P5Lesson(
      term: 1,
      week: 9,
      topic: 'Identifier les Parties du Corps Humain (Partie I: La Tête)',
      subtitle: 'Anatomy of the Head: "La Tête", "Les Cheveux", "Les Yeux", "Les Dents"',
      patternType: P5PatternType.headAndFaceExplorer,
      objectives: [
        'Identify, pronounce, and label the main parts of the head and face in French.',
        'Understand singular and irregular plural forms: "l\'œil" (one eye) vs "les yeux" (eyes).',
        'Construct sentences describing your face: "J\'ai deux yeux, un nez et une bouche".',
        'Match French facial body parts to an interactive smartboard diagram.',
      ],
      culturalInsight:
          'In French, the word for hair is always plural: "les cheveux" (literally "the hairs"). We never say "le cheveu" unless talking about a single strand of hair!',
      vocabItems: [
        P5VocabItem(
          french: 'La tête',
          phonetics: 'lah tett',
          english: 'The head',
          usageNote: 'The entire head.',
          icon: Icons.face_rounded,
          audioKey: 'la_tete',
        ),
        P5VocabItem(
          french: 'Le visage',
          phonetics: 'luh vee-zahzh',
          english: 'The face',
          usageNote: 'The front facial features.',
          icon: Icons.face_retouching_natural_rounded,
          audioKey: 'le_visage',
        ),
        P5VocabItem(
          french: 'Les cheveux',
          phonetics: 'lay shuh-vuh',
          english: 'The hair',
          usageNote: 'Plural masculine noun.',
          icon: Icons.brush_rounded,
          audioKey: 'les_cheveux',
        ),
        P5VocabItem(
          french: 'Les yeux (l\'œil)',
          phonetics: 'lay zyuh (loy)',
          english: 'The eyes (One eye)',
          usageNote: 'Notice the liaison sound "lay zyuh".',
          icon: Icons.visibility_rounded,
          audioKey: 'les_yeux',
        ),
        P5VocabItem(
          french: 'Le nez',
          phonetics: 'luh nay',
          english: 'The nose',
          usageNote: 'Silent \'z\' at the end.',
          icon: Icons.air_rounded,
          audioKey: 'le_nez',
        ),
        P5VocabItem(
          french: 'La bouche',
          phonetics: 'lah boosh',
          english: 'The mouth',
          usageNote: 'Feminine noun for speaking and eating.',
          icon: Icons.record_voice_over_rounded,
          audioKey: 'la_bouche',
        ),
        P5VocabItem(
          french: 'Les oreilles',
          phonetics: 'lay zoh-ray',
          english: 'The ears',
          usageNote: 'Feminine plural with liaison.',
          icon: Icons.hearing_rounded,
          audioKey: 'les_oreilles',
        ),
        P5VocabItem(
          french: 'Les dents',
          phonetics: 'lay dahn',
          english: 'The teeth',
          usageNote: 'Feminine plural noun.',
          icon: Icons.sentiment_very_satisfied_rounded,
          audioKey: 'les_dents',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What is the plural French word for "the eyes"?',
          options: ['Les œils', 'Les yeux', 'Les têtes', 'Les nez'],
          correctOptionIndex: 1,
          explanation: 'The plural of "l\'œil" is the irregular form "les yeux".',
        ),
        P5InteractiveExercise(
          prompt: 'Which facial part is used for hearing in French?',
          options: ['Le nez', 'La bouche', 'Les oreilles', 'Les cheveux'],
          correctOptionIndex: 2,
          explanation: '"Les oreilles" are the ears.',
        ),
        P5InteractiveExercise(
          prompt: 'Complete the sentence: "J\'ai deux yeux et ... bouche."',
          options: ['un', 'une', 'des', 'les'],
          correctOptionIndex: 1,
          explanation: '"Bouche" is a feminine noun, so we use "une bouche".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Point to your head and name 5 facial parts in French.',
          answer: 'La tête, les cheveux, les yeux, le nez, la bouche, les oreilles, les dents.',
          hint: 'Name 5: head, hair, eyes, nose, mouth, ears, teeth.',
        ),
        P5EvaluationQuestion(
          question: 'Translate: "I have two ears and one nose."',
          answer: 'J\'ai deux oreilles et un nez.',
          hint: 'J\'ai deux... et un...',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Diagram Labeling',
          instruction: 'Draw an outline of a human face in your notebook and label the 6 parts in French with clear arrows.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Singular & Plural Articles for Body Parts',
        explanation:
            'Body parts use definite articles "le" (masculine), "la" (feminine), "l\'" (before vowel), and "les" (plural). Notice the irregular change: un œil -> les yeux.',
        examples: [
          'Le nez (The nose - masc)',
          'La bouche (The mouth - fem)',
          'L\'oreille (The ear - vowel)',
          'Les yeux (The eyes - plural)',
          'Les dents (The teeth - plural)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 10: PARTIES DU CORPS HUMAIN (PART II: LE CORPS & LA SANTÉ)
    // ==========================================
    P5Lesson(
      term: 1,
      week: 10,
      topic: 'Identifier les Parties du Corps Humain (Partie II: Le Corps & La Santé)',
      subtitle: 'Body Anatomy & Clinic Station: "Le Corps", "Le Dos", "J\'ai mal à..."',
      patternType: P5PatternType.bodyAndPainClinic,
      objectives: [
        'Name major parts of the body: "le bras", "la main", "les doigts", "le ventre", "le dos", "les jambes", "les pieds".',
        'Distinguish between similar parts: arm vs hand, leg vs foot.',
        'Express physical pain accurately using the formula "J\'ai mal à la / au / aux...".',
        'Role-play doctor and patient clinic dialogues on the smartboard.',
      ],
      culturalInsight:
          'When visiting a clinic or doctor in French, the first question the doctor asks is "Où avez-vous mal ?" (Where does it hurt?). You reply clearly with "J\'ai mal au ventre / à la tête / aux dents"!',
      vocabItems: [
        P5VocabItem(
          french: 'Le bras',
          phonetics: 'luh brah',
          english: 'The arm',
          usageNote: 'Silent \'s\' in singular.',
          icon: Icons.fitness_center_rounded,
          audioKey: 'le_bras',
        ),
        P5VocabItem(
          french: 'La main / Les doigts',
          phonetics: 'lah man / lay dwah',
          english: 'The hand / The fingers',
          usageNote: 'Hand and individual fingers.',
          icon: Icons.pan_tool_rounded,
          audioKey: 'la_main',
        ),
        P5VocabItem(
          french: 'Le ventre',
          phonetics: 'luh vahn-truh',
          english: 'The stomach / Belly',
          usageNote: 'Masculine abdominal region.',
          icon: Icons.accessibility_new_rounded,
          audioKey: 'le_ventre',
        ),
        P5VocabItem(
          french: 'Le dos',
          phonetics: 'luh doh',
          english: 'The back',
          usageNote: 'Silent \'s\' in singular.',
          icon: Icons.airline_seat_recline_normal_rounded,
          audioKey: 'le_dos',
        ),
        P5VocabItem(
          french: 'La jambe / Le pied',
          phonetics: 'lah zhahnb / luh pyay',
          english: 'The leg / The foot',
          usageNote: 'Lower limb anatomy.',
          icon: Icons.directions_walk_rounded,
          audioKey: 'la_jambe',
        ),
        P5VocabItem(
          french: 'J\'ai mal à la tête',
          phonetics: 'zhay mahl ah lah tett',
          english: 'I have a headache (Pain in my head)',
          usageNote: 'Feminine noun with "à la".',
          icon: Icons.sick_rounded,
          audioKey: 'jai_mal_a_la_tete',
        ),
        P5VocabItem(
          french: 'J\'ai mal au ventre',
          phonetics: 'zhay mahl oh vahn-truh',
          english: 'I have a stomach ache',
          usageNote: 'Masculine noun contraction (à + le = au).',
          icon: Icons.healing_rounded,
          audioKey: 'jai_mal_au_ventre',
        ),
        P5VocabItem(
          french: 'J\'ai mal aux dents',
          phonetics: 'zhay mahl oh dahn',
          english: 'I have a toothache',
          usageNote: 'Plural noun contraction (à + les = aux).',
          icon: Icons.medical_services_rounded,
          audioKey: 'jai_mal_aux_dents',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'How do you say "I have a stomach ache" in French?',
          options: [
            'J\'ai mal à la tête',
            'J\'ai mal au ventre',
            'J\'ai mal aux pieds',
            'J\'ai faim'
          ],
          correctOptionIndex: 1,
          explanation: '"Ventre" is masculine, so "à + le" becomes "au": "J\'ai mal au ventre".',
        ),
        P5InteractiveExercise(
          prompt: 'Which French body part is "la jambe"?',
          options: ['The arm', 'The leg', 'The hand', 'The back'],
          correctOptionIndex: 1,
          explanation: '"La jambe" is the leg, while "le bras" is the arm.',
        ),
        P5InteractiveExercise(
          prompt: 'What contraction is used for plural pain: "J\'ai mal ... dents" ?',
          options: ['à la', 'au', 'aux', 'de'],
          correctOptionIndex: 2,
          explanation: 'For plural nouns like "les dents", we use "aux" (à + les = aux).',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'A doctor asks: "Où avez-vous mal ?" How do you say "I have a headache"?',
          answer: 'J\'ai mal à la tête.',
          hint: 'J\'ai mal à la tête.',
        ),
        P5EvaluationQuestion(
          question: 'What is the difference between "le bras" and "la main"?',
          answer: '"Le bras" is the arm, and "la main" is the hand.',
          hint: 'Arm vs Hand.',
        ),
        P5EvaluationQuestion(
          question: 'How do you say "I have back pain" in French?',
          answer: 'J\'ai mal au dos.',
          hint: 'Au dos (masculine).',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Clinic Roleplay',
          instruction: 'Practice a 3-line doctor-patient dialogue with a sibling expressing pain in the stomach and teeth.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Expressing Pain with "J\'ai mal à..."',
        explanation:
            'The preposition "à" contracts with the definite article of the body part: à + la = à la (fem), à + le = au (masc), à + l\' = à l\' (vowel), à + les = aux (plural).',
        examples: [
          'J\'ai mal à la tête. (Feminine: head)',
          'J\'ai mal au dos / au ventre. (Masculine: back / belly)',
          'J\'ai mal à l\'œil. (Vowel: eye)',
          'J\'ai mal aux dents / aux oreilles. (Plural: teeth / ears)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 11: RÉVISION GÉNÉRALE DU PREMIER TRIMESTRE
    // ==========================================
    P5Lesson(
      term: 1,
      week: 11,
      topic: 'Révision Générale du Premier Trimestre',
      subtitle: 'Comprehensive Speed Oral Revision Rally across Weeks 1 to 10',
      patternType: P5PatternType.term1RevisionRally,
      objectives: [
        'Review and consolidate all First Term Primary 5 topics.',
        'Rapidly answer questions on counting 1–60, introductions, and body anatomy.',
        'Demonstrate mastery in speaking, listening, and phonetics.',
      ],
      culturalInsight:
          'Revision rallies bring the classroom to life! Teams compete with smartboard buzzers to test their French mastery before the term assessment.',
      vocabItems: [
        P5VocabItem(
          french: 'La révision générale',
          phonetics: 'lah ray-vee-zyohn zhay-nay-rahl',
          english: 'General revision',
          usageNote: 'Full term consolidation.',
          icon: Icons.auto_awesome_motion_rounded,
          audioKey: 'la_revision_generale',
        ),
        P5VocabItem(
          french: 'Les nombres 1 à 60',
          phonetics: 'lay nohm-bruh uhn ah swah-sahnt',
          english: 'Numbers 1 to 60',
          usageNote: 'Complete counting sequence.',
          icon: Icons.numbers_rounded,
          audioKey: 'les_nombres_1_a_60',
        ),
        P5VocabItem(
          french: 'Présenter les autres',
          phonetics: 'pray-zahn-tay lay zoh-truh',
          english: 'Presenting others',
          usageNote: 'Third person presentations.',
          icon: Icons.group_add_rounded,
          audioKey: 'presenter_les_autres',
        ),
        P5VocabItem(
          french: 'Le corps humain',
          phonetics: 'luh kohr oo-man',
          english: 'The human body',
          usageNote: 'Complete anatomical vocabulary.',
          icon: Icons.accessibility_new_rounded,
          audioKey: 'le_corps_humain',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What number is "Cinquante plus dix" in French?',
          options: ['Quarante (40)', 'Cinquante-cinq (55)', 'Soixante (60)', 'Trente (30)'],
          correctOptionIndex: 2,
          explanation: '50 + 10 = 60 (Soixante).',
        ),
        P5InteractiveExercise(
          prompt: 'Which phrase means "She is my friend and she is kind"?',
          options: [
            'Il est mon ami et il est gentil',
            'Elle est mon amie et elle est gentille',
            'Voici mon frère et il est grand',
            'C\'est ma mère et elle est petite'
          ],
          correctOptionIndex: 1,
          explanation: '"Elle est mon amie et elle est gentille" uses feminine agreements for friend and kind.',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Recite the six tens from 10 to 60 in French.',
          answer: 'Dix, Vingt, Trente, Quarante, Cinquante, Soixante.',
          hint: '10 to 60.',
        ),
        P5EvaluationQuestion(
          question: 'Say: "I have pain in my back and teeth."',
          answer: 'J\'ai mal au dos et aux dents.',
          hint: 'J\'ai mal au dos et aux dents.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Term Portfolio',
          instruction: 'Review all First Term vocabulary flashcards with a partner before next week\'s oral evaluation.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 12: ÉVALUATION ORALE ET BILAN
    // ==========================================
    P5Lesson(
      term: 1,
      week: 12,
      topic: 'Bilan et Évaluation Orale du Premier Trimestre',
      subtitle: 'Teacher-guided Speaking Evaluation & Student Achievement Portfolio',
      patternType: P5PatternType.term1RevisionRally,
      objectives: [
        'Conduct individual and group oral evaluation stations.',
        'Assess pronunciation, fluency, and vocabulary recall.',
        'Award Term 1 French Achievement Badges.',
      ],
      culturalInsight:
          'Oral evaluations in French celebrate pupil progress, expression, and joy in communicating in a second international language!',
      vocabItems: [
        P5VocabItem(
          french: 'L\'évaluation orale',
          phonetics: 'lay-vah-loo-ah-syohn oh-rahl',
          english: 'Oral evaluation',
          usageNote: 'Speaking assessment.',
          icon: Icons.record_voice_over_rounded,
          audioKey: 'levaluation_orale',
        ),
        P5VocabItem(
          french: 'Très bien réussi !',
          phonetics: 'tray byan ray-oo-see',
          english: 'Very well done!',
          usageNote: 'Commendation phrase.',
          icon: Icons.thumb_up_rounded,
          audioKey: 'tres_bien_reussi',
        ),
        P5VocabItem(
          french: 'Félicitations !',
          phonetics: 'fay-lee-see-tah-syohn',
          english: 'Congratulations!',
          usageNote: 'Celebration of success.',
          icon: Icons.star_rounded,
          audioKey: 'felicitations',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'Which expression is used to congratulate someone on their high score?',
          options: ['Pardon', 'Félicitations !', 'Bonsoir', 'De rien'],
          correctOptionIndex: 1,
          explanation: '"Félicitations !" means "Congratulations!".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Deliver your complete Term 1 oral showcase (Self introduction + friend presentation + counting 5 tens).',
          answer: 'Pupils deliver their oral presentation proudly to the class.',
          hint: 'Bonjour... Je m\'appelle... Voici mon ami... Dix, vingt, trente...',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Vacation Reading',
          instruction: 'Get ready for the end-of-term closing celebration and holiday break next week!',
        ),
      ],
    ),

    // ==========================================
    // WEEK 13: CLÔTURE ET VACANCES DU PREMIER TRIMESTRE
    // ==========================================
    P5Lesson(
      term: 1,
      week: 13,
      topic: 'Fin du Premier Trimestre (Term 1 Wrap-up & Vacation Celebration)',
      subtitle: 'Congratulations on Completing Term 1 French — Bonnes Vacances !',
      patternType: P5PatternType.term1Vacation,
      objectives: [
        'Celebrate the successful completion of First Term Primary 5 French!',
        'Review badge collections and achievements.',
        'Preview Term 2 topics: Extended Family, Neighbors & Days of the Week.',
      ],
      culturalInsight:
          'Félicitations ! In Term 2, we will expand our horizons to talk about extended families (grandparents, aunts, uncles, cousins), friendly neighbors, expressing gratitude, and weekly timetables!',
      vocabItems: [
        P5VocabItem(
          french: 'Félicitations !',
          phonetics: 'fay-lee-see-tah-syohn',
          english: 'Congratulations!',
          usageNote: 'Well done on completing Term 1!',
          icon: Icons.celebration_rounded,
          audioKey: 'felicitations',
        ),
        P5VocabItem(
          french: 'Bonnes vacances !',
          phonetics: 'bun vah-kahns',
          english: 'Happy holidays / Have a great vacation!',
          usageNote: 'Vacation departure greeting.',
          icon: Icons.beach_access_rounded,
          audioKey: 'bonnes_vacances',
        ),
        P5VocabItem(
          french: 'À la rentrée !',
          phonetics: 'ah lah rahn-tray',
          english: 'See you next term / when school resumes!',
          usageNote: 'Departure wish until school reopens.',
          icon: Icons.school_rounded,
          audioKey: 'a_la_rentree',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What do you say to classmates before departing for the end-of-term holiday?',
          options: ['Bonne nuit', 'Bonnes vacances !', 'De rien', 'Au secours'],
          correctOptionIndex: 1,
          explanation: '"Bonnes vacances !" is the standard French wish for a great school holiday.',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'What was your favorite French topic learned in Term 1?',
          answer: 'Pupils share their favorite topic (Numbers 21-60, Introducing Friends, Body Anatomy & Pain Clinic).',
          hint: 'Any Term 1 topic.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Holiday Fun',
          instruction: 'Enjoy a wonderful vacation with family and get ready for Term 2 French: "La Grande Famille et Les Voisins"!',
        ),
      ],
    ),
  ];
}
