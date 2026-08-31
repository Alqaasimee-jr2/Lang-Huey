import 'package:flutter/material.dart';
import '../models/jss1_lesson_model.dart';

class JSS1Term2Lessons {
  static const List<JSS1Lesson> weeks = [
    // ==========================================
    // WEEK 1: EXPRIMER LES PROPRIÉTÉS DES OBJETS
    // ==========================================
    JSS1Lesson(
      term: 2,
      week: 1,
      topic: 'Exprimer les Propriétés des Objets',
      subtitle: 'Describing objects by size, color, geometric shape, texture, and weight with adjective agreement.',
      patternType: JSS1PatternType.objectPropertiesStudio,
      objectives: [
        'Identify and describe common classroom and household objects using French adjectives.',
        'Qualify objects by dimension (grand/petit, long/court) and geometric shape (rond, carré, rectangulaire).',
        'Express colors and physical textures (dur, doux, lisse, lourd, léger).',
        'Apply gender and number agreement rules to descriptive adjectives in French.',
      ],
      culturalInsight:
          'In francophone markets across West Africa (Cotonou, Lomé, Dakar), buyers and sellers vividly describe artisan goods using precise adjectives of weight, texture, and color before agreeing on a deal.',
      vocabItems: [
        JSS1VocabItem(
          french: 'Grand / Grande',
          phonetics: 'grahn / grahnd',
          english: 'Big / Tall / Large',
          usageNote: 'Describing large objects or stature (e.g., Un grand livre).',
          icon: Icons.aspect_ratio_rounded,
          audioKey: 'grand_grande',
        ),
        JSS1VocabItem(
          french: 'Petit / Petite',
          phonetics: 'puh-tee / puh-teet',
          english: 'Small / Short / Little',
          usageNote: 'Used for compact objects (e.g., Une petite boîte).',
          icon: Icons.filter_center_focus_rounded,
          audioKey: 'petit_petite',
        ),
        JSS1VocabItem(
          french: 'Rond / Ronde',
          phonetics: 'rohn / rohnd',
          english: 'Round / Circular',
          usageNote: 'Geometric shape adjective (e.g., Un ballon rond).',
          icon: Icons.circle_outlined,
          audioKey: 'rond_ronde',
        ),
        JSS1VocabItem(
          french: 'Carré / Carrée',
          phonetics: 'kah-ray',
          english: 'Square',
          usageNote: 'Geometric shape for boxes or tables (e.g., Une table carrée).',
          icon: Icons.crop_square_rounded,
          audioKey: 'carre_carree',
        ),
        JSS1VocabItem(
          french: 'Lourd / Lourde',
          phonetics: 'loor / loord',
          english: 'Heavy',
          usageNote: 'Physical weight attribute (e.g., Un sac lourd).',
          icon: Icons.fitness_center_rounded,
          audioKey: 'lourd_lourde',
        ),
        JSS1VocabItem(
          french: 'Léger / Légère',
          phonetics: 'lay-zhay / lay-zhair',
          english: 'Light (in weight)',
          usageNote: 'Opposite of lourd (e.g., Une plume légère).',
          icon: Icons.air_rounded,
          audioKey: 'leger_legere',
        ),
        JSS1VocabItem(
          french: 'Dur / Dure',
          phonetics: 'door',
          english: 'Hard / Solid',
          usageNote: 'Surface texture or resistance (e.g., Une pierre dure).',
          icon: Icons.shield_rounded,
          audioKey: 'dur_dure',
        ),
        JSS1VocabItem(
          french: 'Doux / Douce',
          phonetics: 'doo / doos',
          english: 'Soft / Smooth',
          usageNote: 'Pleasant texture (e.g., Un tissu doux, une couverture douce).',
          icon: Icons.texture_rounded,
          audioKey: 'doux_douce',
        ),
        JSS1VocabItem(
          french: 'De quelle couleur est cet objet ?',
          phonetics: 'duh kel koo-luhr ay set ob-zhay',
          english: 'What color is this object?',
          usageNote: 'Key question asked to inquire about the visual appearance of an item.',
          icon: Icons.palette_rounded,
          audioKey: 'de_quelle_couleur_est_cet_objet',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'Comment dit-on "A heavy bag" en français ?',
          options: ['Un sac léger', 'Un sac lourd', 'Un sac rond', 'Un sac carré'],
          correctOptionIndex: 1,
          explanation: '"Sac" is masculine, and "lourd" means heavy in the masculine singular.',
        ),
        JSS1InteractiveExercise(
          prompt: 'Quelle est la forme féminine de l\'adjectif "doux" (soft) ?',
          options: ['Douxe', 'Douce', 'Dourette', 'Dous'],
          correctOptionIndex: 1,
          explanation: 'The irregular feminine form of "doux" is "douce" (e.g. une voix douce).',
        ),
        JSS1InteractiveExercise(
          prompt: 'Pour décrire une table de forme carrée, on dit :',
          options: ['Une table ronde', 'Une table carrée', 'Une table lourde', 'Une table petite'],
          correctOptionIndex: 1,
          explanation: '"Table" is feminine, so the adjective adds an "e": "carrée".',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "This box is light" en français ?',
          answer: 'Cette boîte est légère.',
          hint: 'Boîte is feminine, so use légère.',
        ),
        JSS1EvaluationQuestion(
          question: 'Quel est le contraire de "dur" ?',
          answer: 'Doux (masculin) ou Douce (féminin).',
          hint: 'Means soft or gentle in French.',
        ),
        JSS1EvaluationQuestion(
          question: 'Traduisez : "Le ballon est rond et rouge."',
          answer: 'The ball is round and red.',
          hint: 'Ballon = ball, rond = round, rouge = red.',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Devoir Écrit',
          instruction: 'Pick 4 items in your school bag and write 4 complete sentences describing their size, shape, and color.',
          exampleResponse: '1. Mon stylo est long et bleu.\n2. Ma règle est plate et transparente.\n3. Mon cahier est grand et rectangulaire.',
        ),
        JSS1AssignmentTask(
          category: 'Pratique Orale',
          instruction: 'Describe an object in the classroom to a partner and let them guess what it is.',
          exampleResponse: 'Say: "C\'est un objet rond, lourd et noir." (Le ballon de basket).',
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: 'L\'Accord des Adjectifs Qualificatifs',
        rule: 'In French, adjectives agree in gender (masculine/feminine) and number (singular/plural) with the noun they modify. Most adjectives add "-e" in the feminine, while color and shape adjectives generally follow the noun.',
        examples: [
          'Un livre lourd ➔ Une valise lourde (Masculin vs Féminin)',
          'Un cahier carré ➔ Une table carrée (Ajout du "-e")',
          'Un tissu doux ➔ Une éponge douce (Féminin irrégulier)',
          'Des crayons légers ➔ Des boîtes légères (Pluriel avec "-s")',
        ],
      ),
    ),

    // ==========================================
    // WEEK 2: DEMANDER QUELQUE CHOSE À QUELQU’UN
    // ==========================================
    JSS1Lesson(
      term: 2,
      week: 2,
      topic: 'Demander Quelque Chose à Quelqu’un',
      subtitle: 'Making polite requests, borrowing items, and asking to see someone in formal and informal registers.',
      patternType: JSS1PatternType.politeRequestsStudio,
      objectives: [
        'Formulate polite requests using "Je voudrais..." and "S\'il vous plaît / S\'il te plaît".',
        'Borrow classroom stationery and materials from peers politely (Peux-tu me prêter... ?).',
        'Ask to see an official, teacher, or principal at a school reception or office.',
        'Distinguish formal polite address (Vouvoiement) from peer requests (Tutoiement).',
      ],
      culturalInsight:
          'In Francophone administrative and school environments, jumping straight into a request without first greeting and using "S\'il vous plaît" or "Je voudrais..." is considered impolite. Politeness opens all doors!',
      vocabItems: [
        JSS1VocabItem(
          french: 'S\'il vous plaît',
          phonetics: 'seel voo play',
          english: 'Please (Formal / Plural)',
          usageNote: 'Used when addressing teachers, elders, officials, or groups.',
          icon: Icons.handshake_rounded,
          audioKey: 'sil_vous_plait',
        ),
        JSS1VocabItem(
          french: 'S\'il te plaît',
          phonetics: 'seel tuh play',
          english: 'Please (Informal / Peer)',
          usageNote: 'Used when talking to a classmate or friend of the same age.',
          icon: Icons.people_alt_rounded,
          audioKey: 'sil_te_plait',
        ),
        JSS1VocabItem(
          french: 'Je voudrais...',
          phonetics: 'zhuh voo-dray',
          english: 'I would like... (Polite conditional)',
          usageNote: 'The most courteous way to state a desire or request in French.',
          icon: Icons.volunteer_activism_rounded,
          audioKey: 'je_voudrais',
        ),
        JSS1VocabItem(
          french: 'Peux-tu me prêter ton stylo ?',
          phonetics: 'puh-too muh pray-tay tohn stee-loh',
          english: 'Can you lend me your pen?',
          usageNote: 'Informal request to borrow stationery from a classmate.',
          icon: Icons.edit_rounded,
          audioKey: 'peux_tu_me_preter_ton_stylo',
        ),
        JSS1VocabItem(
          french: 'Prête-moi ta règle, s\'il te plaît',
          phonetics: 'pret-mwah tah rehgl seel tuh play',
          english: 'Lend me your ruler, please',
          usageNote: 'Imperative polite request between classmates.',
          icon: Icons.straighten_rounded,
          audioKey: 'prete_moi_ta_regle',
        ),
        JSS1VocabItem(
          french: 'Puis-je voir le Principal ?',
          phonetics: 'pwee-zhuh vwar luh pran-see-pal',
          english: 'May I see the Principal / Headmaster?',
          usageNote: 'Formal polite inquiry at the school administrative desk.',
          icon: Icons.badge_rounded,
          audioKey: 'puis_je_voir_le_principal',
        ),
        JSS1VocabItem(
          french: 'Est-ce que Madame Dupont est là ?',
          phonetics: 'es-kuh mah-dahm doo-pohn ay lah',
          english: 'Is Mrs. Dupont there / available?',
          usageNote: 'Polite inquiry asking for someone\'s physical presence.',
          icon: Icons.contact_page_rounded,
          audioKey: 'est_ce_que_madame_dupont_est_la',
        ),
        JSS1VocabItem(
          french: 'Voici pour toi / Tenez',
          phonetics: 'vwah-see poor twah / tuh-nay',
          english: 'Here you go (informal) / Here you are (formal)',
          usageNote: 'Said when handing an item over to someone who asked for it.',
          icon: Icons.pan_tool_rounded,
          audioKey: 'voici_pour_toi_tenez',
        ),
        JSS1VocabItem(
          french: 'Merci beaucoup ! - De rien',
          phonetics: 'mair-see boh-koo - duh ree-an',
          english: 'Thank you very much! - You are welcome',
          usageNote: 'Universal gratitude exchange after a request is fulfilled.',
          icon: Icons.thumb_up_alt_rounded,
          audioKey: 'merci_beaucoup_de_rien',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'What is the most polite French expression to begin a request?',
          options: ['Je veux !', 'Donne-moi tout de suite !', 'Je voudrais...', 'Écoute-moi !'],
          correctOptionIndex: 2,
          explanation: '"Je voudrais..." (I would like...) expresses politeness through the conditional mood.',
        ),
        JSS1InteractiveExercise(
          prompt: 'How do you politely ask to see the school principal at the reception desk?',
          options: [
            'Où est le Principal ?',
            'Puis-je voir le Principal, s\'il vous plaît ?',
            'Levez-vous, Principal !',
            'Prête-moi le Principal !'
          ],
          correctOptionIndex: 1,
          explanation: '"Puis-je voir... s\'il vous plaît ?" is the standard polite formula for meeting an authority.',
        ),
        JSS1InteractiveExercise(
          prompt: 'When lending a pencil to your friend, what do you say as you hand it over?',
          options: ['Voici pour toi !', 'Puis-je sortir ?', 'Au revoir !', 'Silence !'],
          correctOptionIndex: 0,
          explanation: '"Voici pour toi !" translates to "Here you go / This is for you!".',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "Can you lend me your eraser?" en français ?',
          answer: 'Peux-tu me prêter ta gomme, s\'il te plaît ?',
          hint: 'Eraser is "la gomme" (feminine).',
        ),
        JSS1EvaluationQuestion(
          question: 'Quelle est la différence d\'utilisation entre "S\'il te plaît" et "S\'il vous plaît" ?',
          answer: '"S\'il te plaît" s\'utilise avec un ami ou un égal, "S\'il vous plaît" s\'utilise avec un adulte ou par politesse.',
          hint: 'Informal singular (te) vs Formal/plural (vous).',
        ),
        JSS1EvaluationQuestion(
          question: 'Comment formule-t-on la demande : "May I see the French teacher?"',
          answer: 'Puis-je voir le professeur de français, s\'il vous plaît ?',
          hint: 'Teacher = le professeur.',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Devoir Écrit',
          instruction: 'Write a short 4-line dialogue between two students borrowing a textbook and a ruler during class.',
          exampleResponse: 'Paul: S\'il te plaît Amina, peux-tu me prêter ton livre ?\nAmina: Oui, voici pour toi !\nPaul: Merci beaucoup !\nAmina: De rien Paul !',
        ),
        JSS1AssignmentTask(
          category: 'Jeu de Rôle',
          instruction: 'Practice asking to see the school principal at the administrative reception desk with your partner.',
          exampleResponse: 'Roleplay entering the office: "Bonjour Madame, puis-je voir Monsieur le Principal, s\'il vous plaît ?"',
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: 'Le Conditionnel de Politesse (Vouloir & Pouvoir)',
        rule: 'To make polite requests instead of harsh commands, French uses the conditional forms "Je voudrais..." (I would like...) and inverted question "Puis-je... ?" (May I...?).',
        examples: [
          'Je veux un stylo ➔ Je voudrais un stylo, s\'il vous plaît (Forme polie)',
          'Peux-tu me prêter ta règle ? (Tutoiement amical)',
          'Pouvez-vous m\'aider, s\'il vous plaît ? (Vouvoiement formel)',
          'Puis-je voir la directrice ? (Demande administrative formelle)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 3: DÉCRIRE LES PROFESSIONS
    // ==========================================
    JSS1Lesson(
      term: 2,
      week: 3,
      topic: 'Décrire les Professions et Métiers',
      subtitle: 'Naming common jobs, stating professional duties, and applying masculine/feminine career titles.',
      patternType: JSS1PatternType.professionsStudio,
      objectives: [
        'Identify and name major professions in French (médecin, enseignant, ingénieur, avocat, infirmier, commerçant).',
        'Describe the daily duties and workplaces associated with various careers in simple French sentences.',
        'Form the feminine equivalents of masculine job titles accurately (enseignant/e, infirmier/ière, avocat/e).',
        'State what one wants to become in the future (Quand je serai grand(e), je veux être...).',
      ],
      culturalInsight:
          'In Nigeria and across West Africa, modern youth aspire to diverse professions in medicine, engineering, technology, law, education, and entrepreneurship. In French, professional titles carry great community prestige.',
      vocabItems: [
        JSS1VocabItem(
          french: 'Le médecin',
          phonetics: 'luh mayd-san',
          english: 'The doctor (Physician)',
          usageNote: 'Healthcare professional who examines and treats patients (Il soigne les malades).',
          icon: Icons.medical_services_rounded,
          audioKey: 'le_medecin',
        ),
        JSS1VocabItem(
          french: 'L\'enseignant / L\'enseignante',
          phonetics: 'lahn-say-nyahn / lahn-say-nyahnt',
          english: 'The teacher',
          usageNote: 'Educator who teaches students in a school (Il/Elle enseigne aux élèves).',
          icon: Icons.school_rounded,
          audioKey: 'l_enseignant_l_enseignante',
        ),
        JSS1VocabItem(
          french: 'L\'ingénieur / L\'ingénieure',
          phonetics: 'lan-zhay-nyuhr',
          english: 'The engineer',
          usageNote: 'Professional who designs and builds infrastructure (Il construit des ponts et des routes).',
          icon: Icons.engineering_rounded,
          audioKey: 'l_ingenieur_l_ingenieure',
        ),
        JSS1VocabItem(
          french: 'L\'avocat / L\'avocate',
          phonetics: 'lah-voh-kah / lah-voh-kaht',
          english: 'The lawyer / Attorney',
          usageNote: 'Legal professional who defends clients and the law (Il/Elle défend la loi et la justice).',
          icon: Icons.gavel_rounded,
          audioKey: 'l_avocat_l_avocate',
        ),
        JSS1VocabItem(
          french: 'L\'infirmier / L\'infirmière',
          phonetics: 'lan-feer-myay / lan-feer-myair',
          english: 'The nurse',
          usageNote: 'Healthcare specialist who cares for patients in the hospital (Il/Elle aide le médecin).',
          icon: Icons.healing_rounded,
          audioKey: 'l_infirmier_l_infirmiere',
        ),
        JSS1VocabItem(
          french: 'Le commerçant / La commerçante',
          phonetics: 'luh koh-mair-sahn / lah koh-mair-sahnt',
          english: 'The merchant / Trader',
          usageNote: 'Businessperson who sells goods in a shop or market (Il/Elle vend des marchandises).',
          icon: Icons.storefront_rounded,
          audioKey: 'le_commercant_la_commercante',
        ),
        JSS1VocabItem(
          french: 'Il soigne les malades',
          phonetics: 'eel swahn lay mah-lahd',
          english: 'He treats / heals the sick',
          usageNote: 'Action verb phrase describing a doctor\'s core duty.',
          icon: Icons.local_hospital_rounded,
          audioKey: 'il_soigne_les_malades',
        ),
        JSS1VocabItem(
          french: 'Elle enseigne aux élèves',
          phonetics: 'el ahn-sayny ohz ay-lehv',
          english: 'She teaches students',
          usageNote: 'Action verb phrase describing an educator\'s duty.',
          icon: Icons.cast_for_education_rounded,
          audioKey: 'elle_enseigne_aux_eleves',
        ),
        JSS1VocabItem(
          french: 'Que fait-il dans la vie ?',
          phonetics: 'kuh fay-teel dahn lah vee',
          english: 'What does he do for a living?',
          usageNote: 'Standard French question used to ask about someone\'s profession.',
          icon: Icons.work_outline_rounded,
          audioKey: 'que_fait_il_dans_la_vie',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'Quelle profession correspond à la phrase : "Il soigne les malades à l\'hôpital" ?',
          options: ['L\'avocat', 'Le commerçant', 'Le médecin', 'L\'enseignant'],
          correctOptionIndex: 2,
          explanation: '"Le médecin" (the doctor) is the healthcare professional who heals the sick.',
        ),
        JSS1InteractiveExercise(
          prompt: 'Quel est le féminin de "un infirmier" ?',
          options: ['Une infirmiere', 'Une infirmière', 'Une infirmie', 'Une infirmette'],
          correctOptionIndex: 1,
          explanation: 'Nouns ending in -ier change to -ière in the feminine (e.g. un infirmier ➔ une infirmière).',
        ),
        JSS1InteractiveExercise(
          prompt: 'Que fait l\'ingénieur ?',
          options: [
            'Il vend du riz au marché',
            'Il construit des maisons et des routes',
            'Il défend les coupables au tribunal',
            'Il soigne les enfants malades'
          ],
          correctOptionIndex: 1,
          explanation: '"L\'ingénieur" designs and builds buildings, bridges, and infrastructure.',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "My mother is a lawyer" en français ?',
          answer: 'Ma mère est avocate (ou avocat).',
          hint: 'Use feminine form "avocate". Note that in French we say "est avocate" without the article "une".',
        ),
        JSS1EvaluationQuestion(
          question: 'Quelle est la profession d\'une personne qui vend des produits au marché ?',
          answer: 'Le commerçant ou la commerçante.',
          hint: 'From the word "commerce" (business).',
        ),
        JSS1EvaluationQuestion(
          question: 'Traduisez : "Quand je serai grand, je veux être médecin."',
          answer: 'When I grow up, I want to be a doctor.',
          hint: 'Grand = grown up / adult, être = to be.',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Devoir Écrit',
          instruction: 'Write 4 sentences stating the professions of 4 members of your family or community and what each person does.',
          exampleResponse: '1. Mon oncle est médecin, il soigne les malades.\n2. Ma tante est enseignante, elle enseigne le français.\n3. Mon père est commerçant, il vend des tissus.',
        ),
        JSS1AssignmentTask(
          category: 'Pratique Orale',
          instruction: 'Present your future career dream to the class in 2 spoken French sentences.',
          exampleResponse: 'Say: "Bonjour ! Quand je serai grand(e), je veux être ingénieur(e) parce que j\'aime construire des ponts."',
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: 'Le Féminin des Noms de Métiers et l\'Omission de l\'Article',
        rule: 'In French, when stating someone\'s profession after the verb "être", no indefinite article (un/une) is used: "Il est médecin" (NOT "Il est un médecin"). For feminine forms: -ier ➔ -ière (infirmier ➔ infirmière), -ant ➔ -ante (enseignant ➔ enseignante), -at ➔ -ate (avocat ➔ avocate).',
        examples: [
          'Il est enseignant ➔ Elle est enseignante (Ajout de "-e")',
          'Il est infirmier ➔ Elle est infirmière (Passage à "-ière")',
          'Mon père est avocat ➔ Ma mère est avocate (Sans article "un/une")',
          'Que fais-tu dans la vie ? ➔ Je suis élève en JSS1 !',
        ],
      ),
    ),

    // ==========================================
    // WEEK 4: DEMANDER ET DONNER L’HEURE
    // ==========================================
    JSS1Lesson(
      term: 2,
      week: 4,
      topic: 'Demander et Donner l’Heure',
      subtitle: 'Asking for time, telling time on analog and digital clocks, and using fractional time expressions.',
      patternType: JSS1PatternType.clockTimeStudio,
      objectives: [
        'Ask for the time politely using "Quelle heure est-il, s\'il vous plaît ?".',
        'State exact hour time (Il est huit heures pile, il est midi, il est minuit).',
        'Use French fractional and minute modifiers (et quart, et demie, moins le quart).',
        'Differentiate 12-hour conversational time from 24-hour official school schedule time.',
      ],
      culturalInsight:
          'In Francophone West Africa, school bells ring at set hours (e.g. 7h30 for morning assembly, 13h00 for lunch). Punctuality is emphasized by teachers announcing "Soyez à l\'heure !" (Be on time!).',
      vocabItems: [
        JSS1VocabItem(
          french: 'Quelle heure est-il ?',
          phonetics: 'kel uhr ay-teel',
          english: 'What time is it?',
          usageNote: 'Universal question to ask someone for the current time.',
          icon: Icons.watch_later_rounded,
          audioKey: 'quelle_heure_est_il',
        ),
        JSS1VocabItem(
          french: 'Il est huit heures pile',
          phonetics: 'eel ay weet uhr peel',
          english: 'It is eight o\'clock sharp / exactly',
          usageNote: 'Used for precise on-the-hour time without extra minutes.',
          icon: Icons.access_time_filled_rounded,
          audioKey: 'il_est_huit_heures_pile',
        ),
        JSS1VocabItem(
          french: 'Il est huit heures et quart',
          phonetics: 'eel ay weet uhr ay kar',
          english: 'It is a quarter past eight (8:15)',
          usageNote: 'Standard way to express 15 minutes past the hour.',
          icon: Icons.schedule_rounded,
          audioKey: 'il_est_huit_heures_et_quart',
        ),
        JSS1VocabItem(
          french: 'Il est huit heures et demie',
          phonetics: 'eel ay weet uhr ay duh-mee',
          english: 'It is half past eight (8:30)',
          usageNote: 'Standard way to express 30 minutes past the hour.',
          icon: Icons.timelapse_rounded,
          audioKey: 'il_est_huit_heures_et_demie',
        ),
        JSS1VocabItem(
          french: 'Il est neuf heures moins le quart',
          phonetics: 'eel ay nuhf uhr mwan luh kar',
          english: 'It is a quarter to nine (8:45)',
          usageNote: 'Expressed as the next hour minus fifteen minutes.',
          icon: Icons.hourglass_top_rounded,
          audioKey: 'il_est_neuf_heures_moins_le_quart',
        ),
        JSS1VocabItem(
          french: 'Il est midi',
          phonetics: 'eel ay mee-dee',
          english: 'It is 12:00 PM (Midday / Noon)',
          usageNote: 'Used specifically for 12 o\'clock in the middle of the day.',
          icon: Icons.wb_sunny_rounded,
          audioKey: 'il_est_midi',
        ),
        JSS1VocabItem(
          french: 'Il est minuit',
          phonetics: 'eel ay mee-nwee',
          english: 'It is 12:00 AM (Midnight)',
          usageNote: 'Used specifically for 12 o\'clock in the middle of the night.',
          icon: Icons.bedtime_rounded,
          audioKey: 'il_est_minuit',
        ),
        JSS1VocabItem(
          french: 'À quelle heure commence le cours ?',
          phonetics: 'ah kel uhr koh-mahns luh koor',
          english: 'At what time does the lesson start?',
          usageNote: 'Question asking for the specific scheduled time of an event.',
          icon: Icons.alarm_on_rounded,
          audioKey: 'a_quelle_heure_commence_le_cours',
        ),
        JSS1VocabItem(
          french: 'Le matin / L\'après-midi / Le soir',
          phonetics: 'luh mah-tan / lah-pray mee-dee / luh swar',
          english: 'Morning / Afternoon / Evening',
          usageNote: 'Time-of-day contextual indicators (e.g., À 8h du matin, à 3h de l\'après-midi).',
          icon: Icons.wb_twilight_rounded,
          audioKey: 'le_matin_l_apres_midi_le_soir',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'Comment dit-on "8:30" en français ?',
          options: [
            'Il est huit heures et quart',
            'Il est huit heures et demie',
            'Il est neuf heures moins le quart',
            'Il est huit heures pile'
          ],
          correctOptionIndex: 1,
          explanation: '"Et demie" means half past (30 minutes past the hour).',
        ),
        JSS1InteractiveExercise(
          prompt: 'Pour dire qu\'il est 12h00 au milieu de la journée, on dit :',
          options: ['Il est minuit', 'Il est midi', 'Il est douze heures pile', 'Il est le soir'],
          correctOptionIndex: 1,
          explanation: 'In French, 12:00 PM is always stated as "Il est midi".',
        ),
        JSS1InteractiveExercise(
          prompt: 'Que signifie "Il est dix heures moins le quart" ?',
          options: ['10:15', '10:45', '9:45', '9:15'],
          correctOptionIndex: 2,
          explanation: '"Dix heures moins le quart" means 10 hours minus a quarter = 9:45.',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Quelle est la question pour demander l\'heure à un passant ?',
          answer: 'Quelle heure est-il, s\'il vous plaît ?',
          hint: 'Uses the phrase "Quelle heure...".',
        ),
        JSS1EvaluationQuestion(
          question: 'Comment exprime-t-on 7h15 en français ?',
          answer: 'Il est sept heures et quart.',
          hint: 'Quarter past = et quart.',
        ),
        JSS1EvaluationQuestion(
          question: 'Traduisez : "The class begins at 8:00 AM sharp."',
          answer: 'Le cours commence à huit heures du matin pile.',
          hint: 'Commence = begins, pile = sharp/exact.',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Devoir Écrit',
          instruction: 'Write out the time in full French words for: 6:00 AM, 7:15 AM, 12:00 PM, 3:30 PM, and 8:45 PM.',
          exampleResponse: '1. 6h00 = Il est six heures pile du matin.\n2. 7h15 = Il est sept heures et quart.\n3. 12h00 = Il est midi.\n4. 15h30 = Il est trois heures et demie de l\'après-midi.\n5. 20h45 = Il est neuf heures moins le quart du soir.',
        ),
        JSS1AssignmentTask(
          category: 'Pratique Orale',
          instruction: 'With your classmate, ask and answer 3 questions about school times (start of school, break, dismissal).',
          exampleResponse: 'Ask: "À quelle heure est la récréation ?" ➔ Reply: "À dix heures et demie !"',
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: 'La Structure de l\'Heure en Français',
        rule: 'In French, telling time always begins with the impersonal phrase "Il est...". Note that "heure(s)" is feminine and takes an "-s" from 2 hours upwards (Il est une heure vs Il est deux heures). Fractions: "+ 15 min" = et quart; "+ 30 min" = et demie; "- 15 min" = moins le quart.',
        examples: [
          'Il est une heure (Singulier, pas de "s")',
          'Il est deux heures (Pluriel avec "s")',
          'Il est cinq heures et quart (5:15)',
          'Il est six heures et demie (6:30 - Note: "demie" s\'accorde au féminin)',
          'Il est sept heures moins le quart (6:45)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 5: CE QUE L'ON FAIT À CERTAINES HEURES
    // ==========================================
    JSS1Lesson(
      term: 2,
      week: 5,
      topic: 'Activités aux Différentes Heures de la Journée',
      subtitle: 'Describing daily routines, school schedules, and linking daily actions to exact times of day.',
      patternType: JSS1PatternType.dailyScheduleStudio,
      objectives: [
        'Narrate a complete daily routine in chronological order from morning to bedtime.',
        'Link reflexive routine verbs (se réveiller, se laver, s\'habiller, se coucher) with specific times.',
        'Describe school schedule milestones (arriver à l\'école, étudier, déjeuner, rentrer à la maison).',
        'Use temporal adverbs and time markers (À six heures, puis, ensuite, plus tard).',
      ],
      culturalInsight:
          'A typical day for a Nigerian JSS1 student begins early at 5:30 or 6:00 AM to beat traffic, attend morning assembly at 7:30 AM, and finish academic classes by 2:00 PM before sports and prep.',
      vocabItems: [
        JSS1VocabItem(
          french: 'À six heures, je me réveille',
          phonetics: 'ah sees uhr zhuh muh ray-vay',
          english: 'At 6:00, I wake up',
          usageNote: 'First action of the morning schedule.',
          icon: Icons.alarm_rounded,
          audioKey: 'a_six_heures_je_me_reveille',
        ),
        JSS1VocabItem(
          french: 'Je me lave et je m\'habille',
          phonetics: 'zhuh muh lahv ay zhuh mah-bee',
          english: 'I wash myself and get dressed',
          usageNote: 'Morning hygiene and preparing school uniform.',
          icon: Icons.shower_rounded,
          audioKey: 'je_me_lave_et_je_m_habille',
        ),
        JSS1VocabItem(
          french: 'À sept heures, je prends le petit-déjeuner',
          phonetics: 'ah set uhr zhuh prahn luh puh-tee day-zhuh-nay',
          english: 'At 7:00, I eat breakfast',
          usageNote: 'First meal of the day before leaving for school.',
          icon: Icons.bakery_dining_rounded,
          audioKey: 'a_sept_heures_je_prends_le_petit_dejeuner',
        ),
        JSS1VocabItem(
          french: 'À sept heures et demie, je vais à l\'école',
          phonetics: 'ah set uhr ay duh-mee zhuh vay ah lay-kohl',
          english: 'At 7:30, I go to school',
          usageNote: 'Commuting to school in the morning.',
          icon: Icons.directions_walk_rounded,
          audioKey: 'a_sept_heures_et_demie_je_vais_a_l_ecole',
        ),
        JSS1VocabItem(
          french: 'À huit heures, les cours commencent',
          phonetics: 'ah weet uhr lay koor koh-mahns',
          english: 'At 8:00, lessons begin',
          usageNote: 'Official start of classroom instruction.',
          icon: Icons.menu_book_rounded,
          audioKey: 'a_huit_heures_les_cours_commencent',
        ),
        JSS1VocabItem(
          french: 'À midi, je déjeune avec mes amis',
          phonetics: 'ah mee-dee zhuh day-zhuhn ah-vek mayz ah-mee',
          english: 'At noon, I have lunch with my friends',
          usageNote: 'Midday meal during the school lunch break.',
          icon: Icons.restaurant_rounded,
          audioKey: 'a_midi_je_dejeune_avec_mes_amis',
        ),
        JSS1VocabItem(
          french: 'À quatorze heures, je rentre à la maison',
          phonetics: 'ah kah-torz uhr zhuh rahntr ah lah may-zohn',
          english: 'At 2:00 PM (14:00), I return home',
          usageNote: 'Dismissal time after the final period of class.',
          icon: Icons.home_rounded,
          audioKey: 'a_quatorze_heures_je_rentre_a_la_maison',
        ),
        JSS1VocabItem(
          french: 'À dix-huit heures, je fais mes devoirs',
          phonetics: 'ah deez-weet uhr zhuh fay may duh-vwar',
          english: 'At 6:00 PM (18:00), I do my homework',
          usageNote: 'Evening study and academic preparation time.',
          icon: Icons.edit_note_rounded,
          audioKey: 'a_dix_huit_heures_je_fais_mes_devoirs',
        ),
        JSS1VocabItem(
          french: 'À vingt et une heures, je me couche',
          phonetics: 'ah van-tay-oon uhr zhuh muh koosh',
          english: 'At 9:00 PM (21:00), I go to bed',
          usageNote: 'Bedtime and end of the daily cycle.',
          icon: Icons.hotel_rounded,
          audioKey: 'a_vingt_et_une_heures_je_me_couche',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'Que fait un élève à 7h00 avant d\'aller à l\'école ?',
          options: [
            'Il se couche pour dormir',
            'Il prend son petit-déjeuner',
            'Il fait ses devoirs de nuit',
            'Il rentre à la maison'
          ],
          correctOptionIndex: 1,
          explanation: '"Prendre le petit-déjeuner" is having breakfast in the morning.',
        ),
        JSS1InteractiveExercise(
          prompt: 'Quelle phrase signifie "At 2:00 PM, I return home" ?',
          options: [
            'À quatorze heures, je rentre à la maison',
            'À midi, je vais à l\'école',
            'À six heures, je me réveille',
            'À huit heures, je dors'
          ],
          correctOptionIndex: 0,
          explanation: '14h00 = 2:00 PM, and "je rentre à la maison" means I go back home.',
        ),
        JSS1InteractiveExercise(
          prompt: 'Pour dire "I go to bed at 9:00 PM", on dit :',
          options: [
            'À 21h, je me lève',
            'À 21h, je me couche',
            'À 21h, je commence le cours',
            'À 21h, je mange le déjeuner'
          ],
          correctOptionIndex: 1,
          explanation: '"Se coucher" is the French reflexive verb for going to bed/sleeping.',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "I wake up at 6:30 AM" en français ?',
          answer: 'À six heures et demie du matin, je me réveille.',
          hint: '6:30 = six heures et demie, wake up = je me réveille.',
        ),
        JSS1EvaluationQuestion(
          question: 'Quelle est la différence entre "se lever" et "se coucher" ?',
          answer: '"Se lever" signifie sortir du lit le matin, "se coucher" signifie aller au lit le soir.',
          hint: 'Morning action vs Night action.',
        ),
        JSS1EvaluationQuestion(
          question: 'Traduisez : "After school, I do my homework at 5:00 PM."',
          answer: 'Après l\'école, je fais mes devoirs à dix-sept heures (cinq heures du soir).',
          hint: 'Après = after, devoirs = homework.',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Devoir Écrit',
          instruction: 'Write out your typical school day timetable with 6 distinct time-stamped sentences in French.',
          exampleResponse: '1. À 6h00, je me réveille.\n2. À 6h30, je me lave.\n3. À 7h00, je prends le petit-déjeuner.\n4. À 7h30, je vais à l\'école.\n5. À 14h00, je rentre à la maison.\n6. À 21h00, je me couche.',
        ),
        JSS1AssignmentTask(
          category: 'Présentation Orale',
          instruction: 'Narrate what you do between coming home from school (14h00) and going to sleep (21h00) to your teacher.',
          exampleResponse: 'Say: "L\'après-midi, je déjeune à 14h30, je me repose, je fais mes devoirs à 18h00 et je dîne en famille à 20h00."',
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: 'Les Verbes Pronominaux de la Routine Quotidienne',
        rule: 'Daily routine verbs in French use reflexive pronouns (me, te, se, nous, vous, se) before the verb: Je me réveille (I wake up), Je me lave (I wash), Je m\'habille (I dress), Je me couche (I go to bed). To express "at" a specific hour, always use the preposition "À": "À 7 heures".',
        examples: [
          'Je me réveille à 6h00 (Verbe pronominal "se réveiller")',
          'Je m\'habille avec mon uniforme (Élision "m\'" devant une voyelle)',
          'À quelle heure te couches-tu ? ➔ Je me couche à 21h00.',
          'Nous nous lavons les mains avant de manger.',
        ],
      ),
    ),

    // ==========================================
    // WEEK 6: DIRE LES DATES
    // ==========================================
    JSS1Lesson(
      term: 2,
      week: 6,
      topic: 'Dire les Dates (Jours, Mois et Années)',
      subtitle: 'Mastering the 7 days of the week, 12 months of the year, and formulating exact calendar dates.',
      patternType: JSS1PatternType.calendarDatesStudio,
      objectives: [
        'Recite and write all 7 days of the week (Lundi to Dimanche) in correct chronological order.',
        'Recite and spell all 12 months of the year (Janvier to Décembre).',
        'Ask for and state today\'s date accurately using "Aujourd\'hui c\'est le [jour] [numéro] [mois]".',
        'State one\'s birthday and national anniversary dates in French (Mon anniversaire est le...).',
      ],
      culturalInsight:
          'In French, days of the week and months of the year are written in lowercase (lundi, octobre), unlike in English. Also, the 1st day of a month is always "le premier" (e.g. Le 1er octobre: Fête de l\'Indépendance du Nigeria), while all other days use cardinal numbers (le 2, le 15, le 30).',
      vocabItems: [
        JSS1VocabItem(
          french: 'Les 7 jours de la semaine',
          phonetics: 'lay set zhoor duh lah suh-men',
          english: 'The 7 days of the week',
          usageNote: 'Lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche.',
          icon: Icons.calendar_view_week_rounded,
          audioKey: 'les_7_jours_de_la_semaine',
        ),
        JSS1VocabItem(
          french: 'Les 12 mois de l\'année',
          phonetics: 'lay dooz mwah duh lah-nay',
          english: 'The 12 months of the year',
          usageNote: 'Janvier, février, mars, avril, mai, juin, juillet, août, septembre, octobre, novembre, décembre.',
          icon: Icons.calendar_month_rounded,
          audioKey: 'les_12_mois_de_l_annee',
        ),
        JSS1VocabItem(
          french: 'Quelle est la date d\'aujourd\'hui ?',
          phonetics: 'kel ay lah daht doh-zhoor-dwee',
          english: 'What is today\'s date?',
          usageNote: 'Standard question used to ask for the current calendar date.',
          icon: Icons.event_note_rounded,
          audioKey: 'quelle_est_la_date_d_aujourd_hui',
        ),
        JSS1VocabItem(
          french: 'Aujourd\'hui c\'est le...',
          phonetics: 'oh-zhoor-dwee say luh',
          english: 'Today is the...',
          usageNote: 'Starting formula for declaring the current date.',
          icon: Icons.today_rounded,
          audioKey: 'aujourd_hui_c_est_le',
        ),
        JSS1VocabItem(
          french: 'Le premier octobre (1er octobre)',
          phonetics: 'luh pruh-myay ok-tohbr',
          english: 'The first of October (Nigeria Independence Day)',
          usageNote: 'Special rule: the 1st of any month uses the ordinal "premier".',
          icon: Icons.flag_rounded,
          audioKey: 'le_premier_octobre',
        ),
        JSS1VocabItem(
          french: 'Quelle est la date de ton anniversaire ?',
          phonetics: 'kel ay lah daht duh tohn ah-nee-vair-sair',
          english: 'What is the date of your birthday?',
          usageNote: 'Question asking someone for their date of birth.',
          icon: Icons.cake_rounded,
          audioKey: 'quelle_est_la_date_de_ton_anniversaire',
        ),
        JSS1VocabItem(
          french: 'Mon anniversaire est le quinze mai',
          phonetics: 'mohn ah-nee-vair-sair ay luh kanz may',
          english: 'My birthday is on May 15th',
          usageNote: 'Formula: Mon anniversaire est le + number + month.',
          icon: Icons.celebration_rounded,
          audioKey: 'mon_anniversaire_est_le_quinze_mai',
        ),
        JSS1VocabItem(
          french: 'Hier, Aujourd\'hui, Demain',
          phonetics: 'yair / oh-zhoor-dwee / duh-man',
          english: 'Yesterday, Today, Tomorrow',
          usageNote: 'Core temporal anchor words for days.',
          icon: Icons.timeline_rounded,
          audioKey: 'hier_aujourd_hui_demain',
        ),
        JSS1VocabItem(
          french: 'En quel mois sommes-nous ?',
          phonetics: 'ahn kel mwah suhm-noo',
          english: 'What month are we in?',
          usageNote: 'Inquiring about the active calendar month.',
          icon: Icons.date_range_rounded,
          audioKey: 'en_quel_mois_sommes_nous',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'Comment dit-on "The first of January" en français ?',
          options: ['Le un janvier', 'Le premier janvier', 'Le début janvier', 'La première janvier'],
          correctOptionIndex: 1,
          explanation: 'The first day of every month always takes "le premier", not "le un".',
        ),
        JSS1InteractiveExercise(
          prompt: 'Quel jour vient immédiatement après le mercredi ?',
          options: ['Mardi', 'Vendredi', 'Jeudi', 'Samedi'],
          correctOptionIndex: 2,
          explanation: 'The sequence is: Lundi, Mardi, Mercredi, **Jeudi**, Vendredi, Samedi, Dimanche.',
        ),
        JSS1InteractiveExercise(
          prompt: 'Pour dire que votre anniversaire est le 10 décembre, vous dites :',
          options: [
            'Mon anniversaire est en 10 décembre',
            'Mon anniversaire est le dix décembre',
            'Mon anniversaire a dix décembre',
            'Je suis anniversaire le dix décembre'
          ],
          correctOptionIndex: 1,
          explanation: 'Dates in French are preceded by the masculine definite article "le": "le dix décembre".',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Comment demande-t-on la date en français ?',
          answer: 'Quelle est la date d\'aujourd\'hui ? (ou Quel jour sommes-nous ?)',
          hint: 'Uses "la date" or "quel jour".',
        ),
        JSS1EvaluationQuestion(
          question: 'Quelle est la fête célébrée le 1er octobre au Nigeria ?',
          answer: 'La fête de l\'Indépendance du Nigeria (Independence Day).',
          hint: 'National holiday celebrated nationwide on October 1st.',
        ),
        JSS1EvaluationQuestion(
          question: 'Si aujourd\'hui c\'est vendredi, quel jour était-ce hier et quel jour sera-ce demain ?',
          answer: 'Hier c\'était jeudi, et demain ce sera samedi.',
          hint: 'Hier = yesterday, Demain = tomorrow.',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Devoir Écrit',
          instruction: 'Write out the full French dates for: your birthday, your mother\'s birthday, Nigeria\'s Independence Day (Oct 1), and Christmas Day (Dec 25).',
          exampleResponse: '1. Mon anniversaire: Le 14 avril\n2. L\'anniversaire de ma mère: Le 20 août\n3. Fête nationale du Nigeria: Le 1er octobre\n4. Noël: Le 25 décembre',
        ),
        JSS1AssignmentTask(
          category: 'Pratique Orale',
          instruction: 'Stand up and state today\'s full date with the day of the week, number, and month to the class in French.',
          exampleResponse: 'Say: "Aujourd\'hui, nous sommes le mardi 12 mai 2026 !"',
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: 'La Formulation de la Date en Français',
        rule: 'In French, dates follow the sequence: [Jour] + "le" + [Nombre] + [Mois] + [Année]. Example: "Mardi, le 15 octobre 2026". Note that unlike English, days and months do NOT take capital letters (lundi, janvier), and no ordinal suffix "-th" is used except for "le 1er" (le premier).',
        examples: [
          'Le 1er mai (Le premier mai - Fête du Travail)',
          'Le 27 mai (Le vingt-sept mai - Fête des Enfants)',
          'Aujourd\'hui, c\'est le jeudi 18 juin.',
          'Nous sommes en novembre (Pour le mois seul, on utilise "en").',
        ],
      ),
    ),

    // ==========================================
    // WEEK 7: SITUER UN ÉVÉNEMENT PAR RAPPORT À UN AUTRE
    // ==========================================
    JSS1Lesson(
      term: 2,
      week: 7,
      topic: 'Situer un Événement par Rapport à un Autre',
      subtitle: 'Chronological event sequencing using temporal prepositions (avant, après, pendant) and connectors.',
      patternType: JSS1PatternType.eventSequencerStudio,
      objectives: [
        'Understand and correctly use temporal prepositions: avant (before), après (after), and pendant (during).',
        'Organize daily and classroom events into a logical sequence using connectors (d\'abord, ensuite, puis, enfin).',
        'State what happens before or after specific school moments (avant la récréation, après le cours de français).',
        'Construct compound sentences comparing two distinct events in time.',
      ],
      culturalInsight:
          'In Nigerian secondary schools, following the sequence of the daily bell (before assembly, during lessons, after prep) instills self-discipline and punctuality. In French, expressing these transitions clearly is essential for storytelling.',
      vocabItems: [
        JSS1VocabItem(
          french: 'Avant',
          phonetics: 'ah-vahn',
          english: 'Before',
          usageNote: 'Preceding an event or noun (e.g., Avant le cours = Before the lesson).',
          icon: Icons.arrow_back_rounded,
          audioKey: 'avant',
        ),
        JSS1VocabItem(
          french: 'Après',
          phonetics: 'ah-pray',
          english: 'After',
          usageNote: 'Following an event or noun (e.g., Après la classe = After class).',
          icon: Icons.arrow_forward_rounded,
          audioKey: 'apres',
        ),
        JSS1VocabItem(
          french: 'Pendant',
          phonetics: 'pahn-dahn',
          english: 'During / While',
          usageNote: 'Denotes duration within an ongoing event (e.g., Pendant la récréation = During break time).',
          icon: Icons.sync_alt_rounded,
          audioKey: 'pendant',
        ),
        JSS1VocabItem(
          french: 'D\'abord',
          phonetics: 'dah-bor',
          english: 'First / First of all',
          usageNote: 'Introductory sequential connector for step 1 of an action.',
          icon: Icons.looks_one_rounded,
          audioKey: 'd_abord',
        ),
        JSS1VocabItem(
          french: 'Ensuite / Puis',
          phonetics: 'ahn-sweet / pwee',
          english: 'Then / Next',
          usageNote: 'Connecting the subsequent steps of an event.',
          icon: Icons.looks_two_rounded,
          audioKey: 'ensuite_puis',
        ),
        JSS1VocabItem(
          french: 'Enfin / Finalement',
          phonetics: 'ahn-fan / fee-nahl-mahn',
          english: 'Finally / Lastly',
          usageNote: 'Concluding connector for the final step of a sequence.',
          icon: Icons.done_all_rounded,
          audioKey: 'enfin_finalement',
        ),
        JSS1VocabItem(
          french: 'Avant de manger, je me lave les mains',
          phonetics: 'ah-vahn duh mahn-zhay zhuh muh lahv lay man',
          english: 'Before eating, I wash my hands',
          usageNote: 'Important hygiene imperative using "avant de + infinitif".',
          icon: Icons.wash_rounded,
          audioKey: 'avant_de_manger_je_me_lave_les_mains',
        ),
        JSS1VocabItem(
          french: 'Pendant la classe, les élèves écoutent',
          phonetics: 'pahn-dahn lah klahs layz ay-lehv ay-koot',
          english: 'During class, the students listen',
          usageNote: 'Expressing simultaneous action during an ongoing period.',
          icon: Icons.hearing_rounded,
          audioKey: 'pendant_la_classe_les_eleves_ecoutent',
        ),
        JSS1VocabItem(
          french: 'Après l\'école, je rentre chez moi',
          phonetics: 'ah-pray lay-kohl zhuh rahntr shay mwah',
          english: 'After school, I return home',
          usageNote: 'Describing an action that happens immediately subsequent to school.',
          icon: Icons.home_rounded,
          audioKey: 'apres_l_ecole_je_rentre_chez_moi',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'Complétez la règle d\'hygiène : "_______ de manger, il faut se laver les mains."',
          options: ['Après', 'Avant', 'Pendant', 'Ensuite'],
          correctOptionIndex: 1,
          explanation: '"Avant de manger" means before eating (hygiene action before the meal).',
        ),
        JSS1InteractiveExercise(
          prompt: 'Que font les élèves "pendant la récréation" ?',
          options: [
            'Ils dorment dans la nuit',
            'Ils jouent dans la cour et mangent une collation',
            'Ils passent l\'examen final',
            'Ils prennent le bain du matin'
          ],
          correctOptionIndex: 1,
          explanation: '"Pendant la récréation" (during recess/break), students play and have a snack.',
        ),
        JSS1InteractiveExercise(
          prompt: 'Quel mot connecteur utilise-t-on pour la dernière étape d\'une histoire ?',
          options: ['D\'abord', 'Avant', 'Enfin', 'Pendant'],
          correctOptionIndex: 2,
          explanation: '"Enfin" or "Finalement" marks the conclusion of a sequence.',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Quels sont les trois mots français pour "Before", "After", et "During" ?',
          answer: 'Avant (Before), Après (After), Pendant (During).',
          hint: 'The 3 core temporal prepositions.',
        ),
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "First I study, then I play" en français ?',
          answer: 'D\'abord j\'étudie, ensuite je joue.',
          hint: 'D\'abord = first, ensuite = then.',
        ),
        JSS1EvaluationQuestion(
          question: 'Traduisez : "Pendant les vacances, nous visitons nos grands-parents."',
          answer: 'During the holidays, we visit our grandparents.',
          hint: 'Pendant = during, vacances = holidays.',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Devoir Écrit',
          instruction: 'Write a 4-step sequence describing how you prepare for school in the morning using "D\'abord", "Ensuite", "Puis", and "Enfin".',
          exampleResponse: '1. D\'abord, je me réveille à 6h00.\n2. Ensuite, je prends mon bain et je m\'habille.\n3. Puis, je mange mon petit-déjeuner.\n4. Enfin, je prends mon sac et je pars à l\'école.',
        ),
        JSS1AssignmentTask(
          category: 'Pratique Orale',
          instruction: 'Tell your teacher 2 things you do before coming to school and 2 things you do after leaving school.',
          exampleResponse: 'Say: "Avant l\'école, je range mon lit et je prends mon thé. Après l\'école, je fais mes devoirs et je joue au football."',
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: 'Les Prépositions Temporelles (Avant, Après, Pendant)',
        rule: '"Avant" indicates anteriority (before): used with a noun ("avant le cours") or with "de + infinitive" ("avant de manger"). "Après" indicates posteriority (after): followed directly by a noun ("après la classe"). "Pendant" denotes simultaneous duration (during): followed by an event noun ("pendant la récréation").',
        examples: [
          'Avant la classe, nous faisons la prière (Before class)',
          'Avant de dormir, je lis mon livre (Avant de + Infinitif)',
          'Pendant le cours de français, nous parlons français (Simultané)',
          'Après l\'école, je joue avec mon frère (Posteriorité)',
        ],
      ),
    ),

    // ==========================================
    // WEEK 8: ACTIVITÉS DE TOUS LES JOURS DE LA SEMAINE
    // ==========================================
    JSS1Lesson(
      term: 2,
      week: 8,
      topic: 'Activités de Tous les Jours de la Semaine',
      subtitle: 'Talking about weekly habits, recurring hobbies, sports clubs, and weekend activities.',
      patternType: JSS1PatternType.weeklyRoutineStudio,
      objectives: [
        'Describe recurring weekly activities from Monday through Sunday in French.',
        'Use the definite article "Le" before days to express recurring weekly habits (Le lundi = Every Monday).',
        'Discuss school clubs, sports, and religious/family weekend commitments in simple French.',
        'Ask peers what they do on weekends (Que fais-tu le samedi / le week-end ?).',
      ],
      culturalInsight:
          'In Nigeria, weekdays (lundi à vendredi) are focused on rigorous schooling and prep, while weekends are filled with sports, household chores, religious worship (mosque on Friday, church on Sunday), and family gatherings.',
      vocabItems: [
        JSS1VocabItem(
          french: 'Le lundi, j\'ai cours de français',
          phonetics: 'luh luhn-dee zhay koor duh frahn-say',
          english: 'On Mondays (Every Monday), I have French class',
          usageNote: 'Using "Le + day" denotes a regular repeating weekly routine.',
          icon: Icons.menu_book_rounded,
          audioKey: 'le_lundi_j_ai_cours_de_francais',
        ),
        JSS1VocabItem(
          french: 'Le mardi, je fais des mathématiques',
          phonetics: 'luh mar-dee zhuh fay day mah-tay-mah-teek',
          english: 'On Tuesdays, I do mathematics',
          usageNote: 'Expressing academic subject schedules.',
          icon: Icons.calculate_rounded,
          audioKey: 'le_mardi_je_fais_des_mathematiques',
        ),
        JSS1VocabItem(
          french: 'Le mercredi après-midi, je joue au football',
          phonetics: 'luh mair-kruh-dee ah-pray mee-dee zhuh zhoo oh foot-bohl',
          english: 'On Wednesday afternoons, I play football (soccer)',
          usageNote: 'Midweek sports and extracurricular activity.',
          icon: Icons.sports_soccer_rounded,
          audioKey: 'le_mercredi_apres_midi_je_joue_au_football',
        ),
        JSS1VocabItem(
          french: 'Le jeudi, je vais à la bibliothèque',
          phonetics: 'luh zhuh-dee zhuh vay ah lah bee-blee-oh-tek',
          english: 'On Thursdays, I go to the library to read',
          usageNote: 'Academic study and library visits.',
          icon: Icons.local_library_rounded,
          audioKey: 'le_jeudi_je_vais_a_la_bibliotheque',
        ),
        JSS1VocabItem(
          french: 'Le vendredi, nous nettoyons la classe',
          phonetics: 'luh vahn-druh-dee noo ne-twah-yohn lah klahs',
          english: 'On Fridays, we clean the classroom',
          usageNote: 'End-of-week school community chores and preparation.',
          icon: Icons.cleaning_services_rounded,
          audioKey: 'le_vendredi_nous_nettoyons_la_classe',
        ),
        JSS1VocabItem(
          french: 'Le samedi, je fais le ménage et la lessive',
          phonetics: 'luh sahm-dee zhuh fay luh may-nahzh ay lah leh-seev',
          english: 'On Saturdays, I do household chores and laundry',
          usageNote: 'Saturday morning home responsibilities in Nigerian households.',
          icon: Icons.local_laundry_service_rounded,
          audioKey: 'le_samedi_je_fais_le_menage',
        ),
        JSS1VocabItem(
          french: 'Le dimanche, nous allons au culte en famille',
          phonetics: 'luh dee-mahnsh nooz ah-lohn oh koolt ahn fah-mee',
          english: 'On Sundays, we go to worship with family',
          usageNote: 'Weekend religious worship and family fellowship.',
          icon: Icons.church_rounded,
          audioKey: 'le_dimanche_nous_allons_au_culte',
        ),
        JSS1VocabItem(
          french: 'Que fais-tu le week-end ?',
          phonetics: 'kuh fay-too luh week-end',
          english: 'What do you do on the weekend?',
          usageNote: 'Friendly conversational question to learn about a friend\'s weekend routine.',
          icon: Icons.weekend_rounded,
          audioKey: 'que_fais_tu_le_week_end',
        ),
        JSS1VocabItem(
          french: 'Tous les jours, j\'apprends le français',
          phonetics: 'too lay zhoor zhah-prahn luh frahn-say',
          english: 'Every day, I learn French',
          usageNote: 'Expressing daily dedication and consistency.',
          icon: Icons.auto_awesome_rounded,
          audioKey: 'tous_les_jours_j_apprends_le_francais',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'Que signifie l\'utilisation de "Le" devant un jour comme dans "Le samedi, je fais du sport" ?',
          options: [
            'Uniquement ce samedi passé',
            'Tous les samedis de façon régulière (habitude)',
            'Peut-être le samedi prochain',
            'Le samedi est annulé'
          ],
          correctOptionIndex: 1,
          explanation: 'In French, "Le + day" indicates an ongoing habitual action occurring every week on that day.',
        ),
        JSS1InteractiveExercise(
          prompt: 'Comment dit-on "On Wednesdays, I go to the library" ?',
          options: [
            'Le mercredi, je vais à la bibliothèque',
            'Le lundi, je vais au marché',
            'Le vendredi, je joue au tennis',
            'Le dimanche, je dors'
          ],
          correctOptionIndex: 0,
          explanation: '"Le mercredi" = On Wednesdays, and "la bibliothèque" = library.',
        ),
        JSS1InteractiveExercise(
          prompt: 'Pour demander à un ami ses activités du samedi et dimanche, on demande :',
          options: [
            'Quelle heure est-il ?',
            'Que fais-tu le week-end ?',
            'Comment t\'appelles-tu ?',
            'De quelle couleur est ton sac ?'
          ],
          correctOptionIndex: 1,
          explanation: '"Que fais-tu le week-end ?" directly asks about weekend plans and routines.',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Comment dit-on "Every Monday we have French class" en français ?',
          answer: 'Le lundi, nous avons cours de français (ou Tous les lundis...).',
          hint: 'Use "Le lundi" to express recurring Mondays.',
        ),
        JSS1EvaluationQuestion(
          question: 'Nommez 3 activités courantes du samedi pour un élève au Nigeria en français.',
          answer: 'Faire le ménage (cleaning), faire la lessive (laundry), jouer au football (playing football).',
          hint: 'Chores, laundry, sports.',
        ),
        JSS1EvaluationQuestion(
          question: 'Traduisez : "On Sunday, we visit our family."',
          answer: 'Le dimanche, nous visitons notre famille.',
          hint: 'Dimanche = Sunday, visitons = we visit.',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Devoir Écrit',
          instruction: 'Create your weekly activity planner: write one complete sentence for each day from Lundi to Dimanche stating what you do.',
          exampleResponse: 'Lundi: J\'étudie le français.\nMardi: Je fais des mathématiques.\nMercredi: Je joue au football.\nJeudi: Je lis à la bibliothèque.\nVendredi: Je nettoie la chambre.\nSamedi: Je lave mes vêtements.\nDimanche: Je me repose en famille.',
        ),
        JSS1AssignmentTask(
          category: 'Pratique Orale',
          instruction: 'Ask 3 classmates what they do on Saturday afternoons and report their answers in French.',
          exampleResponse: 'Say: "Amina joue au basketball le samedi, et Tunde regarde la télévision."',
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: 'L\'Expression de l\'Habitude avec les Jours de la Semaine',
        rule: 'In French, placing the singular definite article "le" before a day of the week denotes repetition and habit (meaning "every..."): "Le lundi" = Every Monday. Contrast with saying "Lundi" without article, which refers specifically to next Monday or last Monday.',
        examples: [
          'Le samedi, je fais du sport (= Every Saturday I do sports)',
          'Samedi, je vais chez le médecin (= This specific Saturday I go to the doctor)',
          'Le week-end, nous nous reposons (= On weekends we rest)',
          'Tous les vendredis après-midi, nous avons club de français.',
        ],
      ),
    ),

    // ==========================================
    // WEEK 9: RÉVISION GÉNÉRALE DU DEUXIÈME TRIMESTRE
    // ==========================================
    JSS1Lesson(
      term: 2,
      week: 9,
      topic: 'Révision Générale du Deuxième Trimestre (Grand Rally)',
      subtitle: 'Comprehensive 4-Station Speed Revision Rally consolidating all 8 instructional topics taught in Term 2.',
      patternType: JSS1PatternType.term2RevisionRally,
      objectives: [
        'Consolidate vocabulary and mastery of object properties (size, color, shape, texture).',
        'Review polite requests, asking to see someone, and classroom etiquette formulas.',
        'Demonstrate fluency with professions, duties, telling time, daily hours, dates, and event sequencing.',
        'Participate in a 4-Team interactive smartboard buzzer quiz tournament with live scoring.',
      ],
      culturalInsight:
          'End-of-term revision in Francophone schools is celebrated with lively oral tournaments and inter-house French quizzes, allowing students to demonstrate communicative confidence before their peers and teachers.',
      vocabItems: [
        JSS1VocabItem(
          french: 'Station 1 : Propriétés & Demandes Polies',
          phonetics: 'stah-syohn uhn : proh-pree-ay-tay ay duh-mahnd poh-lee',
          english: 'Station 1: Object Properties & Polite Requests',
          usageNote: 'Recap of grand/petit, rond/carré, lourd/léger, and Je voudrais / S\'il vous plaît.',
          icon: Icons.category_rounded,
          audioKey: 'station_1_proprietes_et_demandes',
        ),
        JSS1VocabItem(
          french: 'Station 2 : Les Métiers & Professions',
          phonetics: 'stah-syohn dooz : lay may-tyay ay proh-feh-syohn',
          english: 'Station 2: Jobs & Professional Duties',
          usageNote: 'Recap of médecin, enseignant, ingénieur, avocat, infirmier, and commerçant.',
          icon: Icons.work_rounded,
          audioKey: 'station_2_metiers_et_professions',
        ),
        JSS1VocabItem(
          french: 'Station 3 : L\'Heure, Horaires & Dates',
          phonetics: 'stah-syohn trwa : luhr oh-rair ay daht',
          english: 'Station 3: Clock Time, Daily Hours & Dates',
          usageNote: 'Recap of Quelle heure est-il ?, et quart/demie, daily routine hours, and calendar dates.',
          icon: Icons.access_time_rounded,
          audioKey: 'station_3_heure_horaires_et_dates',
        ),
        JSS1VocabItem(
          french: 'Station 4 : Chronologie (Avant/Après) & Semaine',
          phonetics: 'stah-syohn kahtr : kroh-noh-loh-zhee ay suh-men',
          english: 'Station 4: Event Sequencing & Weekly Routines',
          usageNote: 'Recap of avant, pendant, après, d\'abord, ensuite, and recurring weekly activities.',
          icon: Icons.timeline_rounded,
          audioKey: 'station_4_chronologie_et_semaine',
        ),
        JSS1VocabItem(
          french: 'L\'équipe Rouge / Bleue / Verte / Or',
          phonetics: 'lay-keep roozh / bluh / vairt / or',
          english: 'The Red / Blue / Green / Gold Team',
          usageNote: 'Smartboard 4-team buzzer tournament competition rosters.',
          icon: Icons.groups_rounded,
          audioKey: 'l_equipe_rouge_bleue_verte_or',
        ),
        JSS1VocabItem(
          french: 'Appuyez sur le buzzer pour répondre !',
          phonetics: 'ah-pwee-yay soor luh boo-zair poor ray-pohndr',
          english: 'Press the buzzer to answer!',
          usageNote: 'Directive given by teacher/facilitator to trigger team answers.',
          icon: Icons.touch_app_rounded,
          audioKey: 'appuyez_sur_le_buzzer_pour_repondre',
        ),
        JSS1VocabItem(
          french: 'Bonne réponse ! Cinq points pour l\'équipe !',
          phonetics: 'buhn ray-pohns ! sank pwan poor lay-keep !',
          english: 'Correct answer! 5 points for the team!',
          usageNote: 'Celebration trigger when an interactive challenge is won.',
          icon: Icons.stars_rounded,
          audioKey: 'bonne_reponse_cinq_points',
        ),
        JSS1VocabItem(
          french: 'Félicitations pour le Deuxième Trimestre !',
          phonetics: 'fay-lee-see-tah-syohn poor luh dooz-yem tree-mestr !',
          english: 'Congratulations on completing Term 2!',
          usageNote: 'Term conclusion accolade celebrating mastery across all 8 lessons.',
          icon: Icons.military_tech_rounded,
          audioKey: 'felicitations_pour_le_deuxieme_trimestre',
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: 'Quel mot décrit un objet doux et de forme circulaire ?',
          options: ['Dur et carré', 'Doux et rond', 'Lourd et long', 'Léger et pointu'],
          correctOptionIndex: 1,
          explanation: '"Doux" means soft, and "rond" means circular/round.',
        ),
        JSS1InteractiveExercise(
          prompt: 'Quelle phrase est grammaticalement correcte pour exprimer une habitude hebdomadaire ?',
          options: [
            'Lundi passé, je joue au foot',
            'Le samedi, je nettoie ma chambre',
            'Demain matin, je dormais',
            'Hier soir, je vais à l\'école'
          ],
          correctOptionIndex: 1,
          explanation: '"Le samedi" correctly uses the definite article "le" to express every Saturday.',
        ),
        JSS1InteractiveExercise(
          prompt: 'Comment dit-on "At 12:00 PM, we have lunch during the break" ?',
          options: [
            'À minuit, nous mangeons le dîner après le cours',
            'À midi, nous déjeunons pendant la récréation',
            'À 8h du matin, nous dormons avant la classe',
            'À 18h, nous faisons la sieste pendant la nuit'
          ],
          correctOptionIndex: 1,
          explanation: 'Midi = 12:00 PM, déjeuner = lunch, pendant la récréation = during the break.',
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: 'Citez les 4 connecteurs logiques de séquence appris au Terme 2.',
          answer: 'D\'abord (First), Ensuite (Next), Puis (Then), Enfin / Finalement (Finally).',
          hint: 'First, Next, Then, Finally.',
        ),
        JSS1EvaluationQuestion(
          question: 'Comment demande-t-on poliment à voir la directrice de l\'école ?',
          answer: 'Bonjour Madame, puis-je voir la directrice, s\'il vous plaît ?',
          hint: 'Use "Puis-je voir...".',
        ),
        JSS1EvaluationQuestion(
          question: 'Donnez la date de la fête de l\'Indépendance du Nigeria en français.',
          answer: 'Le premier octobre (Le 1er octobre).',
          hint: 'Remember to use "Le premier".',
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: 'Bilan Écrit',
          instruction: 'Write a 1-page summary in your French notebook highlighting 2 key sentences from each of the 8 Term 2 topics.',
          exampleResponse: 'Week 1: Cette table est ronde.\nWeek 2: Je voudrais un stylo, s\'il vous plaît.\nWeek 3: Mon père est médecin.\nWeek 4: Il est huit heures et demie.\nWeek 5: À 7h, je prends le petit-déjeuner.\nWeek 6: Aujourd\'hui c\'est le 1er octobre.\nWeek 7: Avant de manger, je me lave les mains.\nWeek 8: Le samedi, je fais du sport.',
        ),
        JSS1AssignmentTask(
          category: 'Grand Défi Oral',
          instruction: 'Form a team of 4 and compete in the Smartboard Term 2 French Buzzer Rally.',
          exampleResponse: 'Score 100% on the 4 stations and celebrate with the team trophy!',
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: 'Bilan Grammatical du Deuxième Trimestre (Term 2 Synthesis)',
        rule: 'Term 2 consolidated 5 key grammatical pillars: 1. Adjective Agreement (masculin/féminin/pluriel), 2. Polite Conditionals (Je voudrais, Puis-je), 3. Reflexive Routine Verbs (Je me réveille, Je me couche), 4. Telling Time & Date Conventions (Il est... heures, le 1er), and 5. Temporal Connectors (Avant, Pendant, Après, D\'abord, Enfin).',
        examples: [
          'Accord : Une grande table ronde et rouge',
          'Politesse : S\'il vous plaît, puis-je sortir ?',
          'Routine : À 6h30, je me réveille et je m\'habille',
          'Heure : Il est sept heures et demie du matin',
          'Temps : Avant le cours, les élèves attendent poliment',
        ],
      ),
    ),
  ];
}
