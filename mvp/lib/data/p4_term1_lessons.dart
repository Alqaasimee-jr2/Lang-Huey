import 'package:flutter/material.dart';
import '../models/p4_lesson_model.dart';

/// Complete, digitized NERDC Nigerian Primary 4 French Curriculum for First Term (Weeks 1 to 13)
/// Source of Truth: scheme of work files/PRIMARY_4_FRENCH_LANGUAGE_LESSON_NOTES.md
final List<P4Lesson> p4Term1Lessons = [
  // ==========================================
  // WEEK 1: WHY LEARN FRENCH & GEOGRAPHY
  // ==========================================
  P4Lesson(
    term: 1,
    week: 1,
    topic: 'Pourquoi apprendre le français?',
    subtitle: 'Why learn French? Neighboring Francophone Countries & French Alphabet (A–E)',
    patternType: P4PatternType.borderMapAndAlphabet,
    teachingStyle: TeachingStyle.interactiveStudio,
    objectives: [
      'State two reasons why learning French is important for Nigerians.',
      'List three French-speaking countries in Africa (Francophone countries).',
      'Identify Nigeria\'s neighboring countries that speak French (Benin, Niger, Chad, Cameroon).',
      'Recite and correctly pronounce the first 5 letters of the French alphabet (A, B, C, D, E).',
    ],
    culturalInsight:
        'Nigeria is completely surrounded by Francophone (French-speaking) neighbors: Benin Republic to the West, Niger to the North, Chad to the North-East, and Cameroon to the East. Learning French opens doors for cross-border trade, international careers, translation, and travel!',
    vocabItems: [
      P4VocabItem(
        french: 'Le Bénin',
        phonetics: 'luh bay-nahn',
        english: 'Benin Republic (West neighbor)',
        usageNote: 'Shares Nigeria\'s western border (Seme, Idiroko border corridors).',
        icon: Icons.public_rounded,
        audioKey: 'le_benin',
        imageAsset: 'assets/images/p4_term1/flag_benin.png',
      ),
      P4VocabItem(
        french: 'Le Niger',
        phonetics: 'luh nee-zhehr',
        english: 'Niger Republic (North neighbor)',
        usageNote: 'Directly north of Sokoto, Katsina, and Borno states.',
        icon: Icons.public_rounded,
        audioKey: 'le_niger',
        imageAsset: 'assets/images/p4_term1/flag_niger.png',
      ),
      P4VocabItem(
        french: 'Le Tchad',
        phonetics: 'luh tchad',
        english: 'Chad Republic (North-East neighbor)',
        usageNote: 'Border neighbor around the Lake Chad basin.',
        icon: Icons.public_rounded,
        audioKey: 'le_tchad',
        imageAsset: 'assets/images/p4_term1/flag_tchad.png',
      ),
      P4VocabItem(
        french: 'Le Cameroun',
        phonetics: 'luh kah-muh-roon',
        english: 'Cameroon (East neighbor)',
        usageNote: 'Border neighbor stretching along eastern Nigeria.',
        icon: Icons.public_rounded,
        audioKey: 'le_cameroun',
        imageAsset: 'assets/images/p4_term1/flag_cameroun.png',
      ),
      P4VocabItem(
        french: 'A (ah)',
        phonetics: 'ah',
        english: 'Letter A (sounds like "a" in father)',
        usageNote: 'Open mouth wide and relaxed.',
        icon: Icons.spellcheck_rounded,
        audioKey: 'alphabet_a',
      ),
      P4VocabItem(
        french: 'B (bé)',
        phonetics: 'bay',
        english: 'Letter B (sounds like "bay" without trailing y)',
        usageNote: 'Crisp, short sound.',
        icon: Icons.spellcheck_rounded,
        audioKey: 'alphabet_b',
      ),
      P4VocabItem(
        french: 'C (cé)',
        phonetics: 'say',
        english: 'Letter C (sounds like the English word "say")',
        usageNote: 'Smooth soft sound.',
        icon: Icons.spellcheck_rounded,
        audioKey: 'alphabet_c',
      ),
      P4VocabItem(
        french: 'D (dé)',
        phonetics: 'day',
        english: 'Letter D (sounds like English "day")',
        usageNote: 'Tongue touches behind front upper teeth.',
        icon: Icons.spellcheck_rounded,
        audioKey: 'alphabet_d',
      ),
      P4VocabItem(
        french: 'E (euh)',
        phonetics: 'uh',
        english: 'Letter E (sounds like "uh", like the \'e\' in "the")',
        usageNote: 'Important: Keep lips relaxed and jaw slightly open!',
        icon: Icons.spellcheck_rounded,
        audioKey: 'alphabet_e',
      ),
    ],
    classworkExercises: [
      P4InteractiveExercise(
        prompt: 'Which French-speaking country shares Nigeria\'s Western border?',
        options: ['Le Cameroun', 'Le Bénin', 'Le Niger', 'Le Ghana'],
        correctOptionIndex: 1,
        explanation: 'Benin Republic (Le Bénin) is on Nigeria\'s western border (Seme / Badagry / Idiroko).',
      ),
      P4InteractiveExercise(
        prompt: 'How is the French letter "E" pronounced?',
        options: ['Like "egg"', 'Like "ee"', 'Like "uh" (as in "the")', 'Like "ay"'],
        correctOptionIndex: 2,
        explanation: 'The French "E" produces a relaxed "uh" sound, like the "e" in the word "the".',
      ),
      P4InteractiveExercise(
        prompt: 'Which of the following is NOT one of Nigeria\'s immediate border neighbors?',
        options: ['Le Niger', 'Le Cameroun', 'Le Sénégal', 'Le Tchad'],
        correctOptionIndex: 2,
        explanation: 'Senegal (Le Sénégal) is in West Africa, but does not share a direct land border with Nigeria.',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'Le Bénin', english: 'Benin Republic (West neighbor)'),
          DrillPair(french: 'Le Niger', english: 'Niger Republic (North neighbor)'),
          DrillPair(french: 'Le Tchad', english: 'Chad Republic (North-East neighbor)'),
          DrillPair(french: 'Le Cameroun', english: 'Cameroon (East neighbor)'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word (Benin Republic (West neighbor)):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: ['Le Bénin', 'Le Niger', 'Le Tchad', 'Le Cameroun'],
        correctGapWord: 'Le Bénin',
        explanation: 'Bravo ! "Le Bénin" means "Benin Republic (West neighbor)".',
      ),
      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),
    ],
    evaluationQuestions: [
      P4EvaluationQuestion(
        question: 'Give one reason why learning French is useful for someone living in a border town in Nigeria.',
        answer: 'To communicate and trade with neighboring Francophone countries, and for international career and travel opportunities.',
        hint: 'Think about who lives directly across Nigeria\'s borders.',
      ),
      P4EvaluationQuestion(
        question: 'Name two countries that share a border with Nigeria where people speak French.',
        answer: 'Bénin (West) and Niger (North) [Also: Tchad and Cameroun].',
        hint: 'Check the border map.',
      ),
      P4EvaluationQuestion(
        question: 'Look at the map of Africa. Can you name one Francophone country that is NOT Nigeria\'s immediate neighbor?',
        answer: 'Sénégal, Côte d\'Ivoire (Ivory Coast), Mali, or Togo.',
        hint: 'West African countries located further along the coast.',
      ),
      P4EvaluationQuestion(
        question: 'Pronounce the French letter \'C\' for the class.',
        answer: 'It is pronounced "say" (sounds like the English word "say").',
        hint: 'Sounds like the English word "say".',
      ),
      P4EvaluationQuestion(
        question: 'Is the sound of the French letter \'E\' similar to the English \'E\' in "egg"?',
        answer: 'No, it sounds like "uh" (as in the \'e\' of "the").',
        hint: 'Remember mouth shape: lips rounded and relaxed.',
      ),
    ],
    assignmentTasks: [
      P4AssignmentTask(
        category: 'Drawing & Writing',
        instruction: 'Draw a simple outline map of Nigeria in your notebook. On the West side write "Bénin", and on the North side write "Niger".',
      ),
      P4AssignmentTask(
        category: 'Oral/Written Alphabet',
        instruction: 'Practice reciting the first five French letters (A, B, C, D, E) aloud. Write them down with their pronunciation next to them (e.g., A - ah).',
      ),
      P4AssignmentTask(
        category: 'Oral Research',
        instruction: 'Ask a parent or older sibling at home: "Do you know any French word?" Write down one word and its meaning.',
      ),
    ],
    patternData: {
      'countries': [
        {'name': 'Le Bénin', 'direction': 'West (Ouest)', 'capital': 'Porto-Novo', 'french': 'Bénin', 'audio': 'le_benin', 'flag': 'assets/images/p4_term1/flag_benin.png'},
        {'name': 'Le Niger', 'direction': 'North (Nord)', 'capital': 'Niamey', 'french': 'Niger', 'audio': 'le_niger', 'flag': 'assets/images/p4_term1/flag_niger.png'},
        {'name': 'Le Tchad', 'direction': 'North-East (Nord-Est)', 'capital': 'N\'Djamena', 'french': 'Tchad', 'audio': 'le_tchad', 'flag': 'assets/images/p4_term1/flag_tchad.png'},
        {'name': 'Le Cameroun', 'direction': 'East (Est)', 'capital': 'Yaoundé', 'french': 'Cameroun', 'audio': 'le_cameroun', 'flag': 'assets/images/p4_term1/flag_cameroun.png'},
      ],
      'alphabetLetters': [
        {'letter': 'A', 'sound': 'ah', 'hint': 'as in "father"', 'audio': 'alphabet_a'},
        {'letter': 'B', 'sound': 'bay', 'hint': 'as in "bay"', 'audio': 'alphabet_b'},
        {'letter': 'C', 'sound': 'say', 'hint': 'as in "say"', 'audio': 'alphabet_c'},
        {'letter': 'D', 'sound': 'day', 'hint': 'as in "day"', 'audio': 'alphabet_d'},
        {'letter': 'E', 'sound': 'uh', 'hint': 'as in "the"', 'audio': 'alphabet_e'},
      ]
    },
  ),

  // ==========================================
  // WEEK 2: GREETINGS - PART 1
  // ==========================================
  P4Lesson(
    term: 1,
    week: 2,
    topic: 'Saluer (Greetings) - Part 1',
    subtitle: 'Formal vs Informal Greetings, Times of Day & Asking "How Are You?"',
    patternType: P4PatternType.greetingTimeDial,
    teachingStyle: TeachingStyle.dialogueConversation,
    objectives: [
      'Differentiate between formal greetings (politesse) and informal greetings (amiable).',
      'Say "Good morning/day", "Good evening", and "Good night" in French accurately.',
      'Ask "How are you?" in both formal ("Comment allez-vous?") and informal ("Comment ça va?") contexts.',
      'State three appropriate French responses to "How are you?".',
    ],
    culturalInsight:
        'Just like in Nigerian cultures where respect for elders is paramount, French speakers use formal greetings ("Bonjour Madame/Monsieur", "Comment allez-vous?") with adults and teachers, and friendly greetings ("Salut", "Comment ça va?") with classmates and friends.',
    vocabItems: [
      P4VocabItem(
        french: 'Bonjour',
        phonetics: 'bohn-zhoor',
        english: 'Good day / Hello (Formal & Standard)',
        usageNote: 'Used from morning until around 6:00 PM.',
        icon: Icons.wb_sunny_rounded,
        audioKey: 'bonjour',
        imageAsset: 'assets/images/p4_term1/matin_sun.png',
      ),
      P4VocabItem(
        french: 'Bonsoir',
        phonetics: 'bohn-swahr',
        english: 'Good evening',
        usageNote: 'Used from 6:00 PM onwards.',
        icon: Icons.nights_stay_rounded,
        audioKey: 'bonsoir',
        imageAsset: 'assets/images/p4_term1/soir_moon.png',
      ),
      P4VocabItem(
        french: 'Bonne nuit',
        phonetics: 'bun nwee',
        english: 'Good night (only when going to sleep)',
        usageNote: 'Said strictly when going to bed, not as an evening greeting!',
        icon: Icons.bedtime_rounded,
        audioKey: 'bonne_nuit',
        imageAsset: 'assets/images/p4_term1/coucher_bed.png',
      ),
      P4VocabItem(
        french: 'Salut',
        phonetics: 'sah-loo',
        english: 'Hi / Bye (Informal)',
        usageNote: 'Used casually with classmates, siblings, and close friends.',
        icon: Icons.waving_hand_rounded,
        audioKey: 'salut',
      ),
      P4VocabItem(
        french: 'Coucou',
        phonetics: 'koo-koo',
        english: 'Hey there / Peekaboo (Playful greeting)',
        usageNote: 'Playful informal greeting between close friends.',
        icon: Icons.sentiment_very_satisfied_rounded,
        audioKey: 'coucou',
      ),
      P4VocabItem(
        french: 'Comment allez-vous?',
        phonetics: 'koh-mohn tah-lay voo',
        english: 'How are you? (Formal / To Adults)',
        usageNote: 'Respectful way to address teachers, principals, and elders.',
        icon: Icons.record_voice_over_rounded,
        audioKey: 'comment_allez_vous',
      ),
      P4VocabItem(
        french: 'Comment ça va? / Ça va?',
        phonetics: 'koh-mohn sah vah / sah vah',
        english: 'How are you? / How\'s it going? (Informal)',
        usageNote: 'Used with peers and friends.',
        icon: Icons.chat_bubble_outline_rounded,
        audioKey: 'comment_ca_va',
      ),
      P4VocabItem(
        french: 'Ça va bien',
        phonetics: 'sah vah byehn',
        english: 'I am fine / Doing well',
        usageNote: 'Standard positive reply.',
        icon: Icons.sentiment_satisfied_alt_rounded,
        audioKey: 'ca_va_bien',
      ),
      P4VocabItem(
        french: 'Très bien, merci',
        phonetics: 'treh byehn, mair-see',
        english: 'Very well, thank you',
        usageNote: 'Polite and confident reply.',
        icon: Icons.thumb_up_rounded,
        audioKey: 'tres_bien_merci',
      ),
      P4VocabItem(
        french: 'Comme ci, comme ça',
        phonetics: 'kohm see, kohm sah',
        english: 'So-so (neither good nor bad)',
        usageNote: 'Accompanied by a gentle tilting hand gesture.',
        icon: Icons.compare_arrows_rounded,
        audioKey: 'comme_ci_comme_ca',
      ),
    ],
    classworkExercises: [
      P4InteractiveExercise(
        prompt: 'You arrive at school at 8:00 AM and meet your teacher. What is the correct greeting?',
        options: ['Bonsoir, Monsieur!', 'Bonjour, Madame/Monsieur!', 'Bonne nuit!', 'Coucou!'],
        correctOptionIndex: 1,
        explanation: 'Bonjour is the polite, formal greeting used from morning until 6:00 PM.',
      ),
      P4InteractiveExercise(
        prompt: 'Which question should you ask an adult or principal to say "How are you?" respectfully?',
        options: ['Comment allez-vous?', 'Comment ça va?', 'Salut?', 'Coucou?'],
        correctOptionIndex: 0,
        explanation: '"Comment allez-vous?" uses the formal "vous" form showing respect to elders and teachers.',
      ),
      P4InteractiveExercise(
        prompt: 'What does "Comme ci, comme ça" mean?',
        options: ['Very well', 'I am sick', 'So-so (Neither great nor bad)', 'Good night'],
        correctOptionIndex: 2,
        explanation: '"Comme ci, comme ça" means so-so or okay, accompanied by a flat waving hand motion.',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'Bonjour', english: 'Good day / Hello (Formal & Standard)'),
          DrillPair(french: 'Bonsoir', english: 'Good evening'),
          DrillPair(french: 'Bonne nuit', english: 'Good night (only when going to sleep)'),
          DrillPair(french: 'Salut', english: 'Hi / Bye (Informal)'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word (Good day / Hello (Formal & Standard)):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: ['Bonjour', 'Bonsoir', 'Bonne nuit', 'Salut'],
        correctGapWord: 'Bonjour',
        explanation: 'Bravo ! "Bonjour" means "Good day / Hello (Formal & Standard)".',
      ),
      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),
    ],
    evaluationQuestions: [
      P4EvaluationQuestion(
        question: 'You meet your headteacher at the school gate at 8 AM. What is the correct French greeting to use?',
        answer: 'Bonjour, Madame / Monsieur.',
        hint: 'Use the standard formal morning greeting.',
      ),
      P4EvaluationQuestion(
        question: 'Your friend Amina comes to play at 4 PM. What casual greeting can you use?',
        answer: 'Salut, Amina! (or "Coucou!").',
        hint: 'Use the informal friendly greeting.',
      ),
      P4EvaluationQuestion(
        question: 'What does "Bonsoir" mean and when do you use it?',
        answer: 'It means "Good evening", used from around 6:00 PM onwards.',
        hint: 'Evening greeting before bed.',
      ),
      P4EvaluationQuestion(
        question: 'How would you ask your classmate, Chinedu, "How are you?" in French?',
        answer: 'Comment ça va? (or simply "Ça va?").',
        hint: 'Informal greeting between classmates.',
      ),
      P4EvaluationQuestion(
        question: 'How do you say "Very well" in French?',
        answer: 'Très bien (or "Très bien, merci").',
        hint: 'Positive response to how are you.',
      ),
      P4EvaluationQuestion(
        question: 'When is it correct to say "Bonne nuit"?',
        answer: 'Only when someone is going to bed to sleep.',
        hint: 'It is a bedtime farewell, not an arrival greeting.',
      ),
    ],
    assignmentTasks: [
      P4AssignmentTask(
        category: 'Written Time Practice',
        instruction: 'In your notebook, write what French greeting you would use at: (a) 10:00 in the morning (meeting a neighbor), (b) 7:00 in the evening (seeing your uncle).',
      ),
      P4AssignmentTask(
        category: 'Oral Role-Play',
        instruction: 'With a partner at home, practice a greeting: One person says "Bonjour" or "Salut", the other asks "Ça va?", and the first replies "Ça va bien, merci. Et toi?".',
      ),
      P4AssignmentTask(
        category: 'Written Translation',
        instruction: 'Write the French phrase for "I am fine, thank you." (Ça va bien, merci.) in your notebook.',
      ),
    ],
    patternData: {
      'dialTimes': [
        {
          'time': '8:00 AM (Matin)',
          'icon': Icons.wb_sunny_rounded,
          'target': 'Adult / Headteacher',
          'greeting': 'Bonjour, Monsieur/Madame!',
          'response': 'Comment allez-vous?',
          'audio': 'bonjour_madame',
        },
        {
          'time': '4:00 PM (Après-midi)',
          'icon': Icons.wb_twilight_rounded,
          'target': 'Classmate / Friend',
          'greeting': 'Salut! Ça va?',
          'response': 'Ça va très bien, merci! Et toi?',
          'audio': 'salut',
        },
        {
          'time': '7:30 PM (Soir)',
          'icon': Icons.nightlight_round,
          'target': 'Family / Neighbor',
          'greeting': 'Bonsoir, Papa/Maman!',
          'response': 'Bonsoir mon fils/ma fille!',
          'audio': 'bonsoir',
        },
        {
          'time': '9:30 PM (Coucher)',
          'icon': Icons.bedtime_rounded,
          'target': 'Bedtime',
          'greeting': 'Bonne nuit, dors bien!',
          'response': 'Bonne nuit à tous!',
          'audio': 'bonne_nuit',
        },
      ]
    },
  ),

  // ==========================================
  // WEEK 3: GREETINGS - PART 2 & MAGIC WORDS
  // ==========================================
  P4Lesson(
    term: 1,
    week: 3,
    topic: 'Saluer (Greetings) - Part 2',
    subtitle: 'Saying Goodbye, Magic Words (Les Mots Magiques) & French Cultural Customs',
    patternType: P4PatternType.magicWordsCourtesy,
    teachingStyle: TeachingStyle.dialogueConversation,
    objectives: [
      'Mention three different ways to say goodbye in French based on timing.',
      'Identify and use the "Magic Words" (polite expressions) in daily class life.',
      'Perform a short two-person greeting and farewell dialogue.',
      'Describe the French greeting custom of "la bise" (cheek kiss).',
    ],
    culturalInsight:
        'In France and parts of Francophone Africa, friends and family greet with "la bise" (touching cheeks with a soft kissing sound in the air). In Nigeria, we respectfully shake hands, wave, or bow slightly. Respect and warmth are universal!',
    vocabItems: [
      P4VocabItem(
        french: 'Au revoir',
        phonetics: 'oh ruh-vwahr',
        english: 'Goodbye (Universal & Polite)',
        usageNote: 'Standard farewell for all situations.',
        icon: Icons.waving_hand_rounded,
        audioKey: 'au_revoir',
      ),
      P4VocabItem(
        french: 'À bientôt',
        phonetics: 'ah byehn-toh',
        english: 'See you soon',
        usageNote: 'When you expect to see the person again soon.',
        icon: Icons.schedule_rounded,
        audioKey: 'a_bientot',
      ),
      P4VocabItem(
        french: 'À demain',
        phonetics: 'ah duh-mahn',
        english: 'See you tomorrow',
        usageNote: 'Perfect for classmates at the end of the school day.',
        icon: Icons.calendar_today_rounded,
        audioKey: 'a_demain',
      ),
      P4VocabItem(
        french: 'S\'il vous plaît',
        phonetics: 'seel voo pleh',
        english: 'Please (Formal / to Adults)',
        usageNote: 'Essential courtesy when asking a teacher for help.',
        icon: Icons.volunteer_activism_rounded,
        audioKey: 'sil_vous_plait',
      ),
      P4VocabItem(
        french: 'S\'il te plaît',
        phonetics: 'seel tuh pleh',
        english: 'Please (Informal / to Friends)',
        usageNote: 'Use when asking a classmate for a pencil or eraser.',
        icon: Icons.handshake_rounded,
        audioKey: 'sil_te_plait',
      ),
      P4VocabItem(
        french: 'Merci',
        phonetics: 'mair-see',
        english: 'Thank you',
        usageNote: 'The master magic word of gratitude.',
        icon: Icons.favorite_rounded,
        audioKey: 'merci',
      ),
      P4VocabItem(
        french: 'De rien',
        phonetics: 'duh ryehn',
        english: 'You\'re welcome (Literally: "It is nothing")',
        usageNote: 'Standard polite reply to "Merci".',
        icon: Icons.check_circle_outline_rounded,
        audioKey: 'de_rien',
      ),
      P4VocabItem(
        french: 'Pardon / Excusez-moi',
        phonetics: 'pahr-dohn / ex-koo-zay mwah',
        english: 'Sorry / Excuse me',
        usageNote: 'For minor bumps or getting someone\'s attention politely.',
        icon: Icons.front_hand_rounded,
        audioKey: 'pardon',
      ),
      P4VocabItem(
        french: 'Désolé(e)',
        phonetics: 'day-zoh-lay',
        english: 'Sorry (for a mistake)',
        usageNote: 'Add \'e\' for a girl: Désolée.',
        icon: Icons.sentiment_dissatisfied_rounded,
        audioKey: 'desolee',
      ),
    ],
    classworkExercises: [
      P4InteractiveExercise(
        prompt: 'You borrow a pencil from your classmate Amina. What magic word should you say?',
        options: ['Au revoir', 'S\'il te plaît', 'De rien', 'Bonne nuit'],
        correctOptionIndex: 1,
        explanation: '"S\'il te plaît" is the informal phrase for "Please" used between classmates.',
      ),
      P4InteractiveExercise(
        prompt: 'What is the polite reply in French when someone tells you "Merci"?',
        options: ['Pardon', 'De rien', 'Au revoir', 'Bonjour'],
        correctOptionIndex: 1,
        explanation: '"De rien" means "You\'re welcome" (literally "it is nothing").',
      ),
      P4InteractiveExercise(
        prompt: 'At the end of Friday classes, what can you say to friends you will see tomorrow?',
        options: ['À demain!', 'Pardon!', 'Bonjour!', 'Comment allez-vous?'],
        correctOptionIndex: 0,
        explanation: '"À demain" means "See you tomorrow".',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'Au revoir', english: 'Goodbye (Universal & Polite)'),
          DrillPair(french: 'À bientôt', english: 'See you soon'),
          DrillPair(french: 'À demain', english: 'See you tomorrow'),
          DrillPair(french: 'S\'il vous plaît', english: 'Please (Formal / to Adults)'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word (Goodbye (Universal & Polite)):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: ['Au revoir', 'À bientôt', 'À demain', 'S\'il vous plaît'],
        correctGapWord: 'Au revoir',
        explanation: 'Bravo ! "Au revoir" means "Goodbye (Universal & Polite)".',
      ),
      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),
    ],
    evaluationQuestions: [
      P4EvaluationQuestion(
        question: 'What is the most common French word for "Goodbye"?',
        answer: 'Au revoir.',
        hint: 'Standard polite farewell.',
      ),
      P4EvaluationQuestion(
        question: 'You will see your friend in class tomorrow. What can you say instead of "Au revoir"?',
        answer: 'À demain! (See you tomorrow).',
        hint: 'Farewell for the next day.',
      ),
      P4EvaluationQuestion(
        question: 'What is the "magic word" you say when you ask for a pencil?',
        answer: 'S\'il te plaît (to a friend) or S\'il vous plaît (to an adult).',
        hint: 'French word for please.',
      ),
      P4EvaluationQuestion(
        question: 'What does "Merci" mean?',
        answer: 'Thank you.',
        hint: 'Magic word of gratitude.',
      ),
      P4EvaluationQuestion(
        question: 'What is "la bise" in French culture?',
        answer: 'A French custom of greeting friends and family by touching cheeks lightly.',
        hint: 'French cheek greeting custom.',
      ),
      P4EvaluationQuestion(
        question: 'If you step on someone\'s foot in class, which word do you say?',
        answer: 'Pardon! (or "Excusez-moi / Désolé(e)").',
        hint: 'Magic word for apologies.',
      ),
    ],
    assignmentTasks: [
      P4AssignmentTask(
        category: 'Matching Exercise',
        instruction: 'In your notebook, match: Merci -> Thank you | Pardon -> Sorry / Excuse me | Au revoir -> Goodbye | S\'il vous plaît -> Please.',
      ),
      P4AssignmentTask(
        category: 'Written Request',
        instruction: 'Write the French phrase you would use when you want to ask your teacher for help politely: "S\'il vous plaît, Madame/Monsieur."',
      ),
      P4AssignmentTask(
        category: 'Drawing Practical',
        instruction: 'Draw two simple stick-figure friends waving to each other with a speech bubble saying "Au revoir!".',
      ),
    ],
    patternData: {
      'magicWords': [
        {'french': 'S\'il vous plaît', 'meaning': 'Please (Formal)', 'category': 'Request', 'audio': 'sil_vous_plait'},
        {'french': 'Merci', 'meaning': 'Thank you', 'category': 'Gratitude', 'audio': 'merci'},
        {'french': 'De rien', 'meaning': 'You\'re welcome', 'category': 'Gratitude', 'audio': 'de_rien'},
        {'french': 'Pardon', 'meaning': 'Excuse me / Sorry', 'category': 'Courtesy', 'audio': 'pardon'},
        {'french': 'Au revoir', 'meaning': 'Goodbye', 'category': 'Farewell', 'audio': 'au_revoir'},
      ]
    },
  ),

  // ==========================================
  // WEEK 4: INTRODUCING ONESELF - PART 1
  // ==========================================
  P4Lesson(
    term: 1,
    week: 4,
    topic: 'Se présenter (Introducing Oneself) - Part 1',
    subtitle: 'Stating Your Name, Nationality & Subject Pronouns (Je, Tu, Il, Elle)',
    patternType: P4PatternType.identitySentenceLab,
    teachingStyle: TeachingStyle.interactiveStudio,
    objectives: [
      'Introduce oneself by stating one\'s name in French using "Je m\'appelle...".',
      'Ask someone their name in both informal and formal contexts.',
      'State one\'s nationality accurately as a boy ("Nigérian") or girl ("Nigériane").',
      'List and identify the four basic subject pronouns (Je, Tu, Il, Elle).',
    ],
    culturalInsight:
        'In French, words change depending on gender. A boy proudly says "Je suis Nigérian", while a girl adds an "e" and says "Je suis Nigériane". Paying attention to gender is a key part of speaking beautiful French!',
    vocabItems: [
      P4VocabItem(
        french: 'Je m\'appelle...',
        phonetics: 'zhuh mah-pell...',
        english: 'My name is... (Literally: "I call myself...")',
        usageNote: 'The most natural French way to introduce your name.',
        icon: Icons.badge_rounded,
        audioKey: 'je_mappelle',
      ),
      P4VocabItem(
        french: 'Comment tu t\'appelles?',
        phonetics: 'koh-mohn too tah-pell?',
        english: 'What is your name? (Informal / to peers)',
        usageNote: 'Use with classmates and children.',
        icon: Icons.help_outline_rounded,
        audioKey: 'comment_tu_tappelles',
      ),
      P4VocabItem(
        french: 'Comment vous appelez-vous?',
        phonetics: 'koh-mohn voo zah-play voo?',
        english: 'What is your name? (Formal / to adults)',
        usageNote: 'Use with adults and teachers.',
        icon: Icons.person_search_rounded,
        audioKey: 'comment_vous_appelez_vous',
      ),
      P4VocabItem(
        french: 'Je suis Nigérian',
        phonetics: 'zhuh swee nee-zhay-ree-ahn',
        english: 'I am Nigerian (Boy speaking - Masculine)',
        usageNote: 'Used by boys.',
        icon: Icons.flag_rounded,
        audioKey: 'je_suis_nigerian',
        imageAsset: 'assets/images/p4_term1/garcon_avatar.png',
      ),
      P4VocabItem(
        french: 'Je suis Nigériane',
        phonetics: 'zhuh swee nee-zhay-ree-ahn',
        english: 'I am Nigerian (Girl speaking - Feminine)',
        usageNote: 'Used by girls (notice the final -e).',
        icon: Icons.flag_rounded,
        audioKey: 'je_suis_nigeriane',
        imageAsset: 'assets/images/p4_term1/fille_avatar.png',
      ),
      P4VocabItem(
        french: 'Je',
        phonetics: 'zhuh',
        english: 'I (First person singular)',
        usageNote: 'Subject pronoun for self.',
        icon: Icons.person_rounded,
        audioKey: 'pronom_je',
      ),
      P4VocabItem(
        french: 'Tu',
        phonetics: 'too',
        english: 'You (Informal singular)',
        usageNote: 'Subject pronoun for one friend.',
        icon: Icons.people_outline_rounded,
        audioKey: 'pronom_tu',
      ),
      P4VocabItem(
        french: 'Il',
        phonetics: 'eel',
        english: 'He (Third person masculine)',
        usageNote: 'Referring to a boy or male.',
        icon: Icons.man_rounded,
        audioKey: 'pronom_il',
      ),
      P4VocabItem(
        french: 'Elle',
        phonetics: 'ell',
        english: 'She (Third person feminine)',
        usageNote: 'Referring to a girl or female.',
        icon: Icons.woman_rounded,
        audioKey: 'pronom_elle',
      ),
    ],
    classworkExercises: [
      P4InteractiveExercise(
        prompt: 'How does a girl state her nationality in French?',
        options: ['Je suis Nigérian', 'Je suis Nigériane', 'Je m\'appelle Nigeria', 'Il est Nigérian'],
        correctOptionIndex: 1,
        explanation: 'Feminine nationality adds an \'e\' at the end: "Je suis Nigériane".',
      ),
      P4InteractiveExercise(
        prompt: 'Which French pronoun means "She"?',
        options: ['Il', 'Tu', 'Elle', 'Je'],
        correctOptionIndex: 2,
        explanation: '"Elle" means "She", while "Il" means "He".',
      ),
      P4InteractiveExercise(
        prompt: 'Complete the sentence: "Comment ____ t\'appelles?"',
        options: ['je', 'tu', 'il', 'elle'],
        correctOptionIndex: 1,
        explanation: 'The informal question is "Comment tu t\'appelles?".',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'Je m\'appelle...', english: 'My name is... (Literally:'),
          DrillPair(french: 'Comment tu t\'appelles?', english: 'What is your name? (Informal / to peers)'),
          DrillPair(french: 'Comment vous appelez-vous?', english: 'What is your name? (Formal / to adults)'),
          DrillPair(french: 'Je suis Nigérian', english: 'I am Nigerian (Boy speaking - Masculine)'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word (My name is... (Literally:):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: ['Je m\'appelle...', 'Comment tu t\'appelles?', 'Comment vous appelez-vous?', 'Je suis Nigérian'],
        correctGapWord: 'Je m\'appelle...',
        explanation: 'Bravo ! "Je m\'appelle..." means "My name is... (Literally:".',
      ),
      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),
    ],
    evaluationQuestions: [
      P4EvaluationQuestion(
        question: 'How do you say "My name is Bola" in French?',
        answer: 'Je m\'appelle Bola.',
        hint: 'Use the "Je m\'appelle" phrase.',
      ),
      P4EvaluationQuestion(
        question: 'You meet a new student in your class. How do you ask for their name?',
        answer: 'Comment tu t\'appelles?',
        hint: 'Informal question for a peer.',
      ),
      P4EvaluationQuestion(
        question: 'If you are a girl, how do you say "I am Nigerian" in French?',
        answer: 'Je suis Nigériane.',
        hint: 'Add the feminine \'e\' at the end.',
      ),
      P4EvaluationQuestion(
        question: 'What is the French pronoun for "He"?',
        answer: 'Il.',
        hint: 'Short two-letter word.',
      ),
      P4EvaluationQuestion(
        question: 'What is the French pronoun for "She"?',
        answer: 'Elle.',
        hint: 'Feminine singular pronoun.',
      ),
      P4EvaluationQuestion(
        question: 'Complete this sentence in French: "____ m\'appelle Tunde."',
        answer: 'Je (Je m\'appelle Tunde).',
        hint: 'The pronoun for "I".',
      ),
    ],
    assignmentTasks: [
      P4AssignmentTask(
        category: 'Written Self-Introduction',
        instruction: 'Write a sentence introducing yourself with your name: "Je m\'appelle [Your Name]."',
      ),
      P4AssignmentTask(
        category: 'Written Nationality',
        instruction: 'Write a sentence stating your nationality: "Je suis Nigérian" (if boy) or "Je suis Nigériane" (if girl).',
      ),
      P4AssignmentTask(
        category: 'Pronoun Listing',
        instruction: 'Write down the four French subject pronouns and their English meanings: Je (I), Tu (You), Il (He), Elle (She).',
      ),
    ],
    patternData: {
      'pronouns': [
        {'french': 'Je', 'english': 'I', 'example': 'Je m\'appelle Amina', 'audio': 'pronom_je'},
        {'french': 'Tu', 'english': 'You (informal)', 'example': 'Tu t\'appelles Kofi', 'audio': 'pronom_tu'},
        {'french': 'Il', 'english': 'He', 'example': 'Il est Nigérian', 'audio': 'pronom_il'},
        {'french': 'Elle', 'english': 'She', 'example': 'Elle est Nigériane', 'audio': 'pronom_elle'},
      ]
    },
  ),

  // ==========================================
  // WEEK 5: MID-TERM REVIEW & ORAL CHECK
  // ==========================================
  P4Lesson(
    term: 1,
    week: 5,
    topic: 'Révision de Mi-Trimestre (Mid-Term Review)',
    subtitle: 'Comprehensive Oral & Visual Review of Weeks 1 to 4',
    patternType: P4PatternType.midTermReview,
    teachingStyle: TeachingStyle.phoneticSoundboard,
    objectives: [
      'Review all greetings (formal and informal) for different times of day.',
      'Demonstrate fluency in self-introductions (name and nationality).',
      'Accurately recite the French alphabet from A to E with correct mouth shape.',
      'Show mastery of polite expressions (Les Mots Magiques).',
    ],
    culturalInsight:
        'Mid-Term is an exciting opportunity for the whole class to practice French together through interactive board drills, roleplay dialogues, and oral team checkpoints!',
    vocabItems: [
      P4VocabItem(
        french: 'Bonjour / Bonsoir / Bonne nuit',
        phonetics: 'bohn-zhoor / bohn-swahr / bun nwee',
        english: 'Greetings across the day',
        usageNote: 'Morning, evening, and bedtime.',
        icon: Icons.access_time_rounded,
        audioKey: 'bonjour',
      ),
      P4VocabItem(
        french: 'Comment ça va? -> Très bien, merci!',
        phonetics: 'koh-mohn sah vah -> treh byehn, mair-see',
        english: 'Inquiring & responding to well-being',
        usageNote: 'Everyday friendly dialogue.',
        icon: Icons.forum_rounded,
        audioKey: 'tres_bien_merci',
      ),
      P4VocabItem(
        french: 'Je m\'appelle... / Je suis Nigérian(e)',
        phonetics: 'zhuh mah-pell... / zhuh swee nee-zhay-ree-ahn(e)',
        english: 'Personal identity statement',
        usageNote: 'Full self-introduction.',
        icon: Icons.person_pin_rounded,
        audioKey: 'je_mappelle',
      ),
    ],
    classworkExercises: [
      P4InteractiveExercise(
        prompt: 'Put the conversation in order: (1) Ça va bien merci (2) Bonjour (3) Comment ça va?',
        options: ['1 -> 2 -> 3', '2 -> 3 -> 1', '3 -> 2 -> 1', '2 -> 1 -> 3'],
        correctOptionIndex: 1,
        explanation: 'Natural flow: 2. Bonjour -> 3. Comment ça va? -> 1. Ça va bien, merci.',
      ),
      P4InteractiveExercise(
        prompt: 'Which country is Nigeria\'s French-speaking neighbor to the North?',
        options: ['Le Cameroun', 'Le Bénin', 'Le Niger', 'Le Togo'],
        correctOptionIndex: 2,
        explanation: 'Niger Republic (Le Niger) is directly North of Nigeria.',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'Bonjour / Bonsoir / Bonne nuit', english: 'Greetings across the day'),
          DrillPair(french: 'Comment ça va? -> Très bien, merci!', english: 'Inquiring & responding to well-being'),
          DrillPair(french: 'Je m\'appelle... / Je suis Nigérian(e)', english: 'Personal identity statement'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word (Greetings across the day):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: ['Bonjour / Bonsoir / Bonne nuit', 'Comment ça va? -> Très bien, merci!', 'Je m\'appelle... / Je suis Nigérian(e)', 'oui'],
        correctGapWord: 'Bonjour / Bonsoir / Bonne nuit',
        explanation: 'Bravo ! "Bonjour / Bonsoir / Bonne nuit" means "Greetings across the day".',
      ),
      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),
      P4InteractiveExercise(
        type: DrillType.tapTranslation,
        prompt: 'What does "Comment ça va? -> Très bien, merci!" mean in English?',
        options: ['Inquiring & responding to well-being', 'Greetings across the day', 'Personal identity statement', 'to speak kindly'],
        correctOptionIndex: 0,
        explanation: 'Parfait ! "Comment ça va? -> Très bien, merci!" translates to "Inquiring & responding to well-being".',
      ),
    ],
    evaluationQuestions: [
      P4EvaluationQuestion(
        question: 'Recite the full greeting sequence: greet an adult, ask how they are, and reply when asked.',
        answer: '"Bonjour Madame/Monsieur! Comment allez-vous?" -> "Très bien, merci. Et vous?"',
        hint: 'Formal greeting flow.',
      ),
      P4EvaluationQuestion(
        question: 'Introduce yourself completely with your name and nationality.',
        answer: '"Bonjour! Je m\'appelle [Name], je suis Nigérian(e)."',
        hint: 'Name + Nationality.',
      ),
      P4EvaluationQuestion(
        question: 'Name all 4 French-speaking border countries of Nigeria.',
        answer: 'Le Bénin, Le Niger, Le Tchad, Le Cameroun.',
        hint: 'West, North, North-East, East.',
      ),
      P4EvaluationQuestion(
        question: 'Recite the first 5 letters of the French alphabet (A, B, C, D, E).',
        answer: 'A (ah), B (bay), C (say), D (day), E (uh).',
        hint: 'Phonetic sounds.',
      ),
    ],
    assignmentTasks: [
      P4AssignmentTask(
        category: 'Mid-Term Study',
        instruction: 'Review your French notebook notes for Weeks 1 to 4 and practice saying all phrases to your family at home.',
      ),
    ],
  ),

  // ==========================================
  // WEEK 6: MID-TERM BREAK
  // ==========================================
  P4Lesson(
    term: 1,
    week: 6,
    topic: 'Pause de Mi-Trimestre (Mid-Term Break)',
    subtitle: 'Holiday & Rest Period — Repos et Détente',
    patternType: P4PatternType.midTermBreak,
    teachingStyle: TeachingStyle.storyNarrative,
    objectives: [
      'Rest, recharge, and enjoy the school break!',
      'Optionally listen to French songs like "Frère Jacques" or practice greetings at home.',
    ],
    culturalInsight:
        'Taking a short rest helps young learners absorb everything they\'ve practiced so they return fresh and ready for numbers, ages, and leave-taking!',
    vocabItems: [
      P4VocabItem(
        french: 'Bonnes vacances!',
        phonetics: 'bun vah-kahns',
        english: 'Have a good break / holiday!',
        usageNote: 'Said when someone is going on a rest period.',
        icon: Icons.beach_access_rounded,
        audioKey: 'bonnes_vacances',
      ),
      P4VocabItem(
        french: 'Le repos',
        phonetics: 'luh ruh-poh',
        english: 'Rest / Relaxation',
        usageNote: 'Taking time to rest.',
        icon: Icons.self_improvement_rounded,
      ),
    ],
    classworkExercises: [
      P4InteractiveExercise(
        prompt: 'What French wish means "Have a good holiday / break"?',
        options: ['Bonsoir!', 'Bonnes vacances!', 'Au revoir!', 'De rien!'],
        correctOptionIndex: 1,
        explanation: '"Bonnes vacances!" is the joyful French wish for a great holiday or break.',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'Bonnes vacances!', english: 'Have a good break / holiday!'),
          DrillPair(french: 'Le repos', english: 'Rest / Relaxation'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word (Have a good break / holiday!):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: ['Bonnes vacances!', 'Le repos', 'oui', 'oui'],
        correctGapWord: 'Bonnes vacances!',
        explanation: 'Bravo ! "Bonnes vacances!" means "Have a good break / holiday!".',
      ),
      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),
      P4InteractiveExercise(
        type: DrillType.tapTranslation,
        prompt: 'What does "Le repos" mean in English?',
        options: ['Rest / Relaxation', 'Have a good break / holiday!', 'to speak kindly', 'to speak kindly'],
        correctOptionIndex: 0,
        explanation: 'Parfait ! "Le repos" translates to "Rest / Relaxation".',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'Bonnes vacances!', english: 'Have a good break / holiday!'),
          DrillPair(french: 'Le repos', english: 'Rest / Relaxation'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
    ],
    evaluationQuestions: [
      P4EvaluationQuestion(
        question: 'What friendly phrase can you say to classmates before the break?',
        answer: 'Bonnes vacances! (Have a good break!).',
        hint: 'Holiday wish.',
      ),
    ],
    assignmentTasks: [
      P4AssignmentTask(
        category: 'Rest & Fun',
        instruction: 'Enjoy your mid-term break with family!',
      ),
    ],
  ),

  // ==========================================
  // WEEK 7: INTRODUCING ONESELF - PART 2 (AGE, NUMBERS & GENDER)
  // ==========================================
  P4Lesson(
    term: 1,
    week: 7,
    topic: 'Se présenter (Introducing Oneself) - Part 2',
    subtitle: 'Counting 1 to 20 in French, Stating Age ("J\'ai ... ans") & Gender',
    patternType: P4PatternType.numberAndAgeStudio,
    teachingStyle: TeachingStyle.interactiveStudio,
    objectives: [
      'Count fluently from 1 to 20 in French with clear pronunciation.',
      'State one\'s age in French using the verb avoir ("J\'ai ... ans").',
      'Ask a friend "How old are you?" ("Quel âge as-tu?").',
      'Identify one\'s gender in French: "Je suis un garçon" (boy) or "Je suis une fille" (girl).',
    ],
    culturalInsight:
        'In English, we say "I AM 9 years old", but in French, we use the verb "avoir" (to have) and say "J\'ai 9 ans" (literally: "I have 9 years"). French also uses "un garçon" for a boy and "une fille" for a girl.',
    vocabItems: [
      P4VocabItem(
        french: '1-5: un, deux, trois, quatre, cinq',
        phonetics: 'uhn, duh, twah, kat-ruh, sank',
        english: 'Numbers 1 to 5',
        usageNote: 'Foundation counting.',
        icon: Icons.looks_one_rounded,
        audioKey: 'num_1',
      ),
      P4VocabItem(
        french: '6-10: six, sept, huit, neuf, dix',
        phonetics: 'sees, set, weet, nuhf, dees',
        english: 'Numbers 6 to 10',
        usageNote: 'Notice "sept" has a silent p, "huit" has silent h.',
        icon: Icons.looks_two_rounded,
        audioKey: 'num_6',
      ),
      P4VocabItem(
        french: '11-15: onze, douze, treize, quatorze, quinze',
        phonetics: 'ohnz, dooz, trehz, kah-torz, kanz',
        english: 'Numbers 11 to 15',
        usageNote: 'Rhythmic teen numbers.',
        icon: Icons.looks_3_rounded,
        audioKey: 'num_11',
      ),
      P4VocabItem(
        french: '16-20: seize, dix-sept, dix-huit, dix-neuf, vingt',
        phonetics: 'sehz, dee-set, deez-weet, deez-nuhf, van',
        english: 'Numbers 16 to 20',
        usageNote: '17-19 combine "dix" + single digit; 20 is "vingt".',
        icon: Icons.looks_4_rounded,
        audioKey: 'num_20',
      ),
      P4VocabItem(
        french: 'Quel âge as-tu?',
        phonetics: 'kel ahzh ah too?',
        english: 'How old are you? (Informal)',
        usageNote: 'Question to ask someone\'s age.',
        icon: Icons.cake_rounded,
        audioKey: 'quel_age_as_tu',
      ),
      P4VocabItem(
        french: 'J\'ai neuf ans / J\'ai dix ans',
        phonetics: 'zhay nuhf ahn / zhay dees ahn',
        english: 'I am 9 years old / I am 10 years old',
        usageNote: 'J\'ai is short for Je + ai (I have).',
        icon: Icons.celebration_rounded,
        audioKey: 'jai_neuf_ans',
      ),
      P4VocabItem(
        french: 'Je suis un garçon',
        phonetics: 'zhuh swee uhn gar-sohn',
        english: 'I am a boy (Masculine)',
        usageNote: 'Uses "un" before masculine nouns.',
        icon: Icons.boy_rounded,
        audioKey: 'je_suis_un_garcon',
        imageAsset: 'assets/images/p4_term1/garcon_avatar.png',
      ),
      P4VocabItem(
        french: 'Je suis une fille',
        phonetics: 'zhuh swee oon fee-yuh',
        english: 'I am a girl (Feminine)',
        usageNote: 'Uses "une" before feminine nouns.',
        icon: Icons.girl_rounded,
        audioKey: 'je_suis_une_fille',
        imageAsset: 'assets/images/p4_term1/fille_avatar.png',
      ),
    ],
    classworkExercises: [
      P4InteractiveExercise(
        prompt: 'Which number is "Douze" in English?',
        options: ['Two (2)', 'Ten (10)', 'Twelve (12)', 'Twenty (20)'],
        correctOptionIndex: 2,
        explanation: '"Douze" is 12 in French. 2 is "deux", 10 is "dix", and 20 is "vingt".',
      ),
      P4InteractiveExercise(
        prompt: 'How do you ask a friend "How old are you?" in French?',
        options: ['Comment ça va?', 'Comment tu t\'appelles?', 'Quel âge as-tu?', 'Où habites-tu?'],
        correctOptionIndex: 2,
        explanation: '"Quel âge as-tu?" asks for age using the verb avoir.',
      ),
      P4InteractiveExercise(
        prompt: 'Complete: "J\'ai neuf ____."',
        options: ['heures', 'ans', 'garçons', 'filles'],
        correctOptionIndex: 1,
        explanation: 'In French, age is stated as "J\'ai ... ans" (years).',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: '1-5: un, deux, trois, quatre, cinq', english: 'Numbers 1 to 5'),
          DrillPair(french: '6-10: six, sept, huit, neuf, dix', english: 'Numbers 6 to 10'),
          DrillPair(french: '11-15: onze, douze, treize, quatorze, quinze', english: 'Numbers 11 to 15'),
          DrillPair(french: '16-20: seize, dix-sept, dix-huit, dix-neuf, vingt', english: 'Numbers 16 to 20'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word (Numbers 1 to 5):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: ['1-5: un, deux, trois, quatre, cinq', '6-10: six, sept, huit, neuf, dix', '11-15: onze, douze, treize, quatorze, quinze', '16-20: seize, dix-sept, dix-huit, dix-neuf, vingt'],
        correctGapWord: '1-5: un, deux, trois, quatre, cinq',
        explanation: 'Bravo ! "1-5: un, deux, trois, quatre, cinq" means "Numbers 1 to 5".',
      ),
      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),
    ],
    evaluationQuestions: [
      P4EvaluationQuestion(
        question: 'Count from un to cinq (1 to 5) in French.',
        answer: 'Un, deux, trois, quatre, cinq.',
        hint: '1 to 5.',
      ),
      P4EvaluationQuestion(
        question: 'What is the French word for the number 10?',
        answer: 'Dix (pronounced "dees").',
        hint: 'Number 10.',
      ),
      P4EvaluationQuestion(
        question: 'Translate this sentence: "J\'ai huit ans."',
        answer: 'I am eight years old.',
        hint: 'Huit = 8.',
      ),
      P4EvaluationQuestion(
        question: 'How does a boy say "I am a boy" in French?',
        answer: 'Je suis un garçon.',
        hint: 'Garçon = boy.',
      ),
      P4EvaluationQuestion(
        question: 'How does a girl say "I am a girl" in French?',
        answer: 'Je suis une fille.',
        hint: 'Fille = girl.',
      ),
      P4EvaluationQuestion(
        question: 'Spell the number 4 using French letters.',
        answer: 'Q - U - A - T - R - E (Quatre).',
        hint: 'Letter by letter spelling.',
      ),
    ],
    assignmentTasks: [
      P4AssignmentTask(
        category: 'Written Numbers',
        instruction: 'Write the following numbers in French words in your notebook: 5 (cinq), 12 (douze), 20 (vingt).',
      ),
      P4AssignmentTask(
        category: 'Age Sentence',
        instruction: 'Write a complete sentence in French stating how old you are: "J\'ai ____ ans."',
      ),
      P4AssignmentTask(
        category: 'Translation',
        instruction: 'Translate this sentence into English: "Je suis une fille." (I am a girl).',
      ),
    ],
    patternData: {
      'numbers': [
        {'digit': 1, 'word': 'Un', 'sound': 'uhn', 'audio': 'num_1'},
        {'digit': 2, 'word': 'Deux', 'sound': 'duh', 'audio': 'num_2'},
        {'digit': 3, 'word': 'Trois', 'sound': 'twah', 'audio': 'num_3'},
        {'digit': 4, 'word': 'Quatre', 'sound': 'kat-ruh', 'audio': 'num_4'},
        {'digit': 5, 'word': 'Cinq', 'sound': 'sank', 'audio': 'num_5'},
        {'digit': 6, 'word': 'Six', 'sound': 'sees', 'audio': 'num_6'},
        {'digit': 7, 'word': 'Sept', 'sound': 'set', 'audio': 'num_7'},
        {'digit': 8, 'word': 'Huit', 'sound': 'weet', 'audio': 'num_8'},
        {'digit': 9, 'word': 'Neuf', 'sound': 'nuhf', 'audio': 'num_9'},
        {'digit': 10, 'word': 'Dix', 'sound': 'dees', 'audio': 'num_10'},
        {'digit': 11, 'word': 'Onze', 'sound': 'ohnz', 'audio': 'num_11'},
        {'digit': 12, 'word': 'Douze', 'sound': 'dooz', 'audio': 'num_12'},
        {'digit': 13, 'word': 'Treize', 'sound': 'trehz', 'audio': 'num_13'},
        {'digit': 14, 'word': 'Quatorze', 'sound': 'kah-torz', 'audio': 'num_14'},
        {'digit': 15, 'word': 'Quinze', 'sound': 'kanz', 'audio': 'num_15'},
        {'digit': 16, 'word': 'Seize', 'sound': 'sehz', 'audio': 'num_16'},
        {'digit': 17, 'word': 'Dix-sept', 'sound': 'dee-set', 'audio': 'num_17'},
        {'digit': 18, 'word': 'Dix-huit', 'sound': 'deez-weet', 'audio': 'num_18'},
        {'digit': 19, 'word': 'Dix-neuf', 'sound': 'deez-nuhf', 'audio': 'num_19'},
        {'digit': 20, 'word': 'Vingt', 'sound': 'van', 'audio': 'num_20'},
      ]
    },
  ),

  // ==========================================
  // WEEK 8: TAKING LEAVE - PART 1 (TIMING & WELL-WISHES)
  // ==========================================
  P4Lesson(
    term: 1,
    week: 8,
    topic: 'Prendre congé (Taking Leave) - Part 1',
    subtitle: 'Time-Specific Goodbyes & Wishing Someone Well (Les Souhaits)',
    patternType: P4PatternType.farewellTimeMatcher,
    teachingStyle: TeachingStyle.dialogueConversation,
    objectives: [
      'List three different ways to say goodbye based on time.',
      'Use expressions to wish someone a good day, weekend, or holiday.',
      'Match the correct farewell expression to the classroom situation.',
    ],
    culturalInsight:
        'French speakers love to add a kind parting wish when saying goodbye! Saying "Bonne journée!" (Have a good day) or "Bon week-end!" (Have a good weekend) shows thoughtfulness and warmth in every interaction.',
    vocabItems: [
      P4VocabItem(
        french: 'À tout à l\'heure!',
        phonetics: 'ah toot ah luhr',
        english: 'See you later! (Later the same day)',
        usageNote: 'When you will meet again today after break time.',
        icon: Icons.timer_rounded,
        audioKey: 'a_tout_a_lheure',
      ),
      P4VocabItem(
        french: 'À ce soir!',
        phonetics: 'ah suh swahr',
        english: 'See you tonight!',
        usageNote: 'If you have plans to meet in the evening.',
        icon: Icons.dark_mode_rounded,
        audioKey: 'a_ce_soir',
      ),
      P4VocabItem(
        french: 'À la prochaine!',
        phonetics: 'ah lah proh-shen',
        english: 'Until next time!',
        usageNote: 'Friendly phrase when next meeting date is flexible.',
        icon: Icons.shuffle_rounded,
        audioKey: 'a_la_prochaine',
      ),
      P4VocabItem(
        french: 'Bonne journée!',
        phonetics: 'bun zhoor-nay',
        english: 'Have a good day!',
        usageNote: 'Polite daytime departure wish.',
        icon: Icons.light_mode_rounded,
        audioKey: 'bonne_journee',
      ),
      P4VocabItem(
        french: 'Bon week-end!',
        phonetics: 'bohn weekend',
        english: 'Have a good weekend!',
        usageNote: 'Said on Friday afternoon before leaving school.',
        icon: Icons.weekend_rounded,
        audioKey: 'bon_weekend',
      ),
      P4VocabItem(
        french: 'Bonne soirée!',
        phonetics: 'bun swah-ray',
        english: 'Have a good evening!',
        usageNote: 'Said when leaving someone in the evening.',
        icon: Icons.nightlife_rounded,
        audioKey: 'bonne_soiree',
      ),
      P4VocabItem(
        french: 'Adieu',
        phonetics: 'ah-dyuh',
        english: 'Farewell (Final / Formal)',
        usageNote: 'Used rarely when not expecting to meet again for a very long time.',
        icon: Icons.door_front_door_rounded,
        audioKey: 'adieu',
      ),
    ],
    classworkExercises: [
      P4InteractiveExercise(
        prompt: 'It is 2:00 PM on Friday afternoon and school closes. What do you say to your teacher?',
        options: ['Bonsoir!', 'Bon week-end, Madame/Monsieur!', 'À ce soir!', 'Adieu!'],
        correctOptionIndex: 1,
        explanation: '"Bon week-end!" wishes someone a great weekend on Friday dismissal.',
      ),
      P4InteractiveExercise(
        prompt: 'You step out of class for a quick break and will return in 15 minutes. What can you say?',
        options: ['À tout à l\'heure!', 'Adieu!', 'Bonne nuit!', 'Bon week-end!'],
        correctOptionIndex: 0,
        explanation: '"À tout à l\'heure!" means see you later on the same day.',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'À tout à l\'heure!', english: 'See you later! (Later the same day)'),
          DrillPair(french: 'À ce soir!', english: 'See you tonight!'),
          DrillPair(french: 'À la prochaine!', english: 'Until next time!'),
          DrillPair(french: 'Bonne journée!', english: 'Have a good day!'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word (See you later! (Later the same day)):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: ['À tout à l\'heure!', 'À ce soir!', 'À la prochaine!', 'Bonne journée!'],
        correctGapWord: 'À tout à l\'heure!',
        explanation: 'Bravo ! "À tout à l\'heure!" means "See you later! (Later the same day)".',
      ),
      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),
      P4InteractiveExercise(
        type: DrillType.tapTranslation,
        prompt: 'What does "À ce soir!" mean in English?',
        options: ['See you tonight!', 'See you later! (Later the same day)', 'Until next time!', 'Have a good day!'],
        correctOptionIndex: 0,
        explanation: 'Parfait ! "À ce soir!" translates to "See you tonight!".',
      ),
    ],
    evaluationQuestions: [
      P4EvaluationQuestion(
        question: 'What does "À tout à l\'heure" mean and when do you use it?',
        answer: 'It means "See you later today" (used when you will meet again later the same day, like after break).',
        hint: 'Same-day meeting.',
      ),
      P4EvaluationQuestion(
        question: 'Your teacher is leaving school at 3 PM. What polite wish can you say?',
        answer: 'Bonne journée! (Have a good day!).',
        hint: 'Polite daytime wish.',
      ),
      P4EvaluationQuestion(
        question: 'Translate "Have a good weekend" to French.',
        answer: 'Bon week-end!',
        hint: 'Friday departure phrase.',
      ),
      P4EvaluationQuestion(
        question: 'True or False: You can use "Salut" to say goodbye to your friend.',
        answer: 'True (Salut means both Hi and Bye among friends).',
        hint: 'Casual greeting for friends.',
      ),
      P4EvaluationQuestion(
        question: 'If you are saying goodbye to a friend on Thursday and you have plans to play together on Friday evening, what could you say?',
        answer: 'À demain! (See you tomorrow) or À ce soir! (when meeting in evening).',
        hint: 'Next day / evening meeting phrase.',
      ),
    ],
    assignmentTasks: [
      P4AssignmentTask(
        category: 'Written Farewells',
        instruction: 'Write the French phrase you would use to wish your friend a good day as you go home from school (Bonne journée!).',
      ),
      P4AssignmentTask(
        category: 'Written Situations',
        instruction: 'Write the French phrase for "See you later" (assuming you will meet again the same day): "À tout à l\'heure!"',
      ),
      P4AssignmentTask(
        category: 'Drawing & Writing',
        instruction: 'Draw a simple picture of students happily leaving school on a Friday and write a fitting French caption (e.g. "Bon week-end!").',
      ),
    ],
    patternData: {
      'situations': [
        {'time': 'Friday closing bell (3:00 PM)', 'phrase': 'Bon week-end!', 'meaning': 'Have a good weekend!', 'audio': 'bon_weekend'},
        {'time': 'Leaving after morning break (11:00 AM)', 'phrase': 'À tout à l\'heure!', 'meaning': 'See you later today!', 'audio': 'a_tout_a_lheure'},
        {'time': 'Leaving at dismissal (2:00 PM)', 'phrase': 'À demain / Bonne journée!', 'meaning': 'See you tomorrow / Have a good day!', 'audio': 'bonne_journee'},
        {'time': 'Leaving evening study (6:30 PM)', 'phrase': 'Bonne soirée!', 'meaning': 'Have a good evening!', 'audio': 'bonne_soiree'},
      ]
    },
  ),

  // ==========================================
  // WEEK 9: TAKING LEAVE - PART 2 (GRATITUDE & DIALOGUES)
  // ==========================================
  P4Lesson(
    term: 1,
    week: 9,
    topic: 'Prendre congé (Taking Leave) - Part 2',
    subtitle: 'Expressing Gratitude on Departure & Constructing Full Conversations',
    patternType: P4PatternType.dialogueSequencer,
    teachingStyle: TeachingStyle.dialogueConversation,
    objectives: [
      'Express gratitude when leaving a place ("Merci beaucoup", "Merci pour tout").',
      'Construct a simple dialogue combining greetings and farewells in correct order.',
      'Demonstrate polite behavior when taking leave.',
    ],
    culturalInsight:
        'A complete, polite conversation flows naturally: (1) Greeting -> (2) Asking how someone is -> (3) Stating reason or expressing thanks -> (4) Parting farewell & well-wish.',
    vocabItems: [
      P4VocabItem(
        french: 'Merci beaucoup',
        phonetics: 'mair-see boh-koo',
        english: 'Thank you very much',
        usageNote: 'Strong expression of gratitude.',
        icon: Icons.favorite_rounded,
        audioKey: 'merci_beaucoup',
      ),
      P4VocabItem(
        french: 'Merci pour tout',
        phonetics: 'mair-see poor too',
        english: 'Thank you for everything',
        usageNote: 'Great when leaving someone\'s home or a classroom event.',
        icon: Icons.celebration_rounded,
        audioKey: 'merci_pour_tout',
      ),
      P4VocabItem(
        french: 'Merci bien',
        phonetics: 'mair-see byehn',
        english: 'Thanks a lot',
        usageNote: 'Another common way to thank someone.',
        icon: Icons.thumb_up_rounded,
        audioKey: 'merci_bien',
      ),
      P4VocabItem(
        french: 'Je dois partir',
        phonetics: 'zhuh dwah pahr-teer',
        english: 'I must go / leave',
        usageNote: 'Polite way to signal departure.',
        icon: Icons.directions_walk_rounded,
        audioKey: 'je_dois_partir',
      ),
    ],
    classworkExercises: [
      P4InteractiveExercise(
        prompt: 'You visited your friend\'s birthday party and are about to go home. What do you say to their parents?',
        options: ['Merci pour tout! Au revoir!', 'Bonjour!', 'Comment tu t\'appelles?', 'Bonne nuit!'],
        correctOptionIndex: 0,
        explanation: '"Merci pour tout! Au revoir!" thanks the host for everything before leaving.',
      ),
      P4InteractiveExercise(
        prompt: 'Arrange the sequence: (A) Au revoir (B) Bonjour (C) Ça va?',
        options: ['A -> B -> C', 'B -> C -> A', 'C -> B -> A', 'B -> A -> C'],
        correctOptionIndex: 1,
        explanation: 'Start with greeting (Bonjour) -> Ask well-being (Ça va?) -> End with farewell (Au revoir).',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'Merci beaucoup', english: 'Thank you very much'),
          DrillPair(french: 'Merci pour tout', english: 'Thank you for everything'),
          DrillPair(french: 'Merci bien', english: 'Thanks a lot'),
          DrillPair(french: 'Je dois partir', english: 'I must go / leave'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word (Thank you very much):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: ['Merci beaucoup', 'Merci pour tout', 'Merci bien', 'Je dois partir'],
        correctGapWord: 'Merci beaucoup',
        explanation: 'Bravo ! "Merci beaucoup" means "Thank you very much".',
      ),
      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),
      P4InteractiveExercise(
        type: DrillType.tapTranslation,
        prompt: 'What does "Merci pour tout" mean in English?',
        options: ['Thank you for everything', 'Thank you very much', 'Thanks a lot', 'I must go / leave'],
        correctOptionIndex: 0,
        explanation: 'Parfait ! "Merci pour tout" translates to "Thank you for everything".',
      ),
    ],
    evaluationQuestions: [
      P4EvaluationQuestion(
        question: 'How do you say "Thank you very much" in French?',
        answer: 'Merci beaucoup.',
        hint: 'Add "beaucoup" to thank you.',
      ),
      P4EvaluationQuestion(
        question: 'What does "Merci pour tout" mean?',
        answer: 'Thank you for everything (great when leaving a party or visit).',
        hint: 'Gratitude for everything.',
      ),
      P4EvaluationQuestion(
        question: 'Put these parts of a conversation in the correct order: (Ça va?), (Au revoir!), (Bonjour.), (Ça va bien, merci.).',
        answer: 'Bonjour. -> Ça va? -> Ça va bien, merci. -> Au revoir!',
        hint: 'Start with greeting, end with farewell.',
      ),
      P4EvaluationQuestion(
        question: 'Why is it important to say thank you before leaving a friend\'s house?',
        answer: 'To show appreciation, gratitude, and good manners.',
        hint: 'Showing appreciation.',
      ),
      P4EvaluationQuestion(
        question: 'Complete the phrase: Merci ____.',
        answer: 'Merci beaucoup / Merci bien / Merci pour tout.',
        hint: 'Common completion words for merci.',
      ),
    ],
    assignmentTasks: [
      P4AssignmentTask(
        category: 'Writing a Dialogue',
        instruction: 'Write a short 4-line dialogue between two friends (A and B) who meet and then say goodbye. Include a greeting, asking "how are you?", and a farewell.',
      ),
      P4AssignmentTask(
        category: 'Translation',
        instruction: 'Translate into English: "Merci beaucoup. Au revoir." (Thank you very much. Goodbye.) in your notebook.',
      ),
      P4AssignmentTask(
        category: 'Oral Practice',
        instruction: 'With a family member at home, practice saying thank you and goodbye in French after they help you with something.',
      ),
    ],
    patternData: {
      'dialogueSteps': [
        {'step': 1, 'role': 'Speaker A', 'text': 'Bonjour, mon ami! Comment ça va?', 'meaning': 'Hello my friend! How are you?', 'audio': 'bonjour'},
        {'step': 2, 'role': 'Speaker B', 'text': 'Ça va très bien, merci! Et toi?', 'meaning': 'Very well, thank you! And you?', 'audio': 'tres_bien_merci'},
        {'step': 3, 'role': 'Speaker A', 'text': 'Ça va bien. Je dois partir. Merci pour tout!', 'meaning': 'I\'m fine. I must go. Thanks for everything!', 'audio': 'merci_pour_tout'},
        {'step': 4, 'role': 'Speaker B', 'text': 'De rien! Au revoir et bonne journée!', 'meaning': 'You\'re welcome! Goodbye and have a great day!', 'audio': 'bonne_journee'},
      ]
    },
  ),

  // ==========================================
  // WEEK 10: IDENTITY THEME REVIEW & ID CARD WORKSHOP
  // ==========================================
  P4Lesson(
    term: 1,
    week: 10,
    topic: 'Review and Integration: Identity Theme',
    subtitle: 'Comprehensive Review, "Carte d\'Identité" Creation & Class Presentations',
    patternType: P4PatternType.idCardWorkshop,
    teachingStyle: TeachingStyle.interactiveStudio,
    objectives: [
      'Comprehensive review of all identity and identification topics.',
      'Introduce themselves completely (Name, Age, Nationality, Gender) in a structured paragraph.',
      'Create personal identity cards in French ("Carte d\'Identité").',
      'Participate in class presentations using correct French pronunciation and posture.',
    ],
    culturalInsight:
        'Congratulations on mastering your personal identity in French! You can now proudly introduce yourself in any French-speaking country or international gathering!',
    vocabItems: [
      P4VocabItem(
        french: 'Carte d\'Identité',
        phonetics: 'kahrt dee-dahn-tee-tay',
        english: 'Identity Card',
        usageNote: 'Official ID card format.',
        icon: Icons.contact_mail_rounded,
        audioKey: 'carte_didentite',
        imageAsset: 'assets/images/p4_term1/carte_scolaire_bg.png',
      ),
      P4VocabItem(
        french: 'Nom (Nom de famille)',
        phonetics: 'nohm',
        english: 'Surname / Last Name',
        usageNote: 'e.g. Adebayo, Okonkwo, Ibrahim.',
        icon: Icons.text_fields_rounded,
        audioKey: 'nom',
      ),
      P4VocabItem(
        french: 'Prénom',
        phonetics: 'pray-nohm',
        english: 'First Name',
        usageNote: 'e.g. Chinedu, Zainab, Emeka.',
        icon: Icons.person_rounded,
        audioKey: 'prenom',
      ),
      P4VocabItem(
        french: 'Âge',
        phonetics: 'ahzh',
        english: 'Age',
        usageNote: 'e.g. 9 ans / 10 ans.',
        icon: Icons.cake_rounded,
        audioKey: 'age',
      ),
      P4VocabItem(
        french: 'Pays: Le Nigeria',
        phonetics: 'pay-ee: luh nee-zhay-ree-ah',
        english: 'Country: Nigeria',
        usageNote: 'Home country.',
        icon: Icons.flag_rounded,
        audioKey: 'pays',
      ),
      P4VocabItem(
        french: 'Sexe (M / F)',
        phonetics: 'sex (mas-koo-lahn / fay-mee-nahn)',
        english: 'Gender: Masculin (Male) / Féminin (Female)',
        usageNote: 'M for boy, F for girl.',
        icon: Icons.wc_rounded,
        audioKey: 'sexe',
      ),
    ],
    classworkExercises: [
      P4InteractiveExercise(
        prompt: 'On a French school form or ID card, what does "Prénom" mean?',
        options: ['Surname', 'First Name', 'Age', 'Country'],
        correctOptionIndex: 1,
        explanation: '"Prénom" is First Name (Given name). "Nom" is Surname (Family name).',
      ),
      P4InteractiveExercise(
        prompt: 'What is the correct way for a boy named Femi aged 9 to begin his introduction?',
        options: [
          'Bonjour! Je m\'appelle Femi. J\'ai neuf ans. Je suis Nigérian.',
          'Bonne nuit! Je suis une fille.',
          'Au revoir! Comment allez-vous?',
          'Pardon! Merci beaucoup.'
        ],
        correctOptionIndex: 0,
        explanation: '"Bonjour! Je m\'appelle Femi. J\'ai neuf ans. Je suis Nigérian" is the correct full introduction.',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'Carte d\'Identité', english: 'Identity Card'),
          DrillPair(french: 'Nom (Nom de famille)', english: 'Surname / Last Name'),
          DrillPair(french: 'Prénom', english: 'First Name'),
          DrillPair(french: 'Âge', english: 'Age'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word (Identity Card):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: ['Carte d\'Identité', 'Nom (Nom de famille)', 'Prénom', 'Âge'],
        correctGapWord: 'Carte d\'Identité',
        explanation: 'Bravo ! "Carte d\'Identité" means "Identity Card".',
      ),
      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),
      P4InteractiveExercise(
        type: DrillType.tapTranslation,
        prompt: 'What does "Nom (Nom de famille)" mean in English?',
        options: ['Surname / Last Name', 'Identity Card', 'First Name', 'Age'],
        correctOptionIndex: 0,
        explanation: 'Parfait ! "Nom (Nom de famille)" translates to "Surname / Last Name".',
      ),
    ],
    evaluationQuestions: [
      P4EvaluationQuestion(
        question: 'Present yourself! Tell the class your name, age, and nationality in French (2-3 sentences).',
        answer: '"Bonjour! Je m\'appelle [Name]. J\'ai [Age] ans. Je suis Nigérian(e). Je suis un garçon / une fille. Au revoir!"',
        hint: 'Full presentation.',
      ),
      P4EvaluationQuestion(
        question: 'On a French ID card, what does "Prénom" ask for?',
        answer: 'Your First Name.',
        hint: 'Given name.',
      ),
      P4EvaluationQuestion(
        question: 'What does "Nom" mean?',
        answer: 'Surname / Last Name (Family name).',
        hint: 'Family surname.',
      ),
      P4EvaluationQuestion(
        question: 'Translate: "Je suis Nigérian et j\'ai dix ans."',
        answer: 'I am Nigerian and I am ten years old.',
        hint: 'Dix = 10.',
      ),
      P4EvaluationQuestion(
        question: 'What is the first word you should say in your presentation?',
        answer: 'Bonjour! (or "Bonjour à tous!").',
        hint: 'Opening greeting.',
      ),
    ],
    assignmentTasks: [
      P4AssignmentTask(
        category: 'Design & Writing',
        instruction: 'Design and fill out your own French "Carte d\'Identité" on a page in your notebook. Draw a small picture of yourself in the corner and write your details in French.',
      ),
      P4AssignmentTask(
        category: 'Creative Writing',
        instruction: 'Write a short paragraph (4-5 sentences) introducing your best friend using: Il s\'appelle... / Elle s\'appelle..., Il a... ans, Il est Nigérian.',
      ),
      P4AssignmentTask(
        category: 'Oral Practice',
        instruction: 'Practice reading your full self-introduction paragraph aloud at home 5 times with clear pronunciation.',
      ),
    ],
    patternData: {
      'cardFields': [
        {'field': 'Nom', 'label': 'Surname / Last Name', 'audio': 'nom'},
        {'field': 'Prénom', 'label': 'First Name', 'audio': 'prenom'},
        {'field': 'Âge', 'label': 'Age', 'audio': 'age'},
        {'field': 'Nationalité', 'label': 'Nationality (Nigérian / Nigériane)', 'audio': 'nationalite'},
        {'field': 'Pays', 'label': 'Country (Le Nigeria)', 'audio': 'pays'},
      ]
    },
  ),

  // ==========================================
  // WEEK 11: TERM 1 REVISION RALLY
  // ==========================================
  P4Lesson(
    term: 1,
    week: 11,
    topic: 'Révision Générale (Term 1 Revision)',
    subtitle: 'Comprehensive Review of Greetings, Numbers 1–20, Identity & Magic Words',
    patternType: P4PatternType.termRevisionRally,
    teachingStyle: TeachingStyle.phoneticSoundboard,
    objectives: [
      'Review: Greetings (formal and informal) across all times of day.',
      'Review: Self-introductions (Name, Age, Nationality, Gender).',
      'Review: Numbers 1 to 20 counting and simple math.',
      'Review: Basic polite expressions and magic words (Merci, S\'il vous plaît, Pardon).',
    ],
    culturalInsight:
        'Revision Rally lets the whole class participate in high-energy board games, oral relays, and question-and-answer speed rounds!',
    vocabItems: [
      P4VocabItem(
        french: 'Les Salutations',
        phonetics: 'lay sah-loo-tah-syohn',
        english: 'All Greetings (Bonjour, Bonsoir, Bonne nuit, Salut)',
        usageNote: 'Full greeting set.',
        icon: Icons.waving_hand_rounded,
        audioKey: 'bonjour',
      ),
      P4VocabItem(
        french: 'Les Nombres (1–20)',
        phonetics: 'lay nohm-bruh',
        english: 'Numbers 1 to 20',
        usageNote: 'Full 1-20 counting series.',
        icon: Icons.numbers_rounded,
        audioKey: 'num_1',
      ),
      P4VocabItem(
        french: 'L\'Identité',
        phonetics: 'lee-dahn-tee-tay',
        english: 'Identity (Je m\'appelle, J\'ai ... ans, Nigérian/e)',
        usageNote: 'Personal presentation.',
        icon: Icons.badge_rounded,
        audioKey: 'je_mappelle',
      ),
      P4VocabItem(
        french: 'Les Mots Magiques',
        phonetics: 'lay moh mah-zheek',
        english: 'Magic Words (S\'il vous plaît, Merci, De rien, Pardon)',
        usageNote: 'Courtesy expressions.',
        icon: Icons.auto_awesome_rounded,
        audioKey: 'merci',
      ),
    ],
    classworkExercises: [
      P4InteractiveExercise(
        prompt: 'What French number comes immediately after "Quatorze" (14)?',
        options: ['Treize (13)', 'Quinze (15)', 'Seize (16)', 'Douze (12)'],
        correctOptionIndex: 1,
        explanation: '14 is Quatorze, followed immediately by 15 which is Quinze.',
      ),
      P4InteractiveExercise(
        prompt: 'Which phrase is used by a girl to state her nationality?',
        options: ['Je suis Nigérian', 'Je suis Nigériane', 'Je m\'appelle Nigérian', 'Tu es Nigérian'],
        correctOptionIndex: 1,
        explanation: 'A girl says "Je suis Nigériane" with the feminine \'e\'.',
      ),
      P4InteractiveExercise(
        prompt: 'Which magic word should you say when asking to borrow a book from an adult?',
        options: ['S\'il te plaît', 'S\'il vous plaît', 'De rien', 'Bonsoir'],
        correctOptionIndex: 1,
        explanation: '"S\'il vous plaît" is the formal request used with adults.',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'Les Salutations', english: 'All Greetings (Bonjour, Bonsoir, Bonne nuit, Salut)'),
          DrillPair(french: 'Les Nombres (1–20)', english: 'Numbers 1 to 20'),
          DrillPair(french: 'L\'Identité', english: 'Identity (Je m\'appelle, J\'ai ... ans, Nigérian/e)'),
          DrillPair(french: 'Les Mots Magiques', english: 'Magic Words (S\'il vous plaît, Merci, De rien, Pardon)'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word (All Greetings (Bonjour, Bonsoir, Bonne nuit, Salut)):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: ['Les Salutations', 'Les Nombres (1–20)', 'L\'Identité', 'Les Mots Magiques'],
        correctGapWord: 'Les Salutations',
        explanation: 'Bravo ! "Les Salutations" means "All Greetings (Bonjour, Bonsoir, Bonne nuit, Salut)".',
      ),
      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),
    ],
    evaluationQuestions: [
      P4EvaluationQuestion(
        question: 'Count backwards from 10 to 1 in French: Dix, Neuf, Huit...',
        answer: 'Dix, neuf, huit, sept, six, cinq, quatre, trois, deux, un.',
        hint: '10 down to 1.',
      ),
      P4EvaluationQuestion(
        question: 'What do you say when you accidentally step on someone\'s foot in class?',
        answer: 'Pardon! (or "Excusez-moi / Désolé(e)").',
        hint: 'Magic word for apologies.',
      ),
      P4EvaluationQuestion(
        question: 'Greet your principal politely at 9:00 AM and ask how they are.',
        answer: '"Bonjour Monsieur/Madame le Directeur/la Directrice! Comment allez-vous?"',
        hint: 'Formal morning address.',
      ),
      P4EvaluationQuestion(
        question: 'How do you say "Have a good weekend" in French?',
        answer: 'Bon week-end!',
        hint: 'Friday parting wish.',
      ),
    ],
    assignmentTasks: [
      P4AssignmentTask(
        category: 'Final Term Revision',
        instruction: 'Practice reciting your complete French self-introduction to your family 3 times before the end-of-term assessment.',
      ),
    ],
  ),

  // ==========================================
  // WEEK 12: ORAL EVALUATION & TERM 1 PORTFOLIO
  // ==========================================
  P4Lesson(
    term: 1,
    week: 12,
    topic: 'Bilan et Évaluation Orale (Term 1 Oral Assessment & Portfolio)',
    subtitle: 'Teacher-guided speaking and vocabulary evaluation for First Term',
    patternType: P4PatternType.midTermReview,
    teachingStyle: TeachingStyle.storyNarrative,
    objectives: [
      'Assess pupil mastery in French greetings, numbers 1-20, and self-introduction.',
      'Conduct interactive oral speaking stations with the whole class.',
      'Record pupil achievement badges for Term 1.',
    ],
    culturalInsight:
      'Oral evaluation in French primary schools is designed to celebrate speaking confidence! Pupils demonstrate greetings, recite numbers, and state their full name and nationality with pride.',
    vocabItems: [
      P4VocabItem(
        french: 'L\'évaluation orale',
        phonetics: 'lay-vah-loo-ah-syohn oh-rahl',
        english: 'Oral speaking evaluation',
        usageNote: 'Classroom assessment.',
        icon: Icons.record_voice_over_rounded,
        audioKey: 'levaluation_orale',
      ),
      P4VocabItem(
        french: 'Très bien réussi !',
        phonetics: 'tray byan ray-oo-see',
        english: 'Very well done / Great success!',
        usageNote: 'Teacher commendation.',
        icon: Icons.thumb_up_rounded,
        audioKey: 'tres_bien_reussi',
      ),
      P4VocabItem(
        french: 'Bravo à tous !',
        phonetics: 'brah-voh ah toos',
        english: 'Bravo to all pupils!',
        usageNote: 'Class celebration.',
        icon: Icons.celebration_rounded,
        audioKey: 'bravo_a_tous',
      ),
    ],
    classworkExercises: [
      P4InteractiveExercise(
        prompt: 'In your oral presentation, which sentence comes first?',
        options: ['Bonjour, je m\'appelle...', 'Au revoir!', 'J\'ai dix ans.', 'Bonne nuit!'],
        correctOptionIndex: 0,
        explanation: 'A polite oral introduction always starts with "Bonjour, je m\'appelle...".',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'L\'évaluation orale', english: 'Oral speaking evaluation'),
          DrillPair(french: 'Très bien réussi !', english: 'Very well done / Great success!'),
          DrillPair(french: 'Bravo à tous !', english: 'Bravo to all pupils!'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word (Oral speaking evaluation):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: ['L\'évaluation orale', 'Très bien réussi !', 'Bravo à tous !', 'oui'],
        correctGapWord: 'L\'évaluation orale',
        explanation: 'Bravo ! "L\'évaluation orale" means "Oral speaking evaluation".',
      ),
      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),
      P4InteractiveExercise(
        type: DrillType.tapTranslation,
        prompt: 'What does "Très bien réussi !" mean in English?',
        options: ['Very well done / Great success!', 'Oral speaking evaluation', 'Bravo to all pupils!', 'to speak kindly'],
        correctOptionIndex: 0,
        explanation: 'Parfait ! "Très bien réussi !" translates to "Very well done / Great success!".',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'L\'évaluation orale', english: 'Oral speaking evaluation'),
          DrillPair(french: 'Très bien réussi !', english: 'Very well done / Great success!'),
          DrillPair(french: 'Bravo à tous !', english: 'Bravo to all pupils!'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
    ],
    evaluationQuestions: [
      P4EvaluationQuestion(
        question: 'Recite your full French introduction: Greeting, Name, Age, Nationality, and Farewell.',
        answer: 'Bonjour ! Je m\'appelle [Name]. J\'ai [Age] ans. Je suis Nigérian(e). Au revoir !',
        hint: '5-part self-introduction.',
      ),
      P4EvaluationQuestion(
        question: 'Count out loud from 11 to 20 in French.',
        answer: 'Onze, douze, treize, quatorze, quinze, seize, dix-sept, dix-huit, dix-neuf, vingt.',
        hint: '11 to 20 numbers.',
      ),
    ],
    assignmentTasks: [
      P4AssignmentTask(
        category: 'Assessment Preparation',
        instruction: 'Practice reciting your French numbers 1 to 20 smoothly before the holiday break.',
      ),
    ],
  ),

  // ==========================================
  // WEEK 13: TERM 1 WRAP-UP & VACATION CELEBRATION
  // ==========================================
  P4Lesson(
    term: 1,
    week: 13,
    topic: 'Fin du Premier Trimestre (Term 1 Wrap-up & Vacation Celebration)',
    subtitle: 'Congratulations! Term 1 Complete — Félicitations et Bonnes Vacances!',
    patternType: P4PatternType.vacationCelebration,
    teachingStyle: TeachingStyle.storyNarrative,
    objectives: [
      'Celebrate completing Term 1 French Curriculum!',
      'Review your French vocabulary badge collection.',
      'Prepare for Term 2 (Family, School Environment & Colors).',
    ],
    culturalInsight:
        'Félicitations! You have laid a solid foundation in French language: greetings, numbers 1-20, self-introductions, and geography. In Term 2, we will explore our families, classroom objects, school subjects, and colors!',
    vocabItems: [
      P4VocabItem(
        french: 'Félicitations !',
        phonetics: 'fay-lee-see-tah-syohn',
        english: 'Congratulations!',
        usageNote: 'Well done on completing Term 1!',
        icon: Icons.star_rounded,
        audioKey: 'felicitations',
      ),
      P4VocabItem(
        french: 'Bonnes vacances !',
        phonetics: 'bun vah-kahns',
        english: 'Happy holidays / Have a great vacation!',
        usageNote: 'End of term vacation greeting.',
        icon: Icons.beach_access_rounded,
        audioKey: 'bonnes_vacances',
      ),
      P4VocabItem(
        french: 'À la rentrée !',
        phonetics: 'ah lah rahn-tray',
        english: 'See you next term / when school resumes!',
        usageNote: 'Departure wish until next school term.',
        icon: Icons.school_rounded,
        audioKey: 'a_la_rentree',
      ),
    ],
    classworkExercises: [
      P4InteractiveExercise(
        prompt: 'What does "À la rentrée" mean when leaving at the end of the term?',
        options: ['Good night', 'See you when school resumes / next term', 'Welcome back', 'Thank you'],
        correctOptionIndex: 1,
        explanation: '"À la rentrée" is the traditional French phrase for "See you when school reopens".',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'Félicitations !', english: 'Congratulations!'),
          DrillPair(french: 'Bonnes vacances !', english: 'Happy holidays / Have a great vacation!'),
          DrillPair(french: 'À la rentrée !', english: 'See you next term / when school resumes!'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word (Congratulations!):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: ['Félicitations !', 'Bonnes vacances !', 'À la rentrée !', 'oui'],
        correctGapWord: 'Félicitations !',
        explanation: 'Bravo ! "Félicitations !" means "Congratulations!".',
      ),
      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),
      P4InteractiveExercise(
        type: DrillType.tapTranslation,
        prompt: 'What does "Bonnes vacances !" mean in English?',
        options: ['Happy holidays / Have a great vacation!', 'Congratulations!', 'See you next term / when school resumes!', 'to speak kindly'],
        correctOptionIndex: 0,
        explanation: 'Parfait ! "Bonnes vacances !" translates to "Happy holidays / Have a great vacation!".',
      ),
          P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
          DrillPair(french: 'Félicitations !', english: 'Congratulations!'),
          DrillPair(french: 'Bonnes vacances !', english: 'Happy holidays / Have a great vacation!'),
          DrillPair(french: 'À la rentrée !', english: 'See you next term / when school resumes!'),
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),
    ],
    evaluationQuestions: [
      P4EvaluationQuestion(
        question: 'What is your favorite French word or phrase learned in Term 1?',
        answer: 'Pupils share their favorite phrase (e.g. Bonjour, Merci beaucoup, J\'ai neuf ans, etc.).',
        hint: 'Any Term 1 word.',
      ),
      P4EvaluationQuestion(
        question: 'What French wish do you say to classmates before closing for vacation?',
        answer: 'Bonnes vacances! (Have a great vacation / holiday!).',
        hint: 'Vacation wish.',
      ),
    ],
    assignmentTasks: [
      P4AssignmentTask(
        category: 'Holiday Reading',
        instruction: 'Have a wonderful holiday and get ready for Term 2 French: "Ma Famille et Mon École"!',
      ),
    ],
  ),
];
