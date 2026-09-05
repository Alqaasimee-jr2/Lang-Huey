import 'package:flutter/material.dart';
import '../models/p5_lesson_model.dart';

class P5Term2Lessons {
  static final List<P5Lesson> weeks = [
    // ==========================================
    // WEEK 1: PARLER DE LA GRANDE FAMILLE (PART I)
    // ==========================================
    P5Lesson(
      term: 2,
      week: 1,
      topic: 'Parler de la Grande Famille (Partie I: Membres Élargis)',
      subtitle: 'Extended Family Relatives: Grand-père, Grand-mère, Oncle, Tante, Cousin(e)',
      patternType: P5PatternType.extendedFamily,
      objectives: [
        'Identify and correctly pronounce extended family vocabulary in French.',
        'Distinguish between male and female relatives (oncle/tante, cousin/cousine).',
        'Use possessive adjectives accurately: "mon" (masc), "ma" (fem), "mes" (plural).',
        'Construct a 3-generation family tree in French on the smartboard.',
      ],
      culturalInsight:
          'In Nigerian and African culture, the extended family is closely knit and deeply cherished! In French, grandparents are "les grands-parents", and cousins are regarded as close brothers and sisters.',
      vocabItems: [
        P5VocabItem(
          french: 'Les grands-parents',
          phonetics: 'lay grahn pah-rahn',
          english: 'The grandparents',
          usageNote: 'Plural title for grandfather and grandmother.',
          icon: Icons.elderly_rounded,
          audioKey: 'les_grands_parents',
        ),
        P5VocabItem(
          french: 'Le grand-père',
          phonetics: 'luh grahn-pair',
          english: 'The grandfather',
          usageNote: 'Respectful title for paternal or maternal grandfather.',
          icon: Icons.elderly_woman_rounded,
          audioKey: 'le_grand_pere',
        ),
        P5VocabItem(
          french: 'La grand-mère',
          phonetics: 'lah grahn-mair',
          english: 'The grandmother',
          usageNote: 'Respectful title for grandmother.',
          icon: Icons.elderly_rounded,
          audioKey: 'la_grand_mere',
        ),
        P5VocabItem(
          french: 'L\'oncle',
          phonetics: 'lohn-kluh',
          english: 'The uncle',
          usageNote: 'Brother of your father or mother.',
          icon: Icons.person_rounded,
          audioKey: 'loncle',
        ),
        P5VocabItem(
          french: 'La tante',
          phonetics: 'lah tahnt',
          english: 'The aunt',
          usageNote: 'Sister of your father or mother.',
          icon: Icons.person_3_rounded,
          audioKey: 'la_tante',
        ),
        P5VocabItem(
          french: 'Le cousin',
          phonetics: 'luh koo-zan',
          english: 'The male cousin',
          usageNote: 'Son of your aunt or uncle.',
          icon: Icons.boy_rounded,
          audioKey: 'le_cousin',
        ),
        P5VocabItem(
          french: 'La cousine',
          phonetics: 'lah koo-zeen',
          english: 'The female cousin',
          usageNote: 'Daughter of your aunt or uncle.',
          icon: Icons.girl_rounded,
          audioKey: 'la_cousine',
        ),
        P5VocabItem(
          french: 'Mon, Ma, Mes',
          phonetics: 'mohn, mah, may',
          english: 'My (Masc, Fem, Plural)',
          usageNote: 'Possessive adjectives in French.',
          icon: Icons.family_restroom_rounded,
          audioKey: 'mon_ma_mes',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What is the French title for your mother\'s sister?',
          options: ['Ma grand-mère', 'Ma tante', 'Ma cousine', 'Ma sœur'],
          correctOptionIndex: 1,
          explanation: 'Your mother\'s or father\'s sister is "la tante" (aunt).',
        ),
        P5InteractiveExercise(
          prompt: 'Which possessive adjective is used with the plural noun "grands-parents"?',
          options: ['Mon', 'Ma', 'Mes', 'Le'],
          correctOptionIndex: 2,
          explanation: 'For plural family members, we use "mes" (mes grands-parents).',
        ),
        P5InteractiveExercise(
          prompt: 'How do you say "This is my uncle" in French?',
          options: ['C\'est ma tante', 'C\'est mon oncle', 'Voici mon cousin', 'C\'est mon frère'],
          correctOptionIndex: 1,
          explanation: '"C\'est mon oncle" means "This is my uncle".',
        ),
        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Les grands-parents', english: 'The grandparents'),
            DrillPair(french: 'Le grand-père', english: 'The grandfather'),
            DrillPair(french: 'La grand-mère', english: 'The grandmother'),
            DrillPair(french: 'L\'oncle', english: 'The uncle'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (The grandparents):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Les grands-parents', 'Le grand-père', 'La grand-mère', 'L\'oncle'],
          correctWord: 'Les grands-parents',
          explanation: 'Correct! "Les grands-parents" translates to "The grandparents".',
        ),
        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Name 4 extended family members in French.',
          answer: 'Le grand-père, la grand-mère, l\'oncle, la tante (or le cousin / la cousine).',
          hint: 'Grandparents, uncle, aunt, cousin.',
        ),
        P5EvaluationQuestion(
          question: 'Translate to French: "My grandmother is kind."',
          answer: 'Ma grand-mère est gentille.',
          hint: 'Ma grand-mère... gentille.',
        ),
        P5EvaluationQuestion(
          question: 'What is the difference between "le cousin" and "la cousine"?',
          answer: '"Le cousin" is a male cousin, while "la cousine" is a female cousin.',
          hint: 'Male vs female cousin.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Family Tree Project',
          instruction: 'Draw your extended family tree in your French notebook with names for grandparents, uncles, aunts, and cousins.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Possessive Adjectives with Family Members',
        explanation:
            'Use "mon" before masculine singular nouns (mon oncle, mon cousin), "ma" before feminine singular nouns (ma tante, ma cousine), and "mes" before all plural nouns (mes grands-parents, mes cousins).',
        examples: [
          'Mon grand-père (My grandfather - masc)',
          'Ma tante (My aunt - fem)',
          'Mes cousins (My cousins - plural)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 2: PARLER DE LA GRANDE FAMILLE (PART II)
    // ==========================================
    P5Lesson(
      term: 2,
      week: 2,
      topic: 'Parler de la Grande Famille (Partie II: Neveux, Nièces & Âge)',
      subtitle: 'Nephews, Nieces, Grandchildren, Age & Family Size Descriptors',
      patternType: P5PatternType.familyTreeAdvanced,
      objectives: [
        'Identify additional family relationships: "le neveu", "la nièce", "le petit-fils", "la petite-fille".',
        'Describe family members\' age using "âgé(e)" (elderly/old) and "jeune" (young).',
        'State family size: "J\'ai une grande famille" vs "J\'ai une petite famille".',
        'Construct complete sentences linking relationship, age, and personality.',
      ],
      culturalInsight:
          'In Francophone storytelling, grandparents are honored as the keepers of wisdom. Saying "Mon grand-père est âgé et sage" (My grandfather is elderly and wise) reflects deep traditional reverence.',
      vocabItems: [
        P5VocabItem(
          french: 'Le neveu',
          phonetics: 'luh nuh-vuh',
          english: 'The nephew',
          usageNote: 'Son of your brother or sister.',
          icon: Icons.boy_rounded,
          audioKey: 'le_neveu',
        ),
        P5VocabItem(
          french: 'La nièce',
          phonetics: 'lah nyece',
          english: 'The niece',
          usageNote: 'Daughter of your brother or sister.',
          icon: Icons.girl_rounded,
          audioKey: 'la_niece',
        ),
        P5VocabItem(
          french: 'Le petit-fils',
          phonetics: 'luh puh-tee-feess',
          english: 'The grandson',
          usageNote: 'Son of your child.',
          icon: Icons.child_care_rounded,
          audioKey: 'le_petit_fils',
        ),
        P5VocabItem(
          french: 'La petite-fille',
          phonetics: 'lah puh-teet-feey',
          english: 'The granddaughter',
          usageNote: 'Daughter of your child.',
          icon: Icons.child_care_rounded,
          audioKey: 'la_petite_fille',
        ),
        P5VocabItem(
          french: 'Il est âgé / Elle est âgée',
          phonetics: 'eel ay ah-zhay / ell ay ah-zhay',
          english: 'He is elderly / She is elderly',
          usageNote: 'Respectful term for elders.',
          icon: Icons.elderly_rounded,
          audioKey: 'age_agee',
        ),
        P5VocabItem(
          french: 'Il est jeune / Elle est jeune',
          phonetics: 'eel ay zhuhn',
          english: 'He is young / She is young',
          usageNote: 'Used for children and youth.',
          icon: Icons.face_rounded,
          audioKey: 'jeune',
        ),
        P5VocabItem(
          french: 'J\'ai une grande famille',
          phonetics: 'zhay oon grahnd fah-meey',
          english: 'I have a big family',
          usageNote: 'Describing large household/extended family.',
          icon: Icons.groups_rounded,
          audioKey: 'jai_une_grande_famille',
        ),
        P5VocabItem(
          french: 'J\'ai une petite famille',
          phonetics: 'zhay oon puh-teet fah-meey',
          english: 'I have a small family',
          usageNote: 'Describing smaller family units.',
          icon: Icons.group_rounded,
          audioKey: 'jai_une_petite_famille',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What relationship is "le fils de mon frère" (the son of my brother)?',
          options: ['Mon neveu', 'Mon oncle', 'Mon cousin', 'Mon petit-fils'],
          correctOptionIndex: 0,
          explanation: 'The son of your brother is your nephew ("mon neveu").',
        ),
        P5InteractiveExercise(
          prompt: 'How do you describe an elderly grandmother in French?',
          options: ['Elle est jeune', 'Elle est âgée', 'Elle est petite', 'Elle est forte'],
          correctOptionIndex: 1,
          explanation: '"Elle est âgée" means "She is elderly/aged".',
        ),
        P5InteractiveExercise(
          prompt: 'Which phrase means "I have a big family"?',
          options: [
            'J\'ai une petite famille',
            'J\'ai une grande famille',
            'Voici ma famille',
            'C\'est mon père'
          ],
          correctOptionIndex: 1,
          explanation: '"J\'ai une grande famille" means "I have a big family".',
        ),
        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Le neveu', english: 'The nephew'),
            DrillPair(french: 'La nièce', english: 'The niece'),
            DrillPair(french: 'Le petit-fils', english: 'The grandson'),
            DrillPair(french: 'La petite-fille', english: 'The granddaughter'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (The nephew):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Le neveu', 'La nièce', 'Le petit-fils', 'La petite-fille'],
          correctWord: 'Le neveu',
          explanation: 'Correct! "Le neveu" translates to "The nephew".',
        ),
        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Translate to French: "My cousin is young and my grandfather is elderly."',
          answer: 'Mon cousin est jeune et mon grand-père est âgé.',
          hint: 'Jeune (young), Âgé (elderly).',
        ),
        P5EvaluationQuestion(
          question: 'What is the feminine counterpart of "le neveu"?',
          answer: 'La nièce (niece).',
          hint: 'Neveu -> Nièce.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Family Description',
          instruction: 'Write 4 sentences describing the size of your family and whether your grandparents are elderly.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Adjectives for Age and Family Size',
        explanation:
            'Adjectives take an extra "e" in feminine form: grand -> grande, petit -> petite, âgé -> âgée. The adjective "jeune" already ends in "e" and stays the same for both masculine and feminine.',
        examples: [
          'Mon grand-père est âgé. (Masc)',
          'Ma grand-mère est âgée. (Fem)',
          'Mon cousin est jeune. / Ma cousine est jeune. (Both masc & fem)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 3: PARLER DE LA GRANDE FAMILLE (PART III)
    // ==========================================
    P5Lesson(
      term: 2,
      week: 3,
      topic: 'Parler de la Grande Famille (Partie III: Visites et Réunions)',
      subtitle: 'Visiting Relatives, Family Reunions & Village Gatherings: "Nous visitons..."',
      patternType: P5PatternType.familyGathering,
      objectives: [
        'Express visiting relatives using the verb visiter: "Nous visitons nos grands-parents".',
        'Describe family activities: celebrating, eating meals together, and storytelling.',
        'Use the plural possessive adjective "nos" (our).',
        'Appreciate cultural values of elder respect and village gatherings.',
      ],
      culturalInsight:
          'During festive holidays, Nigerian families love traveling "au village" to gather with extended relatives, share hearty meals, and receive blessings from grandparents!',
      vocabItems: [
        P5VocabItem(
          french: 'Nous visitons nos grands-parents',
          phonetics: 'noo vee-zee-tohn noh grahn pah-rahn',
          english: 'We visit our grandparents',
          usageNote: 'Holiday travel expression.',
          icon: Icons.directions_bus_rounded,
          audioKey: 'nous_visitons_nos_grands_parents',
        ),
        P5VocabItem(
          french: 'La réunion de famille',
          phonetics: 'lah ray-oo-nyohn duh fah-meey',
          english: 'The family reunion / Gathering',
          usageNote: 'Special celebratory gathering.',
          icon: Icons.celebration_rounded,
          audioKey: 'la_reunion_de_famille',
        ),
        P5VocabItem(
          french: 'Au village',
          phonetics: 'oh vee-lahzh',
          english: 'In the village / Hometown',
          usageNote: 'Ancestral hometown trip.',
          icon: Icons.holiday_village_rounded,
          audioKey: 'au_village',
        ),
        P5VocabItem(
          french: 'Nous mangeons ensemble',
          phonetics: 'noo mahn-zhohn ahn-sahm-bluh',
          english: 'We eat together',
          usageNote: 'Shared family dining.',
          icon: Icons.restaurant_rounded,
          audioKey: 'nous_mangeons_ensemble',
        ),
        P5VocabItem(
          french: 'Nous fêtons',
          phonetics: 'noo fay-tohn',
          english: 'We celebrate',
          usageNote: 'Festive occasions.',
          icon: Icons.cake_rounded,
          audioKey: 'nous_fetons',
        ),
        P5VocabItem(
          french: 'Respecter les aînés',
          phonetics: 'res-pek-tay lay zay-nay',
          english: 'To respect elders',
          usageNote: 'Core cultural virtue.',
          icon: Icons.volunteer_activism_rounded,
          audioKey: 'respecter_les_aines',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'How do you say "We visit our grandparents" in French?',
          options: [
            'Je visite mon oncle',
            'Nous visitons nos grands-parents',
            'Ils visitent le village',
            'Vous visitez la maison'
          ],
          correctOptionIndex: 1,
          explanation: '"Nous visitons nos grands-parents" means "We visit our grandparents".',
        ),
        P5InteractiveExercise(
          prompt: 'What does "Nous mangeons ensemble" mean?',
          options: ['We play together', 'We eat together', 'We travel together', 'We sing together'],
          correctOptionIndex: 1,
          explanation: '"Nous mangeons ensemble" translates to "We eat together".',
        ),
        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Nous visitons nos grands-parents', english: 'We visit our grandparents'),
            DrillPair(french: 'La réunion de famille', english: 'The family reunion / Gathering'),
            DrillPair(french: 'Au village', english: 'In the village / Hometown'),
            DrillPair(french: 'Nous mangeons ensemble', english: 'We eat together'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (We visit our grandparents):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Nous visitons nos grands-parents', 'La réunion de famille', 'Au village', 'Nous mangeons ensemble'],
          correctWord: 'Nous visitons nos grands-parents',
          explanation: 'Correct! "Nous visitons nos grands-parents" translates to "We visit our grandparents".',
        ),
        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),
        P5InteractiveExercise(
          prompt: 'What is the correct English translation for "La réunion de famille"?',
          options: ['The family reunion / Gathering', 'We visit our grandparents', 'In the village / Hometown', 'We eat together'],
          correctOptionIndex: 0,
          explanation: '"La réunion de famille" translates to "The family reunion / Gathering".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Translate: "During holidays, we go to the village for the family reunion."',
          answer: 'Pendant les vacances, nous allons au village pour la réunion de famille.',
          hint: 'Au village, la réunion de famille.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Cultural Essay',
          instruction: 'Write 3 French sentences describing what your family does when you visit relatives.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'The Plural Subject Pronoun "Nous" (We)',
        explanation:
            'When speaking about activities done together as a family, use the subject pronoun "Nous" (We). Regular -er verbs take the ending "-ons" with nous: visiter -> nous visitons, manger -> nous mangeons.',
        examples: [
          'Nous visitons nos cousins. (We visit our cousins.)',
          'Nous fêtons ensemble. (We celebrate together.)',
          'Nous aimons notre famille. (We love our family.)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 4: PARLER DES VOISINS (PART I)
    // ==========================================
    P5Lesson(
      term: 2,
      week: 4,
      topic: 'Parler des Voisins (Partie I: Voisinage et Présentations)',
      subtitle: 'Neighborhood Vocabulary & Neighbor Introductions: "Voici mon voisin / ma voisine"',
      patternType: P5PatternType.neighborStudio,
      teachingStyle: TeachingStyle.conversationalDialogue,
      objectives: [
        'Identify neighborhood vocabulary: "le voisin", "la voisine", "les voisins", "le quartier".',
        'Introduce a neighbor politely using "Voici mon voisin / ma voisine".',
        'Describe neighbors using positive adjectives: "sympathique" (nice), "aimable" (friendly).',
        'Explain the importance of peaceful community living.',
      ],
      culturalInsight:
          'In Francophone Africa, neighbors are seen as extended family. There is a famous African proverb: "Your neighbor is your closest brother in times of need!"',
      vocabItems: [
        P5VocabItem(
          french: 'Le voisin',
          phonetics: 'luh vwah-zan',
          english: 'The male neighbor',
          usageNote: 'Neighboring man or boy.',
          icon: Icons.person_pin_rounded,
          audioKey: 'le_voisin',
        ),
        P5VocabItem(
          french: 'La voisine',
          phonetics: 'lah vwah-zeen',
          english: 'The female neighbor',
          usageNote: 'Neighboring woman or girl.',
          icon: Icons.person_pin_circle_rounded,
          audioKey: 'la_voisine',
        ),
        P5VocabItem(
          french: 'Les voisins',
          phonetics: 'lay vwah-zan',
          english: 'The neighbors (Plural)',
          usageNote: 'Community members living nearby.',
          icon: Icons.location_city_rounded,
          audioKey: 'les_voisins',
        ),
        P5VocabItem(
          french: 'Le quartier',
          phonetics: 'luh kahr-tyay',
          english: 'The neighborhood / Area',
          usageNote: 'Your local residential district.',
          icon: Icons.map_rounded,
          audioKey: 'le_quartier',
        ),
        P5VocabItem(
          french: 'La maison voisine',
          phonetics: 'lah may-zohn vwah-zeen',
          english: 'The neighboring house (Next door)',
          usageNote: 'House beside yours.',
          icon: Icons.cottage_rounded,
          audioKey: 'la_maison_voisine',
        ),
        P5VocabItem(
          french: 'Il est sympathique / aimable',
          phonetics: 'eel ay sam-pah-teek / ay-mah-bluh',
          english: 'He is friendly / pleasant / kind',
          usageNote: 'Commending neighborly character.',
          icon: Icons.thumb_up_alt_rounded,
          audioKey: 'sympathique_aimable',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What is the feminine word for a female neighbor in French?',
          options: ['Le voisin', 'La voisine', 'Les voisins', 'La maison'],
          correctOptionIndex: 1,
          explanation: 'A female neighbor is "la voisine" (ending in -e).',
        ),
        P5InteractiveExercise(
          prompt: 'Which French word means "the neighborhood"?',
          options: ['La ville', 'Le quartier', 'Le village', 'La rue'],
          correctOptionIndex: 1,
          explanation: '"Le quartier" translates to the neighborhood or district.',
        ),
        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Le voisin', english: 'The male neighbor'),
            DrillPair(french: 'La voisine', english: 'The female neighbor'),
            DrillPair(french: 'Les voisins', english: 'The neighbors (Plural)'),
            DrillPair(french: 'Le quartier', english: 'The neighborhood / Area'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (The male neighbor):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Le voisin', 'La voisine', 'Les voisins', 'Le quartier'],
          correctWord: 'Le voisin',
          explanation: 'Correct! "Le voisin" translates to "The male neighbor".',
        ),
        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),
        P5InteractiveExercise(
          prompt: 'What is the correct English translation for "La voisine"?',
          options: ['The female neighbor', 'The male neighbor', 'The neighbors (Plural)', 'The neighborhood / Area'],
          correctOptionIndex: 0,
          explanation: '"La voisine" translates to "The female neighbor".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Introduce your next-door neighbor in French stating their name and personality.',
          answer: 'Voici mon voisin / ma voisine [Nom]. Il/Elle est très sympathique.',
          hint: 'Voici mon voisin... sympathique.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Community Drawing',
          instruction: 'Draw your street with your house and the neighboring house ("la maison voisine") and write 3 French labels.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 5: EXAMEN DE MI-TRIMESTRE (SPEED RALLY)
    // ==========================================
    P5Lesson(
      term: 2,
      week: 5,
      topic: 'Examen de Mi-Trimestre (Mid-Term Oral Speed Rally)',
      subtitle: 'Mid-Term Speed Review & Team Buzzer Stations for Weeks 1 to 4',
      patternType: P5PatternType.term2RevisionRally,
      teachingStyle: TeachingStyle.storyNarrative,
      objectives: [
        'Consolidate extended family relationships and possessive adjective mastery.',
        'Demonstrate fluency in introducing and describing neighbors.',
        'Participate in classroom team speed buzzer challenges.',
      ],
      culturalInsight:
          'Classroom speed drills make learning energetic and collaborative! Pupils compete in teams to answer rapid-fire French questions.',
      vocabItems: [
        P5VocabItem(
          french: 'La grande famille',
          phonetics: 'lah grahnd fah-meey',
          english: 'The extended family',
          usageNote: 'Full family vocabulary set.',
          icon: Icons.diversity_1_rounded,
          audioKey: 'la_grande_famille',
        ),
        P5VocabItem(
          french: 'Les bons voisins',
          phonetics: 'lay bohn vwah-zan',
          english: 'The good neighbors',
          usageNote: 'Community harmony theme.',
          icon: Icons.handshake_rounded,
          audioKey: 'les_bons_voisins',
        ),
        P5VocabItem(
          french: 'Le champion du trimestre',
          phonetics: 'luh shahm-pyohn doo tree-mestr',
          english: 'The term champion',
          usageNote: 'Award badge for speed drill winners.',
          icon: Icons.emoji_events_rounded,
          audioKey: 'le_champion_du_trimestre',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What is the relationship of your father\'s brother?',
          options: ['Mon grand-père', 'Mon oncle', 'Mon cousin', 'Mon neveu'],
          correctOptionIndex: 1,
          explanation: 'Your father\'s brother is your uncle ("mon oncle").',
        ),
        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'La grande famille', english: 'The extended family'),
            DrillPair(french: 'Les bons voisins', english: 'The good neighbors'),
            DrillPair(french: 'Le champion du trimestre', english: 'The term champion'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (The extended family):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['La grande famille', 'Les bons voisins', 'Le champion du trimestre', 'Merci'],
          correctWord: 'La grande famille',
          explanation: 'Correct! "La grande famille" translates to "The extended family".',
        ),
        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),
        P5InteractiveExercise(
          prompt: 'What is the correct English translation for "Les bons voisins"?',
          options: ['The good neighbors', 'The extended family', 'The term champion', 'Goodbye'],
          correctOptionIndex: 0,
          explanation: '"Les bons voisins" translates to "The good neighbors".',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Choose the correct French term for "The term champion":',
          sentenceTemplate: 'En classe, nous disons ___ avec politesse.',
          wordBank: ['Le champion du trimestre', 'La grande famille', 'Les bons voisins', 'S\'il vous plaît'],
          correctWord: 'Le champion du trimestre',
          explanation: 'Exact ! "Le champion du trimestre" means "The term champion".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Deliver a 30-second presentation of your extended family and your neighbors.',
          answer: 'Pupils deliver oral presentations on the smartboard.',
          hint: 'Mes grands-parents, mes oncles, mes voisins...',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Mid-Term Review',
          instruction: 'Practice reciting 5 family relations and 2 neighbor phrases during the mid-term break.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 6: CONGÉ DE MI-TRIMESTRE (BREAK & REST)
    // ==========================================
    P5Lesson(
      term: 2,
      week: 6,
      topic: 'Congé de Mi-Trimestre (Mid-Term Break & Intermission)',
      subtitle: 'Mid-Term Rest, Community Games & Preparation for Part II',
      patternType: P5PatternType.term2Vacation,
      objectives: [
        'Enjoy a restful break with family and community.',
        'Sing French family songs.',
        'Prepare for Week 7 (Neighborly Activities, Gratitude & Days of the Week).',
      ],
      culturalInsight:
          'Mid-term breaks provide time to bond with family, play community sports with neighborhood friends, and recharge for the second half of the term!',
      vocabItems: [
        P5VocabItem(
          french: 'Bonnes vacances de mi-trimestre !',
          phonetics: 'bun vah-kahns duh mee tree-mestr',
          english: 'Happy mid-term break!',
          usageNote: 'Break departure greeting.',
          icon: Icons.beach_access_rounded,
          audioKey: 'bonnes_vacances_mi_trimestre',
        ),
        P5VocabItem(
          french: 'À très bientôt !',
          phonetics: 'ah tray byan-toh',
          english: 'See you very soon!',
          usageNote: 'Friendly departure wish.',
          icon: Icons.waving_hand_rounded,
          audioKey: 'a_tres_bientot',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What French wish do you say when departing for mid-term break?',
          options: ['Bonsoir', 'Bonnes vacances !', 'De rien', 'Au secours'],
          correctOptionIndex: 1,
          explanation: '"Bonnes vacances !" wishes a happy holiday.',
        ),
        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Bonnes vacances de mi-trimestre !', english: 'Happy mid-term break!'),
            DrillPair(french: 'À très bientôt !', english: 'See you very soon!'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (Happy mid-term break!):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Bonnes vacances de mi-trimestre !', 'À très bientôt !', 'Merci', 'Merci'],
          correctWord: 'Bonnes vacances de mi-trimestre !',
          explanation: 'Correct! "Bonnes vacances de mi-trimestre !" translates to "Happy mid-term break!".',
        ),
        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),
        P5InteractiveExercise(
          prompt: 'What is the correct English translation for "À très bientôt !"?',
          options: ['See you very soon!', 'Happy mid-term break!', 'Goodbye', 'Goodbye'],
          correctOptionIndex: 0,
          explanation: '"À très bientôt !" translates to "See you very soon!".',
        ),
        P5InteractiveExercise(
          prompt: 'Which of the following is an essential habit for mastering French in class?',
          options: ['Practicing spoken dialogue with enthusiasm', 'Staying completely silent', 'Ignoring pronunciation rules', 'Reading without listening'],
          correctOptionIndex: 0,
          explanation: 'Active speaking and confident practice are key to fluency in French.',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'What does "À très bientôt" mean?',
          answer: 'See you very soon!',
          hint: 'Parting phrase with "très bientôt".',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Holiday Reading',
          instruction: 'Enjoy your break and get ready for Week 7: "Activités avec les Voisins et la Gratitude"!',
        ),
      ],
    ),

    // ==========================================
    // WEEK 7: PARLER DES VOISINS (PART II)
    // ==========================================
    P5Lesson(
      term: 2,
      week: 7,
      topic: 'Parler des Voisins (Partie II: Entraide et Quartier)',
      subtitle: 'Neighborly Activities & Neighborhood Life: Aider, Partager, Visiter, Saluer',
      patternType: P5PatternType.communityActivity,
      objectives: [
        'List key qualities and actions of a good neighbor: "aider" (help), "partager" (share), "saluer" (greet).',
        'Describe your neighborhood environment: "calme" (quiet), "bruyant" (noisy), "propre" (clean).',
        'Construct sentences about helping and sharing with neighbors.',
        'Perform role-play conversations with a neighbor on the smartboard.',
      ],
      culturalInsight:
          'In community life, sharing food during celebrations and greeting each other every morning ("Bonjour voisin !") creates strong neighborhood unity and mutual safety.',
      vocabItems: [
        P5VocabItem(
          french: 'Aider son voisin',
          phonetics: 'ay-day sohn vwah-zan',
          english: 'To help one\'s neighbor',
          usageNote: 'Community mutual assistance.',
          icon: Icons.volunteer_activism_rounded,
          audioKey: 'aider_son_voisin',
        ),
        P5VocabItem(
          french: 'Partager avec les voisins',
          phonetics: 'pahr-tah-zhay ah-vek lay vwah-zan',
          english: 'To share with neighbors',
          usageNote: 'Sharing meals, tools, or supplies.',
          icon: Icons.share_rounded,
          audioKey: 'partager_avec_les_voisins',
        ),
        P5VocabItem(
          french: 'Saluer poliment',
          phonetics: 'sah-loo-ay poh-lee-mahn',
          english: 'To greet politely',
          usageNote: 'Saying hello every morning.',
          icon: Icons.waving_hand_rounded,
          audioKey: 'saluer_poliment',
        ),
        P5VocabItem(
          french: 'Mon quartier est calme',
          phonetics: 'mohn kahr-tyay ay kahlm',
          english: 'My neighborhood is quiet / calm',
          usageNote: 'Describing a peaceful area.',
          icon: Icons.nature_people_rounded,
          audioKey: 'mon_quartier_est_calme',
        ),
        P5VocabItem(
          french: 'Mon quartier est bruyant',
          phonetics: 'mohn kahr-tyay ay brwee-yahn',
          english: 'My neighborhood is noisy / busy',
          usageNote: 'Describing a bustling city area.',
          icon: Icons.volume_up_rounded,
          audioKey: 'mon_quartier_est_bruyant',
        ),
        P5VocabItem(
          french: 'Mon quartier est propre',
          phonetics: 'mohn kahr-tyay ay proh-pruh',
          english: 'My neighborhood is clean',
          usageNote: 'Describing a tidy environment.',
          icon: Icons.cleaning_services_rounded,
          audioKey: 'mon_quartier_est_propre',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'Which action shows good neighborliness in French?',
          options: ['Faire du bruit', 'Aider et partager', 'Refuser de saluer', 'Se disputer'],
          correctOptionIndex: 1,
          explanation: '"Aider et partager" (Helping and sharing) are true marks of a good neighbor.',
        ),
        P5InteractiveExercise(
          prompt: 'How do you say "My neighborhood is quiet" in French?',
          options: [
            'Mon quartier est bruyant',
            'Mon quartier est calme',
            'Mon quartier est grand',
            'Mon quartier est loin'
          ],
          correctOptionIndex: 1,
          explanation: '"Mon quartier est calme" means "My neighborhood is quiet/calm".',
        ),
        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Aider son voisin', english: 'To help one\'s neighbor'),
            DrillPair(french: 'Partager avec les voisins', english: 'To share with neighbors'),
            DrillPair(french: 'Saluer poliment', english: 'To greet politely'),
            DrillPair(french: 'Mon quartier est calme', english: 'My neighborhood is quiet / calm'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (To help one\'s neighbor):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Aider son voisin', 'Partager avec les voisins', 'Saluer poliment', 'Mon quartier est calme'],
          correctWord: 'Aider son voisin',
          explanation: 'Correct! "Aider son voisin" translates to "To help one\'s neighbor".',
        ),
        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),
        P5InteractiveExercise(
          prompt: 'What is the correct English translation for "Partager avec les voisins"?',
          options: ['To share with neighbors', 'To help one\'s neighbor', 'To greet politely', 'My neighborhood is quiet / calm'],
          correctOptionIndex: 0,
          explanation: '"Partager avec les voisins" translates to "To share with neighbors".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Mention two things good neighbors do together in French.',
          answer: 'Ils aident et partagent (or ils se saluent poliment).',
          hint: 'Aider, partager, saluer.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Neighbor Dialogue',
          instruction: 'Write a 4-line French dialogue where two neighbors meet, greet, and offer help carrying groceries.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 8: EXPRIMER LA GRATITUDE (PART I)
    // ==========================================
    P5Lesson(
      term: 2,
      week: 8,
      topic: 'Exprimer la Gratitude (Partie I: Dire Merci & Réponses)',
      subtitle: 'Expressing Gratitude & Polite Replies: "Merci beaucoup", "De rien", "Je vous en prie"',
      patternType: P5PatternType.gratitudeStudio,
      objectives: [
        'Say "Thank you" in multiple ways: "Merci", "Merci beaucoup", "Merci bien", "Je vous remercie".',
        'Respond appropriately to thanks: "De rien", "Je vous en prie", "Pas de quoi".',
        'Identify situations requiring formal vs informal gratitude.',
        'Demonstrate polite French courtesy in daily classroom scenarios.',
      ],
      culturalInsight:
          'In France and Francophone cultures, gratitude is the foundation of polite speech. Saying "Je vous en prie" (You are very welcome) to an elder or teacher shows exceptional manners and respect!',
      vocabItems: [
        P5VocabItem(
          french: 'Merci',
          phonetics: 'mair-see',
          english: 'Thank you',
          usageNote: 'Universal polite expression.',
          icon: Icons.favorite_rounded,
          audioKey: 'merci',
        ),
        P5VocabItem(
          french: 'Merci beaucoup !',
          phonetics: 'mair-see boh-koo',
          english: 'Thank you very much!',
          usageNote: 'Strong, heartfelt gratitude.',
          icon: Icons.auto_awesome_rounded,
          audioKey: 'merci_beaucoup',
        ),
        P5VocabItem(
          french: 'Merci bien !',
          phonetics: 'mair-see byan',
          english: 'Thanks a lot / Thank you kindly',
          usageNote: 'Polite daytime thank-you.',
          icon: Icons.thumb_up_rounded,
          audioKey: 'merci_bien',
        ),
        P5VocabItem(
          french: 'Je vous remercie',
          phonetics: 'zhuh voo ruh-mair-see',
          english: 'I thank you (Formal / Respectful)',
          usageNote: 'Used with teachers, elders, and principals.',
          icon: Icons.military_tech_rounded,
          audioKey: 'je_vous_remercie',
        ),
        P5VocabItem(
          french: 'De rien',
          phonetics: 'duh ryahn',
          english: 'You\'re welcome / It\'s nothing (Informal)',
          usageNote: 'Standard reply among classmates.',
          icon: Icons.check_circle_outline_rounded,
          audioKey: 'de_rien',
        ),
        P5VocabItem(
          french: 'Je vous en prie',
          phonetics: 'zhuh voo zahn pree',
          english: 'You are welcome (Formal / Polite)',
          usageNote: 'Formal, elegant reply to adults.',
          icon: Icons.verified_user_rounded,
          audioKey: 'je_vous_en_prie',
        ),
        P5VocabItem(
          french: 'Pas de quoi',
          phonetics: 'pah duh kwah',
          english: 'Don\'t mention it / No problem',
          usageNote: 'Casual friendly reply.',
          icon: Icons.sentiment_satisfied_rounded,
          audioKey: 'pas_de_quoi',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What is the formal and respectful reply when your teacher thanks you?',
          options: ['Salut', 'Je vous en prie', 'De rien', 'Bonsoir'],
          correctOptionIndex: 1,
          explanation: '"Je vous en prie" is the formal, polite response used with adults.',
        ),
        P5InteractiveExercise(
          prompt: 'Which phrase means "Thank you very much"?',
          options: ['Merci bien', 'Merci beaucoup', 'Je vous remercie', 'Pardon'],
          correctOptionIndex: 1,
          explanation: '"Merci beaucoup" translates to "Thank you very much".',
        ),
        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Merci', english: 'Thank you'),
            DrillPair(french: 'Merci beaucoup !', english: 'Thank you very much!'),
            DrillPair(french: 'Merci bien !', english: 'Thanks a lot / Thank you kindly'),
            DrillPair(french: 'Je vous remercie', english: 'I thank you (Formal / Respectful)'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (Thank you):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Merci', 'Merci beaucoup !', 'Merci bien !', 'Je vous remercie'],
          correctWord: 'Merci',
          explanation: 'Correct! "Merci" translates to "Thank you".',
        ),
        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),
        P5InteractiveExercise(
          prompt: 'What is the correct English translation for "Merci beaucoup !"?',
          options: ['Thank you very much!', 'Thank you', 'Thanks a lot / Thank you kindly', 'I thank you (Formal / Respectful)'],
          correctOptionIndex: 0,
          explanation: '"Merci beaucoup !" translates to "Thank you very much!".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Give 3 different ways to say "You\'re welcome" in French.',
          answer: 'De rien, Je vous en prie, Pas de quoi.',
          hint: 'De rien, Je vous en prie, Pas de quoi.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Politeness Practice',
          instruction: 'Use "Merci beaucoup" and "Je vous en prie" at home 5 times with your parents.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 9: EXPRIMER LA GRATITUDE (PART II)
    // ==========================================
    P5Lesson(
      term: 2,
      week: 9,
      topic: 'Exprimer la Gratitude (Partie II: Lettres et Mots Aimables)',
      subtitle: 'Appreciation Phrases & Thank-You Letters: "C\'est très gentil", "C\'est aimable"',
      patternType: P5PatternType.thankYouLetter,
      objectives: [
        'Use advanced appreciation phrases: "C\'est gentil", "C\'est très aimable", "Tu es super".',
        'Write an interactive French thank-you card ("Le petit mot de remerciement").',
        'Differentiate between formal appreciation and peer compliments.',
        'Role-play gift exchange scenarios with proper etiquette.',
      ],
      culturalInsight:
          'Writing a short thank-you card ("une carte de remerciement") after receiving a gift or kind gesture is a cherished French tradition that deepens friendship and goodwill!',
      vocabItems: [
        P5VocabItem(
          french: 'C\'est gentil !',
          phonetics: 'say zhahn-tee',
          english: 'That is kind of you / That\'s nice!',
          usageNote: 'Warm compliment on a gift or favor.',
          icon: Icons.card_giftcard_rounded,
          audioKey: 'cest_gentil',
        ),
        P5VocabItem(
          french: 'C\'est très aimable !',
          phonetics: 'say tray zay-mah-bluh',
          english: 'That is very kind / amiable!',
          usageNote: 'Formal appreciation phrase.',
          icon: Icons.star_border_purple500_rounded,
          audioKey: 'cest_tres_aimable',
        ),
        P5VocabItem(
          french: 'Tu es super !',
          phonetics: 'too ay soo-pair',
          english: 'You are awesome / great!',
          usageNote: 'Enthusiastic peer compliment.',
          icon: Icons.sentiment_very_satisfied_rounded,
          audioKey: 'tu_es_super',
        ),
        P5VocabItem(
          french: 'Merci pour le cadeau',
          phonetics: 'mair-see poor luh kah-doh',
          english: 'Thank you for the gift',
          usageNote: 'Gift reception appreciation.',
          icon: Icons.redeem_rounded,
          audioKey: 'merci_pour_le_cadeau',
        ),
        P5VocabItem(
          french: 'Merci pour l\'aide',
          phonetics: 'mair-see poor layd',
          english: 'Thank you for the help / assistance',
          usageNote: 'Help reception appreciation.',
          icon: Icons.handshake_rounded,
          audioKey: 'merci_pour_laide',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What do you say after receiving a lovely birthday gift in French?',
          options: [
            'Au revoir pour le cadeau',
            'Merci pour le cadeau, c\'est très gentil !',
            'Bonsoir le cadeau',
            'Pardon pour le cadeau'
          ],
          correctOptionIndex: 1,
          explanation: '"Merci pour le cadeau, c\'est très gentil !" is the polite, grateful response.',
        ),
        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'C\'est gentil !', english: 'That is kind of you / That\'s nice!'),
            DrillPair(french: 'C\'est très aimable !', english: 'That is very kind / amiable!'),
            DrillPair(french: 'Tu es super !', english: 'You are awesome / great!'),
            DrillPair(french: 'Merci pour le cadeau', english: 'Thank you for the gift'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (That is kind of you / That\'s nice!):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['C\'est gentil !', 'C\'est très aimable !', 'Tu es super !', 'Merci pour le cadeau'],
          correctWord: 'C\'est gentil !',
          explanation: 'Correct! "C\'est gentil !" translates to "That is kind of you / That\'s nice!".',
        ),
        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),
        P5InteractiveExercise(
          prompt: 'What is the correct English translation for "C\'est très aimable !"?',
          options: ['That is very kind / amiable!', 'That is kind of you / That\'s nice!', 'You are awesome / great!', 'Thank you for the gift'],
          correctOptionIndex: 0,
          explanation: '"C\'est très aimable !" translates to "That is very kind / amiable!".',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Choose the correct French term for "You are awesome / great!":',
          sentenceTemplate: 'En classe, nous disons ___ avec politesse.',
          wordBank: ['Tu es super !', 'C\'est gentil !', 'C\'est très aimable !', 'Merci pour le cadeau'],
          correctWord: 'Tu es super !',
          explanation: 'Exact ! "Tu es super !" means "You are awesome / great!".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'How do you say "Thank you for the help, you are great" to a classmate in French?',
          answer: 'Merci pour l\'aide, tu es super !',
          hint: 'Merci pour l\'aide... tu es super.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Thank You Note',
          instruction: 'Write a 3-line thank-you card in French to your teacher for teaching you French language.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 10: NOMMER LES JOURS DE LA SEMAINE
    // ==========================================
    P5Lesson(
      term: 2,
      week: 10,
      topic: 'Nommer les Jours de la Semaine et Emploi du Temps',
      subtitle: 'The 7 Days of the Week, Today, Tomorrow & Weekly School Timetable',
      patternType: P5PatternType.weeklyTimetable,
      objectives: [
        'Recite the 7 days of the week in French in chronological order (lundi to dimanche).',
        'Ask and answer "Quel jour sommes-nous ?" using "Aujourd\'hui, c\'est...".',
        'State temporal markers: "Aujourd\'hui" (today), "Demain" (tomorrow), "Hier" (yesterday).',
        'Identify weekdays (les jours de classe) vs the weekend (le week-end).',
      ],
      culturalInsight:
          'In French, the days of the week are named after ancient celestial bodies (Lundi = Moon/Lune, Mardi = Mars, Mercredi = Mercury, Jeudi = Jupiter, Vendredi = Venus). Unlike English, they are not capitalized in sentences!',
      vocabItems: [
        P5VocabItem(
          french: 'Lundi, Mardi, Mercredi',
          phonetics: 'luhn-dee, mahr-dee, mair-kruh-dee',
          english: 'Monday, Tuesday, Wednesday',
          usageNote: 'First half of school week.',
          icon: Icons.calendar_today_rounded,
          audioKey: 'lundi_mardi_mercredi',
        ),
        P5VocabItem(
          french: 'Jeudi, Vendredi',
          phonetics: 'zhuh-dee, vahn-druh-dee',
          english: 'Thursday, Friday',
          usageNote: 'Second half of school week.',
          icon: Icons.event_rounded,
          audioKey: 'jeudi_vendredi',
        ),
        P5VocabItem(
          french: 'Samedi, Dimanche (Le week-end)',
          phonetics: 'sahm-dee, dee-mahnsh',
          english: 'Saturday, Sunday (The weekend)',
          usageNote: 'Rest and holiday weekend days.',
          icon: Icons.weekend_rounded,
          audioKey: 'samedi_dimanche',
        ),
        P5VocabItem(
          french: 'Quel jour sommes-nous ?',
          phonetics: 'kell zhoor sohm-noo',
          english: 'What day is it today?',
          usageNote: 'Question to ask the current day.',
          icon: Icons.help_outline_rounded,
          audioKey: 'quel_jour_sommes_nous',
        ),
        P5VocabItem(
          french: 'Aujourd\'hui, c\'est...',
          phonetics: 'oh-zhoor-dwee say',
          english: 'Today is...',
          usageNote: 'Stating today\'s day.',
          icon: Icons.today_rounded,
          audioKey: 'aujourdhui_cest',
        ),
        P5VocabItem(
          french: 'Demain / Hier',
          phonetics: 'duh-man / yair',
          english: 'Tomorrow / Yesterday',
          usageNote: 'Future and past day markers.',
          icon: Icons.update_rounded,
          audioKey: 'demain_hier',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What French day comes immediately after "Mercredi" (Wednesday)?',
          options: ['Mardi (Tuesday)', 'Jeudi (Thursday)', 'Vendredi (Friday)', 'Lundi (Monday)'],
          correctOptionIndex: 1,
          explanation: 'Wednesday is Mercredi, followed immediately by Thursday which is "Jeudi".',
        ),
        P5InteractiveExercise(
          prompt: 'If today is Friday (Vendredi), what day is tomorrow (Demain)?',
          options: ['Dimanche', 'Samedi', 'Lundi', 'Jeudi'],
          correctOptionIndex: 1,
          explanation: 'The day after Friday is Saturday ("Samedi").',
        ),
        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Lundi, Mardi, Mercredi', english: 'Monday, Tuesday, Wednesday'),
            DrillPair(french: 'Jeudi, Vendredi', english: 'Thursday, Friday'),
            DrillPair(french: 'Samedi, Dimanche (Le week-end)', english: 'Saturday, Sunday (The weekend)'),
            DrillPair(french: 'Quel jour sommes-nous ?', english: 'What day is it today?'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (Monday, Tuesday, Wednesday):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Lundi, Mardi, Mercredi', 'Jeudi, Vendredi', 'Samedi, Dimanche (Le week-end)', 'Quel jour sommes-nous ?'],
          correctWord: 'Lundi, Mardi, Mercredi',
          explanation: 'Correct! "Lundi, Mardi, Mercredi" translates to "Monday, Tuesday, Wednesday".',
        ),
        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),
        P5InteractiveExercise(
          prompt: 'What is the correct English translation for "Jeudi, Vendredi"?',
          options: ['Thursday, Friday', 'Monday, Tuesday, Wednesday', 'Saturday, Sunday (The weekend)', 'What day is it today?'],
          correctOptionIndex: 0,
          explanation: '"Jeudi, Vendredi" translates to "Thursday, Friday".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Recite all 7 days of the week in French in correct order.',
          answer: 'Lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche.',
          hint: 'Lundi to Dimanche.',
        ),
        P5EvaluationQuestion(
          question: 'Ask "What day is today?" in French.',
          answer: 'Quel jour sommes-nous ? (or Quel jour est-il aujourd\'hui ?).',
          hint: 'Quel jour sommes-nous ?',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Timetable Creation',
          instruction: 'Create your weekly school timetable in French with all 5 school days: Lundi, Mardi, Mercredi, Jeudi, Vendredi.',
        ),
      ],
      grammarNote: P5GrammarNote(
        title: 'Days of the Week & Temporal Markers',
        explanation:
            'In French, days of the week do not take capital letters unless starting a sentence. Use "Aujourd\'hui, c\'est [jour]" (Today is [day]), "Demain, ce sera [jour]" (Tomorrow will be [day]), and "Hier, c\'était [jour]" (Yesterday was [day]).',
        examples: [
          'Aujourd\'hui, c\'est lundi. (Today is Monday.)',
          'Demain, c\'est mardi. (Tomorrow is Tuesday.)',
          'Samedi et dimanche, c\'est le week-end ! (Saturday and Sunday is the weekend!)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 11: RÉVISION GÉNÉRALE DU DEUXIÈME TRIMESTRE
    // ==========================================
    P5Lesson(
      term: 2,
      week: 11,
      topic: 'Révision Générale du Deuxième Trimestre',
      subtitle: 'Comprehensive Speed Oral Rally across Weeks 1 to 10',
      patternType: P5PatternType.term2RevisionRally,
      teachingStyle: TeachingStyle.conversationalDialogue,
      objectives: [
        'Review extended family terms, neighbor relationships, gratitude, and days of the week.',
        'Participate in classroom team speed buzzer challenges.',
        'Demonstrate speaking fluency and active listening.',
      ],
      culturalInsight:
          'Revision rallies bring the whole class together in friendly competition, reinforcing confidence before the end-of-term oral evaluations!',
      vocabItems: [
        P5VocabItem(
          french: 'La révision du deuxième trimestre',
          phonetics: 'lah ray-vee-zyohn doo duh-zyem tree-mestr',
          english: 'Second term revision',
          usageNote: 'Term 2 consolidation.',
          icon: Icons.checklist_rtl_rounded,
          audioKey: 'la_revision_du_deuxieme_trimestre',
        ),
        P5VocabItem(
          french: 'La famille et les voisins',
          phonetics: 'lah fah-meey ay lay vwah-zan',
          english: 'Family and neighbors',
          usageNote: 'Core term themes.',
          icon: Icons.groups_2_rounded,
          audioKey: 'la_famille_et_les_voisins',
        ),
        P5VocabItem(
          french: 'La politesse et les jours',
          phonetics: 'lah poh-lee-tess ay lay zhoor',
          english: 'Politeness and days of the week',
          usageNote: 'Gratitude and calendar themes.',
          icon: Icons.calendar_month_rounded,
          audioKey: 'la_politesse_et_les_jours',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What are the two weekend days in French?',
          options: [
            'Jeudi et Vendredi',
            'Samedi et Dimanche',
            'Lundi et Mardi',
            'Mercredi et Jeudi'
          ],
          correctOptionIndex: 1,
          explanation: 'The weekend days are "Samedi" (Saturday) and "Dimanche" (Sunday).',
        ),
        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'La révision du deuxième trimestre', english: 'Second term revision'),
            DrillPair(french: 'La famille et les voisins', english: 'Family and neighbors'),
            DrillPair(french: 'La politesse et les jours', english: 'Politeness and days of the week'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (Second term revision):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['La révision du deuxième trimestre', 'La famille et les voisins', 'La politesse et les jours', 'Merci'],
          correctWord: 'La révision du deuxième trimestre',
          explanation: 'Correct! "La révision du deuxième trimestre" translates to "Second term revision".',
        ),
        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),
        P5InteractiveExercise(
          prompt: 'What is the correct English translation for "La famille et les voisins"?',
          options: ['Family and neighbors', 'Second term revision', 'Politeness and days of the week', 'Goodbye'],
          correctOptionIndex: 0,
          explanation: '"La famille et les voisins" translates to "Family and neighbors".',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Choose the correct French term for "Politeness and days of the week":',
          sentenceTemplate: 'En classe, nous disons ___ avec politesse.',
          wordBank: ['La politesse et les jours', 'La révision du deuxième trimestre', 'La famille et les voisins', 'S\'il vous plaît'],
          correctWord: 'La politesse et les jours',
          explanation: 'Exact ! "La politesse et les jours" means "Politeness and days of the week".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Deliver a summary introducing your grandparents, your friendly neighbor, and stating today\'s day.',
          answer: 'Pupils deliver a 3-part oral showcase on the smartboard.',
          hint: 'Mes grands-parents... Mon voisin... Aujourd\'hui c\'est...',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Revision Check',
          instruction: 'Practice reciting your Term 2 flashcards with a partner before next week\'s oral evaluation.',
        ),
      ],
    ),

    // ==========================================
    // WEEK 12: ÉVALUATION ORALE ET BILAN
    // ==========================================
    P5Lesson(
      term: 2,
      week: 12,
      topic: 'Bilan et Évaluation Orale du Deuxième Trimestre',
      subtitle: 'Teacher-guided Speaking Evaluation & Student Achievement Portfolio',
      patternType: P5PatternType.term2RevisionRally,
      teachingStyle: TeachingStyle.storyNarrative,
      objectives: [
        'Conduct individual and group oral evaluation stations.',
        'Assess pronunciation, fluency, and vocabulary recall for Term 2.',
        'Award Term 2 French Achievement Badges.',
      ],
      culturalInsight:
          'Oral evaluations celebrate each pupil\'s growth, expression, and mastery of French communication in realistic family and social contexts!',
      vocabItems: [
        P5VocabItem(
          french: 'L\'évaluation orale',
          phonetics: 'lay-vah-loo-ah-syohn oh-rahl',
          english: 'Oral speaking evaluation',
          usageNote: 'Speaking assessment.',
          icon: Icons.record_voice_over_rounded,
          audioKey: 'levaluation_orale',
        ),
        P5VocabItem(
          french: 'Très bien réussi !',
          phonetics: 'tray byan ray-oo-see',
          english: 'Very well done!',
          usageNote: 'Teacher commendation.',
          icon: Icons.thumb_up_rounded,
          audioKey: 'tres_bien_reussi',
        ),
        P5VocabItem(
          french: 'Félicitations pour le 2e trimestre !',
          phonetics: 'fay-lee-see-tah-syohn poor luh duh-zyem tree-mestr',
          english: 'Congratulations on Term 2!',
          usageNote: 'Term milestone celebration.',
          icon: Icons.star_rounded,
          audioKey: 'felicitations_2e_trimestre',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'Which response shows excellent polite manners in French?',
          options: ['Je vous en prie', 'Tais-toi', 'Au revoir sans saluer', 'Rien'],
          correctOptionIndex: 0,
          explanation: '"Je vous en prie" is the height of polite French manners.',
        ),
        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'L\'évaluation orale', english: 'Oral speaking evaluation'),
            DrillPair(french: 'Très bien réussi !', english: 'Very well done!'),
            DrillPair(french: 'Félicitations pour le 2e trimestre !', english: 'Congratulations on Term 2!'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (Oral speaking evaluation):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['L\'évaluation orale', 'Très bien réussi !', 'Félicitations pour le 2e trimestre !', 'Merci'],
          correctWord: 'L\'évaluation orale',
          explanation: 'Correct! "L\'évaluation orale" translates to "Oral speaking evaluation".',
        ),
        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),
        P5InteractiveExercise(
          prompt: 'What is the correct English translation for "Très bien réussi !"?',
          options: ['Very well done!', 'Oral speaking evaluation', 'Congratulations on Term 2!', 'Goodbye'],
          correctOptionIndex: 0,
          explanation: '"Très bien réussi !" translates to "Very well done!".',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Choose the correct French term for "Congratulations on Term 2!":',
          sentenceTemplate: 'En classe, nous disons ___ avec politesse.',
          wordBank: ['Félicitations pour le 2e trimestre !', 'L\'évaluation orale', 'Très bien réussi !', 'S\'il vous plaît'],
          correctWord: 'Félicitations pour le 2e trimestre !',
          explanation: 'Exact ! "Félicitations pour le 2e trimestre !" means "Congratulations on Term 2!".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'Deliver your complete Term 2 speaking presentation.',
          answer: 'Pupils deliver presentations with confidence.',
          hint: 'Extended family, neighbors, polite gratitude, days of the week.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Holiday Readiness',
          instruction: 'Get ready for next week\'s closing celebration and the exciting preview of Term 3!',
        ),
      ],
    ),

    // ==========================================
    // WEEK 13: CLÔTURE ET VACANCES DU DEUXIÈME TRIMESTRE
    // ==========================================
    P5Lesson(
      term: 2,
      week: 13,
      topic: 'Fin du Deuxième Trimestre (Term 2 Wrap-up & Vacation Celebration)',
      subtitle: 'Congratulations on Completing Term 2 — Bonnes Vacances & Term 3 Preview !',
      patternType: P5PatternType.term2Vacation,
      teachingStyle: TeachingStyle.storyNarrative,
      objectives: [
        'Celebrate the completion of Second Term Primary 5 French!',
        'Review badge collections and achievements.',
        'Preview Term 3: Daily Routine, Sports & Leisure, School Subjects, Professions & Food.',
      ],
      culturalInsight:
          'Félicitations ! In Term 3, we will explore daily routines, sports, hobbies, school subjects, future dream careers, and French culinary meals!',
      vocabItems: [
        P5VocabItem(
          french: 'Félicitations !',
          phonetics: 'fay-lee-see-tah-syohn',
          english: 'Congratulations!',
          usageNote: 'Well done on completing Term 2!',
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
          french: 'À la rentrée pour le 3e trimestre !',
          phonetics: 'ah lah rahn-tray poor luh trwah-zyem tree-mestr',
          english: 'See you next term for Term 3!',
          usageNote: 'Departure wish until Term 3.',
          icon: Icons.school_rounded,
          audioKey: 'a_la_rentree_3e_trimestre',
        ),
      ],
      classworkExercises: [
        P5InteractiveExercise(
          prompt: 'What exciting topics will we discover in Term 3 French?',
          options: [
            'Daily Routine, Sports, School Subjects, Careers & Food',
            'Only numbers 1 to 5',
            'Only alphabet A B C',
            'No topics'
          ],
          correctOptionIndex: 0,
          explanation: 'Term 3 expands into daily routines, sports, careers, and French meals!',
        ),
        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
            DrillPair(french: 'Félicitations !', english: 'Congratulations!'),
            DrillPair(french: 'Bonnes vacances !', english: 'Happy holidays / Have a great vacation!'),
            DrillPair(french: 'À la rentrée pour le 3e trimestre !', english: 'See you next term for Term 3!'),
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word (Congratulations!):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: ['Félicitations !', 'Bonnes vacances !', 'À la rentrée pour le 3e trimestre !', 'Merci'],
          correctWord: 'Félicitations !',
          explanation: 'Correct! "Félicitations !" translates to "Congratulations!".',
        ),
        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),
        P5InteractiveExercise(
          prompt: 'What is the correct English translation for "Bonnes vacances !"?',
          options: ['Happy holidays / Have a great vacation!', 'Congratulations!', 'See you next term for Term 3!', 'Goodbye'],
          correctOptionIndex: 0,
          explanation: '"Bonnes vacances !" translates to "Happy holidays / Have a great vacation!".',
        ),
        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Choose the correct French term for "See you next term for Term 3!":',
          sentenceTemplate: 'En classe, nous disons ___ avec politesse.',
          wordBank: ['À la rentrée pour le 3e trimestre !', 'Félicitations !', 'Bonnes vacances !', 'S\'il vous plaît'],
          correctWord: 'À la rentrée pour le 3e trimestre !',
          explanation: 'Exact ! "À la rentrée pour le 3e trimestre !" means "See you next term for Term 3!".',
        ),
      ],
      evaluationQuestions: [
        P5EvaluationQuestion(
          question: 'What was your favorite French topic learned in Term 2?',
          answer: 'Pupils share their favorite topic (Extended Family, Friendly Neighbors, Gratitude Letters, Days of the Week).',
          hint: 'Any Term 2 topic.',
        ),
      ],
      assignmentTasks: [
        P5AssignmentTask(
          category: 'Holiday Reading',
          instruction: 'Enjoy a wonderful vacation with family and get ready for Term 3 French: "Les Activités Quotidiennes et Les Métiers"!',
        ),
      ],
    ),
  ];
}
