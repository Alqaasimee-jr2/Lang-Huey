import 'package:flutter/material.dart';
import '../models/p4_lesson_model.dart';

/// Primary 4 French - Second Term (Deuxième Trimestre)
/// 100% Comprehensive Curriculum based on NERDC Approved Schemes of Work
class P4Term2Lessons {
  static final List<P4Lesson> weeks = [
    // ==========================================
    // WEEK 1: Close Family Members (Part 1)
    // ==========================================
    P4Lesson(
      week: 1,
      term: 2,
      topic: 'Présenter la Famille Proche (Part 1)',
      subtitle: 'Theme: Immediate Environment & Family · Close Family & Possessives',
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: ['Pupils learn to identify close family members (père, mère, frère, sœur), use the correct possessive adjectives ("mon" for masculine and "ma" for feminine), and introduce their family using "Voici" and "C\'est".'],
      culturalInsight:
          'In France, families love gathering around the dinner table every evening to talk about their day. Family is celebrated every year during national "Fête des Mères" (Mother\'s Day) and "Fête des Pères" (Father\'s Day)!',
      vocabItems: [
        P4VocabItem(
          french: 'La famille',
          phonetics: 'lah fah-mee',
          english: 'The family',
          icon: Icons.family_restroom_rounded,
          audioKey: 'la_famille',
        ),
        P4VocabItem(
          french: 'Le père / Papa',
          phonetics: 'luh pair / pah-pah',
          english: 'The father / Dad',
          icon: Icons.man_rounded,
          audioKey: 'le_pere',
        ),
        P4VocabItem(
          french: 'La mère / Maman',
          phonetics: 'lah mair / mah-mahn',
          english: 'The mother / Mom',
          icon: Icons.woman_rounded,
          audioKey: 'la_mere',
        ),
        P4VocabItem(
          french: 'Le frère',
          phonetics: 'luh frair',
          english: 'The brother',
          icon: Icons.boy_rounded,
          audioKey: 'le_frere',
        ),
        P4VocabItem(
          french: 'La sœur',
          phonetics: 'lah sur',
          english: 'The sister',
          icon: Icons.girl_rounded,
          audioKey: 'la_soeur',
        ),
        P4VocabItem(
          french: 'Mon',
          phonetics: 'mohn',
          english: 'My (Masculine: Mon père, Mon frère)',
          icon: Icons.badge_rounded,
          audioKey: 'mon',
        ),
        P4VocabItem(
          french: 'Ma',
          phonetics: 'mah',
          english: 'My (Feminine: Ma mère, Ma sœur)',
          icon: Icons.badge_rounded,
          audioKey: 'ma',
        ),
        P4VocabItem(
          french: 'Voici...',
          phonetics: 'vwah-see',
          english: 'Here is... (Voici mon père)',
          icon: Icons.waving_hand_rounded,
          audioKey: 'voici',
        ),
        P4VocabItem(
          french: 'C\'est...',
          phonetics: 'say',
          english: 'This is... (C\'est ma mère)',
          icon: Icons.person_pin_circle_rounded,
          audioKey: 'cest',
        ),
        P4VocabItem(
          french: 'J\'ai un frère',
          phonetics: 'zhay uhn frair',
          english: 'I have a brother',
          icon: Icons.record_voice_over_rounded,
          audioKey: 'jai_un_frere',
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: 'Possessive Adjectives: Mon vs Ma',
          explanation:
              'In French, "my" changes depending on the gender of the family member:\n• Use "Mon" for masculine nouns (Mon père, Mon frère).\n• Use "Ma" for feminine nouns (Ma mère, Ma sœur).\nMemory trick: "Mon" sounds like man (male), "Ma" sounds like mama (female)!',
          examples: [
            'Mon père = My father',
            'Ma mère = My mother',
            'Mon frère = My brother',
            'Ma sœur = My sister',
          ],
        ),
        P4GrammarNote(
          ruleTitle: 'Introducing with "Voici" & "C\'est"',
          explanation:
              'When pointing to a photo or introducing family members to classmates:\n• "Voici mon père" = Here is my father.\n• "C\'est ma mère" = This is my mother.',
          examples: [
            'Voici mon frère Kofi. = Here is my brother Kofi.',
            'C\'est ma sœur Amina. = This is my sister Amina.',
          ],
        ),
      ],
      classworkExercises: [
        P4ClassworkExercise(
          prompt: 'Which possessive word correctly completes: "___ mère s\'appelle Fatima"?',
          options: ['Mon', 'Ma', 'Mes', 'Le'],
          correctOptionIndex: 1,
          explanation: '"Mère" is feminine, so we must use "Ma mère".',
        ),
        P4ClassworkExercise(
          prompt: 'How do you say "My brother" in French?',
          options: ['Ma sœur', 'Mon frère', 'Ma frère', 'Le père'],
          correctOptionIndex: 1,
          explanation: '"Frère" is masculine, so it is "Mon frère".',
        ),
        P4ClassworkExercise(
          prompt: 'What does "Voici mon père" mean in English?',
          options: [
            'This is my mother',
            'Here is my father',
            'I have a brother',
            'Goodbye father'
          ],
          correctOptionIndex: 1,
          explanation: '"Voici" means "Here is", so "Voici mon père" means "Here is my father".',
        ),
        P4ClassworkExercise(
          prompt: 'Translate to French: "I have a sister."',
          options: [
            'J\'ai un frère',
            'J\'ai une sœur',
            'C\'est ma sœur',
            'Voici mon père'
          ],
          correctOptionIndex: 1,
          explanation: '"J\'ai une sœur" uses "une" because "sœur" is feminine.',
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          questionNumber: 1,
          questionText: 'What is the French word for "The Mother"?',
          expectedAnswer: 'La mère (or Maman).',
        ),
        P4EvaluationQuestion(
          questionNumber: 2,
          questionText: 'Translate "Mon frère" into English.',
          expectedAnswer: 'My brother.',
        ),
        P4EvaluationQuestion(
          questionNumber: 3,
          questionText: 'Do we say "Mon mère" or "Ma mère"? Explain why.',
          expectedAnswer: 'Ma mère, because "mère" is feminine.',
        ),
        P4EvaluationQuestion(
          questionNumber: 4,
          questionText: 'You are showing a family photo pointing to your dad. What French sentence do you say?',
          expectedAnswer: 'Voici mon père (or C\'est mon père).',
        ),
        P4EvaluationQuestion(
          questionNumber: 5,
          questionText: 'Translate into English: "C\'est ma mère."',
          expectedAnswer: 'This is my mother.',
        ),
      ],
      homeworkTasks: [
        P4HomeworkTask(
          taskNumber: 1,
          topic: 'Drawing & Labelling Family Members',
          instructions:
              'Draw a neat picture of your father and mother in your French notebook. Under your father\'s picture write "Mon père". Under your mother\'s picture write "Ma mère".',
        ),
        P4HomeworkTask(
          taskNumber: 2,
          topic: 'Fill-in-the-Blank',
          instructions:
              'Complete the sentence with Mon or Ma: "___ sœur s\'appelle Amina."',
        ),
        P4HomeworkTask(
          taskNumber: 3,
          topic: 'Sentence Construction',
          instructions:
              'Write one full sentence in French stating whether you have a brother or a sister (e.g., "J\'ai un frère." or "J\'ai une sœur.").',
        ),
      ],
    ),

    // ==========================================
    // WEEK 2: Extended Family Members (Part 2)
    // ==========================================
    P4Lesson(
      week: 2,
      term: 2,
      topic: 'Présenter la Famille Élargie (Part 2)',
      subtitle: 'Theme: Extended Family & Family Trees · Extended Family & Names',
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: ['Pupils learn names for extended family members (grand-père, grand-mère, oncle, tante, cousin, cousine, grands-parents), state names using "Il s\'appelle" and "Elle s\'appelle", count relatives, and understand a family tree.'],
      culturalInsight:
          'In Francophone African countries like Senegal and Côte d\'Ivoire, extended family often live together in large compounds called "concessions", sharing meals and stories together!',
      vocabItems: [
        P4VocabItem(
          french: 'Les grands-parents',
          phonetics: 'lay grahn-pah-rahn',
          english: 'The grandparents',
          icon: Icons.elderly_rounded,
          audioKey: 'les_grands_parents',
        ),
        P4VocabItem(
          french: 'Le grand-père / Papi',
          phonetics: 'luh grahn-pair / pah-pee',
          english: 'The grandfather / Grandpa',
          icon: Icons.elderly_rounded,
          audioKey: 'le_grand_pere',
        ),
        P4VocabItem(
          french: 'La grand-mère / Mami',
          phonetics: 'lah grahn-mair / mah-mee',
          english: 'The grandmother / Grandma',
          icon: Icons.elderly_woman_rounded,
          audioKey: 'la_grand_mere',
        ),
        P4VocabItem(
          french: 'L\'oncle',
          phonetics: 'lon-kl',
          english: 'The uncle',
          icon: Icons.person_rounded,
          audioKey: 'loncle',
        ),
        P4VocabItem(
          french: 'La tante',
          phonetics: 'lah tahnt',
          english: 'The aunt',
          icon: Icons.person_3_rounded,
          audioKey: 'la_tante',
        ),
        P4VocabItem(
          french: 'Le cousin',
          phonetics: 'luh koo-zan',
          english: 'The cousin (male)',
          icon: Icons.boy_rounded,
          audioKey: 'le_cousin',
        ),
        P4VocabItem(
          french: 'La cousine',
          phonetics: 'lah koo-zeen',
          english: 'The cousin (female)',
          icon: Icons.girl_rounded,
          audioKey: 'la_cousine',
        ),
        P4VocabItem(
          french: 'Il s\'appelle...',
          phonetics: 'eel sah-pell',
          english: 'His name is... (He is called...)',
          icon: Icons.badge_rounded,
          audioKey: 'il_sappelle',
        ),
        P4VocabItem(
          french: 'Elle s\'appelle...',
          phonetics: 'ell sah-pell',
          english: 'Her name is... (She is called...)',
          icon: Icons.badge_rounded,
          audioKey: 'elle_sappelle',
        ),
        P4VocabItem(
          french: 'L\'arbre généalogique',
          phonetics: 'lar-bruh zhay-nay-ah-loh-zheek',
          english: 'The family tree',
          icon: Icons.park_rounded,
          audioKey: 'arbre_genealogique',
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: 'Stating Names: Il s\'appelle vs Elle s\'appelle',
          explanation:
              'To say the name of a family member:\n• Use "Il s\'appelle [Name]" for males (Mon oncle, il s\'appelle Tunde).\n• Use "Elle s\'appelle [Name]" for females (Ma tante, elle s\'appelle Funke).',
          examples: [
            'Mon grand-père, il s\'appelle Babatunde.',
            'Ma grand-mère, elle s\'appelle Zainab.',
          ],
        ),
        P4GrammarNote(
          ruleTitle: 'Counting Family Members',
          explanation:
              'Combine "J\'ai" with French numbers to count family members:\n• J\'ai un grand-père. (I have one grandfather)\n• J\'ai deux tantes. (I have two aunts)\n• J\'ai trois cousins. (I have three cousins)',
          examples: [
            'J\'ai deux frères et une sœur.',
            'J\'ai quatre cousins.',
          ],
        ),
      ],
      classworkExercises: [
        P4ClassworkExercise(
          prompt: 'What is the French word for "Grandmother"?',
          options: ['La tante', 'La mère', 'La grand-mère', 'La cousine'],
          correctOptionIndex: 2,
          explanation: '"Grand-mère" is French for Grandmother.',
        ),
        P4ClassworkExercise(
          prompt: 'How do you say "His name is Tunde" when talking about your uncle?',
          options: [
            'Elle s\'appelle Tunde',
            'Il s\'appelle Tunde',
            'Je m\'appelle Tunde',
            'Tu t\'appelles Tunde'
          ],
          correctOptionIndex: 1,
          explanation: 'For males (oncle), we use "Il s\'appelle".',
        ),
        P4ClassworkExercise(
          prompt: 'What is the feminine word for a girl cousin?',
          options: ['Le cousin', 'La tante', 'La cousine', 'La sœur'],
          correctOptionIndex: 2,
          explanation: 'A male cousin is "le cousin", a female cousin is "la cousine".',
        ),
        P4ClassworkExercise(
          prompt: 'Translate to French: "Two sisters"',
          options: ['Deux frères', 'Deux sœurs', 'Une sœur', 'Trois tantes'],
          correctOptionIndex: 1,
          explanation: '"Deux" means 2, and "sœurs" means sisters.',
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          questionNumber: 1,
          questionText: 'How do you say "Grandmother" in French?',
          expectedAnswer: 'La grand-mère (or Mami).',
        ),
        P4EvaluationQuestion(
          questionNumber: 2,
          questionText: 'What is the French word for "Uncle"?',
          expectedAnswer: 'L\'oncle.',
        ),
        P4EvaluationQuestion(
          questionNumber: 3,
          questionText: 'How would you say "Her name is Bimpe" when talking about your aunt?',
          expectedAnswer: 'Ma tante, elle s\'appelle Bimpe.',
        ),
        P4EvaluationQuestion(
          questionNumber: 4,
          questionText: 'Translate: "Mon grand-père, il s\'appelle Babatunde."',
          expectedAnswer: 'My grandfather, his name is Babatunde.',
        ),
        P4EvaluationQuestion(
          questionNumber: 5,
          questionText: 'What is the French word for a female cousin?',
          expectedAnswer: 'La cousine.',
        ),
      ],
      homeworkTasks: [
        P4HomeworkTask(
          taskNumber: 1,
          topic: 'Grandparents Sentence Writing',
          instructions:
              'Write two sentences in French giving the names of your grandfather and grandmother using "Mon grand-père s\'appelle..." and "Ma grand-mère s\'appelle...".',
        ),
        P4HomeworkTask(
          taskNumber: 2,
          topic: 'Family Tree Drawing',
          instructions:
              'Draw a tree in your notebook. At the top branch draw grandparents ("Les grands-parents"), below them draw parents and uncles/aunts, and at the bottom draw yourself ("Moi") and siblings.',
        ),
        P4HomeworkTask(
          taskNumber: 3,
          topic: 'Translation Drill',
          instructions:
              'Translate into French: (1) Three cousins (Trois cousins), (2) Two aunts (Deux tantes).',
        ),
      ],
    ),

    // ==========================================
    // WEEK 3: Describing Family & Verb Avoir (Part 3)
    // ==========================================
    P4Lesson(
      week: 3,
      term: 2,
      topic: 'Décrire la Famille & Verbe Avoir (Part 3)',
      subtitle: 'Theme: Family Descriptions & Avoir · Adjectives & Verb Avoir',
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: ['Pupils learn to conjugate the verb "avoir" in singular forms (J\'ai, Tu as, Il a, Elle a), describe family members using basic adjectives (grand, petit, jeune, vieux), and explain family relationships.'],
      culturalInsight:
          'In French, adjectives change their spelling to agree with feminine nouns (grand -> grande, petit -> petite, vieux -> vieille). French children love learning these word transformations!',
      vocabItems: [
        P4VocabItem(
          french: 'Grand / Grande',
          phonetics: 'grahn / grahnd',
          english: 'Big / Tall (Masculine / Feminine)',
          icon: Icons.height_rounded,
          audioKey: 'grand_grande',
        ),
        P4VocabItem(
          french: 'Petit / Petite',
          phonetics: 'puh-tee / puh-teet',
          english: 'Small / Short (Masculine / Feminine)',
          icon: Icons.accessibility_new_rounded,
          audioKey: 'petit_petite',
        ),
        P4VocabItem(
          french: 'Jeune',
          phonetics: 'zhuhn',
          english: 'Young',
          icon: Icons.child_care_rounded,
          audioKey: 'jeune',
        ),
        P4VocabItem(
          french: 'Vieux / Vieille',
          phonetics: 'vyuh / vyeh-ee',
          english: 'Old (Masculine / Feminine)',
          icon: Icons.elderly_rounded,
          audioKey: 'vieux_vieille',
        ),
        P4VocabItem(
          french: 'J\'ai',
          phonetics: 'zhay',
          english: 'I have',
          icon: Icons.pan_tool_rounded,
          audioKey: 'jai',
        ),
        P4VocabItem(
          french: 'Tu as',
          phonetics: 'too ah',
          english: 'You have (informal)',
          icon: Icons.front_hand_rounded,
          audioKey: 'tu_as',
        ),
        P4VocabItem(
          french: 'Il a',
          phonetics: 'eel ah',
          english: 'He has',
          icon: Icons.boy_rounded,
          audioKey: 'il_a',
        ),
        P4VocabItem(
          french: 'Elle a',
          phonetics: 'ell ah',
          english: 'She has',
          icon: Icons.girl_rounded,
          audioKey: 'elle_a',
        ),
        P4VocabItem(
          french: 'Mes parents',
          phonetics: 'may pah-rahn',
          english: 'My parents',
          icon: Icons.people_rounded,
          audioKey: 'mes_parents',
        ),
        P4VocabItem(
          french: 'J\'aime ma famille',
          phonetics: 'zhem mah fah-mee',
          english: 'I love my family',
          icon: Icons.favorite_rounded,
          audioKey: 'jaime_ma_famille',
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: 'Conjugation of "Avoir" (To Have)',
          explanation:
              'The singular forms of the verb avoir are:\n• J\'ai = I have\n• Tu as = You have\n• Il a = He has\n• Elle a = She has',
          examples: [
            'J\'ai un frère. = I have a brother.',
            'Tu as une sœur? = Do you have a sister?',
            'Il a deux cousins. = He has two cousins.',
            'Elle a un grand-père. = She has a grandfather.',
          ],
        ),
        P4GrammarNote(
          ruleTitle: 'Using Adjectives with Family Members',
          explanation:
              'Place the adjective after the verb "est" (is):\n• Mon père est grand. (My father is tall - masc)\n• Ma mère est grande. (My mother is tall - fem +e)\n• Mon frère est petit. (My brother is short - masc)\n• Ma sœur est petite. (My sister is short - fem +e)',
          examples: [
            'Mon grand-père est vieux.',
            'Ma grand-mère est vieille.',
          ],
        ),
      ],
      classworkExercises: [
        P4ClassworkExercise(
          prompt: 'Fill in the blank with the correct verb form: "Elle ___ un frère."',
          options: ['ai', 'as', 'a', 'est'],
          correctOptionIndex: 2,
          explanation: 'For "Elle" (she), the present tense form of avoir is "a" (Elle a).',
        ),
        P4ClassworkExercise(
          prompt: 'What is the opposite (antonym) of "Grand" in French?',
          options: ['Jeune', 'Petit', 'Vieux', 'Fort'],
          correctOptionIndex: 1,
          explanation: 'The opposite of "Grand" (tall/big) is "Petit" (short/small).',
        ),
        P4ClassworkExercise(
          prompt: 'How do you say "My mother is tall" in French?',
          options: [
            'Mon père est grand',
            'Ma mère est grande',
            'Ma mère est petite',
            'Mon frère est jeune'
          ],
          correctOptionIndex: 1,
          explanation: '"Mère" is feminine, so "grand" takes an extra "e" -> "Ma mère est grande".',
        ),
        P4ClassworkExercise(
          prompt: 'Translate: "The sister of my mother is my aunt."',
          options: [
            'Le frère de mon père est mon oncle',
            'La sœur de ma mère est ma tante',
            'Le père de ma mère est mon grand-père',
            'La mère de mon père est ma cousine'
          ],
          correctOptionIndex: 1,
          explanation: 'Mother\'s sister is aunt ("La sœur de ma mère est ma tante").',
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          questionNumber: 1,
          questionText: 'What does "J\'ai" mean?',
          expectedAnswer: 'I have.',
        ),
        P4EvaluationQuestion(
          questionNumber: 2,
          questionText: 'Translate "Elle a" into English.',
          expectedAnswer: 'She has.',
        ),
        P4EvaluationQuestion(
          questionNumber: 3,
          questionText: 'What is the opposite of "Grand" in French?',
          expectedAnswer: 'Petit (or Petite for feminine).',
        ),
        P4EvaluationQuestion(
          questionNumber: 4,
          questionText: 'How do you say "My mother is tall" in French?',
          expectedAnswer: 'Ma mère est grande.',
        ),
        P4EvaluationQuestion(
          questionNumber: 5,
          questionText: 'Fill in the blank with the verb form: "J\'___ deux frères."',
          expectedAnswer: 'ai (J\'ai deux frères).',
        ),
      ],
      homeworkTasks: [
        P4HomeworkTask(
          taskNumber: 1,
          topic: 'Family Description Paragraph',
          instructions:
              'Write three sentences describing your family members using "J\'ai...", "Mon père est...", and "Ma mère est..." with adjectives like grand, petite, or jeune.',
        ),
        P4HomeworkTask(
          taskNumber: 2,
          topic: 'Antonym Matching',
          instructions:
              'In your notebook, write and match opposites: Grand -> Petit, Jeune -> Vieux.',
        ),
        P4HomeworkTask(
          taskNumber: 3,
          topic: 'Verb Conjugation Drill',
          instructions:
              'Write out the 4 singular forms of the verb "Avoir" (J\'ai, Tu as, Il a, Elle a) with English translations.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 4: School & Classroom Objects (Part 1)
    // ==========================================
    P4Lesson(
      week: 4,
      term: 2,
      topic: 'Parler de l\'École & la Classe (Part 1)',
      subtitle: 'Theme: School Environment & Classroom Items · School & Classroom Items',
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: ['Pupils learn vocabulary for school objects (tableau, bureau, cahier, livre, stylo, crayon), people in school (professeur, élève), state where they study ("Je vais à l\'école", "J\'étudie à..."), and introduce their school using "Voici".'],
      culturalInsight:
          'In France, school children carry a "trousse" (pencil case) and a "cartable" (school bag) to school every day. The school week runs from Monday to Friday!',
      vocabItems: [
        P4VocabItem(
          french: 'L\'école',
          phonetics: 'lay-kol',
          english: 'The school',
          icon: Icons.school_rounded,
          audioKey: 'lecole',
        ),
        P4VocabItem(
          french: 'La salle de classe',
          phonetics: 'lah sal duh klass',
          english: 'The classroom',
          icon: Icons.meeting_room_rounded,
          audioKey: 'la_salle_de_classe',
        ),
        P4VocabItem(
          french: 'Le tableau',
          phonetics: 'luh tab-loh',
          english: 'The board (chalkboard/whiteboard)',
          icon: Icons.tv_rounded,
          audioKey: 'le_tableau',
        ),
        P4VocabItem(
          french: 'Le bureau',
          phonetics: 'luh byoo-roh',
          english: 'The desk / office',
          icon: Icons.table_restaurant_rounded,
          audioKey: 'le_bureau',
        ),
        P4VocabItem(
          french: 'Le cahier',
          phonetics: 'luh kah-yay',
          english: 'The notebook / exercise book',
          icon: Icons.menu_book_rounded,
          audioKey: 'le_cahier',
        ),
        P4VocabItem(
          french: 'Le livre',
          phonetics: 'luh leev-ruh',
          english: 'The book / textbook',
          icon: Icons.auto_stories_rounded,
          audioKey: 'le_livre',
        ),
        P4VocabItem(
          french: 'Le stylo',
          phonetics: 'luh stee-loh',
          english: 'The pen',
          icon: Icons.edit_rounded,
          audioKey: 'le_stylo',
        ),
        P4VocabItem(
          french: 'Le crayon',
          phonetics: 'luh kray-on',
          english: 'The pencil',
          icon: Icons.create_rounded,
          audioKey: 'le_crayon',
        ),
        P4VocabItem(
          french: 'Le professeur / La professeure',
          phonetics: 'luh pro-fess-ur',
          english: 'The teacher (male / female)',
          icon: Icons.person_celebrate_rounded,
          audioKey: 'le_professeur',
        ),
        P4VocabItem(
          french: 'L\'élève',
          phonetics: 'lay-lev',
          english: 'The student / pupil',
          icon: Icons.face_rounded,
          audioKey: 'leleve',
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: 'Talking About Your School',
          explanation:
              'Common phrases to talk about where you go to school:\n• "Je vais à l\'école." = I go to school.\n• "J\'étudie à l\'école [Name]." = I study at [Name] school.\n• "Voici mon école." = Here is my school.',
          examples: [
            'Je vais à l\'école tous les jours. (I go to school every day.)',
            'Voici mon école et ma classe. (Here is my school and my class.)',
          ],
        ),
        P4GrammarNote(
          ruleTitle: 'Genders of Classroom Items',
          explanation:
              'Most classroom stationery items take the masculine article "Le":\n• Le stylo (the pen)\n• Le crayon (the pencil)\n• Le livre (the book)\n• Le cahier (the notebook)\n• Le tableau (the board)\n• Le bureau (the desk)',
          examples: [
            'J\'ai un stylo et un cahier.',
            'Le professeur écrit sur le tableau.',
          ],
        ),
      ],
      classworkExercises: [
        P4ClassworkExercise(
          prompt: 'What is the French word for "Book"?',
          options: ['Le cahier', 'Le livre', 'Le stylo', 'Le crayon'],
          correctOptionIndex: 1,
          explanation: '"Le livre" means the book. "Le cahier" is the notebook.',
        ),
        P4ClassworkExercise(
          prompt: 'How do you say "Pen" in French?',
          options: ['Le crayon', 'Le tableau', 'Le stylo', 'Le bureau'],
          correctOptionIndex: 2,
          explanation: '"Le stylo" is French for pen.',
        ),
        P4ClassworkExercise(
          prompt: 'Who is "L\'élève" in a school?',
          options: ['The principal', 'The teacher', 'The pupil / student', 'The driver'],
          correctOptionIndex: 2,
          explanation: '"L\'élève" means student or pupil.',
        ),
        P4ClassworkExercise(
          prompt: 'Translate: "Voici mon école."',
          options: [
            'I go to school',
            'Here is my school',
            'I like my classroom',
            'The teacher is writing'
          ],
          correctOptionIndex: 1,
          explanation: '"Voici" means "Here is", so "Voici mon école" means "Here is my school".',
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          questionNumber: 1,
          questionText: 'What is the French word for "Book"?',
          expectedAnswer: 'Le livre.',
        ),
        P4EvaluationQuestion(
          questionNumber: 2,
          questionText: 'How do you say "Pen" in French?',
          expectedAnswer: 'Le stylo.',
        ),
        P4EvaluationQuestion(
          questionNumber: 3,
          questionText: 'Who is "L\'élève"?',
          expectedAnswer: 'The pupil or student.',
        ),
        P4EvaluationQuestion(
          questionNumber: 4,
          questionText: 'Translate: "Voici mon école."',
          expectedAnswer: 'Here is my school / This is my school.',
        ),
        P4EvaluationQuestion(
          questionNumber: 5,
          questionText: 'What do we call "The board" where the teacher writes in French?',
          expectedAnswer: 'Le tableau.',
        ),
      ],
      homeworkTasks: [
        P4HomeworkTask(
          taskNumber: 1,
          topic: 'Drawing & Labelling Stationery',
          instructions:
              'Draw three classroom items in your notebook: a pen, a book, and a board. Label each drawing in French: "Le stylo", "Le livre", "Le tableau".',
        ),
        P4HomeworkTask(
          taskNumber: 2,
          topic: 'Sentence Completion',
          instructions:
              'Complete the sentence in your notebook: "Je vais à ___." (l\'école).',
        ),
        P4HomeworkTask(
          taskNumber: 3,
          topic: 'School Presentation Sentence',
          instructions:
              'Write a full sentence stating your school name: "J\'étudie à l\'école [Your School Name]."',
        ),
      ],
    ),

    // ==========================================
    // WEEK 5: Mid-Term Oral Revision Rally
    // ==========================================
    P4Lesson(
      week: 5,
      term: 2,
      topic: 'Rallye de Révision de Mi-Trimestre',
      subtitle: 'Theme: Weeks 1–4 Oral Revision Rally · Mid-Term Oral Revision',
      patternType: P4PatternType.midTermReview,
      objectives: ['Comprehensive speed oral recap covering Weeks 1 to 4 topics: Close family, extended family, possessive adjectives (mon/ma), describing family with verb avoir, and school classroom objects.'],
      culturalInsight:
          'Oral speed drills help students build fluency and rapid recall without hesitation. In France, quick Q&A warm-ups start every language class!',
      vocabItems: [
        P4VocabItem(
          french: 'La révision',
          phonetics: 'lah ray-vee-zyon',
          english: 'The revision',
          icon: Icons.quiz_rounded,
          audioKey: 'la_revision',
        ),
        P4VocabItem(
          french: 'Mon père et ma mère',
          phonetics: 'mohn pair ay mah mair',
          english: 'My father and my mother',
          icon: Icons.family_restroom_rounded,
          audioKey: 'mon_pere_ma_mere',
        ),
        P4VocabItem(
          french: 'Mon frère et ma sœur',
          phonetics: 'mohn frair ay mah sur',
          english: 'My brother and my sister',
          icon: Icons.people_alt_rounded,
          audioKey: 'mon_frere_ma_soeur',
        ),
        P4VocabItem(
          french: 'Grand-père et Grand-mère',
          phonetics: 'grahn pair ay grahn mair',
          english: 'Grandfather and Grandmother',
          icon: Icons.elderly_rounded,
          audioKey: 'grand_pere_grand_mere',
        ),
        P4VocabItem(
          french: 'Oncle et Tante',
          phonetics: 'on-kl ay tahnt',
          english: 'Uncle and Aunt',
          icon: Icons.groups_2_rounded,
          audioKey: 'oncle_et_tante',
        ),
        P4VocabItem(
          french: 'Le stylo et le cahier',
          phonetics: 'luh stee-loh ay luh kah-yay',
          english: 'The pen and the notebook',
          icon: Icons.edit_note_rounded,
          audioKey: 'stylo_et_cahier',
        ),
        P4VocabItem(
          french: 'Le livre et le tableau',
          phonetics: 'luh leev-ruh ay luh tab-loh',
          english: 'The book and the board',
          icon: Icons.school_rounded,
          audioKey: 'livre_et_tableau',
        ),
        P4VocabItem(
          french: 'J\'ai / Tu as / Il a / Elle a',
          phonetics: 'zhay / too ah / eel ah / ell ah',
          english: 'I have / You have / He has / She has',
          icon: Icons.spellcheck_rounded,
          audioKey: 'avoir_singular',
        ),
        P4VocabItem(
          french: 'Voici mon école',
          phonetics: 'vwah-see mohn nay-kol',
          english: 'Here is my school',
          icon: Icons.location_city_rounded,
          audioKey: 'voici_mon_ecole',
        ),
        P4VocabItem(
          french: 'Très bien !',
          phonetics: 'tray byan',
          english: 'Very good ! / Well done !',
          icon: Icons.thumb_up_rounded,
          audioKey: 'tres_bien',
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: 'Mid-Term Oral Mastery Checklist',
          explanation:
              'Before the mid-term break, verify that every pupil can:\n1. State all 8 family members (père, mère, frère, sœur, grand-père, grand-mère, oncle, tante).\n2. Correctly use Mon vs Ma.\n3. Recite the singular conjugation of Avoir (J\'ai, Tu as, Il a, Elle a).\n4. Name 6 classroom items in French.',
          examples: [
            'Mon père est grand. Ma sœur est petite.',
            'J\'ai un stylo, un crayon et un livre.',
          ],
        ),
      ],
      classworkExercises: [
        P4ClassworkExercise(
          prompt: 'Which word means "My uncle"?',
          options: ['Ma tante', 'Mon oncle', 'Ma oncle', 'Le cousin'],
          correctOptionIndex: 1,
          explanation: '"Oncle" is masculine, so we use "Mon oncle".',
        ),
        P4ClassworkExercise(
          prompt: 'Complete: "Le professeur écrit sur le ___."',
          options: ['livre', 'stylo', 'tableau', 'élève'],
          correctOptionIndex: 2,
          explanation: 'Teachers write on the board ("le tableau").',
        ),
        P4ClassworkExercise(
          prompt: 'Translate: "J\'ai deux frères."',
          options: [
            'I have two sisters',
            'I have two brothers',
            'I have one brother',
            'Here are two brothers'
          ],
          correctOptionIndex: 1,
          explanation: '"Deux frères" means two brothers.',
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          questionNumber: 1,
          questionText: 'Give the French words for Father, Mother, Brother, and Sister.',
          expectedAnswer: 'Le père, La mère, Le frère, La sœur.',
        ),
        P4EvaluationQuestion(
          questionNumber: 2,
          questionText: 'When do we use "Mon" and when do we use "Ma"?',
          expectedAnswer: 'Mon is used before masculine nouns; Ma is used before feminine nouns.',
        ),
        P4EvaluationQuestion(
          questionNumber: 3,
          questionText: 'Conjugate the verb "Avoir" with Je, Tu, Il, and Elle.',
          expectedAnswer: 'J\'ai, Tu as, Il a, Elle a.',
        ),
      ],
      homeworkTasks: [
        P4HomeworkTask(
          taskNumber: 1,
          topic: 'Mid-Term Review Card',
          instructions:
              'Create a mid-term revision flashcard with 5 family members and 5 school objects in French.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 6: Mid-Term Break
    // ==========================================
    P4Lesson(
      week: 6,
      term: 2,
      topic: 'Pause de Mi-Trimestre (Vacances)',
      subtitle: 'Theme: Rest, Recharge & Vacation Review · Mid-Term Holiday Break',
      patternType: P4PatternType.midTermBreak,
      objectives: ['Holiday break for pupils to rest and spend quality time with family while reviewing French family and school terms at home.'],
      culturalInsight:
          'In France, the school year has regular two-week breaks called "petites vacances" every seven weeks so pupils stay refreshed and energetic!',
      vocabItems: [
        P4VocabItem(
          french: 'Bonnes vacances !',
          phonetics: 'bun vah-kahns',
          english: 'Have a good holiday !',
          icon: Icons.beach_access_rounded,
          audioKey: 'bonnes_vacances',
        ),
        P4VocabItem(
          french: 'Le repos',
          phonetics: 'luh ruh-poh',
          english: 'Rest / Relaxation',
          icon: Icons.bedtime_rounded,
          audioKey: 'le_repos',
        ),
        P4VocabItem(
          french: 'À bientôt !',
          phonetics: 'ah byan-toh',
          english: 'See you soon !',
          icon: Icons.waving_hand_rounded,
          audioKey: 'a_bientot',
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: 'Mid-Term Holiday Rest Note',
          explanation:
              'Use this mid-term break to greet family members in French: say "Bonjour Maman", "Merci Papa", and practice naming your stationery items!',
          examples: [
            'Bonjour Papa ! Voici mon cahier.',
            'Bonnes vacances à toute la famille !',
          ],
        ),
      ],
      classworkExercises: [
        P4ClassworkExercise(
          prompt: 'What does "Bonnes vacances" mean?',
          options: ['Good morning', 'Have a good holiday', 'Goodbye forever', 'Thank you'],
          correctOptionIndex: 1,
          explanation: '"Bonnes vacances" means Have a good holiday / vacation.',
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          questionNumber: 1,
          questionText: 'How do you wish your classmates a happy holiday in French?',
          expectedAnswer: 'Bonnes vacances !',
        ),
      ],
      homeworkTasks: [
        P4HomeworkTask(
          taskNumber: 1,
          topic: 'Family French Conversation',
          instructions:
              'At home, greet your parents in French and introduce one sibling using "Voici mon frère / Voici ma sœur".',
        ),
      ],
    ),

    // ==========================================
    // WEEK 7: School Facilities & Subjects (Part 2)
    // ==========================================
    P4Lesson(
      week: 7,
      term: 2,
      topic: 'Les Lieux de l\'École & Matières (Part 2)',
      subtitle: 'Theme: School Places & Favorite Subjects · School Places & Subjects',
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: ['Pupils learn to identify more places in school (bibliothèque, cour de récréation, bureau du directeur, toilettes), school subjects (français, anglais, mathématiques, sciences), express preferences using "J\'aime", and conjugate the verb "aller" (to go).'],
      culturalInsight:
          'In French schools, the playground is called "la cour de récréation" or simply "la récré". It is the favorite place for games like "la marelle" (hopscotch) and "le loup" (tag)!',
      vocabItems: [
        P4VocabItem(
          french: 'La bibliothèque',
          phonetics: 'lah bib-lee-oh-tek',
          english: 'The library',
          icon: Icons.local_library_rounded,
          audioKey: 'la_bibliotheque',
        ),
        P4VocabItem(
          french: 'La cour de récréation',
          phonetics: 'lah coor duh ray-cray-ah-see-on',
          english: 'The playground',
          icon: Icons.sports_kabaddi_rounded,
          audioKey: 'la_cour_de_recreation',
        ),
        P4VocabItem(
          french: 'Le bureau du directeur',
          phonetics: 'luh byoo-roh doo dee-rek-tur',
          english: 'The headteacher\'s office',
          icon: Icons.apartment_rounded,
          audioKey: 'bureau_du_directeur',
        ),
        P4VocabItem(
          french: 'Les toilettes',
          phonetics: 'lay twah-let',
          english: 'The restrooms / toilets',
          icon: Icons.wc_rounded,
          audioKey: 'les_toilettes',
        ),
        P4VocabItem(
          french: 'Le français',
          phonetics: 'luh frahn-say',
          english: 'French',
          icon: Icons.translate_rounded,
          audioKey: 'le_francais',
        ),
        P4VocabItem(
          french: 'L\'anglais',
          phonetics: 'lon-glay',
          english: 'English',
          icon: Icons.language_rounded,
          audioKey: 'langlais',
        ),
        P4VocabItem(
          french: 'Les mathématiques / Les maths',
          phonetics: 'lay maht',
          english: 'Mathematics / Maths',
          icon: Icons.calculate_rounded,
          audioKey: 'les_mathematiques',
        ),
        P4VocabItem(
          french: 'Les sciences',
          phonetics: 'lay syahns',
          english: 'Sciences',
          icon: Icons.science_rounded,
          audioKey: 'les_sciences',
        ),
        P4VocabItem(
          french: 'J\'aime...',
          phonetics: 'zhem',
          english: 'I like... (J\'aime le français)',
          icon: Icons.favorite_rounded,
          audioKey: 'jaime',
        ),
        P4VocabItem(
          french: 'Je vais à...',
          phonetics: 'zhuh vay ah',
          english: 'I am going to... (Je vais à la bibliothèque)',
          icon: Icons.directions_walk_rounded,
          audioKey: 'je_vais',
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: 'Conjugation of "Aller" (To Go)',
          explanation:
              'The singular forms of the verb aller are:\n• Je vais = I go / I am going\n• Tu vas = You go\n• Il va = He goes\n• Elle va = She goes',
          examples: [
            'Je vais à la bibliothèque. (I am going to the library.)',
            'Tu vas à la cour de récréation? (Are you going to the playground?)',
            'Elle va à la salle de classe. (She is going to the classroom.)',
          ],
        ),
        P4GrammarNote(
          ruleTitle: 'Expressing Likes: J\'aime + Subject',
          explanation:
              'Use "J\'aime" with the definite article (le, l\', les) before the school subject:\n• J\'aime le français. (I like French.)\n• J\'aime les mathématiques. (I like maths.)\n• J\'aime les sciences. (I like sciences.)',
          examples: [
            'J\'aime le français et l\'anglais.',
          ],
        ),
      ],
      classworkExercises: [
        P4ClassworkExercise(
          prompt: 'Where do you go to read books quietly in French?',
          options: [
            'La cour de récréation',
            'La bibliothèque',
            'Les toilettes',
            'Le bureau'
          ],
          correctOptionIndex: 1,
          explanation: '"La bibliothèque" is the library where you read quietly.',
        ),
        P4ClassworkExercise(
          prompt: 'What is the French name for the subject "Mathematics"?',
          options: ['Le français', 'L\'histoire', 'Les mathématiques', 'Les sciences'],
          correctOptionIndex: 2,
          explanation: '"Les mathématiques" (or "les maths") is Mathematics.',
        ),
        P4ClassworkExercise(
          prompt: 'Translate to French: "I like English."',
          options: [
            'J\'aime le français',
            'J\'aime l\'anglais',
            'Je vais à l\'anglais',
            'Voici l\'anglais'
          ],
          correctOptionIndex: 1,
          explanation: '"J\'aime l\'anglais" means I like English.',
        ),
        P4ClassworkExercise(
          prompt: 'Fill in the blank with the verb aller: "Tu ___ à l\'école."',
          options: ['vais', 'vas', 'va', 'allez'],
          correctOptionIndex: 1,
          explanation: 'For "Tu", the correct form is "vas" (Tu vas).',
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          questionNumber: 1,
          questionText: 'Where do you go to read storybooks quietly? Say it in French.',
          expectedAnswer: 'La bibliothèque.',
        ),
        P4EvaluationQuestion(
          questionNumber: 2,
          questionText: 'What is the French name for the subject "Mathematics"?',
          expectedAnswer: 'Les mathématiques (or Les maths).',
        ),
        P4EvaluationQuestion(
          questionNumber: 3,
          questionText: 'Translate: "J\'aime l\'anglais."',
          expectedAnswer: 'I like English.',
        ),
        P4EvaluationQuestion(
          questionNumber: 4,
          questionText: 'What does "Je vais" mean?',
          expectedAnswer: 'I go / I am going.',
        ),
        P4EvaluationQuestion(
          questionNumber: 5,
          questionText: 'Who works in "Le bureau du directeur"?',
          expectedAnswer: 'The headteacher or school principal.',
        ),
      ],
      homeworkTasks: [
        P4HomeworkTask(
          taskNumber: 1,
          topic: 'Favorite Subjects Sentences',
          instructions:
              'Write two sentences in French stating subjects you like using "J\'aime..." (e.g., "J\'aime le français. J\'aime les sciences.").',
        ),
        P4HomeworkTask(
          taskNumber: 2,
          topic: 'Fill-in-the-Blank with Aller',
          instructions:
              'Complete the sentence: "Tu ___ à l\'école." (vas).',
        ),
        P4HomeworkTask(
          taskNumber: 3,
          topic: 'Drawing the Playground',
          instructions:
              'Draw a picture of a school playground with children playing and label it "La cour de récréation".',
        ),
      ],
    ),

    // ==========================================
    // WEEK 8: School Activities & Days of the Week (Part 3)
    // ==========================================
    P4Lesson(
      week: 8,
      term: 2,
      topic: 'Activités Scolaires & Jours de la Semaine (Part 3)',
      subtitle: 'Theme: Daily Actions & 7 Days of the Week · Activities & Days of the Week',
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: ['Pupils learn verbs for school activities (étudier, lire, écrire, écouter, parler, jouer, chanter, dessiner), recite the 7 days of the week, and describe their weekly school schedule.'],
      culturalInsight:
          'In French, the days of the week are named after planets and Roman gods: Lundi (Moon), Mardi (Mars), Mercredi (Mercury), Jeudi (Jupiter), Vendredi (Venus)! Also, in French, days are written with small letters (no capital letter).',
      vocabItems: [
        P4VocabItem(
          french: 'Lundi',
          phonetics: 'luhn-dee',
          english: 'Monday',
          icon: Icons.calendar_today_rounded,
          audioKey: 'lundi',
        ),
        P4VocabItem(
          french: 'Mardi',
          phonetics: 'mahr-dee',
          english: 'Tuesday',
          icon: Icons.calendar_today_rounded,
          audioKey: 'mardi',
        ),
        P4VocabItem(
          french: 'Mercredi',
          phonetics: 'mair-kruh-dee',
          english: 'Wednesday',
          icon: Icons.calendar_today_rounded,
          audioKey: 'mercredi',
        ),
        P4VocabItem(
          french: 'Jeudi',
          phonetics: 'zhuh-dee',
          english: 'Thursday',
          icon: Icons.calendar_today_rounded,
          audioKey: 'jeudi',
        ),
        P4VocabItem(
          french: 'Vendredi',
          phonetics: 'vahn-druh-dee',
          english: 'Friday',
          icon: Icons.calendar_today_rounded,
          audioKey: 'vendredi',
        ),
        P4VocabItem(
          french: 'Samedi / Dimanche',
          phonetics: 'sahm-dee / dee-mahnsh',
          english: 'Saturday / Sunday (The weekend)',
          icon: Icons.weekend_rounded,
          audioKey: 'samedi_dimanche',
        ),
        P4VocabItem(
          french: 'Lire',
          phonetics: 'leer',
          english: 'To read (Je lis = I read)',
          icon: Icons.menu_book_rounded,
          audioKey: 'lire',
        ),
        P4VocabItem(
          french: 'Écrire',
          phonetics: 'ay-kreer',
          english: 'To write (J\'écris = I write)',
          icon: Icons.draw_rounded,
          audioKey: 'ecrire',
        ),
        P4VocabItem(
          french: 'Étudier',
          phonetics: 'ay-too-dyay',
          english: 'To study (J\'étudie = I study)',
          icon: Icons.school_rounded,
          audioKey: 'etudier',
        ),
        P4VocabItem(
          french: 'Jouer',
          phonetics: 'zhoo-ay',
          english: 'To play (Je joue = I play)',
          icon: Icons.sports_soccer_rounded,
          audioKey: 'jouer',
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: 'Describing Your Weekly Schedule',
          explanation:
              'To say what you do on a certain day, put "Le" before the day of the week:\n• "Le lundi, j\'ai français." = On Monday, I have French.\n• "Le mardi, j\'étudie les maths." = On Tuesday, I study maths.\n• "Le vendredi, je joue avec mes amis." = On Friday, I play with my friends.',
          examples: [
            'Le lundi, j\'ai français.',
            'À l\'école, je lis et j\'écris.',
          ],
        ),
      ],
      classworkExercises: [
        P4ClassworkExercise(
          prompt: 'What day of the week comes after "Lundi" in French?',
          options: ['Mercredi', 'Mardi', 'Jeudi', 'Vendredi'],
          correctOptionIndex: 1,
          explanation: 'Lundi (Monday) is followed by Mardi (Tuesday).',
        ),
        P4ClassworkExercise(
          prompt: 'What is the French verb for "To read"?',
          options: ['Écrire', 'Lire', 'Jouer', 'Chanter'],
          correctOptionIndex: 1,
          explanation: '"Lire" means to read. "Je lis" means I read.',
        ),
        P4ClassworkExercise(
          prompt: 'What is the French verb for "To play"?',
          options: ['Étudier', 'Écouter', 'Jouer', 'Parler'],
          correctOptionIndex: 2,
          explanation: '"Jouer" means to play.',
        ),
        P4ClassworkExercise(
          prompt: 'Translate: "On Monday, I have French."',
          options: [
            'Le mardi, j\'ai anglais',
            'Le lundi, j\'ai français',
            'Le vendredi, je lis',
            'Voici mon école'
          ],
          correctOptionIndex: 1,
          explanation: '"Le lundi, j\'ai français" means On Monday, I have French.',
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          questionNumber: 1,
          questionText: 'Recite the days of the school week in French (Monday to Friday).',
          expectedAnswer: 'Lundi, Mardi, Mercredi, Jeudi, Vendredi.',
        ),
        P4EvaluationQuestion(
          questionNumber: 2,
          questionText: 'What is the French verb for "To read"?',
          expectedAnswer: 'Lire.',
        ),
        P4EvaluationQuestion(
          questionNumber: 3,
          questionText: 'What is the French verb for "To play"?',
          expectedAnswer: 'Jouer.',
        ),
        P4EvaluationQuestion(
          questionNumber: 4,
          questionText: 'Translate: "Le mardi, j\'ai anglais."',
          expectedAnswer: 'On Tuesday, I have English.',
        ),
        P4EvaluationQuestion(
          questionNumber: 5,
          questionText: 'What do you do in the playground? Answer in a full French sentence.',
          expectedAnswer: 'Je joue dans la cour (or Dans la cour, je joue avec mes amis).',
        ),
      ],
      homeworkTasks: [
        P4HomeworkTask(
          taskNumber: 1,
          topic: 'Days of the Week Listing',
          instructions:
              'Write down the 7 days of the week in French in your notebook from Lundi to Dimanche.',
        ),
        P4HomeworkTask(
          taskNumber: 2,
          topic: 'Translation of Action Verbs',
          instructions:
              'Translate into French: "I read and I write." (Je lis et j\'écris.)',
        ),
        P4HomeworkTask(
          taskNumber: 3,
          topic: 'Schedule Sentence',
          instructions:
              'Complete the sentence: "Le ___ (Monday), j\'ai français." (Lundi).',
        ),
      ],
    ),

    // ==========================================
    // WEEK 9: Prepositions of Place & Colors (Part 4)
    // ==========================================
    P4Lesson(
      week: 9,
      term: 2,
      topic: 'Prépositions de Lieu & Couleurs (Part 4)',
      subtitle: 'Theme: Locations, Directions & Colors · Prepositions & 6 Core Colors',
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: ['Pupils learn 6 core colors (rouge, bleu, jaune, vert, noir, blanc), describe school items by color, use prepositions of place (sur, sous, dans, devant, derrière, à côté de), and ask "Où est...?".'],
      culturalInsight:
          'The national flag of France ("Le Drapeau Tricolore") has three vertical stripes: Bleu (Blue), Blanc (White), and Rouge (Red)! In French, color words usually come after the noun.',
      vocabItems: [
        P4VocabItem(
          french: 'Rouge',
          phonetics: 'roozh',
          english: 'Red',
          icon: Icons.palette_rounded,
          audioKey: 'rouge',
        ),
        P4VocabItem(
          french: 'Bleu / Bleue',
          phonetics: 'bluh',
          english: 'Blue (Masc / Fem)',
          icon: Icons.palette_rounded,
          audioKey: 'bleu',
        ),
        P4VocabItem(
          french: 'Jaune',
          phonetics: 'zhohn',
          english: 'Yellow',
          icon: Icons.palette_rounded,
          audioKey: 'jaune',
        ),
        P4VocabItem(
          french: 'Vert / Verte',
          phonetics: 'vair / vairt',
          english: 'Green (Masc / Fem)',
          icon: Icons.palette_rounded,
          audioKey: 'vert',
        ),
        P4VocabItem(
          french: 'Noir / Noire',
          phonetics: 'nwahr',
          english: 'Black (Masc / Fem)',
          icon: Icons.palette_rounded,
          audioKey: 'noir',
        ),
        P4VocabItem(
          french: 'Blanc / Blanche',
          phonetics: 'blahn / blahnsh',
          english: 'White (Masc / Fem)',
          icon: Icons.palette_rounded,
          audioKey: 'blanc',
        ),
        P4VocabItem(
          french: 'Sur',
          phonetics: 'sur',
          english: 'On (Sur la table)',
          icon: Icons.vertical_align_top_rounded,
          audioKey: 'sur',
        ),
        P4VocabItem(
          french: 'Sous',
          phonetics: 'soo',
          english: 'Under (Sous le bureau)',
          icon: Icons.vertical_align_bottom_rounded,
          audioKey: 'sous',
        ),
        P4VocabItem(
          french: 'Dans',
          phonetics: 'dahn',
          english: 'In / Inside (Dans le sac)',
          icon: Icons.inbox_rounded,
          audioKey: 'dans',
        ),
        P4VocabItem(
          french: 'Devant / Derrière',
          phonetics: 'duh-vahn / dair-ee-air',
          english: 'In front of / Behind',
          icon: Icons.swap_horiz_rounded,
          audioKey: 'devant_derriere',
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: 'Prepositions of Place (Où est...?)',
          explanation:
              'To state where something is in the classroom:\n• "Où est le livre?" = Where is the book?\n• "Le livre est sur la table." = The book is on the table.\n• "Le crayon est sous le bureau." = The pencil is under the desk.\n• "Le professeur est devant la classe." = The teacher is in front of the class.',
          examples: [
            'Le ballon est derrière la boîte.',
            'Mon stylo est dans le sac.',
          ],
        ),
        P4GrammarNote(
          ruleTitle: 'Color Agreement with Gender',
          explanation:
              'In French, colors come after the noun and match its gender:\n• Mon cahier est rouge. (Notebook is red)\n• Le stylo est vert. (Pen is green - masc)\n• La règle est verte. (Ruler is green - fem +e)\n• La craie est blanche. (Chalk is white - fem)',
          examples: [
            'Le tableau est noir.',
            'La gomme est blanche.',
          ],
        ),
      ],
      classworkExercises: [
        P4ClassworkExercise(
          prompt: 'What is the French word for the color "Red"?',
          options: ['Bleu', 'Rouge', 'Vert', 'Jaune'],
          correctOptionIndex: 1,
          explanation: '"Rouge" is French for Red.',
        ),
        P4ClassworkExercise(
          prompt: 'What does "Sur la table" mean?',
          options: ['Under the table', 'On the table', 'Behind the table', 'In the bag'],
          correctOptionIndex: 1,
          explanation: '"Sur" means "On". So "Sur la table" = On the table.',
        ),
        P4ClassworkExercise(
          prompt: 'If the ball is "Derrière la boîte", where is it located?',
          options: ['Inside the box', 'Under the box', 'Behind the box', 'In front of the box'],
          correctOptionIndex: 2,
          explanation: '"Derrière" means behind.',
        ),
        P4ClassworkExercise(
          prompt: 'Translate: "Mon stylo est vert."',
          options: [
            'My pen is blue',
            'My pen is green',
            'My book is red',
            'Here is my pencil'
          ],
          correctOptionIndex: 1,
          explanation: '"Vert" means green, so "Mon stylo est vert" = My pen is green.',
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          questionNumber: 1,
          questionText: 'What is the French word for the color Red?',
          expectedAnswer: 'Rouge.',
        ),
        P4EvaluationQuestion(
          questionNumber: 2,
          questionText: 'What is the French word for Black?',
          expectedAnswer: 'Noir (or Noire for feminine).',
        ),
        P4EvaluationQuestion(
          questionNumber: 3,
          questionText: 'Translate: "Mon stylo est vert."',
          expectedAnswer: 'My pen is green.',
        ),
        P4EvaluationQuestion(
          questionNumber: 4,
          questionText: 'If something is "Derrière" the door, where is it?',
          expectedAnswer: 'Behind the door.',
        ),
        P4EvaluationQuestion(
          questionNumber: 5,
          questionText: 'How do you ask "Where is the teacher?" in French?',
          expectedAnswer: 'Où est le professeur? (or Où est la professeure?).',
        ),
      ],
      homeworkTasks: [
        P4HomeworkTask(
          taskNumber: 1,
          topic: 'Coloring Circles & French Labels',
          instructions:
              'In your notebook, draw and color three circles: Red, Blue, and Yellow. Under each circle write its French name: "Rouge", "Bleu", "Jaune".',
        ),
        P4HomeworkTask(
          taskNumber: 2,
          topic: 'Describing Your School Bag Color',
          instructions:
              'Write one sentence in French describing the color of your school bag (e.g., "Mon sac est noir." or "Mon sac est bleu.").',
        ),
        P4HomeworkTask(
          taskNumber: 3,
          topic: 'Drawing Prepositions',
          instructions:
              'Draw a ball behind a box. Label the ball "le ballon" and the box "la boîte". Write the French sentence: "Le ballon est derrière la boîte."',
        ),
      ],
    ),

    // ==========================================
    // WEEK 10: Review & Integration (Immediate Environment)
    // ==========================================
    P4Lesson(
      week: 10,
      term: 2,
      topic: 'Intégration & Présentation de l\'École et Famille',
      subtitle: 'Theme: Family Presentation & School Tour · Integration & Role-Play',
      patternType: P4PatternType.borderMapAndAlphabet,
      objectives: ['Pupils integrate all Term 2 concepts: Family Bingo, School Tour, Parent-Teacher Meeting Role-Play ("Voici mon père. Enchanté, Madame"), and complete oral presentation "Mon École et Moi".'],
      culturalInsight:
          'In France, saying "Enchanté" (or "Enchantée" for girls) when being introduced to someone is considered a mark of supreme politeness and great manners!',
      vocabItems: [
        P4VocabItem(
          french: 'Enchanté / Enchantée',
          phonetics: 'ahn-shahn-tay',
          english: 'Pleased to meet you (Masc / Fem)',
          icon: Icons.handshake_rounded,
          audioKey: 'enchante',
        ),
        P4VocabItem(
          french: 'Mon école et moi',
          phonetics: 'mohn nay-kol ay mwah',
          english: 'My school and me',
          icon: Icons.record_voice_over_rounded,
          audioKey: 'mon_ecole_et_moi',
        ),
        P4VocabItem(
          french: 'Qu\'est-ce que c\'est ?',
          phonetics: 'kess kuh say',
          english: 'What is this?',
          icon: Icons.help_outline_rounded,
          audioKey: 'quest_ce_que_cest',
        ),
        P4VocabItem(
          french: 'C\'est le tableau !',
          phonetics: 'say luh tab-loh',
          english: 'It is the board !',
          icon: Icons.tv_rounded,
          audioKey: 'cest_le_tableau',
        ),
        P4VocabItem(
          french: 'C\'est mon cahier !',
          phonetics: 'say mohn kah-yay',
          english: 'It is my notebook !',
          icon: Icons.menu_book_rounded,
          audioKey: 'cest_mon_cahier',
        ),
        P4VocabItem(
          french: 'Voici mon père',
          phonetics: 'vwah-see mohn pair',
          english: 'Here is my father',
          icon: Icons.family_restroom_rounded,
          audioKey: 'voici_mon_pere',
        ),
        P4VocabItem(
          french: 'J\'aime le français',
          phonetics: 'zhem luh frahn-say',
          english: 'I like French',
          icon: Icons.favorite_rounded,
          audioKey: 'jaime_le_francais',
        ),
        P4VocabItem(
          french: 'Le ballon est sous la table',
          phonetics: 'luh bah-lohn ay soo lah tah-bl',
          english: 'The ball is under the table',
          icon: Icons.sports_soccer_rounded,
          audioKey: 'ballon_sous_table',
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: 'Parent-Teacher Meeting Role-Play Script',
          explanation:
              'Practice the visiting day conversation:\n• Élève: "Bonjour, Madame. Voici mon père."\n• Père: "Bonjour Madame. Enchanté."\n• Professeur: "Bonjour Monsieur. Enchantée."',
          examples: [
            'Voici mon père. Il s\'appelle M. Adebayo.',
            'Enchanté, Madame. J\'aime votre école.',
          ],
        ),
      ],
      classworkExercises: [
        P4ClassworkExercise(
          prompt: 'What polite word do you say when meeting someone new?',
          options: ['Merci', 'Pardon', 'Enchanté(e)', 'Au revoir'],
          correctOptionIndex: 2,
          explanation: '"Enchanté(e)" means Pleased / Nice to meet you.',
        ),
        P4ClassworkExercise(
          prompt: 'How do you ask "What is this?" in French?',
          options: [
            'Comment ça va ?',
            'Qu\'est-ce que c\'est ?',
            'Où est le livre ?',
            'Quel âge as-tu ?'
          ],
          correctOptionIndex: 1,
          explanation: '"Qu\'est-ce que c\'est ?" means What is this?.',
        ),
        P4ClassworkExercise(
          prompt: 'What day comes after "Lundi"?',
          options: ['Dimanche', 'Vendredi', 'Mardi', 'Jeudi'],
          correctOptionIndex: 2,
          explanation: 'Mardi (Tuesday) comes after Lundi (Monday).',
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          questionNumber: 1,
          questionText: 'What phrase do you use when introducing someone?',
          expectedAnswer: 'Voici... or C\'est...',
        ),
        P4EvaluationQuestion(
          questionNumber: 2,
          questionText: 'Name three objects you can find in a classroom.',
          expectedAnswer: 'Un tableau, un cahier, un stylo (or un livre, un bureau).',
        ),
        P4EvaluationQuestion(
          questionNumber: 3,
          questionText: 'Name three members of your family in French.',
          expectedAnswer: 'Mon père, ma mère, mon frère (or ma sœur, mon grand-père).',
        ),
        P4EvaluationQuestion(
          questionNumber: 4,
          questionText: 'What day comes after Lundi?',
          expectedAnswer: 'Mardi.',
        ),
        P4EvaluationQuestion(
          questionNumber: 5,
          questionText: 'What colour is "Jaune"?',
          expectedAnswer: 'Yellow.',
        ),
      ],
      homeworkTasks: [
        P4HomeworkTask(
          taskNumber: 1,
          topic: 'Paragraph: Mon École',
          instructions:
              'Write a 3-4 line paragraph titled "Mon École". Mention your school name, what you study there, and what you like (e.g., "Mon école s\'appelle... J\'étudie le français. J\'aime jouer dans la cour.").',
        ),
        P4HomeworkTask(
          taskNumber: 2,
          topic: 'Family Word Search Puzzle',
          instructions:
              'In your notebook, draw a 5x5 grid and hide 5 French family words: PERE, MERE, FRERE, SOEUR, TANTE.',
        ),
        P4HomeworkTask(
          taskNumber: 3,
          topic: 'Role-Play Practice at Home',
          instructions:
              'Practice the Parent-Teacher role-play dialogue at home with your parents.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 11: Comprehensive Term 2 Revision
    // ==========================================
    P4Lesson(
      week: 11,
      term: 2,
      topic: 'Grande Révision du Deuxième Trimestre',
      subtitle: 'Theme: Comprehensive End-of-Term Speed Revision · Term 2 Speed Revision Rally',
      patternType: P4PatternType.termRevisionRally,
      objectives: ['Comprehensive speed revision covering all Term 2 topics: Family members & possessives, school objects & places, days of the week, colors, and verbs Avoir & Aller.'],
      culturalInsight:
          'Mastering both family and school vocabulary allows Grade 4 pupils to hold complete everyday conversations about their home and school life in French!',
      vocabItems: [
        P4VocabItem(
          french: 'La famille et l\'école',
          phonetics: 'lah fah-mee ay lay-kol',
          english: 'Family and School',
          icon: Icons.menu_book_rounded,
          audioKey: 'famille_et_ecole',
        ),
        P4VocabItem(
          french: 'Mon, Ma, Mes',
          phonetics: 'mohn, mah, may',
          english: 'My (Masc, Fem, Plural)',
          icon: Icons.badge_rounded,
          audioKey: 'mon_ma_mes',
        ),
        P4VocabItem(
          french: 'Sur, Sous, Dans, Devant, Derrière',
          phonetics: 'sur, soo, dahn, duh-vahn, dair-ee-air',
          english: 'On, Under, In, In front of, Behind',
          icon: Icons.open_with_rounded,
          audioKey: 'prepositions_all',
        ),
        P4VocabItem(
          french: 'Rouge, Bleu, Jaune, Vert, Noir, Blanc',
          phonetics: 'roozh, bluh, zhohn, vair, nwahr, blahn',
          english: 'Red, Blue, Yellow, Green, Black, White',
          icon: Icons.palette_rounded,
          audioKey: 'couleurs_all',
        ),
        P4VocabItem(
          french: 'Lundi, Mardi, Mercredi, Jeudi, Vendredi',
          phonetics: 'luhn-dee, mahr-dee, mair-kruh-dee, zhuh-dee, vahn-druh-dee',
          english: 'Monday to Friday',
          icon: Icons.calendar_month_rounded,
          audioKey: 'jours_semaine_all',
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: 'Term 2 Mastery Summary',
          explanation:
              'Key Term 2 takeaways:\n1. Family: Mon père, Ma mère, Mes parents.\n2. Verbs: J\'ai (I have), Je vais (I go).\n3. Colors: Placed after nouns (Le stylo bleu).\n4. Prepositions: Le livre est sur la table.',
          examples: [
            'Mon frère est jeune et grand.',
            'Le lundi, je vais à l\'école.',
          ],
        ),
      ],
      classworkExercises: [
        P4ClassworkExercise(
          prompt: 'Which verb form completes: "Je ___ à la bibliothèque"?',
          options: ['ai', 'vais', 'as', 'va'],
          correctOptionIndex: 1,
          explanation: 'For "Je" with verb aller, we say "Je vais" (I am going).',
        ),
        P4ClassworkExercise(
          prompt: 'Where is the pencil in: "Le crayon est sous le bureau"?',
          options: ['On the desk', 'In the bag', 'Under the desk', 'Behind the door'],
          correctOptionIndex: 2,
          explanation: '"Sous" means under.',
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          questionNumber: 1,
          questionText: 'Conjugate "Avoir" (To have) and "Aller" (To go) for "Je".',
          expectedAnswer: 'J\'ai (I have) and Je vais (I go).',
        ),
      ],
      homeworkTasks: [
        P4HomeworkTask(
          taskNumber: 1,
          topic: 'Term 2 Master Revision Sheet',
          instructions:
              'Write a 5-sentence French story about a day in your school with your family.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 12: End-of-Term Examination Review
    // ==========================================
    P4Lesson(
      week: 12,
      term: 2,
      topic: 'Récapitulatif de Fin de Trimestre',
      subtitle: 'Theme: Term 2 Examination Review & Summary · Exam Oral Review',
      patternType: P4PatternType.termRevisionRally,
      objectives: ['Oral exam review and checklist for pupils to demonstrate spoken proficiency in family descriptions, school environments, colors, days of the week, and prepositions.'],
      culturalInsight:
          'End-of-term oral evaluations in France encourage confidence in speaking out loud in front of peers with poise, proper diction, and joy!',
      vocabItems: [
        P4VocabItem(
          french: 'L\'examen oral',
          phonetics: 'leg-zah-man oh-ral',
          english: 'The oral examination',
          icon: Icons.record_voice_over_rounded,
          audioKey: 'examen_oral',
        ),
        P4VocabItem(
          french: 'Félicitations !',
          phonetics: 'fay-lee-see-tah-zyon',
          english: 'Congratulations !',
          icon: Icons.star_rounded,
          audioKey: 'felicitations',
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: 'Term 2 Spoken Verification Checklist',
          explanation:
              '1. Introduce family clearly.\n2. Name 6 stationery items and colors.\n3. Recite 7 days of the week.\n4. Use Sur, Sous, Dans correctly.',
          examples: [
            'Voici mon père. J\'ai un frère.',
            'Le stylo est sur la table.',
          ],
        ),
      ],
      classworkExercises: [
        P4ClassworkExercise(
          prompt: 'Translate: "Congratulations!"',
          options: ['Merci', 'Au revoir', 'Félicitations !', 'Pardon'],
          correctOptionIndex: 2,
          explanation: '"Félicitations !" means Congratulations!.',
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          questionNumber: 1,
          questionText: 'Present your full school schedule for Monday and Tuesday in French.',
          expectedAnswer: 'Le lundi, j\'ai français. Le mardi, j\'ai anglais (or mathématiques).',
        ),
      ],
      homeworkTasks: [
        P4HomeworkTask(
          taskNumber: 1,
          topic: 'Vacation Reading Preparation',
          instructions:
              'Prepare your French notebook for Term 3: Numbers 0-20, Telling Time, and Meals!',
        ),
      ],
    ),

    // ==========================================
    // WEEK 13: Term 2 Vacation & Term 3 Preview
    // ==========================================
    P4Lesson(
      week: 13,
      term: 2,
      topic: 'Clôture du Trimestre & Aperçu du Trimestre 3',
      subtitle: 'Theme: Holiday Celebration & Term 3 Roadmap · Vacation & Term 3 Preview',
      patternType: P4PatternType.vacationCelebration,
      objectives: ['Celebration of Term 2 completion with French holiday wishes and a preview of Term 3 topics (Counting 0 to 20 math, Telling Time, and Foods & Meals).'],
      culturalInsight:
          'During French holidays, families love having picnics in parks and sharing baguettes, cheese, and fresh fruit together!',
      vocabItems: [
        P4VocabItem(
          french: 'Bonnes vacances !',
          phonetics: 'bun vah-kahns',
          english: 'Have a great vacation !',
          icon: Icons.celebration_rounded,
          audioKey: 'bonnes_vacances',
        ),
        P4VocabItem(
          french: 'À la rentrée !',
          phonetics: 'ah lah rahn-tray',
          english: 'See you when school resumes !',
          icon: Icons.school_rounded,
          audioKey: 'a_la_rentree',
        ),
        P4VocabItem(
          french: 'Le temps et les repas',
          phonetics: 'luh tahn ay lay ruh-pah',
          english: 'Time and Meals (Term 3 Theme)',
          icon: Icons.restaurant_rounded,
          audioKey: 'temps_et_repas',
        ),
      ],
      grammarNotes: [
        P4GrammarNote(
          ruleTitle: 'Term 3 Roadmap Preview',
          explanation:
              'In Term 3, we will explore:\n• Counting 0 to 20 and simple French arithmetic (+ and =)\n• Telling Time on the hour, half past, and quarter past\n• Daily routines and times of day\n• Food items, meals (breakfast, lunch, dinner), and ordering!',
          examples: [
            'Quelle heure est-il? (What time is it?)',
            'Le petit-déjeuner (Breakfast), Le déjeuner (Lunch), Le dîner (Dinner)',
          ],
        ),
      ],
      classworkExercises: [
        P4ClassworkExercise(
          prompt: 'What does "À la rentrée" mean?',
          options: [
            'Goodbye forever',
            'See you when school resumes',
            'Good evening',
            'I have a book'
          ],
          correctOptionIndex: 1,
          explanation: '"À la rentrée !" means See you when school resumes / at the start of the next term.',
        ),
      ],
      evaluationQuestions: [
        P4EvaluationQuestion(
          questionNumber: 1,
          questionText: 'What are the main topics coming up in Term 3?',
          expectedAnswer: 'Counting 0-20 math, Telling time (l\'heure), and Foods & Meals (les aliments et les repas).',
        ),
      ],
      homeworkTasks: [
        P4HomeworkTask(
          taskNumber: 1,
          topic: 'Term 3 Readiness',
          instructions:
              'Practice counting to 20 in French with your parents over the holidays!',
        ),
      ],
    ),
  ];
}
