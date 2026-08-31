import 'package:flutter/material.dart';
import '../models/jss3_lesson_model.dart';

/// JSS 3 French — Deuxième Trimestre (Second Term)
/// 9 High-Impact Instructional & Revision Weeks
/// Nigerian NERDC Curriculum — BECE / Junior WAEC Preparation Aligned
class JSS3Term2Lessons {
  static const List<JSS3LessonModel> weeks = [
    // ─────────────────────────────────────────────────────
    // WEEK 1 — Unité 1: Relater un événement passé
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 1,
      termNumber: 2,
      theme: 'Unité 1',
      frenchTitle: 'Relater un événement passé et situer les actions',
      englishSubtitle: 'Narrating Past Events — Passé Composé, Imparfait & Temporal Adverbs',
      teacherFacilitatorPrompt:
          'Welcome pupils back to Term 2 of JSS 3 French. Review the distinction between Passé Composé (completed actions) and Imparfait (ongoing background descriptions). Show how temporal adverbs (autrefois, autrefois, alors, soudain, ensuite) anchor the timeline. Launch the Past Events Studio.',
      objectives: [
        'Combine Passé Composé and Imparfait seamlessly in a cohesive past narrative.',
        'Use temporal adverbs (autrefois, soudain, alors, plus tard) to establish chronological sequence.',
        'Express weather conditions and emotional states in the past using the Imparfait.',
        'Narrate a complete historical or personal anecdote in French.',
      ],
      culturalInsight:
          'In West African French literature (e.g. Camara Laye\'s *L\'Enfant Noir* or Ferdinand Oyono\'s *Une Vie de Boy*), authors masterfully weave the Imparfait to evoke childhood nostalgia and the Passé Composé to recount life-altering events. Nigerian pupils preparing for the BECE exam will encounter narrative comprehension passages utilizing this exact dual-tense interplay.',
      patternType: JSS3PatternType.narratingPastEventsStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'autrefois / jadis',
          phonetics: '[o.tʁə.fwa] / [ʒa.dis]',
          english: 'formerly / in times past',
          usageNote: 'Autrefois, les gens voyageaient à pied ou à cheval.',
          icon: Icons.history_rounded,
          audioKey: 't2w1_autrefois_jadis',
        ),
        JSS3VocabItem(
          french: 'alors / à ce moment-là',
          phonetics: '[a.lɔʁ] / [a sə mɔ.mɑ̃ la]',
          english: 'then / at that moment',
          usageNote: 'Il pleuvait fort, alors nous sommes restés à l\'intérieur.',
          icon: Icons.arrow_right_alt_rounded,
          audioKey: 't2w1_alors_moment',
        ),
        JSS3VocabItem(
          french: 'pendant que / tandis que',
          phonetics: '[pɑ̃.dɑ̃ kə] / [tɑ̃.di kə]',
          english: 'while / whereas',
          usageNote: 'Pendant que le professeur expliquait, les élèves écoutaient attentivement.',
          icon: Icons.sync_alt_rounded,
          audioKey: 't2w1_pendant_que',
        ),
        JSS3VocabItem(
          french: 'soudainement / brusquement',
          phonetics: '[su.dɛn.mɑ̃] / [bʁysk.mɑ̃]',
          english: 'suddenly / abruptly',
          usageNote: 'Brusquement, l\'électricité s\'est coupée pendant l\'orage.',
          icon: Icons.bolt_rounded,
          audioKey: 't2w1_soudainement_brusquement',
        ),
        JSS3VocabItem(
          french: 'il faisait beau / il pleuvait',
          phonetics: '[il fə.zɛ bo] / [il plø.vɛ]',
          english: 'the weather was fine / it was raining',
          usageNote: 'Ce matin-là, il faisait un soleil radieux à Lagos.',
          icon: Icons.cloud_queue_rounded,
          audioKey: 't2w1_faisait_beau_pleuvait',
        ),
        JSS3VocabItem(
          french: 'j\'étais heureux / nous étions contents',
          phonetics: '[ʒe.tɛ œ.ʁø] / [nu.z‿e.tjɔ̃ kɔ̃.tɑ̃]',
          english: 'I was happy / we were pleased',
          usageNote: 'Nous étions très contents de recevoir nos correspondants français.',
          icon: Icons.sentiment_very_satisfied_rounded,
          audioKey: 't2w1_etais_heureux',
        ),
        JSS3VocabItem(
          french: 'relater / raconter une histoire',
          phonetics: '[ʁə.la.te] / [ʁa.kɔ̃.te yn is.twaʁ]',
          english: 'to relate / to tell a story',
          usageNote: 'Le vieil homme nous a relaté l\'histoire de notre village.',
          icon: Icons.auto_stories_rounded,
          audioKey: 't2w1_relater_raconter',
        ),
        JSS3VocabItem(
          french: 'ce jour-là / la veille',
          phonetics: '[sə ʒuʁ la] / [la vɛj]',
          english: 'that day / the day before (eve)',
          usageNote: 'La veille de l\'examen, j\'ai révisé toute la soirée.',
          icon: Icons.event_note_rounded,
          audioKey: 't2w1_ce_jour_la_veille',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Complétez : « Pendant que nous ___ le dîner, mon oncle est arrivé. » (préparer)',
          options: ['avons préparé (Passé Composé)', 'préparions (Imparfait)', 'préparerons (Futur)', 'préparons (Présent)'],
          correctOptionIndex: 1,
          explanation: 'Actions introduced by "Pendant que" (expressing an ongoing background action) take the Imparfait: "préparions".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quel adverbe temporel exprime une rupture soudaine dans un récit ?',
          options: ['D\'habitude', 'Autrefois', 'Brusquement / Soudain', 'Chaque jour'],
          correctOptionIndex: 2,
          explanation: '"Brusquement" or "Soudain" indicates a sudden turning point in the past narrative.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Comment traduit-on "The day before the journey" en français ?',
          options: ['Le lendemain du voyage', 'La veille du voyage', 'Pendant le voyage', 'Après le voyage'],
          correctOptionIndex: 1,
          explanation: '"La veille" means the day before or the eve of an event.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Choisissez la bonne phrase au passé :',
          options: [
            'Il faisait nuit quand l\'avion a atterri.',
            'Il a fait nuit quand l\'avion atterrissait.',
            'Il fait nuit quand l\'avion atterrira.',
            'Il était nuit quand l\'avion a fait atterri.',
          ],
          correctOptionIndex: 0,
          explanation: 'Weather/state in the background takes Imparfait ("Il faisait nuit"), while the sudden punctual action takes Passé Composé ("l\'avion a atterri").',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Explique quand on emploie l\'Imparfait et quand on emploie le Passé Composé dans un même récit.',
          answer: 'L\'Imparfait sert pour le DÉCOR, les descriptions, les états d\'âme, le temps qu\'il faisait et les habitudes passées ("Il faisait beau, j\'avais faim"). Le Passé Composé sert pour les ACTIONS PRÉCISES, soudaines, complètes et successives ("Soudain, la porte a claqué, je me suis levé").',
          hint: 'Imparfait = Background/Setting/Habit; Passé Composé = Action/Event/Turning point.',
        ),
        JSS3EvaluationQuestion(
          question: 'Traduisez en français : "Yesterday it was raining, so we stayed at home."',
          answer: '"Hier, il pleuvait, alors nous sommes restés à la maison."',
          hint: 'Yesterday = Hier; it was raining = il pleuvait (Imparfait); so = alors; we stayed = nous sommes restés (Passé Composé).',
        ),
        JSS3EvaluationQuestion(
          question: 'Cite 3 adverbes ou expressions temporelles qui situent les actions dans le passé.',
          answer: '1. Autrefois / Jadis 2. La veille 3. À ce moment-là (ou Brusquement / Soudain).',
          hint: 'Think of formerly, the eve, at that moment, suddenly.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Récit d\'anecdote',
          instruction: 'Write a 6-sentence story about an unexpected power cut or thunderstorm at your school. Use at least 2 verbs in the Imparfait (setting) and 3 verbs in the Passé Composé (actions).',
          exampleResponse: 'Hier après-midi, nous étions en classe de français et le ciel était très sombre. Soudain, un éclair a illuminé la pièce et le tonnerre a grondé très fort. L\'électricité s\'est coupée instantanément. Les élèves ont crié de surprise, puis le professeur a allumé une lampe. Nous avons continué la leçon dans la bonne humeur.',
        ),
        JSS3AssignmentTask(
          category: 'Conjugaison croisée',
          instruction: 'Fill in the blanks with either Passé Composé or Imparfait in 4 self-created sentences.',
          exampleResponse: '1. Quand j\'ÉTAIS petit, j\'AI VU la mer pour la première fois. 2. Il FAISAIT chaud quand le bus EST ARRIVÉ. 3. Nous DORMIONS quand le téléphone A SONNÉ. 4. Fatima ÉTAIT fatiguée, alors elle S\'EST COUCHÉE tôt.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Mastering Narrative Past Tenses: Passé Composé vs Imparfait',
        explanation:
            'In French narrative texts (BECE reading comprehension and guided writing), two past tenses work in harmony:\n\n1. L\'IMPARFAIT (The Camera / Setting):\n• Describes weather: "Il pleuvait."\n• Describes physical/emotional states: "J\'étais malade."\n• Describes ongoing, uncompleted actions: "Nous marchions dans la rue..."\n\n2. LE PASSÉ COMPOSÉ (The Action / Punctual Event):\n• Interrupts an ongoing action: "... quand un chien a aboyé."\n• Advances the plot with specific, sequential actions: "Je suis entré, j\'ai salué et je me suis assis."\n\n3. KEY DISCOURSE MARKERS:\n• Triggers for Imparfait: Pendant que, tandis que, d\'habitude, autrefois, chaque fois que.\n• Triggers for Passé Composé: Soudain, brusquement, tout à coup, un jour, à ce moment-là.',
        examples: [
          'Pendant que je lisais (Imparfait), ma mère est entrée (Passé Composé).',
          'Il faisait très chaud (Imparfait), alors j\'ai bu un grand verre d\'eau (Passé Composé).',
          'Autrefois nous habitions à Kano, mais en 2022 nous avons déménagé à Abuja.',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 2 — Unité 2: Rapporter un fait récent
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 2,
      termNumber: 2,
      theme: 'Unité 2',
      frenchTitle: 'Rapporter un fait récent : le passé récent (venir de)',
      englishSubtitle: 'Reporting Recent Events — Le Passé Récent & Breaking News',
      teacherFacilitatorPrompt:
          'Enter the classroom as if delivering urgent, exciting news: "Écoutez tous ! Le proviseur vient d\'annoncer les dates des vacances !" Introduce the Passé Récent structure: VENIR (au présent) + DE + INFINITIF. Practice converting standard past actions into immediate past updates. Move to the Newsroom Studio.',
      objectives: [
        'Form and conjugate the Passé Récent (VENIR DE + infinitif) for all subject pronouns.',
        'Report immediate breaking news, sports results, and classroom announcements.',
        'Distinguish between Passé Composé (completed past) and Passé Récent (just happened).',
        'Roleplay a news broadcast journalist presenting recent school and world headlines.',
      ],
      culturalInsight:
          'In Francophone media (RFI - Radio France Internationale, TV5 Monde Afrique, and national news stations like ORTB Bénin or RTI Côte d\'Ivoire), the formula "Nous venons d\'apprendre que..." (We have just learned that...) is the universal journalistic standard for breaking news. Nigerian students learning this formula gain immediate authentic communicative fluency.',
      patternType: JSS3PatternType.recentEventsVenirDeStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'venir de + infinitif',
          phonetics: '[və.niʁ də]',
          english: 'to have just (done something)',
          usageNote: 'Le cours vient de commencer. — The class has just started.',
          icon: Icons.update_rounded,
          audioKey: 't2w2_venir_de',
        ),
        JSS3VocabItem(
          french: 'à l\'instant / tout juste',
          phonetics: '[a lɛ̃s.tɑ̃] / [tu ʒyst]',
          english: 'just now / this very instant',
          usageNote: 'Le bus vient d\'arriver à l\'instant.',
          icon: Icons.timer_outlined,
          audioKey: 't2w2_a_l_instant',
        ),
        JSS3VocabItem(
          french: 'les dernières nouvelles / l\'actualité',
          phonetics: '[le dɛʁ.njɛʁ nu.vɛl] / [lak.tɥa.li.te]',
          english: 'the latest news / current affairs',
          usageNote: 'Voici les dernières nouvelles de la journée.',
          icon: Icons.newspaper_rounded,
          audioKey: 't2w2_dernieres_nouvelles',
        ),
        JSS3VocabItem(
          french: 'un flash spécial / une alerte',
          phonetics: '[œ̃ flaʃ spe.sjal] / [yn a.lɛʁt]',
          english: 'special news bulletin / alert',
          usageNote: 'Flash spécial : Les Super Eagles viennent de marquer un but !',
          icon: Icons.campaign_rounded,
          audioKey: 't2w2_flash_special',
        ),
        JSS3VocabItem(
          french: 'annoncer / proclamer',
          phonetics: '[a.nɔ̃.se] / [pʁɔ.kla.me]',
          english: 'to announce / to declare',
          usageNote: 'Le professeur vient d\'annoncer les résultats du test.',
          icon: Icons.record_voice_over_rounded,
          audioKey: 't2w2_annoncer_proclamer',
        ),
        JSS3VocabItem(
          french: 'récemment / dernièrement',
          phonetics: '[ʁe.sa.mɑ̃] / [dɛʁ.njɛʁ.mɑ̃]',
          english: 'recently / lately',
          usageNote: 'Récemment, notre école a construit un nouveau laboratoire de langues.',
          icon: Icons.calendar_today_rounded,
          audioKey: 't2w2_recemment_dernierement',
        ),
        JSS3VocabItem(
          french: 'remporter la victoire / gagner',
          phonetics: '[ʁɑ̃.pɔʁ.te la vik.twaʁ] / [ɡa.ɲe]',
          english: 'to win the victory / to win',
          usageNote: 'Notre équipe vient de remporter la médaille d\'or.',
          icon: Icons.emoji_events_rounded,
          audioKey: 't2w2_remporter_victoire',
        ),
        JSS3VocabItem(
          french: 'se produire / avoir lieu',
          phonetics: '[sə pʁɔ.dɥiʁ] / [a.vwaʁ ljø]',
          english: 'to happen / to take place',
          usageNote: 'Un grand événement vient d\'avoir lieu au stade national.',
          icon: Icons.event_available_rounded,
          audioKey: 't2w2_se_produire',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Comment forme-t-on le Passé Récent en français ?',
          options: [
            'ALLER + infinitif',
            'VENIR (au présent) + DE + infinitif',
            'AVOIR + participe passé',
            'ÊTRE + adjectif',
          ],
          correctOptionIndex: 1,
          explanation: 'The Passé Récent formula is: VENIR (conjugated in present) + DE (or D\') + INFINITIF.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Complétez : « Nous ___ de terminer notre devoir de français. »',
          options: ['venons', 'vient', 'venez', 'viennent'],
          correctOptionIndex: 0,
          explanation: 'For the subject "Nous", the present tense of venir is "venons" : "Nous venons de terminer".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Traduisez : "The bell has just rung."',
          options: [
            'La cloche va sonner.',
            'La cloche vient de sonner.',
            'La cloche a sonné hier.',
            'La cloche sonnait toujours.',
          ],
          correctOptionIndex: 1,
          explanation: '"Has just rung" translates to the Passé Récent : "La cloche vient de sonner".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Que devient "de" devant un verbe commençant par une voyelle (ex: arriver) ?',
          options: ['du arriver', 'de arriver', 'd\'arriver', 'des arriver'],
          correctOptionIndex: 2,
          explanation: '"De" elides to "d\'" before a vowel or silent h : "Il vient d\'arriver".',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Conjugue le verbe VENIR au présent pour tous les pronoms.',
          answer: 'Je viens, tu viens, il/elle/on vient, nous venons, vous venez, ils/elles viennent.',
          hint: 'Remember: je viens, tu viens, il vient, nous venons, vous venez, ils viennent.',
        ),
        JSS3EvaluationQuestion(
          question: 'Transforme cette phrase au passé récent : "Les élèves finissent le contrôle."',
          answer: '"Les élèves viennent de finir le contrôle."',
          hint: 'Use viennent + de + finir.',
        ),
        JSS3EvaluationQuestion(
          question: 'Annonce une nouvelle sportive récente en français (ex: Super Eagles).',
          answer: 'Exemple : "Flash info : L\'équipe du Nigeria vient de marquer le deuxième but de la finale !"',
          hint: 'Use "Flash info / Les Super Eagles viennent de..."',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Journaliste en herbe',
          instruction: 'Write 4 breaking news headlines about recent happenings in your school or neighborhood using "venir de + infinitif".',
          exampleResponse: '1. Notre école vient d\'inaugurer une nouvelle bibliothèque. 2. Le club de français vient de remporter le premier prix. 3. Le proviseur vient d\'arriver au rassemblement. 4. Mes camarades viennent de terminer leur projet scientifique.',
        ),
        JSS3AssignmentTask(
          category: 'Exercice de transformation',
          instruction: 'Transform 5 present tense sentences into the Passé Récent in your notebook.',
          exampleResponse: '1. Je mange -> Je viens de manger. 2. Tu sors -> Tu viens de sortir. 3. Elle arrive -> Elle vient d\'arriver. 4. Nous gagnons -> Nous venons de gagner. 5. Ils partent -> Ils viennent de partir.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Le Passé Récent: VENIR + DE + INFINITIF',
        explanation:
            '1. Definition & Usage:\nThe Passé Récent expresses an action that occurred immediately before the present moment (equivalent to "have/has just done" in English).\n\n2. Conjugation Structure:\n• Je viens de + infinitif (Je viens de manger)\n• Tu viens de + infinitif (Tu viens de parler)\n• Il / Elle / On vient de + infinitif (Il vient de partir)\n• Nous venons de + infinitif (Nous venons d\'arriver)\n• Vous venez de + infinitif (Vous venez d\'entendre)\n• Ils / Elles viennent de + infinitif (Elles viennent de gagner)\n\n3. Elision Rule:\n"de" becomes "d\'" before a vowel or mute h: "Nous venons d\'entrer."',
        examples: [
          'Le train vient de partir il y a deux minutes. (The train has just left 2 minutes ago.)',
          'Attention ! Le sol vient d\'être lavé. (Careful! The floor has just been cleaned.)',
          'Mes parents viennent d\'acheter une nouvelle voiture. (My parents have just bought a new car.)',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 3 — Unité 3: Comprendre un récit / Écrire son journal
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 3,
      termNumber: 2,
      theme: 'Unité 3',
      frenchTitle: 'Comprendre un récit et écrire son journal intime',
      englishSubtitle: 'Narrative Comprehension & Writing a Personal Diary',
      teacherFacilitatorPrompt:
          'Discuss the concept of a personal diary (le journal intime). Explain standard French diary conventions: date at the top right, greeting "Cher journal,", emotional reflections, and sign-off. Guide pupils through a comprehension passage of a secondary student\'s diary entry before launching the Diary Studio.',
      objectives: [
        'Read and comprehend a structured French personal narrative passage.',
        'Format and write a personal diary entry with appropriate date and salutation.',
        'Express personal feelings, hopes, fears, and secret reflections in French.',
        'Extract specific details (who, what, where, when, why) from a narrative text.',
      ],
      culturalInsight:
          'Diary keeping (*la tenue d\'un journal intime*) has a celebrated history in Francophone culture, from classic youth literature to historical memoirs. In secondary school, writing a diary develops reflective thinking, emotional intelligence, and narrative mastery for the BECE written composition test.',
      patternType: JSS3PatternType.diaryAndNarrativeStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'cher journal / mon cher journal',
          phonetics: '[ʃɛʁ ʒuʁ.nal]',
          english: 'dear diary / my dear diary',
          usageNote: 'Cher journal, aujourd\'hui a été une journée incroyable !',
          icon: Icons.book_rounded,
          audioKey: 't2w3_cher_journal',
        ),
        JSS3VocabItem(
          french: 'un secret / une confidence',
          phonetics: '[œ̃ sə.kʁɛ] / [yn kɔ̃.fi.dɑ̃s]',
          english: 'a secret / a confidence',
          usageNote: 'Je vais te confier un grand secret que personne ne sait.',
          icon: Icons.lock_person_rounded,
          audioKey: 't2w3_secret_confidence',
        ),
        JSS3VocabItem(
          french: 'ressentir de la joie / de la fierté',
          phonetics: '[ʁə.sɑ̃.tiʁ də la ʒwa] / [fœʁ.te]',
          english: 'to feel joy / pride',
          usageNote: 'J\'ai ressenti une immense fierté quand j\'ai reçu mon bulletin.',
          icon: Icons.favorite_rounded,
          audioKey: 't2w3_ressentir_joie',
        ),
        JSS3VocabItem(
          french: 'être inquiet / soulagé',
          phonetics: '[ɛtʁ ɛ̃.kjɛ] / [su.la.ʒe]',
          english: 'to be worried / relieved',
          usageNote: 'J\'étais inquiet pour le test, mais maintenant je suis soulagé.',
          icon: Icons.mood_rounded,
          audioKey: 't2w3_inquiet_soulage',
        ),
        JSS3VocabItem(
          french: 'il m\'est arrivé une aventure',
          phonetics: '[il mɛt‿a.ʁi.ve yn a.vɑ̃.tyʁ]',
          english: 'an adventure happened to me',
          usageNote: 'Aujourd\'hui, il m\'est arrivé quelque chose d\'extraordinaire.',
          icon: Icons.explore_rounded,
          audioKey: 't2w3_aventure_arrivee',
        ),
        JSS3VocabItem(
          french: 'la déception / l\'espoir',
          phonetics: '[la de.sɛp.sjɔ̃] / [lɛs.pwaʁ]',
          english: 'disappointment / hope',
          usageNote: 'Malgré la déception, je garde l\'espoir de réussir.',
          icon: Icons.wb_sunny_rounded,
          audioKey: 't2w3_deception_espoir',
        ),
        JSS3VocabItem(
          french: 'à demain / bonne nuit cher journal',
          phonetics: '[a də.mɛ̃] / [bɔn nɥi ʃɛʁ ʒuʁ.nal]',
          english: 'see you tomorrow / good night dear diary',
          usageNote: 'Il se fait tard, je dois dormir. À demain, cher journal !',
          icon: Icons.nightlight_round,
          audioKey: 't2w3_a_demain_journal',
        ),
        JSS3VocabItem(
          french: 'garder en mémoire / se rappeler',
          phonetics: '[ɡaʁ.de ɑ̃ me.mwaʁ] / [sə ʁa.pə.le]',
          english: 'to keep in memory / to recall',
          usageNote: 'Je garderai cette journée gravée dans ma mémoire pour toujours.',
          icon: Icons.save_rounded,
          audioKey: 't2w3_garder_en_memoire',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Comment commence-t-on traditionnellement une page de journal intime en français ?',
          options: [
            'Monsieur le Directeur,',
            'Cher journal, (avec la date en haut)',
            'À qui de droit,',
            'Chers clients,',
          ],
          correctOptionIndex: 1,
          explanation: 'A diary entry starts with the date at the top and the salutation "Cher journal,".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quel sentiment exprime : "Je n\'ai plus peur, tout s\'est bien passé" ?',
          options: ['la colère', 'le soulagement', 'la jalousie', 'la tristesse'],
          correctOptionIndex: 1,
          explanation: '"Le soulagement" (being relieved) expresses peace of mind after anxiety.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Que signifie l\'expression "Il m\'est arrivé..." ?',
          options: ['I am going to arrive', 'Something happened to me', 'I arrived yesterday', 'I will never arrive'],
          correctOptionIndex: 1,
          explanation: '"Il m\'est arrivé [quelque chose]" means "Something happened to me".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Où se place la date sur une page de journal intime ?',
          options: ['Tout en bas à gauche', 'En haut à droite de la page', 'Au milieu du texte', 'Sur la couverture seulement'],
          correctOptionIndex: 1,
          explanation: 'The date is written at the top right of the page before the salutation.',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Quels sont les 4 éléments obligatoires dans la mise en page d\'un journal intime ?',
          answer: '1. La date (en haut à droite, ex: "Lundi 12 février 2026") 2. La formule d\'ouverture ("Cher journal,") 3. Le corps du texte au passé avec expressions de sentiments 4. La formule de clôture ("À demain," ou "Bonne nuit,").',
          hint: 'Date, Salutation, Body text, Sign-off.',
        ),
        JSS3EvaluationQuestion(
          question: 'Écris 2 phrases exprimant un sentiment de joie et de fierté dans ton journal.',
          answer: 'Exemple : "Aujourd\'hui, j\'ai reçu la meilleure note en mathématiques ! J\'ai ressenti une immense fierté et mes parents étaient très heureux."',
          hint: 'Use "ressentir de la fierté", "être heureux / ravi".',
        ),
        JSS3EvaluationQuestion(
          question: 'Pourquoi le journal intime est-il un excellent exercice pour le BECE ?',
          answer: 'Il permet de pratiquer à la fois la narration au passé (Passé Composé / Imparfait), l\'expression des sentiments, et la structuration chronologique des idées.',
          hint: 'Narrative tenses, emotional vocabulary, structured essay skills.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Mon Journal Intime',
          instruction: 'Draft a full diary entry (6–8 sentences) about a special day at school (e.g. sports day, inter-house competition, or exam victory). Follow standard diary layout.',
          exampleResponse: 'Vendredi 15 mars 2026\n\nCher journal,\n\nQuelle journée inoubliable ! Ce matin, notre maison scolaire (Green House) a remporté le championnat d\'athlétisme. Au début, j\'étais très stressé avant ma course de 100 mètres. Mais quand le coup de sifflet a retenti, j\'ai couru de toutes mes forces et j\'ai terminé premier ! Tout le stade a crié mon nom. Je ressens une immense joie. Je n\'oublierai jamais ce moment. À demain !',
        ),
        JSS3AssignmentTask(
          category: 'Vocabulaire des émotions',
          instruction: 'Match 5 emotional expressions in French with their English meanings in your notebook.',
          exampleResponse: '1. Être ravi(e) = to be delighted. 2. Avoir le trac = to have stage fright. 3. Être soulagé(e) = to be relieved. 4. Garder l\'espoir = to keep hope. 5. Être fier / fière = to be proud.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Conventions & Syntax of Personal Diary Writing',
        explanation:
            'A French diary entry follows structured stylistic conventions:\n\n1. Layout & Presentation:\n• Top Right: Date in full French (ex: "Mercredi 18 février 2026")\n• Greeting: "Cher journal," (followed by a comma and new line)\n• Sign-off: "À demain,", "Bonne nuit,", "À plus tard,"\n\n2. Tone & Tense Integration:\n• First-person pronoun "Je / Moi"\n• Combines Passé Composé (events that happened today) + Imparfait (how you felt / atmosphere) + Futur Proche (plans for tomorrow: "Demain je vais...").\n\n3. Emotional Verbs:\n• Se sentir + adjectif (Je me sens fier / soulagé)\n• Ressentir + nom (Je ressens de la joie / de l\'angoisse)\n• Avoir + nom (J\'ai peur / j\'ai confiance)',
        examples: [
          'Jeudi 20 avril 2026 — Cher journal, aujourd\'hui j\'ai vécu un moment magique.',
          'Je me sentais un peu intimidé, mais mes amis m\'ont encouragé.',
          'Demain, je vais donner le meilleur de moi-même pour l\'épreuve.',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 4 — Unité 4: Dire ce que l’on va faire (Le Futur Proche)
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 4,
      termNumber: 2,
      theme: 'Unité 4',
      frenchTitle: 'Dire ce que l’on va faire : le futur proche et les intentions',
      englishSubtitle: 'Expressing Immediate Intentions & Near Future (Aller + Infinitif)',
      teacherFacilitatorPrompt:
          'Ask pupils: "Qu\'est-ce que vous allez faire ce week-end ?" Teach the near future formula: ALLER (au présent) + INFINITIF. Practice building near-future schedules for the next 24 to 48 hours (school activities, sports, travel plans). Open the Near Future Planner Studio.',
      objectives: [
        'Conjugate and master the Futur Proche (ALLER + infinitif) with all subject pronouns.',
        'Express personal intentions, immediate plans, and weekend schedules in French.',
        'Form negative and interrogative near-future sentences (Ne... pas aller / Qu\'est-ce que tu vas faire ?).',
        'Compare immediate intentions with general habits.',
      ],
      culturalInsight:
          'In everyday spoken French and Francophone diplomatic circles, the Futur Proche is the most frequently used tense for upcoming actions because it communicates certainty and dynamism ("Nous allons signer l\'accord ce soir"). Mastered early, it gives Nigerian students immediate conversational confidence.',
      patternType: JSS3PatternType.nearFutureIntentionsStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'qu\'est-ce que tu vas faire ?',
          phonetics: '[kɛs kə ty va fɛʁ]',
          english: 'what are you going to do?',
          usageNote: 'Qu\'est-ce que tu vas faire après les cours ?',
          icon: Icons.help_outline_rounded,
          audioKey: 't2w4_que_vas_tu_faire',
        ),
        JSS3VocabItem(
          french: 'je vais étudier / réviser',
          phonetics: '[ʒə ve.z‿e.ty.dje] / [ʁe.vi.ze]',
          english: 'I am going to study / revise',
          usageNote: 'Ce soir, je vais réviser mes verbes de français.',
          icon: Icons.menu_book_rounded,
          audioKey: 't2w4_vais_etudier',
        ),
        JSS3VocabItem(
          french: 'nous allons voyager / partir',
          phonetics: '[nu.z‿a.lɔ̃ vwa.ja.ʒe] / [paʁ.tiʁ]',
          english: 'we are going to travel / leave',
          usageNote: 'Le week-end prochain, nous allons voyager à Ibadan.',
          icon: Icons.flight_takeoff_rounded,
          audioKey: 't2w4_allons_voyager',
        ),
        JSS3VocabItem(
          french: 'bientôt / tout à l\'heure',
          phonetics: '[bjɛ̃.to] / [tu.t‿a lœʁ]',
          english: 'soon / in a short while',
          usageNote: 'Le match va commencer tout à l\'heure.',
          icon: Icons.access_time_rounded,
          audioKey: 't2w4_bientot_tout_a_l_heure',
        ),
        JSS3VocabItem(
          french: 'ce week-end / ce soir',
          phonetics: '[sə wi.kɛnd] / [sə swaʁ]',
          english: 'this weekend / this evening',
          usageNote: 'Ce week-end, je vais aider mes parents à la maison.',
          icon: Icons.calendar_view_week_rounded,
          audioKey: 't2w4_ce_weekend_soir',
        ),
        JSS3VocabItem(
          french: 'avoir l\'intention de + infinitif',
          phonetics: '[a.vwaʁ lɛ̃.tɑ̃.sjɔ̃ də]',
          english: 'to intend to (do something)',
          usageNote: 'J\'ai l\'intention de passer le BECE avec mention très bien.',
          icon: Icons.lightbulb_rounded,
          audioKey: 't2w4_intention_de',
        ),
        JSS3VocabItem(
          french: 'se préparer à / planifier',
          phonetics: '[sə pʁe.pa.ʁe a] / [pla.ni.fje]',
          english: 'to get ready to / to plan',
          usageNote: 'Toute la classe va se préparer sérieusement pour l\'examen.',
          icon: Icons.checklist_rounded,
          audioKey: 't2w4_preparer_planifier',
        ),
        JSS3VocabItem(
          french: 'ne pas aller + infinitif',
          phonetics: '[nə pa.z‿a.le]',
          english: 'not going to (do something)',
          usageNote: 'Je ne vais pas gaspiller mon temps sur les réseaux sociaux.',
          icon: Icons.block_rounded,
          audioKey: 't2w4_ne_pas_aller',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Comment forme-t-on le Futur Proche en français ?',
          options: [
            'AVOIR + infinitif',
            'ALLER (au présent) + INFINITIF',
            'ÊTRE + participe passé',
            'VENIR + DE + infinitif',
          ],
          correctOptionIndex: 1,
          explanation: 'The Futur Proche formula is: ALLER (conjugated in present) + INFINITIF (e.g. Je vais manger).',
        ),
        JSS3InteractiveExercise(
          prompt: 'Complétez : « Demain, les élèves ___ visiter le musée national. »',
          options: ['vont', 'vas', 'va', 'allons'],
          correctOptionIndex: 0,
          explanation: 'For the plural subject "Les élèves" (ils), the form of aller is "vont" : "vont visiter".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Où se placent "ne... pas" au Futur Proche ? (ex: Je ne vais pas dormir)',
          options: [
            'Autour du verbe aller (Je ne vais pas dormir)',
            'Autour de l\'infinitif (Je vais ne dormir pas)',
            'À la fin de la phrase (Je vais dormir ne pas)',
            'Au début seulement (Ne pas je vais dormir)',
          ],
          correctOptionIndex: 0,
          explanation: 'In negation, "ne... pas" surrounds the conjugated auxiliary verb aller: "Je ne vais pas + infinitif".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Traduisez : "We are going to celebrate our victory."',
          options: [
            'Nous venons de célébrer notre victoire.',
            'Nous allons célébrer notre victoire.',
            'Nous célébrons notre victoire hier.',
            'Nous avons célébré notre victoire.',
          ],
          correctOptionIndex: 1,
          explanation: '"We are going to celebrate" translates to Futur Proche : "Nous allons célébrer".',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Conjugue le verbe ALLER au présent de l\'indicatif.',
          answer: 'Je vais, tu vas, il/elle/on va, nous allons, vous allez, ils/elles vont.',
          hint: 'Remember: vais, vas, va, allons, allez, vont.',
        ),
        JSS3EvaluationQuestion(
          question: 'Écris 3 phrases décrivant ce que tu vas faire ce week-end.',
          answer: 'Exemple : "1. Samedi matin, je vais faire mes devoirs. 2. L\'après-midi, je vais jouer au football avec mes amis. 3. Dimanche, nous allons aller à l\'église en famille."',
          hint: 'Use "Je vais + infinitif" or "Nous allons + infinitif".',
        ),
        JSS3EvaluationQuestion(
          question: 'Mets cette phrase à la forme négative : "Je vais regarder la télévision."',
          answer: '"Je ne vais pas regarder la télévision."',
          hint: 'Place ne... pas around "vais".',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Mon emploi du temps du week-end',
          instruction: 'Write out your near future plan for Saturday and Sunday in 6 sentences using the Futur Proche (e.g. Samedi matin, je vais...).',
          exampleResponse: 'Samedi matin, je vais me réveiller à sept heures. Ensuite, je vais aider ma mère au marché. L\'après-midi, mes amis et moi allons réviser la leçon de sciences. Dimanche matin, nous allons assister au culte. L\'après-midi, je vais me reposer. Enfin, dimanche soir, je vais préparer mon sac pour l\'école.',
        ),
        JSS3AssignmentTask(
          category: 'Transformation au Futur Proche',
          instruction: 'Transform 5 present tense sentences into the Futur Proche in your notebook.',
          exampleResponse: '1. J\'écris une lettre -> Je vais écrire une lettre. 2. Tu apprends le français -> Tu vas apprendre le français. 3. Nous partons en voyage -> Nous allons partir en voyage. 4. Fatima cuisine -> Fatima va cuisiner. 5. Ils gagnent le match -> Ils vont gagner le match.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Le Futur Proche: Formation, Négation & Interrogation',
        explanation:
            '1. Formation of Futur Proche:\nSubject + Present Tense of ALLER + INFINITIVE\n• Je vais parler (I am going to speak)\n• Tu vas finir (You are going to finish)\n• Il / Elle va partir (He/She is going to leave)\n• Nous allons étudier (We are going to study)\n• Vous allez réussir (You are going to succeed)\n• Ils / Elles vont gagner (They are going to win)\n\n2. Negation:\n"Ne" goes before ALLER and "pas" goes after ALLER:\n• "Je NE vais PAS abandonner." (I am not going to give up.)\n\n3. Questions:\n• "Qu\'est-ce que tu vas faire ?" / "Vas-tu voyager ?"',
        examples: [
          'Ce soir, nous allons regarder un film en français. (Tonight we are going to watch a film in French.)',
          'Est-ce que vous allez participer au grand rallye ? (Are you going to participate in the grand rally?)',
          'Elle ne va pas sortir sous la pluie. (She is not going to go out in the rain.)',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 5 — Unité 5: Faire des projets d'avenir (Le Futur Simple)
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 5,
      termNumber: 2,
      theme: 'Unité 5',
      frenchTitle: 'Faire des projets d\'avenir : le futur simple',
      englishSubtitle: 'Future Plans & Career Aspirations — Le Futur Simple',
      teacherFacilitatorPrompt:
          'Inspire pupils to look ahead to Senior Secondary School (SS1), university, and future careers ("Quand vous serez grands, que ferez-vous ?"). Introduce the Futur Simple tense: regular verb formation (infinitive + -ai, -as, -a, -ons, -ez, -ont) and key irregular stems (être ➔ ser-, avoir ➔ aur-, faire ➔ fer-, aller ➔ ir-, pouvoir ➔ pourr-, vouloir ➔ voudr-). Open the Future Aspirations Studio.',
      objectives: [
        'Form and conjugate the Futur Simple for regular -ER, -IR, and -RE verbs.',
        'Master the 6 high-yield irregular Futur Simple stems (ser-, aur-, fer-, ir-, pourr-, voudr-).',
        'Express future career ambitions and 5-to-10 year life projections in French.',
        'Construct conditional hypotheses with "SI + présent ➔ futur simple".',
      ],
      culturalInsight:
          'Career aspirations (*les projets d\'avenir*) in Nigeria and Francophone Africa encompass technology, medicine, engineering, diplomacy, and aviation. In the BECE exam, questions frequently test students\' ability to project into the future using the Futur Simple ("Quand je serai grand, je serai médecin pour soigner les malades").',
      patternType: JSS3PatternType.futurePlansAndAspirationsStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'quand je serai grand(e)',
          phonetics: '[kɑ̃ ʒə sə.ʁe ɡʁɑ̃]',
          english: 'when I grow up / when I am older',
          usageNote: 'Quand je serai grand, je serai ingénieur en informatique.',
          icon: Icons.trending_up_rounded,
          audioKey: 't2w5_quand_je_serai_grand',
        ),
        JSS3VocabItem(
          french: 'je serai / j\'aurai',
          phonetics: '[ʒə sə.ʁe] / [ʒo.ʁe]',
          english: 'I will be / I will have',
          usageNote: 'Dans dix ans, j\'aurai mon diplôme universitaire et je serai médecin.',
          icon: Icons.star_rounded,
          audioKey: 't2w5_serai_aurai',
        ),
        JSS3VocabItem(
          french: 'je ferai / j\'irai',
          phonetics: '[ʒə fə.ʁe] / [ʒi.ʁe]',
          english: 'I will do / I will go',
          usageNote: 'Après le BECE, j\'irai au lycée et je ferai des études scientifiques.',
          icon: Icons.flight_rounded,
          audioKey: 't2w5_ferai_irai',
        ),
        JSS3VocabItem(
          french: 'à l\'avenir / dans le futur',
          phonetics: '[a la.və.niʁ] / [dɑ̃ lə fy.tyʁ]',
          english: 'in the future / in days to come',
          usageNote: 'À l\'avenir, la technologie transformera l\'éducation en Afrique.',
          icon: Icons.psychology_rounded,
          audioKey: 't2w5_avenir_futur',
        ),
        JSS3VocabItem(
          french: 'réaliser mes rêves / réussir',
          phonetics: '[ʁe.a.li.ze me ʁɛv] / [ʁe.y.siʁ]',
          english: 'to achieve my dreams / to succeed',
          usageNote: 'Grâce au travail acharné, nous réussirons tous nos examens.',
          icon: Icons.workspace_premium_rounded,
          audioKey: 't2w5_realiser_reves',
        ),
        JSS3VocabItem(
          french: 'étudier à l\'université',
          phonetics: '[e.ty.dje a ly.ni.vɛʁ.si.te]',
          english: 'to study at university',
          usageNote: 'Mon frère étudiera le droit et les relations internationales.',
          icon: Icons.school_rounded,
          audioKey: 't2w5_etudier_universite',
        ),
        JSS3VocabItem(
          french: 'voyager à travers le monde',
          phonetics: '[vwa.ja.ʒe a tʁa.vɛʁ lə mɔ̃d]',
          english: 'to travel across the world',
          usageNote: 'Plus tard, je visiterai la France, le Sénégal et le Canada.',
          icon: Icons.public_rounded,
          audioKey: 't2w5_voyager_monde',
        ),
        JSS3VocabItem(
          french: 'si je travaille dur, je réussirai',
          phonetics: '[si ʒə tʁa.vaj dyʁ ʒə ʁe.y.si.ʁe]',
          english: 'if I work hard, I will succeed',
          usageNote: 'Règle d\'or : Si tu révises bien, tu obtiendras d\'excellentes notes.',
          icon: Icons.auto_awesome_rounded,
          audioKey: 't2w5_si_travaille_reussirai',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Quelles sont les terminaisons du Futur Simple pour tous les verbes ?',
          options: [
            '-ais, -ais, -ait, -ions, -iez, -aient',
            '-ai, -as, -a, -ons, -ez, -ont',
            '-e, -es, -e, -ons, -ez, -ent',
            '-is, -is, -it, -issons, -issez, -issent',
          ],
          correctOptionIndex: 1,
          explanation: 'The universal Futur Simple endings are: -ai, -as, -a, -ons, -ez, -ont.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quel est le radical du verbe ÊTRE au Futur Simple ?',
          options: ['êt-', 'ser-', 'ét-', 'fu-'],
          correctOptionIndex: 1,
          explanation: 'The irregular stem of ÊTRE in the future simple is "ser-" : je serai, tu seras, il sera.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Complétez : « Quand nous serons grands, nous ___ (voyager) en France. »',
          options: ['voyagerons', 'voyageront', 'voyagerez', 'voyagerai'],
          correctOptionIndex: 0,
          explanation: 'For "nous", the ending is "-ons" : "nous voyagerons".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Complétez la structure d\'hypothèse : « Si tu étudies bien, tu ___ l\'examen. » (réussir)',
          options: ['réussissais', 'réussiras', 'as réussi', 'réussir'],
          correctOptionIndex: 1,
          explanation: 'Rule: "SI + présent ➔ FUTUR SIMPLE": "Si tu étudies bien, tu réussiras l\'examen."',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Conjugue le verbe AVOIR et le verbe ÊTRE au futur simple pour tous les pronoms.',
          answer: 'AVOIR : J\'aurai, tu auras, il/elle aura, nous aurons, vous aurez, ils/elles auront. / ÊTRE : Je serai, tu seras, il/elle sera, nous serons, vous serez, ils/elles seront.',
          hint: 'Stems: aur- and ser- with endings -ai, -as, -a, -ons, -ez, -ont.',
        ),
        JSS3EvaluationQuestion(
          question: 'Écris 3 phrases sur ce que tu feras dans 10 ans en utilisant le futur simple.',
          answer: 'Exemple : "Dans dix ans, je serai ingénieur. J\'habiterai dans une belle maison et je voyagerai dans plusieurs pays francophones."',
          hint: 'Use "serai", "habiterai", "travaillerai", "voyagerai".',
        ),
        JSS3EvaluationQuestion(
          question: 'Explique la différence d\'utilisation entre le Futur Proche et le Futur Simple.',
          answer: 'Le Futur Proche (Aller + inf) exprime une action IMMÉDIATE ou très certaine dans un court délai ("Je vais manger maintenant"). Le Futur Simple exprime des PROJETS D\'AVENIR à moyen ou long terme, des prédictions ou des hypothèses ("Plus tard, je serai médecin").',
          hint: 'Near/immediate certainty vs Long-term projection/destiny.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Mes projets d\'avenir (BECE Composition)',
          instruction: 'Write a 6–8 sentence essay titled "Mon Métier de Rêve et Mes Projets d\'Avenir". Use at least 4 different verbs in the Futur Simple (including irregular stems).',
          exampleResponse: 'Quand je serai grand, je serai médecin spécialiste. J\'étudierai la médecine à l\'université et je soignerai les personnes malades dans mon pays. J\'aurai un grand hôpital moderne à Abuja. Pendant mes vacances, j\'irai en France pour assister à des conférences médicales. Je ferai tout mon possible pour rendre mes parents fiers de moi. Si je travaille avec discipline, je réaliserai tous mes rêves !',
        ),
        JSS3AssignmentTask(
          category: 'Radicaux irréguliers du futur',
          instruction: 'Memorize and list the future stems and "Je" forms of: Être, Avoir, Faire, Aller, Pouvoir, Vouloir, Venir, Voir.',
          exampleResponse: '1. Être -> ser- (Je serai). 2. Avoir -> aur- (J\'aurai). 3. Faire -> fer- (Je ferai). 4. Aller -> ir- (J\'irai). 5. Pouvoir -> pourr- (Je pourrai). 6. Vouloir -> voudr- (Je voudrai). 7. Venir -> viendr- (Je viendrai). 8. Voir -> verr- (Je verrai).',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Le Futur Simple: Formation, Terminaisons & Radicaux Irréguliers',
        explanation:
            '1. Regular Verbs Formation:\nTake the INFINITIVE and add the universal endings:\n• -ER verbs (Parler): Je parlerai, tu parleras, il parlera, nous parlerons, vous parlerez, ils parleront.\n• -IR verbs (Finir): Je finirai, tu finiras, il finira, nous finirons, vous finirez, ils finiront.\n• -RE verbs (Prendre): Drop the final "e" -> prendr- + endings: Je prendrai, tu prendras...\n\n2. Universal Endings:\n-ai, -as, -a, -ons, -ez, -ont (Note: these resemble the present tense of AVOIR!)\n\n3. High-Yield Irregular Stems (BECE Exam Favorites):\n• Être ➔ ser-\n• Avoir ➔ aur-\n• Faire ➔ fer-\n• Aller ➔ ir-\n• Pouvoir ➔ pourr-\n• Vouloir ➔ voudr-\n• Venir ➔ viendr-\n• Voir ➔ verr-\n• Savoir ➔ saur-',
        examples: [
          'L\'année prochaine, nous serons en classe de SS 1. (Next year we will be in SS 1 class.)',
          'S\'il fait beau demain, nous irons à la plage. (If the weather is fine tomorrow, we will go to the beach.)',
          'Avec la grâce de Dieu, ils réussiront tous au brevet du BECE.',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 6 — Unité 6: Consolidation orale et écrite
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 6,
      termNumber: 2,
      theme: 'Unité 6',
      frenchTitle: 'Consolidation orale et écrite : jeux de rôles et dialogues',
      englishSubtitle: 'Oral & Written Consolidation — Multi-Scenario Roleplays',
      teacherFacilitatorPrompt:
          'Consolidate all skills learned in Weeks 1 to 5. Organize 4 communicative stations across the classroom: (1) Past Anecdote Station, (2) Breaking News Desk, (3) Diary Reading Corner, and (4) Future Ambitions Debate. Launch the Interactive Consolidation Theatre.',
      objectives: [
        'Perform multi-turn communicative dialogues switching between Past, Present, and Future.',
        'Synthesize news reports, diary readings, and future projections with native pronunciation.',
        'Self-correct common grammatical errors in tense concordance.',
        'Demonstrate oral fluency and team collaboration in roleplay simulations.',
      ],
      culturalInsight:
          'Interactive drama and simulated press conferences (*les simulations de conférences de presse et débats scolaires*) are proven pedagogical methods in Nigerian French language centers (like the French Village in Badagry). They transition learners from passive grammar knowledge to active, spontaneous oral production.',
      patternType: JSS3PatternType.term2ConsolidationStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'prendre la parole / s\'exprimer',
          phonetics: '[pʁɑ̃dʁ la pa.ʁɔl] / [sɛks.pʁi.me]',
          english: 'to speak up / to express oneself',
          usageNote: 'C\'est à ton tour de prendre la parole devant la classe.',
          icon: Icons.mic_rounded,
          audioKey: 't2w6_prendre_parole',
        ),
        JSS3VocabItem(
          french: 'un jeu de rôle / une saynète',
          phonetics: '[œ̃ ʒø də ʁol] / [yn sɛ.nɛt]',
          english: 'a roleplay / a short sketch',
          usageNote: 'Nous allons jouer une saynète entre un journaliste et un champion.',
          icon: Icons.theater_comedy_rounded,
          audioKey: 't2w6_jeu_de_role',
        ),
        JSS3VocabItem(
          french: 'à mon avis / selon moi',
          phonetics: '[a mɔ̃.n‿a.vi] / [sə.lɔ̃ mwa]',
          english: 'in my opinion / according to me',
          usageNote: 'À mon avis, le futur simple est plus facile que le subjonctif.',
          icon: Icons.psychology_alt_rounded,
          audioKey: 't2w6_a_mon_avis',
        ),
        JSS3VocabItem(
          french: 'être d\'accord / pas d\'accord',
          phonetics: '[ɛtʁ da.kɔʁ] / [pa da.kɔʁ]',
          english: 'to agree / to disagree',
          usageNote: 'Je suis tout à fait d\'accord avec cette proposition.',
          icon: Icons.handshake_rounded,
          audioKey: 't2w6_daccord_pas_daccord',
        ),
        JSS3VocabItem(
          french: 'résumer les points essentiels',
          phonetics: '[ʁe.zy.me le pwɛ̃.z‿e.sɑ̃.sjɛl]',
          english: 'to summarize key points',
          usageNote: 'Résumez en trois phrases les événements de la semaine.',
          icon: Icons.summarize_rounded,
          audioKey: 't2w6_resumer_points',
        ),
        JSS3VocabItem(
          french: 'un dialogue captivant',
          phonetics: '[œ̃ dja.lɔɡ kap.ti.vɑ̃]',
          english: 'a captivating dialogue',
          usageNote: 'Ce dialogue entre les deux élèves était vivant et captivant.',
          icon: Icons.chat_bubble_rounded,
          audioKey: 't2w6_dialogue_captivant',
        ),
        JSS3VocabItem(
          french: 'corriger les fautes',
          phonetics: '[kɔ.ʁi.ʒe le fot]',
          english: 'to correct mistakes',
          usageNote: 'Écoutons attentivement pour corriger les fautes de prononciation.',
          icon: Icons.spellcheck_rounded,
          audioKey: 't2w6_corriger_fautes',
        ),
        JSS3VocabItem(
          french: 'félicitations pour la prestation !',
          phonetics: '[fe.li.si.ta.sjɔ̃ puʁ la pʁɛs.ta.sjɔ̃]',
          english: 'congratulations on the performance!',
          usageNote: 'Bravo à toute l\'équipe pour cette belle prestation théâtrale !',
          icon: Icons.celebration_rounded,
          audioKey: 't2w6_felicitations_prestation',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Quel temps utilise-t-on pour rapporter une action qui vient tout juste de se terminer ?',
          options: ['Le Futur Simple', 'Le Passé Récent (Venir de)', 'L\'Imparfait', 'Le Plus-que-parfait'],
          correctOptionIndex: 1,
          explanation: 'The Passé Récent (Venir de + infinitif) is specifically used for actions that just finished.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Complétez le dialogue : « — Que feras-tu demain ? — Demain, je ___ réviser pour le BECE. »',
          options: ['vais', 'viens de', 'suis', 'faisais'],
          correctOptionIndex: 0,
          explanation: '"Demain, je vais réviser" uses the Futur Proche for immediate scheduled plans.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quelle expression utilise-t-on pour exprimer poliment son opinion personnelle ?',
          options: ['À mon avis / Selon moi', 'Tais-toi', 'C\'est faux', 'Peu importe'],
          correctOptionIndex: 0,
          explanation: '"À mon avis" or "Selon moi" politely introduces personal perspective.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Trouvez la phrase correcte associant le Passé Récent et le Futur Proche :',
          options: [
            'Je viens de manger et maintenant je vais étudier.',
            'Je vais de manger et maintenant je viens étudier.',
            'Je viens à manger et je vais d\'étudier.',
            'Je mangeais hier et je mangerai avant-hier.',
          ],
          correctOptionIndex: 0,
          explanation: '"Je viens de manger (Passé Récent) et maintenant je vais étudier (Futur Proche)" is grammatically flawless.',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Présente un mini-dialogue (4 répliques) entre deux élèves discutant de leur journée passée et de leurs projets du soir.',
          answer: '— Salut Fatima ! Qu\'est-ce qui s\'est passé aujourd\'hui ?\n— Salut Aminu ! Je viens de finir mon examen de sciences. C\'était difficile !\n— Et ce soir, que vas-tu faire ?\n— Ce soir, je vais me reposer et je regarderai un film avec ma famille.',
          hint: 'Include greeting, past/recent event, and near future plan.',
        ),
        JSS3EvaluationQuestion(
          question: 'Corrige cette phrase fautive : "Hier, je vais au marché et j\'ai acheter des fruits."',
          answer: 'Correction : "Hier, je suis allé au marché et j\'ai acheté des fruits."',
          hint: 'Aller takes Être (je suis allé); acheté needs past participle accent.',
        ),
        JSS3EvaluationQuestion(
          question: 'Comment exprime-t-on l\'accord et le désaccord lors d\'un débat en classe ?',
          answer: 'Accord : "Je suis d\'accord avec toi / C\'est exact." Désaccord : "Je ne suis pas d\'accord / Je pense plutôt que..."',
          hint: 'Agreement vs Disagreement formulas.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Dialogue écrit complet',
          instruction: 'Write an 8-line script between a TV journalist and an Olympic Nigerian athlete who just won a gold medal. Use Passé Récent, Passé Composé, and Futur Simple.',
          exampleResponse: 'Journaliste : Bonjour champion ! Vous venez de remporter la médaille d\'or. Quelles sont vos impressions ?\nAthlète : Je suis tellement ému ! Pendant la course, j\'étais très concentré. À la fin, j\'ai accéléré et j\'ai franchi la ligne en premier.\nJournaliste : Que ferez-vous après cette grande victoire ?\nAthlète : Demain, je vais célébrer avec mes supporters au Nigeria. À l\'avenir, je continuerai à m\'entraîner pour battre le record du monde !',
        ),
        JSS3AssignmentTask(
          category: 'Autocorrection grammaticale',
          instruction: 'Spot and correct 4 deliberate errors in a text in your notebook.',
          exampleResponse: '1. "Nous venons à arriver" -> "Nous venons d\'arriver". 2. "Elle serai" -> "Elle sera". 3. "Je ne vas pas" -> "Je ne vais pas". 4. "Pendant que je dormi" -> "Pendant que je dormais".',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'Synthesis of the 4 Tenses: Passé Composé, Imparfait, Futur Proche & Futur Simple',
        explanation:
            'A master summary table of the 4 core tenses required for BECE / Junior WAEC:\n\n1. PASSÉ COMPOSÉ : Avoir/Être + Participe passé -> Action ponctuelle terminée (J\'ai fini / Je suis venu).\n2. IMPARFAIT : Radical de "nous" au présent + -ais, -ais, -ait, -ions, -iez, -aient -> Description/Habitude passée (Il faisait beau / J\'étais petit).\n3. FUTUR PROCHE : Aller + Infinitif -> Action immédiate certaine (Je vais réviser).\n4. FUTUR SIMPLE : Infinitif + -ai, -as, -a, -ons, -ez, -ont -> Projet d\'avenir lointain (Je serai grand / J\'aurai du succès).',
        examples: [
          'Hier j\'ai étudié (PC), il faisait nuit (IMP), maintenant je vais dormir (FP), et demain je réussirai (FS).',
          'Tout à l\'heure je viens de parler (PR), dans un instant je vais sortir (FP).',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 7 — Unité 7: Préparation au BECE (Partie I)
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 7,
      termNumber: 2,
      theme: 'Unité 7',
      frenchTitle: 'Préparation intensive au BECE — Partie I : Grammaire & Conjugaison',
      englishSubtitle: 'BECE Examination Bootcamp — Part I: High-Yield Grammar & Tenses',
      teacherFacilitatorPrompt:
          'Set a serious, encouraging exam hall atmosphere. Review the exact structure of the BECE / Junior WAEC Paper 1 (Grammar, Tenses, Pronouns, Adjectives, Prepositions). Drill students on high-probability examination traps (DR MRS VANDERTRAMP agreements, irregular future stems, prepositions EN vs À, and negative placements). Open the BECE Grammar Bootcamp Studio.',
      objectives: [
        'Master high-yield BECE multiple-choice grammar questions with 100% accuracy.',
        'Apply pronoun replacement rules (COD / COI: le, la, les, lui, leur) correctly.',
        'Demonstrate mastery of tense concordances (SI + Présent ➔ Futur Simple).',
        'Analyze and resolve tricky past participle agreement traps.',
      ],
      culturalInsight:
          'The Basic Education Certificate Examination (BECE) is the national qualification benchmark determining senior secondary academic tracks in Nigeria. French is a prized distinguishing subject that boosts overall aggregate scores and opens international bilingual opportunities for students.',
      patternType: JSS3PatternType.beceGrammarPrepStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'l\'épreuve de grammaire / le QCM',
          phonetics: '[le.pʁœv də ɡʁa.mɛʁ] / [lə ky.se.ɛm]',
          english: 'grammar exam / multiple choice test',
          usageNote: 'Le QCM du BECE comporte cinquante questions à choix multiples.',
          icon: Icons.quiz_rounded,
          audioKey: 't2w7_epreuve_grammaire',
        ),
        JSS3VocabItem(
          french: 'la concordance des temps',
          phonetics: '[la kɔ̃.kɔʁ.dɑ̃s de tɑ̃]',
          english: 'tense agreement / concordance',
          usageNote: 'Veillez à respecter la concordance des temps dans vos phrases.',
          icon: Icons.schedule_send_rounded,
          audioKey: 't2w7_concordance_temps',
        ),
        JSS3VocabItem(
          french: 'le pronom d\'objet direct (le, la, les)',
          phonetics: '[lə pʁɔ.nɔ̃ dɔb.ʒɛ di.ʁɛkt]',
          english: 'direct object pronoun (COD)',
          usageNote: 'Tu as vu mon livre ? — Oui, je l\'ai vu sur la table.',
          icon: Icons.swap_horiz_rounded,
          audioKey: 't2w7_pronom_direct',
        ),
        JSS3VocabItem(
          french: 'le pronom indirect (lui, leur)',
          phonetics: '[lə pʁɔ.nɔ̃ ɛ̃.di.ʁɛkt]',
          english: 'indirect object pronoun (COI)',
          usageNote: 'Je parle à mon professeur ➔ Je lui parle poliment.',
          icon: Icons.forward_to_inbox_rounded,
          audioKey: 't2w7_pronom_indirect',
        ),
        JSS3VocabItem(
          french: 'choisir la bonne réponse',
          phonetics: '[ʃwa.ziʁ la bɔn ʁe.pɔ̃s]',
          english: 'to choose the correct answer',
          usageNote: 'Lisez chaque consigne avant de choisir la bonne réponse.',
          icon: Icons.check_box_rounded,
          audioKey: 't2w7_choisir_bonne_reponse',
        ),
        JSS3VocabItem(
          french: 'éviter les pièges d\'examen',
          phonetics: '[e.vi.te le pjɛʒ dɛɡ.za.mɛ̃]',
          english: 'to avoid exam traps',
          usageNote: 'Faites attention à l\'accord du participe passé pour éviter les pièges.',
          icon: Icons.warning_amber_rounded,
          audioKey: 't2w7_eviter_pieges',
        ),
        JSS3VocabItem(
          french: 'le temps alloué / gérer son temps',
          phonetics: '[lə tɑ̃ a.lwe] / [ʒe.ʁe sɔ̃ tɑ̃]',
          english: 'allocated time / to manage one\'s time',
          usageNote: 'Gérez bien votre temps : consacrez une minute par question.',
          icon: Icons.hourglass_bottom_rounded,
          audioKey: 't2w7_temps_alloue',
        ),
        JSS3VocabItem(
          french: 'la réussite avec mention',
          phonetics: '[la ʁe.y.sit a.vɛk mɑ̃.sjɔ̃]',
          english: 'success with honors / distinction',
          usageNote: 'Tous nos élèves visent la réussite avec mention très bien au BECE !',
          icon: Icons.military_tech_rounded,
          audioKey: 't2w7_reussite_mention',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'BECE DRILL 1 — « Fatima a acheté des robes et elle ___ a portées hier. » (Pronom)',
          options: ['les', 'la', 'lui', 'leur'],
          correctOptionIndex: 0,
          explanation: '"Des robes" is direct object plural feminine. The direct pronoun is "les" : "elle les a portées".',
        ),
        JSS3InteractiveExercise(
          prompt: 'BECE DRILL 2 — « Si nous étudions ensemble, nous ___ le brevet. » (réussir)',
          options: ['réussissons', 'réussirons', 'réussissions', 'avons réussi'],
          correctOptionIndex: 1,
          explanation: 'Rule: "SI + présent ➔ FUTUR SIMPLE": "nous réussirons".',
        ),
        JSS3InteractiveExercise(
          prompt: 'BECE DRILL 3 — « Les filles sont ___ à la fête hier soir. » (arriver)',
          options: ['arrivé', 'arrivée', 'arrivés', 'arrivées'],
          correctOptionIndex: 3,
          explanation: 'With ÊTRE, past participle agrees with feminine plural subject "Les filles" ➔ "arrivées".',
        ),
        JSS3InteractiveExercise(
          prompt: 'BECE DRILL 4 — « Je parle à mon père ➔ Je ___ parle. »',
          options: ['le', 'lui', 'la', 'leur'],
          correctOptionIndex: 1,
          explanation: '"À mon père" is singular indirect object. The indirect pronoun is "lui" : "Je lui parle".',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Remplace les mots soulignés par les pronoms convenables (le, la, les, lui, leur) :\n1. J\'écris une lettre à ma tante.\n2. Nous avons mangé le gâteau.',
          answer: '1. "J\'écris une lettre à ma tante" ➔ "Je lui écris une lettre" (ou "Je la lui écris"). 2. "Nous avons mangé le gâteau" ➔ "Nous l\'avons mangé".',
          hint: 'Identify direct (COD) vs indirect (COI with à).',
        ),
        JSS3EvaluationQuestion(
          question: 'Complète avec la bonne forme au futur simple :\n1. (Avoir) Demain, nous ___ une interro.\n2. (Être) Ils ___ à l\'heure.',
          answer: '1. "nous aurons" 2. "ils seront".',
          hint: 'aurons and seront.',
        ),
        JSS3EvaluationQuestion(
          question: 'Quelle est la règle d\'or pour accorder le participe passé avec ÊTRE ?',
          answer: 'Avec l\'auxiliaire ÊTRE, le participe passé s\'accorde TOUJOURS en genre (féminin: +e) et en nombre (pluriel: +s) avec le sujet de la phrase.',
          hint: 'Always agrees in gender and number with subject.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Entraînement BECE Blanc',
          instruction: 'Complete a 10-question grammar transformation exercise in your notebook covering pronouns, tenses, and agreements.',
          exampleResponse: '10 transformed sentences reviewing pronouns and future/past tenses.',
        ),
        JSS3AssignmentTask(
          category: 'Fiche mémorisation BECE',
          instruction: 'Create a summary card of the 10 most common grammar rules tested in the Junior WAEC French examination.',
          exampleResponse: 'Summary card with formulas for PC with être, Futur Simple, Pronouns, and BANGS.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'BECE Grammar Survival Guide: Pronouns & Agreement Rules',
        explanation:
            'The 3 most tested grammar concepts in the BECE examination:\n\n1. Direct Object Pronouns (COD: le, la, l\', les):\n• Replace nouns directly connected to the verb (no preposition).\n• "Tu lis ce livre ?" ➔ "Oui, je LE lis."\n\n2. Indirect Object Pronouns (COI: lui, leur):\n• Replace people introduced by the preposition À.\n• "Je téléphone à mon ami." ➔ "Je LUI téléphone."\n• "Elle écrit à ses parents." ➔ "Elle LEUR écrit." (NEVER "leurs")\n\n3. Past Participle Agreement with ÊTRE:\n• Masculine Sing: allé | Feminine Sing: allée (+e)\n• Masculine Plural: allés (+s) | Feminine Plural: allées (+es)',
        examples: [
          'Fatima donne le cahier à Aminu ➔ Fatima le lui donne.',
          'Elles sont sorties de la classe. (Feminine plural +es).',
          'Si vous travaillez sérieusement, vous aurez une excellente mention.',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 8 — Unité 8: Préparation au BECE (Partie II)
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 8,
      termNumber: 2,
      theme: 'Unité 8',
      frenchTitle: 'Préparation intensive au BECE — Partie II : Vocabulaire, Compréhension & Rédaction',
      englishSubtitle: 'BECE Examination Workshop — Part II: Reading Comprehension & Guided Essay',
      teacherFacilitatorPrompt:
          'Distribute a full BECE model examination passage to the smartboard. Model effective reading strategies: skim the text for main themes, underline key vocabulary and connectors, read questions carefully before answering, and structure a written composition using the 3-part format (Introduction, Développement, Conclusion). Open the BECE Essay Workbench Studio.',
      objectives: [
        'Read and interpret BECE examination comprehension passages with speed and precision.',
        'Extract specific factual information and deduce implied contextual meanings.',
        'Plan, draft, and polish an 80-to-100 word French essay following BECE marking rubrics.',
        'Avoid common spelling, gender, and grammatical pitfalls in written production.',
      ],
      culturalInsight:
          'In the Junior WAEC / BECE marking scheme for French, examiners allocate marks across four distinct pillars: Content Relevance (Le Fond / Idées), Grammar & Tense Accuracy (La Grammaire), Vocabulary Richness & Spelling (Le Vocabulaire & L\'Orthographe), and Logical Organization & Connectors (La Cohérence & Connecteurs). Mastering all four ensures maximum grades.',
      patternType: JSS3PatternType.beceVocabEssayPrepStudio,
      vocabulary: [
        JSS3VocabItem(
          french: 'la compréhension écrite / le texte',
          phonetics: '[la kɔ̃.pʁe.ɑ̃.sjɔ̃ e.kʁit] / [lə tɛkst]',
          english: 'reading comprehension / text',
          usageNote: 'Lisez attentivement le texte avant de répondre aux questions.',
          icon: Icons.menu_book_rounded,
          audioKey: 't2w8_comprehension_texte',
        ),
        JSS3VocabItem(
          french: 'la consigne / l\'instruction',
          phonetics: '[la kɔ̃.siɲ] / [lɛ̃s.tʁyk.sjɔ̃]',
          english: 'the prompt / instruction',
          usageNote: 'Respectez scrupuleusement les consignes de l\'épreuve.',
          icon: Icons.assignment_outlined,
          audioKey: 't2w8_consigne_instruction',
        ),
        JSS3VocabItem(
          french: 'rédiger un paragraphe / un essai',
          phonetics: '[ʁe.di.ʒe œ̃ pa.ʁa.ɡʁaf] / [œ̃.n‿e.sɛ]',
          english: 'to write a paragraph / an essay',
          usageNote: 'Rédigez un essai de quatre-vingts mots sur vos projets.',
          icon: Icons.edit_note_rounded,
          audioKey: 't2w8_rediger_paragraphe',
        ),
        JSS3VocabItem(
          french: 'le plan : introduction, développement, conclusion',
          phonetics: '[lə plɑ̃] [ɛ̃.tʁɔ.dyk.sjɔ̃] [de.vlɔp.mɑ̃] [kɔ̃.kly.zjɔ̃]',
          english: 'outline: introduction, body, conclusion',
          usageNote: 'Un bon devoir comporte toujours une introduction, un développement et une conclusion.',
          icon: Icons.view_quilt_rounded,
          audioKey: 't2w8_plan_redaction',
        ),
        JSS3VocabItem(
          french: 'selon l\'auteur / d\'après le texte',
          phonetics: '[sə.lɔ̃ lo.tœʁ] / [da.pʁɛ lə tɛkst]',
          english: 'according to the author / according to the text',
          usageNote: 'D\'après le texte, pourquoi Aminu était-il si heureux ?',
          icon: Icons.format_quote_rounded,
          audioKey: 't2w8_selon_auteur',
        ),
        JSS3VocabItem(
          french: 'le champ lexical',
          phonetics: '[lə ʃɑ̃ lɛk.si.kal]',
          english: 'lexical field / vocabulary theme',
          usageNote: 'Le texte utilise le champ lexical de la santé et du voyage.',
          icon: Icons.category_rounded,
          audioKey: 't2w8_champ_lexical',
        ),
        JSS3VocabItem(
          french: 'la ponctuation et les accents',
          phonetics: '[la pɔ̃k.tɥa.sjɔ̃ e le.z‿ak.sɑ̃]',
          english: 'punctuation and accents',
          usageNote: 'N\'oubliez pas les accents (é, è, ê, ç) et la ponctuation correcte.',
          icon: Icons.spellcheck_rounded,
          audioKey: 't2w8_ponctuation_accents',
        ),
        JSS3VocabItem(
          french: 'relire attentivement sa copie',
          phonetics: '[ʁə.liʁ a.tɑ̃.tiv.mɑ̃ sa kɔ.pi]',
          english: 'to carefully proofread one\'s script',
          usageNote: 'Gardez cinq minutes à la fin pour relire attentivement votre copie.',
          icon: Icons.verified_rounded,
          audioKey: 't2w8_relire_copie',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'Dans la rédaction du BECE, quelle est la structure essentielle d\'une composition ?',
          options: [
            'Une seule longue phrase sans ponctuation',
            'Introduction, Développement et Conclusion',
            'Uniquement des verbes à l\'infinitif',
            'Des questions sans réponses',
          ],
          correctOptionIndex: 1,
          explanation: 'Every high-scoring BECE composition must have an Introduction, Body (Développement), and Conclusion.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Comment dit-on "According to the passage" en français d\'examen ?',
          options: ['Avant le texte', 'D\'après le texte / Selon le texte', 'Sans le texte', 'Contre le texte'],
          correctOptionIndex: 1,
          explanation: '"D\'après le texte" or "Selon le passage" is standard exam terminology.',
        ),
        JSS3InteractiveExercise(
          prompt: 'Quel mot du champ lexical de la SANTÉ est un synonyme de "médecin" ?',
          options: ['le boucher', 'le docteur', 'le proviseur', 'le conducteur'],
          correctOptionIndex: 1,
          explanation: '"Le docteur" is a synonym of "le médecin".',
        ),
        JSS3InteractiveExercise(
          prompt: 'Pourquoi doit-on relire sa copie avant de la rendre à l\'examinateur ?',
          options: [
            'Pour effacer tout le texte',
            'Pour corriger les accords d\'adjectifs, les accents et la ponctuation',
            'Pour changer de sujet',
            'Pour compter le nombre de lettres',
          ],
          correctOptionIndex: 1,
          explanation: 'Proofreading catches careless errors in accents, gender/number agreements, and verb endings.',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'Quels sont les 4 critères d\'évaluation d\'une rédaction au BECE ?',
          answer: '1. Respect du sujet et des consignes (Content) 2. Correction grammaticale et des temps (Grammar) 3. Richesse du vocabulaire et orthographe (Vocabulary/Spelling) 4. Structure, logique et connecteurs (Organization/Coherence).',
          hint: 'Content, Grammar, Vocabulary, Organization.',
        ),
        JSS3EvaluationQuestion(
          question: 'Rédige une phrase d\'introduction pour une composition sur le thème : "Mes projets de vacances".',
          answer: 'Exemple : "Les vacances sont toujours un moment très attendu par tous les élèves. Cette année, j\'ai prévu de nombreuses activités passionnantes."',
          hint: 'Engaging general opening sentence.',
        ),
        JSS3EvaluationQuestion(
          question: 'Cite 4 connecteurs logiques indispensables pour relier les paragraphes d\'une rédaction.',
          answer: '1. Tout d\'abord / D\'abord 2. De plus / En outre 3. Cependant / Mais 4. Pour conclure / Enfin.',
          hint: 'First, Furthermore, However, Finally.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Rédaction BECE Format Officiel',
          instruction: 'Write a full 80-word BECE model essay on the prompt: "Racontez une fête mémorable à laquelle vous avez assisté". Follow the 3-paragraph structure.',
          exampleResponse: 'L\'année dernière, j\'ai assisté au mariage grandiose de mon oncle à Calabar. C\'était une fête mémorable.\n\nTout d\'abord, la cérémonie traditionnelle a commencé vers dix heures. Les mariés portaient de magnifiques vêtements traditionnels colorés en tissu brodé. Ensuite, tous les invités ont partagé un festin délicieux composé de jollof rice, de poisson braisé et de fruits frais. Tout le monde chantait et dansait au son de la musique africaine.\n\nEnfin, nous avons offert de beaux cadeaux aux nouveaux mariés. C\'était une journée remplie de joie que je garderai pour toujours dans mon cœur !',
        ),
        JSS3AssignmentTask(
          category: 'Champs lexicaux BECE',
          instruction: 'Create 4 vocabulary word banks for the themes: 1. Les Métiers 2. Le Voyage 3. La Nourriture 4. L\'École (5 words each).',
          exampleResponse: '4 vocabulary word banks with 5 words each.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'BECE Written Expression Rubric & Strategy',
        explanation:
            'Strategies for scoring Maximum Marks in the BECE French Essay:\n\n1. Paragraph Structure (Format 3 Paliers):\n• Paragraph 1 (Introduction): Contextualize the prompt (2 sentences).\n• Paragraph 2 (Développement): Chronological actions with connectors (4–5 sentences).\n• Paragraph 3 (Conclusion): Reflection, feelings, or moral of the story (2 sentences).\n\n2. Checklist Before Handing In (Relecture):\n• Have I used at least 3 transition connectors (D\'abord, Ensuite, Enfin) ?\n• Are all adjectives agreeing with their nouns (genre & nombre) ?\n• Are all accents placed correctly (é, è, ê, à, ç) ?\n• Are the verbs conjugated in the correct tense ?',
        examples: [
          'Introduction: Les vacances de fin d\'année sont pour moi une occasion de grand repos.',
          'Transition: Par ailleurs, mon frère et moi avons visité le parc national.',
          'Conclusion: En somme, cette expérience m\'a permis d\'apprendre beaucoup de choses.',
        ],
      ),
    ),

    // ─────────────────────────────────────────────────────
    // WEEK 9 — Grand Rallye & Bilan du 2e Trimestre
    // ─────────────────────────────────────────────────────
    JSS3LessonModel(
      weekNumber: 9,
      termNumber: 2,
      theme: 'Grand Rallye',
      frenchTitle: 'Grand Bilan & Rallye de Révision du 2e Trimestre (Simulation BECE)',
      englishSubtitle: 'All-Unit Championship Rally & Complete BECE Simulation Arena',
      teacherFacilitatorPrompt:
          'Congratulate pupils on completing all instructional units of JSS 3 Term 2! Divide the class into the 4 official teams (Équipe Bleue, Équipe Verte, Équipe Or, Équipe Rouge). Launch the Live Smartboard Championship Arena covering all Term 2 units (Past Narratives, Passé Récent, Diaries, Near Future, Future Simple, Grammar Bootcamp, and Written Expression). Award the Term 2 Silver Trophy!',
      objectives: [
        'Synthesize and master all vocabulary and grammar from Units 1 through 8 of Term 2.',
        'Excel in speed, accuracy, and team collaboration in BECE national examination drills.',
        'Demonstrate oral and written mastery of all 4 French tenses (PC, Imparfait, FP, FS).',
        'Celebrate academic progress and readiness for the upcoming third term national finals.',
      ],
      culturalInsight:
          'Inter-house French rallies (*Les Grands Rallyes Interclasses*) replicate the thrill of televised national bilingual quiz competitions in West Africa (such as *Génies en Herbe* in Côte d\'Ivoire and Nigeria\'s National French Drama and Quiz Olympiad). They instill intellectual pride and collective academic ambition.',
      patternType: JSS3PatternType.term2RevisionRally,
      vocabulary: [
        JSS3VocabItem(
          french: 'la simulation d\'examen BECE',
          phonetics: '[la si.my.la.sjɔ̃ dɛɡ.za.mɛ̃]',
          english: 'BECE exam simulation / mock rally',
          usageNote: 'Cette simulation prépare directement aux épreuves officielles du BECE.',
          icon: Icons.quiz_rounded,
          audioKey: 't2w9_simulation_bece',
        ),
        JSS3VocabItem(
          french: 'l\'équipe victorieuse',
          phonetics: '[le.kip vik.tɔ.ʁjøz]',
          english: 'the victorious team',
          usageNote: 'L\'équipe victorieuse recevra le trophée du deuxième trimestre !',
          icon: Icons.military_tech_rounded,
          audioKey: 't2w9_equipe_victorieuse',
        ),
        JSS3VocabItem(
          french: 'le buzzer en direct',
          phonetics: '[lə bœ.zœʁ ɑ̃ di.ʁɛkt]',
          english: 'live buzzer',
          usageNote: 'Appuyez sur le buzzer en direct pour répondre à la question.',
          icon: Icons.touch_app_rounded,
          audioKey: 't2w9_buzzer_direct',
        ),
        JSS3VocabItem(
          french: 'la rapidité et la précision',
          phonetics: '[la ʁa.pi.di.te e la pʁe.si.zjɔ̃]',
          english: 'speed and precision',
          usageNote: 'La rapidité et la précision sont les clés du succès au rallye.',
          icon: Icons.speed_rounded,
          audioKey: 't2w9_rapidite_precision',
        ),
        JSS3VocabItem(
          french: 'le classement général',
          phonetics: '[lə klas.mɑ̃ ʒe.ne.ʁal]',
          english: 'general ranking / leaderboard',
          usageNote: 'Voyons le classement général sur le tableau d\'honneur.',
          icon: Icons.leaderboard_rounded,
          audioKey: 't2w9_classement_general',
        ),
        JSS3VocabItem(
          french: 'un tonnerre d\'applaudissements',
          phonetics: '[œ̃ tɔ.nɛʁ da.plo.dis.mɑ̃]',
          english: 'a round of thunderous applause',
          usageNote: 'Un tonnerre d\'applaudissements pour nos quatre équipes brillantes !',
          icon: Icons.celebration_rounded,
          audioKey: 't2w9_tonnerre_applaudissements',
        ),
        JSS3VocabItem(
          french: 'le trophée d\'argent du 2e trimestre',
          phonetics: '[lə tʁɔ.fe daʁ.ʒɑ̃ dy dø.zjɛm tʁi.mɛstʁ]',
          english: 'Term 2 silver trophy',
          usageNote: 'Le prestigieux trophée d\'argent est remis aux champions !',
          icon: Icons.workspace_premium_rounded,
          audioKey: 't2w9_trophee_argent',
        ),
        JSS3VocabItem(
          french: 'en route pour le troisième trimestre !',
          phonetics: '[ɑ̃ ʁut puʁ lə tʁwa.zjɛm tʁi.mɛstʁ]',
          english: 'onward to the third term!',
          usageNote: 'Félicitations à tous et en route pour le troisième trimestre et le BECE !',
          icon: Icons.rocket_launch_rounded,
          audioKey: 't2w9_en_route_troisieme',
        ),
      ],
      exercises: [
        JSS3InteractiveExercise(
          prompt: 'RALLYE ROUND 1 — « Le professeur ___ d\'entrer en classe il y a une seconde. » (Passé récent)',
          options: ['va', 'vient', 'venait', 'est'],
          correctOptionIndex: 1,
          explanation: 'Passé récent : "vient d\'entrer".',
        ),
        JSS3InteractiveExercise(
          prompt: 'RALLYE ROUND 2 — Quel est le futur simple du verbe ALLER pour "Nous" ?',
          options: ['Nous allons', 'Nous irons', 'Nous allions', 'Nous sommes allés'],
          correctOptionIndex: 1,
          explanation: 'The Futur Simple stem of ALLER is "ir-" ➔ "Nous irons".',
        ),
        JSS3InteractiveExercise(
          prompt: 'RALLYE ROUND 3 — « Fatima ___ son journal chaque soir quand elle était petite. » (écrire)',
          options: ['a écrit', 'écrivait (Imparfait)', 'écrira', 'écrit'],
          correctOptionIndex: 1,
          explanation: 'Repeated habit in the past takes Imparfait : "écrivait".',
        ),
        JSS3InteractiveExercise(
          prompt: 'RALLYE ROUND 4 — « Si vous étudiez bien, vous ___ tous avec mention. » (réussir)',
          options: ['réussirez (Futur simple)', 'avez réussi', 'réussissiez', 'réussir'],
          correctOptionIndex: 0,
          explanation: '"SI + présent ➔ FUTUR SIMPLE": "vous réussirez".',
        ),
      ],
      evaluation: [
        JSS3EvaluationQuestion(
          question: 'GRAND BILAN T2 — Récapitule les 4 grands temps étudiés pendant ce deuxième trimestre avec un exemple pour chacun.',
          answer: '1. Passé Récent (Venir de) : "Je viens de finir." 2. Passé Composé : "J\'ai voyagé à Lagos." 3. Futur Proche (Aller + inf) : "Je vais étudier ce soir." 4. Futur Simple : "Dans dix ans, je serai médecin."',
          hint: 'Passé Récent, Passé Composé, Futur Proche, Futur Simple.',
        ),
        JSS3EvaluationQuestion(
          question: 'Quels sont les 6 radicaux irréguliers du futur simple les plus importants pour le BECE ?',
          answer: '1. Être -> ser- 2. Avoir -> aur- 3. Faire -> fer- 4. Aller -> ir- 5. Pouvoir -> pourr- 6. Vouloir -> voudr-.',
          hint: 'ser-, aur-, fer-, ir-, pourr-, voudr-.',
        ),
        JSS3EvaluationQuestion(
          question: 'Quel est le mot de conclusion pour motiver la classe avant le Troisième Trimestre ?',
          answer: '"Félicitations pour votre persévérance au deuxième trimestre ! En route pour le troisième trimestre et le grand succès au BECE national !"',
          hint: 'Inspiring graduation / transition message.',
        ),
      ],
      homework: [
        JSS3AssignmentTask(
          category: 'Fiche récapitulative Trimestre 2',
          instruction: 'Create a comprehensive 1-page summary chart in your notebook containing all 4 tenses, pronoun rules, and BECE composition guidelines.',
          exampleResponse: 'Full page revision chart summarizing Term 2 grammar, tenses, and vocabulary word banks.',
        ),
        JSS3AssignmentTask(
          category: 'Quiz entre pairs',
          instruction: 'Write 5 BECE-style multiple choice questions to test your classmates during study group.',
          exampleResponse: '5 student-authored multiple choice questions testing Term 2 concepts.',
        ),
      ],
      grammarNote: JSS3GrammarNote(
        title: 'JSS 3 French Term 2 — The Complete Mastery Framework',
        explanation: 'The 4 pillars of linguistic and examination mastery delivered throughout Term 2:',
        examples: [
          '1. Dual Past Mastery: Passé Composé (punctual action) vs Imparfait (setting/habit) vs Passé Récent (Venir de).',
          '2. Dual Future Mastery: Futur Proche (immediate intention) vs Futur Simple (long-term projection/hypothesis).',
          '3. Object Pronouns: Direct (le, la, les) and Indirect (lui, leur).',
          '4. Structured Essay Writing: 3-tier layout with connectors and tense concordance.',
        ],
      ),
    ),
  ];
}
