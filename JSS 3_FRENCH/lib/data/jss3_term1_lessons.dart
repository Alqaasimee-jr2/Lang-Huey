import 'package:flutter/material.dart';
import '../models/jss3_lesson_model.dart';

/// JSS 3 French — Premier Trimestre (First Term)
/// 9 High-Impact Instructional & Revision Weeks
/// Nigerian NERDC Curriculum — BECE / Junior WAEC Preparation Aligned
class JSS3Term1Lessons {
  static const List<JSS3LessonModel> weeks = [
    // ─────────────────────────────────────────────────────
    // WEEK 1 — Unité 1: Décrire plus précisément une personne
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 1,
      termNumber: 1,
      theme: 'Unité 1',
      frenchTitle: 'Décrire plus précisément une personne',
      englishSubtitle: 'In-Depth Physical & Personality Descriptions',
      teacherFacilitatorPrompt:
          'Welcome pupils to JSS 3 French (the BECE examination year). Ask two pupils of different heights or hair styles to stand up and elicit basic adjectives (grand, petit). Then introduce nuanced physical traits (le teint, les yeux, la corpulence) and moral qualities (généreux, travailleur, honnête). Explain the BANGS adjective placement rule. Open the Character Studio.',
      objectives: [
        'Describe physical appearance with precision (height, complexion, hair, facial features).',
        'Express moral and character traits using qualifying adjectives.',
        'Apply feminine and plural adjective agreement rules accurately.',
        'Master the BANGS position rule (adjectives placed before vs after the noun).',
      ],
      culturalInsight:
          'In Nigerian and Francophone African communities (Senegal, Côte d\'Ivoire, Cameroon), describing someone\'s character (la moralité) is deeply valued. Respectful formulas like "Il est poli et travailleur" (He is polite and hardworking) or "Elle a bon cœur" (She has a good heart) are central to social introductions and letters of recommendation in Francophone Africa.',
      patternType: JSS3PatternType.personDescriptionStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'le teint / la peau',
          phonetics: '[lə tɛ̃] / [la po]',
          english: 'complexion / skin',
          usageNote: 'Il a le teint clair / le teint noir. — He has a light / dark complexion.',
          icon: Icons.face_rounded,
          audioKey: 't1w1_teint_peau',
        ),
        JSS3VocabItem(
          french: 'la corpulence / la taille',
          phonetics: '[la kɔʁ.py.lɑ̃s] / [la taj]',
          english: 'build / height',
          usageNote: 'Elle est de taille moyenne et mince. — She is of medium height and slim.',
          icon: Icons.accessibility_new_rounded,
          audioKey: 't1w1_corpulence_taille',
        ),
        JSS3VocabItem(
          french: 'les cheveux lisses / crépus / bouclés',
          phonetics: '[le ʃə.vø lis] / [kʁe.py] / [bu.kle]',
          english: 'straight / afro-textured / curly hair',
          usageNote: 'Il a les cheveux courts et crépus. — He has short, afro-textured hair.',
          icon: Icons.person_rounded,
          audioKey: 't1w1_cheveux_types',
        ),
        JSS3VocabItem(
          french: 'travailleur / travailleuse',
          phonetics: '[tʁa.va.jœʁ] / [tʁa.va.jøz]',
          english: 'hardworking (m/f)',
          usageNote: 'Cet élève est très travailleur et ambitieux.',
          icon: Icons.work_history_rounded,
          audioKey: 't1w1_travailleur',
        ),
        JSS3VocabItem(
          french: 'généreux / généreuse',
          phonetics: '[ʒe.ne.ʁø] / [ʒe.ne.ʁøz]',
          english: 'generous (m/f)',
          usageNote: 'Elle est très généreuse avec ses camarades.',
          icon: Icons.volunteer_activism_rounded,
          audioKey: 't1w1_genereux',
        ),
        JSS3VocabItem(
          french: 'timide / sociable',
          phonetics: '[ti.mid] / [sɔ.sjabl]',
          english: 'shy / outgoing',
          usageNote: 'Au début, il était timide, mais maintenant il est sociable.',
          icon: Icons.psychology_rounded,
          audioKey: 't1w1_timide_sociable',
        ),
        JSS3VocabItem(
          french: 'honnête / sincère',
          phonetics: '[ɔ.nɛt] / [sɛ̃.sɛʁ]',
          english: 'honest / sincere',
          usageNote: 'Un bon ami doit toujours être honnête et loyal.',
          icon: Icons.verified_user_rounded,
          audioKey: 't1w1_honnete_sincere',
        ),
        JSS3VocabItem(
          french: 'beau / bel / belle / beaux / belles',
          phonetics: '[bo] / [bɛl]',
          english: 'handsome / beautiful',
          usageNote: 'Un bel homme (before vowel), une belle fille, de beaux yeux.',
          icon: Icons.auto_awesome_rounded,
          audioKey: 't1w1_beau_belle',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Complétez : "Fatima est une fille très ___ et intelligente."',
          options: ['travailleur', 'travailleuse', 'travailleurs', 'travailleuses'],
          correctOptionIndex: 1,
          explanation: '"Fatima" is feminine singular. The feminine form of "travailleur" is "travailleuse".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Où se place l\'adjectif dans : "C\'est un ___ garçon ___" (petit / intelligent) ?',
          options: ['intelligent garçon petit', 'petit garçon intelligent', 'garçon petit intelligent', 'garçon intelligent petit'],
          correctOptionIndex: 1,
          explanation: '"Petit" is a BANGS adjective (Size) and goes BEFORE the noun. "Intelligent" is a descriptive adjective and goes AFTER.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quel mot décrit une personne qui aime donner et aider les autres ?',
          options: ['avare', 'généreuse', 'égoïste', 'paresseuse'],
          correctOptionIndex: 1,
          explanation: '"Généreux / généreuse" means generous, someone who gives and helps others.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Choisissez la bonne forme : "C\'est un ___ homme."',
          options: ['beau', 'bel', 'belle', 'beaux'],
          correctOptionIndex: 1,
          explanation: 'Before a masculine singular noun starting with a vowel or silent h ("homme"), "beau" becomes "bel".',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Décris physiquement ton/ta meilleur(e) ami(e) en 3 détails précis.',
          answer: 'Exemple : "Mon ami Aminu est de grande taille, il a le teint noir, les yeux marron et les cheveux courts crépus."',
          hint: 'Mention height/build, complexion, eyes, or hair.',
        ),
        JSS3EvaluationQuestion(
          question: 'Cite 3 adjectifs de qualité morale positifs en français avec leur féminin.',
          answer: '1. Travailleur (f. travailleuse) 2. Généreux (f. généreuse) 3. Honnête (f. honnête).',
          hint: 'Think about traits like hard-working, generous, honest, kind.',
        ),
        JSS3EvaluationQuestion(
          question: 'Explique la règle BANGS pour la position des adjectifs.',
          answer: 'BANGS = Beauty (beau, joli), Age (jeune, vieux, nouveau), Goodness (bon, mauvais), Size (grand, petit, gros). These adjectives are placed BEFORE the noun, while color, nationality, and specific descriptions go AFTER.',
          hint: 'What does each letter of B-A-N-G-S stand for?',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Portrait écrit',
          instruction: 'Write a 6-sentence paragraph describing an admired Nigerian or world leader (e.g. Chinua Achebe, Ngozi Okonjo-Iweala). Include both physical traits and moral qualities.',
          exampleResponse: 'Le Dr Ngozi Okonjo-Iweala est une femme remarquable. Elle a le teint noir et un sourire chaleureux. Elle est extrêmement intelligente, travailleuse et honnête. Elle porte toujours de beaux vêtements traditionnels nigérians.',
        ),
        JSS3AssignmentTask(
          category: 'Jeu d\'adjectifs',
          instruction: 'List 5 nouns and add two adjectives to each (one before and one after). Example: "Un petit garçon courageux".',
          exampleResponse: '1. Une jolie robe bleue. 2. Un vieil homme sage. 3. Une grande maison moderne. 4. Un bon élève attentif. 5. Une nouvelle voiture rapide.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Adjective Agreement & The BANGS Rule',
        explanation:
            'Adjectives in French must agree in gender (masculine/feminine) and number (singular/plural) with the noun they modify.\n\nPosition Rule:\n• MOST adjectives go AFTER the noun (colors, shapes, nationalities, characteristics): une voiture rouge, un élève nigérian.\n• BANGS adjectives go BEFORE the noun:\n  - B (Beauty): beau, joli\n  - A (Age): jeune, vieux, nouveau\n  - N (Goodness/Number): bon, mauvais, premier, deuxième\n  - S (Size): grand, petit, gros, long, court\n\nSpecial masculine forms before vowels/silent h: beau ➔ bel (un bel homme), nouveau ➔ nouvel (un nouvel an), vieux ➔ vieil (un vieil ami).',
        examples: [
          'Un grand homme (a great/tall man) vs Une femme intelligente (an intelligent woman).',
          'Un bel appartement (a beautiful apartment) — "bel" used before vowel "a".',
          'Une jeune fille travailleuse (a hardworking young girl) — "jeune" before, "travailleuse" after.',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 2 — Unité 2: Décrire un paysage et des lieux touristiques
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 2,
      termNumber: 1,
      theme: 'Unité 2',
      frenchTitle: 'Décrire un paysage et des lieux touristiques',
      englishSubtitle: 'Landscapes & Tourism in Nigeria & Francophone Lands',
      teacherFacilitatorPrompt:
          'Show panoramic images of Nigerian landmarks (Zuma Rock, Obudu Mountain, Lekki Conservation Centre) alongside iconic Francophone sites (La Tour Eiffel, La basilique de Yamoussoukro, Le parc de la Pendjari). Introduce geography vocabulary (la montagne, la cascade, la savane, le monument). Practice landscape adjectives. Move to the Tourism Studio.',
      objectives: [
        'Identify and describe natural landscapes (mountains, rivers, waterfalls, savannah, forests).',
        'Name and locate famous tourist monuments in Nigeria and Francophone countries.',
        'Use sensory and descriptive adjectives (majestueux, verdoyant, aride, pittoresque).',
        'Compose a travel brochure presentation for a tourist site.',
      ],
      culturalInsight:
          'Tourism is a vital economic and cultural bridge between Nigeria and its Francophone neighbors. West Africa boasts incredible UNESCO World Heritage sites: the Grand-Bassam historic town in Côte d\'Ivoire, Djenné in Mali, the Pendjari National Park in Bénin, and Nigeria\'s own Osun-Osogbo Sacred Grove and Sukur Cultural Landscape. Learning to describe these in French connects Nigerian pupils to regional heritage.',
      patternType: JSS3PatternType.landscapesLandmarksStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'le paysage naturel',
          phonetics: '[lə pe.i.zaʒ na.ty.ʁɛl]',
          english: 'natural landscape / scenery',
          usageNote: 'Le paysage de la montagne d\'Obudu est magnifique.',
          icon: Icons.landscape_rounded,
          audioKey: 't1w2_paysage_naturel',
        ),
        JSS3VocabItem(
          french: 'la montagne / la colline',
          phonetics: '[la mɔ̃.taɲ] / [la kɔ.lin]',
          english: 'mountain / hill',
          usageNote: 'Zuma Rock est un rocher gigantesque près d\'Abuja.',
          icon: Icons.terrain_rounded,
          audioKey: 't1w2_montagne_colline',
        ),
        JSS3VocabItem(
          french: 'la cascade / la chute d\'eau',
          phonetics: '[la kas.kad] / [la ʃyt do]',
          english: 'waterfall',
          usageNote: 'Les cascades de Gurara et d\'Erin Ijesha sont célèbres au Nigeria.',
          icon: Icons.water_rounded,
          audioKey: 't1w2_cascade_chute',
        ),
        JSS3VocabItem(
          french: 'la forêt tropicale / la savane',
          phonetics: '[la fɔ.ʁɛ tʁɔ.pi.kal] / [la sa.van]',
          english: 'rainforest / savannah',
          usageNote: 'Le nord du Nigeria est dominé par la savane sahélienne.',
          icon: Icons.forest_rounded,
          audioKey: 't1w2_foret_savane',
        ),
        JSS3VocabItem(
          french: 'le monument historique',
          phonetics: '[lə mɔ.ny.mɑ̃ is.tɔ.ʁik]',
          english: 'historical monument',
          usageNote: 'La Tour Eiffel et le Monument de la Renaissance sont des monuments célèbres.',
          icon: Icons.account_balance_rounded,
          audioKey: 't1w2_monument_historique',
        ),
        JSS3VocabItem(
          french: 'majestueux / verdoyant',
          phonetics: '[ma.ʒɛs.tɥø] / [vɛʁ.dwa.jɑ̃]',
          english: 'majestic / lush green',
          usageNote: 'Le plateau d\'Obudu offre des collines verdoyantes et un climat frais.',
          icon: Icons.eco_rounded,
          audioKey: 't1w2_majestueux_verdoyant',
        ),
        JSS3VocabItem(
          french: 'visiter / admirer',
          phonetics: '[vi.zi.te] / [ad.mi.ʁe]',
          english: 'to visit / to admire',
          usageNote: 'Les touristes aiment visiter les réserves d\'animaux à Yankari.',
          icon: Icons.travel_explore_rounded,
          audioKey: 't1w2_visiter_admirer',
        ),
        JSS3VocabItem(
          french: 'le site touristique',
          phonetics: '[lə sit tu.ʁis.tik]',
          english: 'tourist site / attraction',
          usageNote: 'Le Nigeria compte de nombreux sites touristiques impressionnants.',
          icon: Icons.location_on_rounded,
          audioKey: 't1w2_site_touristique',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Comment appelle-t-on de l\'eau qui tombe d\'une falaise rocheuse ?',
          options: ['la savane', 'la cascade / chute d\'eau', 'la colline', 'le monument'],
          correctOptionIndex: 1,
          explanation: 'A waterfall is called "la cascade" or "la chute d\'eau" in French.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Complétez : "Les collines d\'Obudu sont magnifiques et ___."',
          options: ['verdoyantes', 'verdoyant', 'verdoyants', 'verdoyante'],
          correctOptionIndex: 0,
          explanation: '"Les collines" is feminine plural. The correct agreement is "verdoyantes".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Où se trouve la Basilique Notre-Dame de la Paix, l\'un des plus grands édifices religieux au monde ?',
          options: ['Au Nigeria (Lagos)', 'En Côte d\'Ivoire (Yamoussoukro)', 'Au Sénégal (Dakar)', 'En France (Paris)'],
          correctOptionIndex: 1,
          explanation: 'La Basilique Notre-Dame de la Paix is located in Yamoussoukro, Côte d\'Ivoire.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quel adjectif signifie "qui inspire le respect par sa grandeur" ?',
          options: ['étroit', 'majestueux', 'minuscule', 'bruyant'],
          correctOptionIndex: 1,
          explanation: '"Majestueux" means majestic, inspiring admiration and awe through grandeur.',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Nomme 2 sites touristiques au Nigeria et décris chacun avec un adjectif approprié.',
          answer: '1. Zuma Rock à Suleja : un rocher gigantesque et majestueux. 2. Yankari Game Reserve à Bauchi : une réserve naturelle chaude et fascinante.',
          hint: 'Think of Obudu, Yankari, Zuma Rock, Lekki Conservation, Gurara Falls.',
        ),
        JSS3EvaluationQuestion(
          question: 'Comment dit-on en français : "Tourists admire the lush green landscapes of Africa." ?',
          answer: '"Les touristes admirent les paysages verdoyants d\'Afrique."',
          hint: 'Tourists = Les touristes; admire = admirent; lush green = verdoyants; landscapes = les paysages.',
        ),
        JSS3EvaluationQuestion(
          question: 'Quelle est la différence entre "visiter un monument" et "rendre visite à une personne" ?',
          answer: 'In French, "visiter" is used for PLACES, monuments, cities, and museums ("Je visite le musée"). For PEOPLE, you must use "rendre visite à" ("Je rends visite à mes grands-parents"). Saying "Je visite mon ami" is incorrect.',
          hint: 'Visiter = places; Rendre visite à = people.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Guide touristique',
          instruction: 'Create a mini travel postcard (4–6 sentences) inviting a French tourist to visit a state or natural attraction in Nigeria.',
          exampleResponse: 'Bienvenue au Nigeria ! Venez découvrir le plateau d\'Obudu dans l\'État de Cross River. C\'est un endroit montagneux avec un climat doux et des forêts verdoyantes. On peut monter en téléphérique et admirer des cascades spectaculaires. C\'est inoubliable !',
        ),
        JSS3AssignmentTask(
          category: 'Vocabulaire géographique',
          instruction: 'Match 5 Nigerian states with their famous geographic landscape in French (e.g. Bauchi -> la réserve de savane).',
          exampleResponse: '1. Niger State : les chutes de Gurara. 2. Cross River : les montagnes d\'Obudu. 3. Bauchi : la réserve faunique de Yankari. 4. Lagos : les plages côtières de l\'Atlantique. 5. Plateau State : les collines rocheuses de Jos.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Descriptive Adjectives & "Visiter" vs "Rendre visite à"',
        explanation:
            '1. Qualifying Geographic Adjectives:\n• masculine: verdoyant, montagneux, aride, spectaculaire, historique\n• feminine: verdoyante, montagneuse, aride, spectaculaire, historique\n• plural: verdoyants/verdoyantes, montagneux/montagneuses\n\n2. Crucial Verb Distinction (BECE Exam Trap):\n• VISITER + place / building: "Je visite la Tour Eiffel / le Nigeria."\n• RENDRE VISITE À + person: "Je rends visite à mon oncle." (NEVER say: "Je visite mon oncle").',
        examples: [
          'Nous visitons les chutes d\'eau de Gurara. (We are visiting Gurara Falls.)',
          'Pendant les vacances, je rends visite à ma tante à Cotonou. (During the holidays, I visit my aunt in Cotonou.)',
          'Ce parc national offre une vue panoramique et spectaculaire. (This national park offers a spectacular panoramic view.)',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 3 — Unité 3: Expliquer ses habitudes
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 3,
      termNumber: 1,
      theme: 'Unité 3',
      frenchTitle: 'Expliquer ses habitudes et sa routine',
      englishSubtitle: 'Daily Habits, Reflexive Verbs & Frequency Adverbs',
      teacherFacilitatorPrompt:
          'Review clock times and daily actions. Introduce reflexive pronominal verbs (se réveiller, se lever, se laver, s\'habiller, se coucher). Write the reflexive pronouns on the board (me, te, se, nous, vous, se). Teach frequency adverbs (toujours, souvent, d\'habitude, rarement, ne... jamais). Practice building a routine timeline in the Habits Studio.',
      objectives: [
        'Conjugate and use reflexive pronominal verbs in the present tense.',
        'Describe morning, afternoon, and evening routines systematically.',
        'Express frequency of habits using appropriate adverbs and expressions.',
        'Compare school day routines with weekend habits.',
      ],
      culturalInsight:
          'In Nigerian boarding schools and day schools alike, daily routines start early (often 5:30 am with morning prayers, cleaning, assembly, and classes from 8:00 am to 2:00 pm). In Francophone West African secondary schools (collèges et lycées), the timetable often runs from 7:30 am to 12:00 pm, followed by a midday break ("la pause de midi"), and resumes from 3:00 pm to 5:30 pm.',
      patternType: JSS3PatternType.habitsAndRoutineStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'se réveiller / se lever',
          phonetics: '[sə ʁe.ve.je] / [sə lə.ve]',
          english: 'to wake up / to get up',
          usageNote: 'Je me réveille à 6h00 et je me lève aussitôt.',
          icon: Icons.alarm_rounded,
          audioKey: 't1w3_reveiller_lever',
        ),
        JSS3VocabItem(
          french: 'se laver / se doucher',
          phonetics: '[sə la.ve] / [sə du.ʃe]',
          english: 'to wash oneself / to shower',
          usageNote: 'Je me lave avec de l\'eau tiède avant d\'aller à l\'école.',
          icon: Icons.bathtub_rounded,
          audioKey: 't1w3_laver_doucher',
        ),
        JSS3VocabItem(
          french: 's\'habiller / se brosser les dents',
          phonetics: '[sa.bi.je] / [sə bʁɔ.se le dɑ̃]',
          english: 'to get dressed / to brush teeth',
          usageNote: 'Je m\'habille en uniforme scolaire et je me brosse les dents.',
          icon: Icons.checkroom_rounded,
          audioKey: 't1w3_habiller_brosser',
        ),
        JSS3VocabItem(
          french: 'se coucher / s\'endormir',
          phonetics: '[sə ku.ʃe] / [sɑ̃.dɔʁ.miʁ]',
          english: 'to go to bed / to fall asleep',
          usageNote: 'Je me couche à 21h30 après avoir fait mes devoirs.',
          icon: Icons.bedtime_rounded,
          audioKey: 't1w3_coucher_endormir',
        ),
        JSS3VocabItem(
          french: 'd\'habitude / d\'ordinaire',
          phonetics: '[da.bi.tyd] / [dɔʁ.di.nɛʁ]',
          english: 'usually / ordinarily',
          usageNote: 'D\'habitude, je prends le bus scolaire à 7h15.',
          icon: Icons.schedule_rounded,
          audioKey: 't1w3_dhabitude',
        ),
        JSS3VocabItem(
          french: 'tous les jours / chaque matin',
          phonetics: '[tu le ʒuʁ] / [ʃak ma.tɛ̃]',
          english: 'every day / every morning',
          usageNote: 'Chaque matin, nous chantons l\'hymne national au rassemblement.',
          icon: Icons.calendar_month_rounded,
          audioKey: 't1w3_tous_les_jours',
        ),
        JSS3VocabItem(
          french: 'régulièrement / souvent',
          phonetics: '[ʁe.ɡy.ljɛʁ.mɑ̃] / [su.vɑ̃]',
          english: 'regularly / often',
          usageNote: 'Je révise mes leçons de français régulièrement.',
          icon: Icons.repeat_rounded,
          audioKey: 't1w3_regulierement_souvent',
        ),
        JSS3VocabItem(
          french: 'de temps en temps / rarement',
          phonetics: '[də tɑ̃z‿ɑ̃ tɑ̃] / [ʁaʁ.mɑ̃]',
          english: 'from time to time / rarely',
          usageNote: 'De temps en temps, je joue au football le samedi après-midi.',
          icon: Icons.hourglass_top_rounded,
          audioKey: 't1w3_temps_en_temps',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Complétez avec le bon pronom : "Le matin, nous ___ réveillons à 6 heures."',
          options: ['se', 'vous', 'nous', 'me'],
          correctOptionIndex: 2,
          explanation: 'For the subject "nous", the reflexive pronoun is always "nous": "Nous nous réveillons".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quelle phrase est correcte au présent ?',
          options: ['Je me lève à six heures.', 'Je se lève à six heures.', 'Je me lever à six heures.', 'Je lève me à six heures.'],
          correctOptionIndex: 0,
          explanation: '"Je me lève" has the correct reflexive pronoun "me" and conjugated verb form "lève".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Que signifie l\'expression "d\'habitude" ?',
          options: ['never', 'rarely', 'usually / customarily', 'yesterday'],
          correctOptionIndex: 2,
          explanation: '"D\'habitude" means usually or customarily.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Conjuguez pour "ils" : "Ils ___ (se brosser) les dents."',
          options: ['se brosse', 'se brossent', 'se brossons', 'se brossez'],
          correctOptionIndex: 1,
          explanation: 'For "ils", the third-person plural ending is "-ent": "Ils se brossent".',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Conjugue le verbe réflexif "se lever" au présent pour tous les pronoms sujets.',
          answer: 'Je me lève, tu te lèves, il/elle se lève, nous nous levons, vous vous levez, ils/elles se lèvent.',
          hint: 'Remember the reflexive pronouns: me, te, se, nous, vous, se.',
        ),
        JSS3EvaluationQuestion(
          question: 'Écris 3 phrases décrivant ce que tu fais d\'habitude le matin avant de partir à l\'école.',
          answer: 'Exemple : "D\'abord, je me réveille à 6h00. Ensuite, je me lave et je m\'habille. Enfin, je prends mon petit-déjeuner et je pars à 7h00."',
          hint: 'Use reflexive verbs like se réveiller, se laver, s\'habiller.',
        ),
        JSS3EvaluationQuestion(
          question: 'Classe ces adverbes de fréquence du plus fréquent au moins fréquent : rarement, toujours, parfois, souvent.',
          answer: '1. Toujours (100%) ➔ 2. Souvent (75%) ➔ 3. Parfois (50%) ➔ 4. Rarement (20%).',
          hint: 'From always (100%) down to rarely (20%).',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Mon emploi du temps',
          instruction: 'Write out your typical Saturday routine in French (5–7 sentences). Use at least 4 reflexive verbs and 3 frequency adverbs.',
          exampleResponse: 'Le samedi, je me lève un peu plus tard, vers 7h30. D\'habitude, j\'aide mes parents avec les tâches ménagères. À midi, nous déjeunons en famille. L\'après-midi, je joue souvent au football avec mes voisins. Le soir, je me couche vers 22h00.',
        ),
        JSS3AssignmentTask(
          category: 'Conjugaison',
          instruction: 'Conjugate "s\'habiller" (to get dressed) and "se coucher" (to go to bed) in your notebook for all subject pronouns.',
          exampleResponse: 'Je m\'habille, tu t\'habilles, il s\'habille, nous nous habillons, vous vous habillez, ils s\'habillent. / Je me couche, tu te couches, il se couche, nous nous couchons, vous vous couchez, ils se couchent.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Pronominal Reflexive Verbs & Frequency Syntax',
        explanation:
            '1. Reflexive Verbs (Verbes Pronominaux):\nReflexive verbs express actions the subject performs on themselves. They require a reflexive pronoun that agrees with the subject:\n• Je ME réveille (I wake up)\n• Tu TE laves (You wash yourself)\n• Il / Elle / On SE brosse (He/She brushes)\n• Nous NOUS habillons (We get dressed)\n• Vous VOUS levez (You get up)\n• Ils / Elles SE couchent (They go to bed)\n\nNote: "me, te, se" become "m\', t\', s\'" before a vowel or mute h (s\'habiller, s\'endormir).\n\n2. Frequency Adverbs Placement:\nAdverbs usually follow the conjugated verb in the present tense: "Je révise SOUVENT mes leçons."',
        examples: [
          'Chaque matin, je me prépare en trente minutes. (Every morning, I get ready in 30 minutes.)',
          'Est-ce que tu te reposes le dimanche ? (Do you rest on Sundays?)',
          'Mes frères se lèvent toujours de bonne heure. (My brothers always get up early.)',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 4 — Unité 4: Parler d’un événement passé (les souvenirs)
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 4,
      termNumber: 1,
      theme: 'Unité 4',
      frenchTitle: 'Raconter un souvenir et un événement passé',
      englishSubtitle: 'Narrating Past Memories — Passé Composé vs Imparfait',
      teacherFacilitatorPrompt:
          'Ask pupils about a memorable event from their primary school days or last holiday ("Qu\'est-ce que tu as fait l\'année dernière ?"). Introduce the dual past tense system: Passé Composé for completed actions and Imparfait for descriptions/background habits. Teach auxiliary verbs (Avoir vs Être with DR MRS VANDERTRAMP). Practice in the Memory Vault Studio.',
      objectives: [
        'Form and use the Passé Composé with AVOIR and ÊTRE auxiliary verbs.',
        'Recognize regular and irregular past participles (mangé, fini, vu, fait, pris, allé).',
        'Distinguish between Passé Composé (punctual action) and Imparfait (habit/description).',
        'Narrate a personal childhood or holiday memory in French.',
      ],
      culturalInsight:
          'Oral storytelling (les contes et récits du passé) is an ancient and revered African art. Elders and griots across West Africa narrate family genealogies and village histories using structured past tenses. In French education and the BECE exam, mastering the past tense is the milestone separating junior secondary learners from intermediate speakers.',
      patternType: JSS3PatternType.pastMemoriesStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'un souvenir d\'enfance',
          phonetics: '[œ̃ su.və.niʁ dɑ̃.fɑ̃s]',
          english: 'a childhood memory',
          usageNote: 'J\'ai un beau souvenir de mon village natal.',
          icon: Icons.history_edu_rounded,
          audioKey: 't1w4_souvenir_enfance',
        ),
        JSS3VocabItem(
          french: 'quand j\'étais petit(e)',
          phonetics: '[kɑ̃ ʒe.tɛ pə.ti]',
          english: 'when I was little / young',
          usageNote: 'Quand j\'étais petit, je jouais sous la pluie avec mes cousins.',
          icon: Icons.child_care_rounded,
          audioKey: 't1w4_quand_j_etais_petit',
        ),
        JSS3VocabItem(
          french: 'l\'année dernière / autrefois',
          phonetics: '[la.ne dɛʁ.njɛʁ] / [o.tʁə.fwa]',
          english: 'last year / in the past',
          usageNote: 'L\'année dernière, nous avons visité la ville de Calabar.',
          icon: Icons.update_rounded,
          audioKey: 't1w4_annee_derniere',
        ),
        JSS3VocabItem(
          french: 'j\'ai voyagé / nous sommes allés',
          phonetics: '[ʒe vwa.ja.ʒe] / [nu sɔm.z‿a.le]',
          english: 'I travelled / we went',
          usageNote: 'Pendant les vacances, nous sommes allés au village.',
          icon: Icons.flight_takeoff_rounded,
          audioKey: 't1w4_voyage_alles',
        ),
        JSS3VocabItem(
          french: 'j\'ai vu / j\'ai fait / j\'ai pris',
          phonetics: '[ʒe vy] / [ʒe fɛ] / [ʒe pʁi]',
          english: 'I saw / I did / I took',
          usageNote: 'J\'ai vu des éléphants à Yankari et j\'ai pris des photos.',
          icon: Icons.camera_alt_rounded,
          audioKey: 't1w4_vu_fait_pris',
        ),
        JSS3VocabItem(
          french: 'je me souviens de...',
          phonetics: '[ʒə mə su.vjɛ̃ də]',
          english: 'I remember...',
          usageNote: 'Je me souviens de mon premier jour d\'école en Primary 1.',
          icon: Icons.psychology_alt_rounded,
          audioKey: 't1w4_souviens_de',
        ),
        JSS3VocabItem(
          french: 'inoubliable / mémorable',
          phonetics: '[i.nu.bli.jabl] / [me.mɔ.ʁabl]',
          english: 'unforgettable / memorable',
          usageNote: 'C\'était une journée mémorable et pleine de joie.',
          icon: Icons.star_rounded,
          audioKey: 't1w4_inoubliable_memorable',
        ),
        JSS3VocabItem(
          french: 'hier / avant-hier',
          phonetics: '[jɛʁ] / [a.vɑ̃.tjɛʁ]',
          english: 'yesterday / day before yesterday',
          usageNote: 'Hier soir, j\'ai terminé tous mes devoirs de français.',
          icon: Icons.event_available_rounded,
          audioKey: 't1w4_hier_avant_hier',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Quel auxiliaire utilise le verbe "ALLER" au passé composé ?',
          options: ['AVOIR (j\'ai allé)', 'ÊTRE (je suis allé)', 'FAIRE (je fais allé)', 'ALLER (je vais allé)'],
          correctOptionIndex: 1,
          explanation: '"Aller" is a verb of movement and takes the auxiliary ÊTRE: "Je suis allé(e)".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Complétez : "L\'année dernière, nous ___ un voyage mémorable."',
          options: ['avons fait', 'sommes fait', 'ont fait', 'avez fait'],
          correctOptionIndex: 0,
          explanation: '"Faire" uses AVOIR. For "nous", the correct form is "avons fait".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quel est le participe passé du verbe "PRENDRE" ?',
          options: ['prendu', 'pris', 'prené', 'prient'],
          correctOptionIndex: 1,
          explanation: 'The irregular past participle of "prendre" is "pris" (J\'ai pris).',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quand utilise-t-on l\'Imparfait ?',
          options: [
            'Pour une action ponctuelle et rapide',
            'Pour des descriptions, des états et des habitudes passées',
            'Pour parler du futur',
            'Pour donner un ordre',
          ],
          correctOptionIndex: 1,
          explanation: 'The Imparfait is used for ongoing states, background descriptions, and recurring past habits ("Quand j\'étais petit...").',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Explique comment on forme le Passé Composé en français.',
          answer: 'Passé Composé = Auxiliaire (AVOIR ou ÊTRE au présent) + Participe Passé du verbe principal. Exemple : "J\'ai mangé" (avoir) / "Je suis venu" (être).',
          hint: 'Auxiliary verb (Avoir/Être) + Past Participle.',
        ),
        JSS3EvaluationQuestion(
          question: 'Cite 5 verbes qui utilisent l\'auxiliaire ÊTRE au passé composé.',
          answer: 'Aller, venir, arriver, partir, entrer, sortir, monter, descendre, naître, mourir (DR & MRS VANDERTRAMP verbs).',
          hint: 'Think of movement and state verbs: go, come, arrive, leave, enter, born, die.',
        ),
        JSS3EvaluationQuestion(
          question: 'Raconte un événement passé en 3 phrases au passé composé.',
          answer: 'Exemple : "Samedi dernier, je suis allé au marché avec ma mère. Nous avons acheté des fruits frais et du poisson. Le soir, nous avons préparé un délicieux dîner."',
          hint: 'Use past time markers: Samedi dernier, hier, pendant les vacances.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Récit de vacances',
          instruction: 'Write a short story (5–7 sentences) titled "Un souvenir mémorable de mes vacances". Use at least 4 verbs in the Passé Composé (2 with Avoir, 2 with Être).',
          exampleResponse: 'Pendant les dernières vacances, je suis allé chez mes grands-parents à Enugu. Mon cousin est arrivé le lendemain. Nous avons joué au football et nous avons visité de beaux endroits. J\'ai passé un séjour inoubliable !',
        ),
        JSS3AssignmentTask(
          category: 'Tableau des participes passés',
          instruction: 'Create a table in your notebook listing the infinitives and past participles of: avoir, être, faire, prendre, voir, aller, venir, finir, manger, partir.',
          exampleResponse: 'Avoir -> eu, Être -> été, Faire -> fait, Prendre -> pris, Voir -> vu, Aller -> allé, Venir -> venu, Finir -> fini, Manger -> mangé, Partir -> parti.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Passé Composé (Avoir vs Être) & Past Participles',
        explanation:
            '1. Formation of Passé Composé:\n• Subject + Present of Avoir/Être + Past Participle\n\n2. Most verbs take AVOIR:\n• J\'ai parlé, tu as fini, il a vendu, nous avons vu, ils ont fait.\n\n3. 16 Movement/State verbs take ÊTRE (DR & MRS VANDERTRAMP):\n• Devenir, Revenir, Monter, Rester, Sortir, Venir, Aller, Naître, Descendre, Entrer, Rentrer, Tomber, Retourner, Arriver, Mourir, Partir.\n• IMPORTANT: With ÊTRE, the past participle agrees in gender and number with the subject!\n  - Aminu est allé (m.s.)\n  - Fatima est allée (f.s.)\n  - Les garçons sont allés (m.p.)\n  - Les filles sont allées (f.p.)',
        examples: [
          'Hier, j\'ai fini mes devoirs et j\'ai regardé un match. (Yesterday I finished my homework and watched a match.)',
          'Elle est partie pour Abuja ce matin. (She left for Abuja this morning.)',
          'Quand j\'avais dix ans, nous habitions à Kano. (When I was ten, we used to live in Kano - Imparfait).',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 5 — Unité 5: Décrire un objet
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 5,
      termNumber: 1,
      theme: 'Unité 5',
      frenchTitle: 'Décrire un objet : forme, couleur, matière et usage',
      englishSubtitle: 'Describing Objects — Shapes, Materials & Utility',
      teacherFacilitatorPrompt:
          'Bring a few everyday objects to class (a metallic ruler, a wooden box, a plastic bottle, a leather bag). Introduce geometric shapes (rond, carré, rectangulaire), material expressions with preposition EN (en bois, en cuir, en plastique, en métal), and utility formulas (ça sert à + infinitif). Move to the Object Studio.',
      objectives: [
        'Identify and describe geometric shapes (rond, carré, rectangulaire, ovale).',
        'Name raw and manufactured materials using the preposition EN.',
        'Explain the purpose and function of objects using "servir à" and "être utilisé pour".',
        'Write a complete product specification for a common technological or school tool.',
      ],
      culturalInsight:
          'African craftsmanship is world-renowned: carved wooden sculptures (*en bois d\'ébène*), brass and bronze castings from the Benin Kingdom (*en bronze / en cuivre*), Kano leather goods (*en cuir véritable*), and traditional woven textiles (*en coton tissé / aso-oke / kente*). Describing these in French highlights Nigeria\'s rich material culture.',
      patternType: JSS3PatternType.objectDescriptionStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'la forme (rond / carré / rectangulaire)',
          phonetics: '[la fɔʁm] [ʁɔ̃] [ka.ʁe] [ʁɛk.tɑ̃.ɡy.lɛʁ]',
          english: 'shape (round / square / rectangular)',
          usageNote: 'Cette table est de forme rectangulaire.',
          icon: Icons.category_rounded,
          audioKey: 't1w5_forme_geometrique',
        ),
        JSS3VocabItem(
          french: 'en bois / en métal / en fer',
          phonetics: '[ɑ̃ bwa] / [ɑ̃ me.tal] / [ɑ̃ fɛʁ]',
          english: 'made of wood / metal / iron',
          usageNote: 'Le banc de classe est fabriqué en bois et en métal.',
          icon: Icons.carpenter_rounded,
          audioKey: 't1w5_bois_metal',
        ),
        JSS3VocabItem(
          french: 'en plastique / en verre',
          phonetics: '[ɑ̃ plas.tik] / [ɑ̃ vɛʁ]',
          english: 'made of plastic / glass',
          usageNote: 'Cette bouteille est en plastique recyclable, celle-là est en verre.',
          icon: Icons.local_drink_rounded,
          audioKey: 't1w5_plastique_verre',
        ),
        JSS3VocabItem(
          french: 'en cuir / en tissu / en coton',
          phonetics: '[ɑ̃ kɥiʁ] / [ɑ̃ ti.sy] / [ɑ̃ kɔ.tɔ̃]',
          english: 'made of leather / fabric / cotton',
          usageNote: 'Mon cartable est en cuir noir et ma chemise est en coton.',
          icon: Icons.shopping_bag_rounded,
          audioKey: 't1w5_cuir_tissu_coton',
        ),
        JSS3VocabItem(
          french: 'ça sert à + infinitif',
          phonetics: '[sa sɛʁ a]',
          english: 'it is used for / to...',
          usageNote: 'Ce dictionnaire sert à chercher la signification des mots.',
          icon: Icons.build_circle_rounded,
          audioKey: 't1w5_sert_a',
        ),
        JSS3VocabItem(
          french: 'c\'est composé de...',
          phonetics: '[sɛ kɔ̃.po.ze də]',
          english: 'it is composed of / made of...',
          usageNote: 'Cet appareil est composé d\'un écran tactile et d\'une batterie.',
          icon: Icons.extension_rounded,
          audioKey: 't1w5_compose_de',
        ),
        JSS3VocabItem(
          french: 'lourd / léger',
          phonetics: '[luʁ] / [le.ʒe]',
          english: 'heavy / light (weight)',
          usageNote: 'Ce sac d\'école est trop lourd, mais cet ordinateur est léger.',
          icon: Icons.fitness_center_rounded,
          audioKey: 't1w5_lourd_leger',
        ),
        JSS3VocabItem(
          french: 'utile / indispensable',
          phonetics: '[y.til] / [ɛ̃.dis.pɑ̃.sabl]',
          english: 'useful / indispensable',
          usageNote: 'Le smartphone est un outil très utile pour communiquer.',
          icon: Icons.thumb_up_alt_rounded,
          audioKey: 't1w5_utile_indispensable',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Quelle préposition utilise-t-on pour indiquer la matière d\'un objet ?',
          options: ['à (à bois)', 'en (en bois)', 'de (de bois)', 'par (par bois)'],
          correctOptionIndex: 1,
          explanation: 'In French, the preposition "EN" is always used before material nouns: en bois, en cuir, en or, en verre.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Complétez : "Les ciseaux ___ à couper du papier et du tissu."',
          options: ['servent', 'sert', 'servons', 'servez'],
          correctOptionIndex: 0,
          explanation: '"Les ciseaux" is plural. The third-person plural of "servir" is "servent" (servent à couper).',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quelle est la forme géométrique d\'un ballon de football ?',
          options: ['carré', 'rond / sphérique', 'triangulaire', 'rectangulaire'],
          correctOptionIndex: 1,
          explanation: 'A ball is round: "rond" or "sphérique".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Comment dit-on "A leather shoes" en français ?',
          options: ['Des chaussures en cuir', 'Des chaussures à cuir', 'Des chaussures de cuir', 'Des chaussures pour cuir'],
          correctOptionIndex: 0,
          explanation: '"Des chaussures en cuir" uses the correct preposition "EN" for material.',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Décris ton smartphone ou un stylo en précisant : la forme, la matière, la couleur et l\'usage.',
          answer: 'Exemple pour un smartphone : "Mon smartphone est de forme rectangulaire, de couleur noire. Il est fait en métal et en verre. Il sert à communiquer, faire des recherches et écouter de la musique."',
          hint: 'Include shape, material (en...), color, and function (ça sert à + verb).',
        ),
        JSS3EvaluationQuestion(
          question: 'Quelle est la différence d\'utilisation entre "EN" et "À" pour les objets et vêtements ?',
          answer: 'EN is used for MATERIALS (en coton, en cuir, en bois). À is used for PATTERNS and FEATURES (à rayures, à pois, à manches courtes, à roulettes).',
          hint: 'EN for material/fabric; À for patterns/features/accessories.',
        ),
        JSS3EvaluationQuestion(
          question: 'Traduis cette phrase : "This wooden desk is heavy but very useful for studying."',
          answer: '"Ce bureau en bois est lourd mais très utile pour étudier."',
          hint: 'This wooden desk = Ce bureau en bois; heavy = lourd; useful for studying = utile pour étudier.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Devinette d\'objet',
          instruction: 'Write a 4-line riddle ("Qui suis-je ?") describing a classroom or household object without naming it. Your classmates will guess it.',
          exampleResponse: 'Je suis de forme rectangulaire. Je suis fait en bois et en papier. Je contiens beaucoup d\'histoires et de leçons. Je sers à lire et à apprendre. Qui suis-je ? (Réponse : Un livre).',
        ),
        JSS3AssignmentTask(
          category: 'Inventaire matériel',
          instruction: 'List 6 objects found in your home and describe what material each is made of using "en" (e.g. la cuillère en métal).',
          exampleResponse: '1. La table en bois. 2. La bouteille en verre. 3. Le sac en cuir. 4. La chaise en plastique. 5. La clé en métal. 6. Le rideau en tissu.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Prepositions for Materials (EN) & Function ("Servir à")',
        explanation:
            '1. Materials (Les Matières):\nAlways use the preposition EN before materials:\n• en or (made of gold), en argent (silver), en fer (iron), en bois (wood), en cuir (leather), en plastique (plastic), en verre (glass), en tissu (fabric), en coton (cotton), en laine (wool).\n\n2. Expressing Utility & Function:\n• Ça sert à + infinitif : "La règle sert à tracer des lignes droites."\n• Être utilisé pour + nom/infinitif : "Ce logiciel est utilisé pour le dessin."',
        examples: [
          'Une montre en or et un bracelet en argent. (A gold watch and a silver bracelet.)',
          'À quoi sert cet instrument ? — Ça sert à mesurer la température. (What is this tool used for? — It is used to measure temperature.)',
          'Ces sacs sont fabriqués en cuir véritable du Nigeria. (These bags are made of genuine Nigerian leather.)',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 6 — Unité 6: Comparer
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 6,
      termNumber: 1,
      theme: 'Unité 6',
      frenchTitle: 'Comparer des personnes, des objets et des situations',
      englishSubtitle: 'Comparatives and Superlatives Arena',
      teacherFacilitatorPrompt:
          'Draw comparison scales on the board. Compare two cities (Lagos vs Abuja: "Lagos est plus peuplée qu\'Abuja"), two subjects (Maths vs Français), or two objects. Teach the comparative formulas (plus... que, moins... que, aussi... que) and superlative formulas (le plus, la plus, les meilleurs). Open the Comparison Arena Studio.',
      objectives: [
        'Construct comparative sentences of superiority, inferiority, and equality for adjectives.',
        'Form comparative sentences for quantities (plus de... que, autant de... que).',
        'Use superlative structures accurately (le plus grand, la meilleure école).',
        'Recognize irregular forms: bon ➔ meilleur, bien ➔ mieux.',
      ],
      culturalInsight:
          'Comparative thinking is essential for analytical problem solving in secondary school. Nigerian pupils often compare the economic dynamism of Lagos with the administrative order of Abuja, or compare football clubs in the African Cup of Nations (AFCON) and European leagues. Using French comparatives allows them to debate and express nuanced opinions eloquently.',
      patternType: JSS3PatternType.comparisonSuperlativesStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'plus... que (supériorité)',
          phonetics: '[ply ... kə]',
          english: 'more... than (superiority)',
          usageNote: 'Lagos est plus grand et plus animé qu\'Abuja.',
          icon: Icons.trending_up_rounded,
          audioKey: 't1w6_plus_que',
        ),
        JSS3VocabItem(
          french: 'moins... que (infériorité)',
          phonetics: '[mwɛ̃ ... kə]',
          english: 'less... than (inferiority)',
          usageNote: 'Cette ville est moins bruyante que la capitale.',
          icon: Icons.trending_down_rounded,
          audioKey: 't1w6_moins_que',
        ),
        JSS3VocabItem(
          french: 'aussi... que (égalité)',
          phonetics: '[o.si ... kə]',
          english: 'as... as (equality)',
          usageNote: 'Fatima est aussi intelligente et travailleuse que son frère.',
          icon: Icons.drag_handle_rounded,
          audioKey: 't1w6_aussi_que',
        ),
        JSS3VocabItem(
          french: 'meilleur(e) / le meilleur',
          phonetics: '[mɛ.jœʁ] / [lə mɛ.jœʁ]',
          english: 'better / the best',
          usageNote: 'Le jollof rice nigérian est le meilleur plat du monde !',
          icon: Icons.emoji_events_rounded,
          audioKey: 't1w6_meilleur_le_meilleur',
        ),
        JSS3VocabItem(
          french: 'le plus / la plus / les plus',
          phonetics: '[lə ply] / [la ply] / [le ply]',
          english: 'the most (superlative)',
          usageNote: 'Le mont Everest est la montagne la plus haute de la planète.',
          icon: Icons.workspace_premium_rounded,
          audioKey: 't1w6_superlatif_le_plus',
        ),
        JSS3VocabItem(
          french: 'pire / le pire',
          phonetics: '[piʁ] / [lə piʁ]',
          english: 'worse / the worst',
          usageNote: 'Les embouteillages du vendredi soir sont les pires.',
          icon: Icons.error_outline_rounded,
          audioKey: 't1w6_pire_le_pire',
        ),
        JSS3VocabItem(
          french: 'plus de... que / autant de... que',
          phonetics: '[ply də ... kə] / [o.tɑ̃ də ... kə]',
          english: 'more (quantity) than / as much as',
          usageNote: 'J\'ai plus de livres de français que de cahiers.',
          icon: Icons.format_list_numbered_rounded,
          audioKey: 't1w6_plus_de_autant_de',
        ),
        JSS3VocabItem(
          french: 'comparé à / par rapport à',
          phonetics: '[kɔ̃.pa.ʁe a] / [paʁ ʁa.pɔʁ a]',
          english: 'compared to / in relation to',
          usageNote: 'Comparé à l\'année dernière, nos résultats sont bien meilleurs.',
          icon: Icons.compare_arrows_rounded,
          audioKey: 't1w6_compare_a',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Complétez : "L\'avion est ___ rapide ___ le train."',
          options: ['plus ... que', 'aussi ... de', 'meilleur ... que', 'moins ... de'],
          correctOptionIndex: 0,
          explanation: 'The comparative of superiority for adjectives is "plus + adjectif + que".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quel est le comparatif correct pour l\'adjectif "BON" ?',
          options: ['plus bon', 'meilleur', 'mieux', 'bonner'],
          correctOptionIndex: 1,
          explanation: '"Plus bon" does not exist in French. The comparative of "bon" is "meilleur" (f. meilleure).',
        ),
        JSS3InteractiveExercise(
          prompt: 'Choisissez la bonne phrase de quantité :',
          options: [
            'Il a plus livres que moi.',
            'Il a plus de livres que moi.',
            'Il a aussi livres que moi.',
            'Il a très livres que moi.',
          ],
          correctOptionIndex: 1,
          explanation: 'For quantities of nouns, use "plus DE + nom + que": "plus de livres que".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Traduisez : "She is the most intelligent student in the class."',
          options: [
            'Elle est plus intelligente élève.',
            'Elle est la plus intelligente élève de la classe.',
            'Elle est l\'élève plus intelligente.',
            'Elle est la meilleure élève intelligente.',
          ],
          correctOptionIndex: 1,
          explanation: 'The superlative uses "la plus + adjectif": "la plus intelligente élève de la classe".',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Compare deux villes nigérianes en utilisant : 1. Supériorité (+), 2. Égalité (=), 3. Superlatif (+++).',
          answer: '1. Supériorité : "Lagos est plus peuplée qu\'Abuja." 2. Égalité : "Calabar est aussi belle qu\'Uyo." 3. Superlatif : "Lagos est la ville la plus dynamique du Nigeria."',
          hint: 'Use plus... que, aussi... que, and la plus...',
        ),
        JSS3EvaluationQuestion(
          question: 'Pourquoi dit-on "Ce gâteau est meilleur" et non pas "Ce gâteau est plus bon" ?',
          answer: '"Bon" is an irregular adjective. Its comparative is "meilleur" (better) and superlative is "le meilleur" (the best). "Plus bon" is grammatically incorrect in French.',
          hint: 'Remember the rule: bon -> meilleur; bien -> mieux.',
        ),
        JSS3EvaluationQuestion(
          question: 'Quelle est la différence entre "meilleur" et "mieux" ?',
          answer: '"Meilleur" is an ADJECTIVE that modifies a noun ("C\'est un meilleur livre"). "Mieux" is an ADVERB that modifies a verb ("Il parle mieux français").',
          hint: 'Meilleur modifies nouns; Mieux modifies verbs/actions.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Débat écrit',
          instruction: 'Write a 6-sentence comparison between two school subjects (e.g. Mathematics vs French) or two sports (Football vs Basketball). Use at least 3 comparatives and 1 superlative.',
          exampleResponse: 'J\'aime les mathématiques et le français. Les mathématiques sont plus logiques, mais le français est plus utile pour les voyages internationaux. Le français est aussi passionnant que les sciences. À mon avis, le français est la matière la plus enrichissante de mon emploi du temps.',
        ),
        JSS3AssignmentTask(
          category: 'Transformation comparative',
          instruction: 'Transform 4 simple sentences into comparative sentences of superiority, inferiority, and equality in your notebook.',
          exampleResponse: '1. Le lion est plus fort que la gazelle. 2. La moto est moins chère que la voiture. 3. Mon frère est aussi grand que mon père. 4. Notre école est la meilleure de l\'État.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Comparatives (Adjectives & Quantities) and Superlatives',
        explanation:
            '1. Comparatives with Adjectives:\n• Superiority (+): plus + adjectif + que (L\'avion est plus rapide que le train.)\n• Inferiority (−): moins + adjectif + que (Le vélo est moins rapide que la voiture.)\n• Equality (=): aussi + adjectif + que (Elle est aussi grande que sa sœur.)\n\n2. Comparatives with Quantities (Nouns):\n• plus DE + nom + que / moins DE + nom + que / autant DE + nom + que\n\n3. Superlatives:\n• le plus / la plus / les plus + adjectif (+ de)\n\n4. Irregular Forms:\n• bon (good) ➔ meilleur (better) ➔ le meilleur (the best)\n• bien (well) ➔ mieux (better/adverb) ➔ le mieux (the best/adverb)',
        examples: [
          'Ce joueur est le meilleur de l\'équipe. (This player is the best in the team.)',
          'Elle chante mieux que son amie. (She sings better than her friend.)',
          'Nous avons autant de devoirs que les élèves de JSS2. (We have as much homework as JSS2 pupils.)',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 7 — Unité 7: Dater et mesurer le temps
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 7,
      termNumber: 1,
      theme: 'Unité 7',
      frenchTitle: 'Dater, mesurer le temps et situer dans la durée',
      englishSubtitle: 'Dates, Timeline & Temporal Prepositions (depuis, pendant, il y a)',
      teacherFacilitatorPrompt:
          'Review days of the week, months, and years. Practice stating historic dates (e.g. Nigerian Independence: le 1er octobre 1960). Introduce the core temporal prepositions: DEPUIS (ongoing since/for), PENDANT (completed duration), IL Y A (time ago), and DANS (future duration). Drill timeline sentences in the Temporal Radar Studio.',
      objectives: [
        'Express full calendar dates, historical milestones, and centuries in French.',
        'Distinguish between temporal prepositions: DEPUIS, PENDANT, IL Y A, DANS, and JUSQU\'À.',
        'Calculate and express elapsed time and duration accurately.',
        'Construct historical timelines for Nigerian and Francophone events.',
      ],
      culturalInsight:
          'Understanding dates and timelines is essential for Francophone history and diplomacy. In West Africa, 1960 is known as "l\'Année de l\'Afrique" (The Year of Africa) because 17 nations, including Nigeria (1er octobre 1960), Bénin (1er août 1960), Côte d\'Ivoire (7 août 1960), and Senegal (20 juin 1960), gained independence. BECE exams frequently test temporal prepositions and historic dates.',
      patternType: JSS3PatternType.datingTimeMeasurementStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'la date / le calendrier',
          phonetics: '[la dat] / [lə ka.lɑ̃.dʁi.je]',
          english: 'date / calendar',
          usageNote: 'Quelle est la date d\'aujourd\'hui ? — Nous sommes le 15 octobre.',
          icon: Icons.calendar_today_rounded,
          audioKey: 't1w7_date_calendrier',
        ),
        JSS3VocabItem(
          french: 'le premier (1er) / le deux (2)',
          phonetics: '[lə pʁə.mje] / [lə dø]',
          english: 'the 1st / the 2nd (of month)',
          usageNote: 'In French, only the 1st uses an ordinal (le 1er mai), all other days use cardinal numbers (le 2 juin).',
          icon: Icons.looks_one_rounded,
          audioKey: 't1w7_premier_cardinaux',
        ),
        JSS3VocabItem(
          french: 'depuis (durée continue)',
          phonetics: '[də.pɥi]',
          english: 'since / for (action still ongoing)',
          usageNote: 'J\'apprends le français depuis trois ans. — I have been learning French for 3 years.',
          icon: Icons.timelapse_rounded,
          audioKey: 't1w7_depuis',
        ),
        JSS3VocabItem(
          french: 'pendant (durée complète)',
          phonetics: '[pɑ̃.dɑ̃]',
          english: 'during / for (completed duration)',
          usageNote: 'J\'ai habité à Kaduna pendant cinq ans. — I lived in Kaduna for five years.',
          icon: Icons.hourglass_full_rounded,
          audioKey: 't1w7_pendant',
        ),
        JSS3VocabItem(
          french: 'il y a (moment dans le passé)',
          phonetics: '[il i a]',
          english: 'ago',
          usageNote: 'Le cours a commencé il y a dix minutes. — The lesson started 10 minutes ago.',
          icon: Icons.history_rounded,
          audioKey: 't1w7_il_y_a',
        ),
        JSS3VocabItem(
          french: 'dans (moment dans le futur)',
          phonetics: '[dɑ̃]',
          english: 'in (future timeframe)',
          usageNote: 'L\'examen du BECE aura lieu dans deux mois. — The BECE exam will take place in two months.',
          icon: Icons.update_rounded,
          audioKey: 't1w7_dans_futur',
        ),
        JSS3VocabItem(
          french: 'le siècle / la décennie',
          phonetics: '[lə sjɛkl] / [la de.se.ni]',
          english: 'century / decade',
          usageNote: 'Nous vivons au vingt-et-unième (21e) siècle.',
          icon: Icons.auto_stories_rounded,
          audioKey: 't1w7_siecle_decennie',
        ),
        JSS3VocabItem(
          french: 'l\'indépendance',
          phonetics: '[lɛ̃.de.pɑ̃.dɑ̃s]',
          english: 'independence',
          usageNote: 'Le Nigeria a obtenu son indépendance le premier octobre 1960.',
          icon: Icons.flag_rounded,
          audioKey: 't1w7_independance',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Comment dit-on "October 1st, 1960" en français ?',
          options: ['Le un octobre 1960', 'Le premier octobre 1960', 'Le premier de octobre 1960', 'L\'octobre un 1960'],
          correctOptionIndex: 1,
          explanation: 'In French, the first day of the month is always "le premier": "Le premier octobre 1960".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Complétez : "J\'étudie dans cette école ___ trois ans (et j\'y suis encore)."',
          options: ['il y a', 'pendant', 'depuis', 'dans'],
          correctOptionIndex: 2,
          explanation: '"DEPUIS" is used with the present tense for an action that started in the past and is still continuing.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Traduisez : "The bell rang five minutes ago."',
          options: [
            'La cloche a sonné depuis cinq minutes.',
            'La cloche a sonné il y a cinq minutes.',
            'La cloche a sonné pendant cinq minutes.',
            'La cloche a sonné dans cinq minutes.',
          ],
          correctOptionIndex: 1,
          explanation: '"IL Y A + durée" expresses elapsed time in the past (ago): "il y a cinq minutes".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quelle préposition exprime un délai dans le futur ("in two weeks") ?',
          options: ['pendant', 'depuis', 'il y a', 'dans'],
          correctOptionIndex: 3,
          explanation: '"DANS + durée" expresses a future point in time: "dans deux semaines" (in two weeks).',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Explique la différence d\'emploi entre DEPUIS, PENDANT, et IL Y A avec des exemples clairs.',
          answer: '1. DEPUIS + présent : action continue ("J\'habite ici depuis 2 ans"). 2. PENDANT + passé : durée terminée ("J\'ai dormi pendant 8 heures"). 3. IL Y A + durée : moment passé / ago ("Le train est parti il y a 10 minutes").',
          hint: 'Ongoing (depuis) vs Completed duration (pendant) vs Time ago (il y a).',
        ),
        JSS3EvaluationQuestion(
          question: 'Écris en toutes lettres la date de l\'indépendance du Nigeria.',
          answer: '"Le premier octobre mil neuf cent soixante" (ou mille neuf cent soixante).',
          hint: '1st = premier; October = octobre; 1960 = mil neuf cent soixante.',
        ),
        JSS3EvaluationQuestion(
          question: 'Traduis : "We will write our French BECE examination in six months."',
          answer: '"Nous passerons notre examen de français du BECE dans six mois."',
          hint: 'Use "dans six mois" for future duration.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Frise chronologique personnelle',
          instruction: 'Create a personal timeline with 5 key dates of your life (birth, starting primary school, entering JSS1, JSS3, future goals). Write a sentence for each using dates and temporal prepositions.',
          exampleResponse: '1. Je suis né(e) le 15 mai 2012. 2. En 2018, j\'ai commencé l\'école primaire. 3. Il y a deux ans, je suis entré(e) en JSS 1. 4. J\'étudie en JSS 3 depuis septembre. 5. Dans six mois, je passerai mon examen du BECE.',
        ),
        JSS3AssignmentTask(
          category: 'Exercice de grammaire temporelle',
          instruction: 'Fill in the blanks with depuis, pendant, il y a, or dans in 4 self-created sentences.',
          exampleResponse: '1. Je vis à Abuja DEPUIS 2020. 2. J\'ai lu ce livre PENDANT le week-end. 3. Le bus est parti IL Y A cinq minutes. 4. Les vacances commenceront DANS trois semaines.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Temporal Prepositions: Depuis, Pendant, Il y a, Dans',
        explanation:
            'Mastering temporal markers is one of the highest-yield topics in the Junior WAEC / BECE French examination:\n\n1. DEPUIS (since / for):\n• Used with the PRESENT tense for actions that began in the past and continue in the present.\n• "J\'apprends le français depuis 3 ans." (I have been learning French for 3 years.)\n\n2. PENDANT (during / for a complete duration):\n• Used with PAST or FUTURE tenses for an action with a defined start and finish.\n• "J\'ai voyagé pendant deux semaines." (I travelled for two weeks.)\n\n3. IL Y A (ago):\n• Used with the PAST tense to indicate how long ago an event took place.\n• "Il est arrivé il y a une heure." (He arrived an hour ago.)\n\n4. DANS (in + timeframe):\n• Used with the FUTURE tense to indicate when an event will occur.\n• "Le cours finira dans dix minutes." (The class will end in 10 minutes.)',
        examples: [
          'Depuis quand étudiez-vous ? — Depuis huit heures du matin.',
          'Pendant les grandes vacances, nous avons visité nos grands-parents.',
          'Il y a trois jours, nous avons écrit un devoir surveillé.',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 8 — Unité 8: Raconter sa journée
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 8,
      termNumber: 1,
      theme: 'Unité 8',
      frenchTitle: 'Raconter sa journée : récit chronologique',
      englishSubtitle: 'Chronological Daily Narrative & Transitional Connectors',
      teacherFacilitatorPrompt:
          'Guide pupils to tell a continuous, engaging story of a complete day (morning to night) combining actions and feelings. Introduce chronological discourse connectors (d\'abord, ensuite, puis, soudain, pendant ce temps, par conséquent, enfin). Practice live guided composition on the Smartboard Narrative Teleprompter.',
      objectives: [
        'Structure a chronological narrative of a full day from morning to evening.',
        'Use transition discourse connectors (d\'abord, ensuite, puis, soudain, enfin).',
        'Combine Present narration with Past tense recollection seamlessly.',
        'Draft a coherent 8–10 sentence guided composition for the BECE written exam.',
      ],
      culturalInsight:
          'Structured essay writing (l\'expression écrite guidée) is a compulsory component of the BECE / Junior WAEC French examination. Pupils are often given prompts like "Racontez votre première journée au collège" or "Racontez une journée mémorable". Examiners look for correct sequencing connectors, tense consistency, and rich vocabulary.',
      patternType: JSS3PatternType.dayChronologicalNarrativeStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'd\'abord / tout d\'abord',
          phonetics: '[da.bɔʁ] / [tu da.bɔʁ]',
          english: 'first of all / firstly',
          usageNote: 'D\'abord, le soleil s\'est levé et nous avons commencé le voyage.',
          icon: Icons.looks_one_rounded,
          audioKey: 't1w8_dabord_tout_dabord',
        ),
        JSS3VocabItem(
          french: 'ensuite / puis',
          phonetics: '[ɑ̃.sɥit] / [pɥi]',
          english: 'then / next / afterwards',
          usageNote: 'Ensuite, nous avons pris notre petit-déjeuner ensemble.',
          icon: Icons.arrow_forward_rounded,
          audioKey: 't1w8_ensuite_puis',
        ),
        JSS3VocabItem(
          french: 'soudain / tout à coup',
          phonetics: '[su.dɛ̃] / [tu.t‿a ku]',
          english: 'suddenly / all of a sudden',
          usageNote: 'Soudain, une forte pluie tropicale a commencé à tomber.',
          icon: Icons.bolt_rounded,
          audioKey: 't1w8_soudain_tout_a_coup',
        ),
        JSS3VocabItem(
          french: 'pendant ce temps / en même temps',
          phonetics: '[pɑ̃.dɑ̃ sə tɑ̃] / [ɑ̃ mɛm tɑ̃]',
          english: 'meanwhile / at the same time',
          usageNote: 'Pendant ce temps, les élèves préparaient la salle de fête.',
          icon: Icons.sync_alt_rounded,
          audioKey: 't1w8_pendant_ce_temps',
        ),
        JSS3VocabItem(
          french: 'par conséquent / c\'est pourquoi',
          phonetics: '[paʁ kɔ̃.se.kɑ̃] / [sɛ puʁ.kwa]',
          english: 'consequently / that is why',
          usageNote: 'La route était bloquée, par conséquent nous sommes arrivés en retard.',
          icon: Icons.alt_route_rounded,
          audioKey: 't1w8_par_consequent',
        ),
        JSS3VocabItem(
          french: 'enfin / finalement',
          phonetics: '[ɑ̃.fɛ̃] / [fi.nal.mɑ̃]',
          english: 'finally / at last',
          usageNote: 'Enfin, le directeur a annoncé les résultats du concours.',
          icon: Icons.flag_circle_rounded,
          audioKey: 't1w8_enfin_finalement',
        ),
        JSS3VocabItem(
          french: 'une journée mouvementée / chargée',
          phonetics: '[yn ʒuʁ.ne muv.mɑ̃.te] / [ʃaʁ.ʒe]',
          english: 'an eventful / busy day',
          usageNote: 'Quelle journée mouvementée et pleine de surprises !',
          icon: Icons.local_activity_rounded,
          audioKey: 't1w8_journee_mouvementee',
        ),
        JSS3VocabItem(
          french: 'se terminer / s\'achever',
          phonetics: '[sə tɛʁ.mi.ne] / [sa.ʃə.ve]',
          english: 'to come to an end / finish',
          usageNote: 'La journée s\'est terminée par un beau feu de joie.',
          icon: Icons.nightlight_rounded,
          audioKey: 't1w8_terminer_achever',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Quel connecteur logique utilise-t-on pour introduire la TOUTE PREMIÈRE étape d\'un récit ?',
          options: ['Enfin', 'D\'abord', 'Puis', 'Soudain'],
          correctOptionIndex: 1,
          explanation: '"D\'abord" (or "Tout d\'abord") is used to introduce the first event in a chronological sequence.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quel mot exprime un événement inattendu et surprenant dans une histoire ?',
          options: ['D\'habitude', 'Soudain / Tout à coup', 'Chaque jour', 'Depuis'],
          correctOptionIndex: 1,
          explanation: '"Soudain" or "Tout à coup" expresses suddenness or an unexpected event.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Complétez : "Il a beaucoup plu, ___ le match de football a été reporté."',
          options: ['par conséquent', 'd\'abord', 'pendant que', 'depuis'],
          correctOptionIndex: 0,
          explanation: '"Par conséquent" expresses the logical consequence or result of a situation.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quel connecteur conclut un récit chronologique ?',
          options: ['D\'abord', 'Ensuite', 'Enfin / Finalement', 'Pendant ce temps'],
          correctOptionIndex: 2,
          explanation: '"Enfin" or "Finalement" marks the conclusion of a story or timeline.',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Ordonne ces connecteurs pour raconter une histoire dans l\'ordre chronologique : enfin, soudain, ensuite, d\'abord.',
          answer: '1. D\'abord ➔ 2. Ensuite ➔ 3. Soudain ➔ 4. Enfin.',
          hint: 'First -> Next -> Suddenly -> Finally.',
        ),
        JSS3EvaluationQuestion(
          question: 'Écris un court paragraphe (4 phrases) racontant ta journée d\'hier avec des connecteurs.',
          answer: 'Exemple : "Hier matin, je me suis d\'abord réveillé à 6h00. Ensuite, je suis allé à l\'école et j\'ai assisté à tous mes cours. L\'après-midi, j\'ai joué au basket avec mes amis. Enfin, je suis rentré à la maison pour réviser et dîner en famille."',
          hint: 'Use D\'abord, Ensuite, Puis, Enfin with past verbs.',
        ),
        JSS3EvaluationQuestion(
          question: 'Pourquoi les connecteurs logiques sont-ils essentiels dans une rédaction du BECE ?',
          answer: 'Connectors organize the text logically, ensure smooth narrative flow, demonstrate linguistic maturity to examiners, and earn higher marks in the essay section.',
          hint: 'Structure, coherence, smooth transitions, and high BECE marks.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Rédaction guidée (BECE Format)',
          instruction: 'Write an essay (8–10 sentences) titled "Une journée inoubliable à l\'école". Use at least 5 transition connectors and varied past tenses (Passé Composé & Imparfait).',
          exampleResponse: 'Vendredi dernier était une journée inoubliable à notre collège. D\'abord, nous avons eu une assemblée spéciale pour célébrer la journée des langues. Ensuite, notre club de français a présenté un sketch comique devant toute l\'école. Tout à coup, le proviseur est monté sur scène pour applaudir et nous féliciter. Pendant ce temps, les spectateurs chantaient en français. Enfin, nous avons reçu des prix honorifiques. C\'était une journée formidable !',
        ),
        JSS3AssignmentTask(
          category: 'Boîte à connecteurs',
          instruction: 'Create a summary table of 6 transition words with their English translations and an example sentence for each.',
          exampleResponse: '1. D\'abord (First of all). 2. Ensuite (Next). 3. Puis (Then). 4. Soudain (Suddenly). 5. Par conséquent (Consequently). 6. Enfin (Finally).',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Chronological Discourse Connectors & Narrative Structuring',
        explanation:
            'A well-structured French narrative follows three distinct phases:\n\n1. Introduction (Le Début):\n• D\'abord / Tout d\'abord (First of all)\n• Au début (In the beginning)\n\n2. Development & Progression (Le Déroulement):\n• Ensuite / Puis (Next / Then)\n• Après cela (After that)\n• Pendant ce temps (Meanwhile)\n• Soudain / Tout à coup (Suddenly — marks a turning point, triggers Passé Composé!)\n• Par conséquent / C\'est pourquoi (Consequently / That is why)\n\n3. Conclusion (La Fin):\n• Enfin / Finalement (Finally / At last)\n• Pour terminer (To conclude)\n• À la fin de la journée (At the end of the day)',
        examples: [
          'D\'abord nous avons étudié, puis nous avons déjeuné. (First we studied, then we had lunch.)',
          'Tout à coup, les lumières se sont éteintes. (Suddenly, the lights went off.)',
          'Enfin, tout le monde est rentré joyeux. (Finally, everyone returned home joyful.)',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 9 — Grand Rallye & Bilan du 1er Trimestre
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 9,
      termNumber: 1,
      theme: 'Grand Rallye',
      frenchTitle: 'Grand Bilan & Rallye de Révision du 1er Trimestre',
      englishSubtitle: 'All-Unit Championship Rally & BECE Junior WAEC Prep Arena',
      teacherFacilitatorPrompt:
          'Congratulate pupils on completing all 8 instructional units of JSS 3 Term 1! Divide the classroom into 4 competing teams (Équipe Bleue, Équipe Verte, Équipe Or, Équipe Rouge). Launch the Smartboard Championship Arena. Track scores across rounds (Descriptions, Landscapes, Habits, Past Memories, Objects, Comparatives, Dates & Time, Daily Narrative). Award the Term 1 Championship Trophy!',
      objectives: [
        'Synthesize and master all vocabulary and grammar from Units 1 through 8.',
        'Excel in speed, accuracy, and team collaboration in BECE-style examination drills.',
        'Demonstrate oral and written mastery of descriptions, routines, past tenses, and timelines.',
        'Celebrate academic growth and readiness for Junior WAEC / BECE French examination.',
      ],
      culturalInsight:
          'Inter-house and inter-school academic competitions (Les Génies en Herbe / Les Concours Interscolaires de Français) are prestigious traditions in Francophone West Africa and Nigerian bilingual academies. They foster team spirit, celebrate multilingual achievement, and build the confidence necessary for national examination excellence.',
      patternType: JSS3PatternType.term1RevisionRally,
      vocabulary: [
        JSS3VocabItem(
          french: 'le grand rallye / le championnat',
          phonetics: '[lə ɡʁɑ̃ ʁa.li] / [lə ʃɑ̃.pjɔ.na]',
          english: 'grand rally / championship',
          usageNote: 'Bienvenue au Grand Rallye de révision du premier trimestre !',
          icon: Icons.emoji_events_rounded,
          audioKey: 't1w9_rallye_championnat',
        ),
        JSS3VocabItem(
          french: 'l\'équipe gagnante',
          phonetics: '[le.kip ɡa.ɲɑ̃t]',
          english: 'the winning team',
          usageNote: 'Quelle équipe remportera le trophée de JSS 3 ?',
          icon: Icons.military_tech_rounded,
          audioKey: 't1w9_equipe_gagnante',
        ),
        JSS3VocabItem(
          french: 'le buzzer / répondre rapidement',
          phonetics: '[lə bœ.zœʁ] / [ʁe.pɔ̃dʁ ʁa.pid.mɑ̃]',
          english: 'the buzzer / to answer rapidly',
          usageNote: 'Appuyez sur le buzzer pour donner votre réponse.',
          icon: Icons.touch_app_rounded,
          audioKey: 't1w9_buzzer_repondre',
        ),
        JSS3VocabItem(
          french: 'le score / le tableau d\'honneur',
          phonetics: '[lə skɔʁ] / [lə ta.blo dɔ.nœʁ]',
          english: 'the score / honour board',
          usageNote: 'L\'équipe Bleue prend la tête avec vingt-cinq points !',
          icon: Icons.scoreboard_rounded,
          audioKey: 't1w9_score_honneur',
        ),
        JSS3VocabItem(
          french: 'la révision générale',
          phonetics: '[la ʁe.vi.zjɔ̃ ʒe.ne.ʁal]',
          english: 'general review / consolidation',
          usageNote: 'Cette révision prépare directement aux épreuves du BECE.',
          icon: Icons.menu_book_rounded,
          audioKey: 't1w9_revision_generale',
        ),
        JSS3VocabItem(
          french: 'bonne chance à tous !',
          phonetics: '[bɔn ʃɑ̃s a tus]',
          english: 'good luck to all!',
          usageNote: 'Bonne chance à toutes les équipes pour la finale !',
          icon: Icons.thumb_up_rounded,
          audioKey: 't1w9_bonne_chance',
        ),
        JSS3VocabItem(
          french: 'félicitations / bravo !',
          phonetics: '[fe.li.si.ta.sjɔ̃] / [bʁa.vo]',
          english: 'congratulations / well done!',
          usageNote: 'Félicitations pour votre travail exceptionnel ce trimestre !',
          icon: Icons.celebration_rounded,
          audioKey: 't1w9_felicitations_bravo',
        ),
        JSS3VocabItem(
          french: 'le trophée du trimestre',
          phonetics: '[lə tʁɔ.fe dy tʁi.mɛstʁ]',
          english: 'the term trophy',
          usageNote: 'Le trophée d\'or est décerné aux champions de JSS 3.',
          icon: Icons.workspace_premium_rounded,
          audioKey: 't1w9_trophee_trimestre',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'UNIT 1 RECALL — Où place-t-on l\'adjectif "BEAU" par rapport au nom ?',
          options: ['Toujours après le nom', 'Avant le nom (règle BANGS)', 'Au milieu du nom', 'À la fin de la phrase'],
          correctOptionIndex: 1,
          explanation: 'Beauty adjectives (beau, joli) go BEFORE the noun according to the BANGS rule.',
        ),
        JSS3InteractiveExercise(
          prompt: 'UNIT 4 RECALL — Choisissez la bonne phrase au passé composé :',
          options: ['Hier, nous sommes allés au musée.', 'Hier, nous avons allé au musée.', 'Hier, nous allons au musée.', 'Hier, nous étions allé au musée.'],
          correctOptionIndex: 0,
          explanation: '"Aller" takes ÊTRE with subject agreement: "nous sommes allés".',
        ),
        JSS3InteractiveExercise(
          prompt: 'UNIT 6 RECALL — Complétez : "Cette école est ___ meilleure de la région."',
          options: ['la', 'le', 'plus', 'aussi'],
          correctOptionIndex: 0,
          explanation: '"École" is feminine singular: "la meilleure école".',
        ),
        JSS3InteractiveExercise(
          prompt: 'UNIT 7 RECALL — "J\'apprends le français ___ deux ans et je continue."',
          options: ['pendant', 'il y a', 'depuis', 'dans'],
          correctOptionIndex: 2,
          explanation: 'For an ongoing action starting in the past and continuing now, use "DEPUIS".',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'GRAND BILAN T1 — Cite les 8 thèmes majeurs appris pendant ce premier trimestre de JSS 3.',
          answer: '1. Description des personnes (BANGS) 2. Paysages & tourisme (Nigeria & Francophonie) 3. Habitudes & verbes pronominaux 4. Souvenirs & Passé Composé vs Imparfait 5. Description d\'objets & matières (EN) 6. Comparatifs & superlatifs 7. Dates, temps & prépositions (depuis/pendant/il y a/dans) 8. Récit chronologique de la journée.',
          hint: 'Recap the 8 unit themes of Term 1.',
        ),
        JSS3EvaluationQuestion(
          question: 'Écris 2 phrases combinant : un comparatif + un marqueur temporel.',
          answer: 'Exemple : "Depuis l\'année dernière, je suis plus rapide en calcul." / "Il y a trois ans, mon école était moins grande qu\'aujourd\'hui."',
          hint: 'Use (depuis / il y a / pendant) + (plus... que / meilleur que).',
        ),
        JSS3EvaluationQuestion(
          question: 'Quel est ton message de motivation pour la classe avant les examens ?',
          answer: '"Avec du travail régulier, de la discipline et de la passion pour la langue française, nous allons tous exceller au BECE ! Félicitations et bonne continuation !"',
          hint: 'Encouraging message in French.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Bilan de fin de trimestre',
          instruction: 'Create a comprehensive Term 1 Revision Summary Sheet in your notebook organizing key grammar formulas (BANGS, Passé Composé with Être, Prepositions EN, Comparatives, Depuis/Pendant/Il y a).',
          exampleResponse: 'Student notebook sheet summarizing all 8 units with rules and 2 examples per rule.',
        ),
        JSS3AssignmentTask(
          category: 'Autotest BECE',
          instruction: 'Write out 5 multiple-choice questions with answers testing your study partner on Term 1 topics.',
          exampleResponse: '5 peer-assessment questions testing vocabulary, grammar, and cultural facts from Term 1.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'JSS 3 French Term 1 — The 8 Core Pillars of Grammar',
        explanation: 'The 8 foundational grammar and communicative pillars mastered throughout Term 1 in preparation for Junior WAEC / BECE:',
        examples: [
          '1. BANGS Adjective Placement: Beauty, Age, Goodness, Size BEFORE the noun.',
          '2. Geographic Adjective Agreements & "Visiter" (places) vs "Rendre visite à" (people).',
          '3. Pronominal Reflexive Verbs: me, te, se, nous, vous, se + Present Tense.',
          '4. Passé Composé (Avoir / Être + DR & MRS VANDERTRAMP) vs Imparfait.',
          '5. Material Preposition EN (en bois, en cuir) & Utility (servir à + inf).',
          '6. Comparatives (plus/moins/aussi... que) & Irregular "bon ➔ meilleur".',
          '7. Temporal Prepositions: DEPUIS (present/ongoing), PENDANT (completed), IL Y A (ago), DANS (future).',
          '8. Chronological Discourse Connectors: D\'abord ➔ Ensuite ➔ Soudain ➔ Enfin.',
        ],
      ),
    ),
  ];
}
