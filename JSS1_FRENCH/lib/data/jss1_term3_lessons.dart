import 'package:flutter/material.dart';
import '../models/jss1_lesson_model.dart';

class JSS1Term3Lessons {
  static const List<JSS1Lesson> weeks = [
    // ==========================================
    // SEMAINE 1: Demander et indiquer le temps qu’il fait
    // ==========================================
    JSS1Lesson(
      term: 3,
      week: 1,
      topic: "Demander et indiquer le temps qu’il fait",
      subtitle: "Weather expressions, seasons in Nigeria & France, asking and telling about the weather",
      patternType: JSS1PatternType.weatherAndSeasonsStudio,
      objectives: [
        "Demander le temps qu'il fait en utilisant 'Quel temps fait-il ?'",
        "Décrire les conditions météorologiques courantes (Il fait beau, chaud, froid, frais, il pleut)",
        "Identifier et comparer les 2 saisons du Nigeria et les 4 saisons en France",
        "Associer les vêtements et activités aux conditions climatiques",
      ],
      culturalInsight:
          "Au Nigeria et en Afrique de l'Ouest, l'année se divise en deux grandes saisons : la saison des pluies (avril à octobre) et la saison sèche avec l'harmattan (novembre à mars). En France et en Europe, il y a quatre saisons distinctes : le printemps, l'été, l'automne et l'hiver.",
      vocabItems: [
        JSS1VocabItem(
          french: "Quel temps fait-il ?",
          phonetics: "[kɛl tɑ̃ fɛ-t-il]",
          english: "What is the weather like?",
          usageNote: "Question clé universelle pour s'informer de la météo.",
          icon: Icons.wb_sunny_rounded,
          audioKey: "quel_temps_fait_il",
        ),
        JSS1VocabItem(
          french: "Il fait beau / Il fait chaud",
          phonetics: "[il fɛ bo / il fɛ ʃo]",
          english: "The weather is fine / It is hot",
          usageNote: "Structure impersonnelle avec le verbe 'faire'.",
          icon: Icons.wb_sunny_outlined,
          audioKey: "il_fait_beau_il_fait_chaud",
        ),
        JSS1VocabItem(
          french: "Il fait froid / Il fait frais",
          phonetics: "[il fɛ fʁwa / il fɛ fʁɛ]",
          english: "It is cold / It is cool",
          usageNote: "Utilisé pour décrire la baisse de température.",
          icon: Icons.ac_unit_rounded,
          audioKey: "il_fait_froid_il_fait_frais",
        ),
        JSS1VocabItem(
          french: "Il pleut / Il y a de la pluie",
          phonetics: "[il plø / il j-a də la plɥi]",
          english: "It is raining / There is rain",
          usageNote: "'Pleuvoir' est un verbe impersonnel (se conjugue uniquement avec 'Il').",
          icon: Icons.umbrella_rounded,
          audioKey: "il_pleut_il_y_a_de_la_pluie",
        ),
        JSS1VocabItem(
          french: "Il y a du vent / Il y a du soleil",
          phonetics: "[il j-a dy vɑ̃ / il j-a dy sɔlɛj]",
          english: "It is windy / It is sunny",
          usageNote: "Structure 'Il y a du + nom masculin'.",
          icon: Icons.air_rounded,
          audioKey: "il_y_a_du_vent_il_y_a_du_soleil",
        ),
        JSS1VocabItem(
          french: "La saison des pluies",
          phonetics: "[la sɛzɔ̃ de plɥi]",
          english: "The rainy season",
          usageNote: "Saison abondante en précipitations au Nigeria (avril à octobre).",
          icon: Icons.water_drop_rounded,
          audioKey: "la_saison_des_pluies",
        ),
        JSS1VocabItem(
          french: "La saison sèche / L'harmattan",
          phonetics: "[la sɛzɔ̃ sɛʃ / l-aʁmatɑ̃]",
          english: "The dry season / The harmattan",
          usageNote: "Période sèche et poussiéreuse venue du désert du Sahara.",
          icon: Icons.wb_twilight_rounded,
          audioKey: "la_saison_seche_l_harmattan",
        ),
        JSS1VocabItem(
          french: "Le printemps, l'été, l'automne, l'hiver",
          phonetics: "[lə pʁɛ̃tɑ̃, l-ete, l-otɔn, l-ivɛʁ]",
          english: "Spring, summer, autumn, winter",
          usageNote: "Les quatre saisons en zone tempérée (Europe/France).",
          icon: Icons.forest_rounded,
          audioKey: "printemps_ete_automne_hiver",
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: "Comment demande-t-on le temps qu'il fait en français ?",
          options: ["Quelle heure est-il ?", "Quel temps fait-il ?", "Comment vous appelez-vous ?", "Où allez-vous ?"],
          correctOptionIndex: 1,
          explanation: "'Quel temps fait-il ?' est la question standard pour demander la météo.",
        ),
        JSS1InteractiveExercise(
          prompt: "Quand le soleil brille et que la température est élevée, on dit :",
          options: ["Il fait froid", "Il neige", "Il fait beau et il fait chaud", "Il fait nuit"],
          correctOptionIndex: 2,
          explanation: "'Il fait beau et chaud' décrit une journée très ensoleillée et chaude.",
        ),
        JSS1InteractiveExercise(
          prompt: "Au Nigeria, quelle saison s'accompagne d'un vent sec et poussiéreux du Sahara ?",
          options: ["La saison des pluies", "L'harmattan / saison sèche", "L'hiver enneigé", "L'automne"],
          correctOptionIndex: 1,
          explanation: "L'harmattan est le vent sec et poussiéreux caractéristique de la saison sèche au Nigeria.",
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: "Comment dit-on 'It is raining' en français ?",
          answer: "Il pleut (ou Il y a de la pluie).",
          hint: "Verbe impersonnel pleuvoir.",
        ),
        JSS1EvaluationQuestion(
          question: "Citez les 4 saisons européennes en français.",
          answer: "Le printemps, l'été, l'automne et l'hiver.",
          hint: "Printemps, été, automne, hiver.",
        ),
        JSS1EvaluationQuestion(
          question: "Traduisez : 'Aujourd'hui, il y a du vent à Abuja.'",
          answer: "Aujourd'hui, il y a du vent à Abuja.",
          hint: "Structure : Il y a du vent.",
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: "Météo Locale",
          instruction: "Écrivez un bulletin météo de 3 phrases décrivant le temps actuel dans votre ville.",
          exampleResponse: "Aujourd'hui à Lagos, il fait beau et il fait chaud. Il y a du soleil et un peu de vent.",
        ),
        JSS1AssignmentTask(
          category: "Comparaison des Saisons",
          instruction: "Dans votre cahier, dessinez et écrivez le nom des 2 saisons nigérianes et des 4 saisons françaises.",
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: "Les Expressions Météorologiques Impersonnelles",
        explanation: "Pour exprimer le temps qu'il fait, on emploie principalement 'Il fait + adjectif' ou 'Il y a + partitif + nom'. Le pronom 'Il' est impersonnel.",
        examples: [
          "Il fait beau / Il fait mauvais / Il fait chaud / Il fait froid.",
          "Il y a du soleil / Il y a du vent / Il y a des nuages.",
          "Il pleut beaucoup pendant la saison des pluies.",
        ],
      ),
    ),

    // ==========================================
    // SEMAINE 2: Exprimer la fréquence d’une activité
    // ==========================================
    JSS1Lesson(
      term: 3,
      week: 2,
      topic: "Exprimer la fréquence d’une activité",
      subtitle: "Using adverbs of frequency: toujours, souvent, parfois, rarement, jamais",
      patternType: JSS1PatternType.frequencyAdverbsStudio,
      objectives: [
        "Comprendre et mémoriser l'échelle des 5 adverbes de fréquence (100% à 0%)",
        "Positionner correctement l'adverbe de fréquence directement après le verbe conjugué",
        "Formuler la négation totale avec 'Ne ... jamais' sans ajouter 'pas'",
        "Répondre à la question 'À quelle fréquence fais-tu... ?'",
      ],
      culturalInsight:
          "En France comme au Nigeria, exprimer son rythme de vie et ses habitudes quotidiennes (études, sport, loisirs) permet d'engager des conversations riches entre amis et collègues de classe.",
      vocabItems: [
        JSS1VocabItem(
          french: "Toujours",
          phonetics: "[tu.ʒuʁ]",
          english: "Always (100% frequency)",
          usageNote: "Indique une habitude constante et ininterrompue.",
          icon: Icons.all_inclusive_rounded,
          audioKey: "toujours",
        ),
        JSS1VocabItem(
          french: "Souvent",
          phonetics: "[su.vɑ̃]",
          english: "Often / Frequently (75% frequency)",
          usageNote: "Indique une action répétée régulièrement.",
          icon: Icons.repeat_rounded,
          audioKey: "souvent",
        ),
        JSS1VocabItem(
          french: "Parfois / Quelquefois",
          phonetics: "[paʁ.fwa / kɛl.kə.fwa]",
          english: "Sometimes / Occasionally (50% frequency)",
          usageNote: "Indique une fréquence moyenne (de temps en temps).",
          icon: Icons.shuffle_rounded,
          audioKey: "parfois_quelquefois",
        ),
        JSS1VocabItem(
          french: "Rarement",
          phonetics: "[ʁaʁ.mɑ̃]",
          english: "Rarely / Seldom (20% frequency)",
          usageNote: "Indique une action très peu fréquente.",
          icon: Icons.hourglass_bottom_rounded,
          audioKey: "rarement",
        ),
        JSS1VocabItem(
          french: "Ne ... jamais",
          phonetics: "[nə ... ʒa.mɛ]",
          english: "Never (0% frequency / Negation)",
          usageNote: "Remplace 'pas' dans la négation ('Je ne triche jamais').",
          icon: Icons.block_rounded,
          audioKey: "ne_jamais",
        ),
        JSS1VocabItem(
          french: "Je fais toujours mes devoirs",
          phonetics: "[ʒə fɛ tu.ʒuʁ me də.vwaʁ]",
          english: "I always do my homework",
          usageNote: "Exemple type avec adverbe placé après le verbe conjugué.",
          icon: Icons.menu_book_rounded,
          audioKey: "je_fais_toujours_mes_devoirs",
        ),
        JSS1VocabItem(
          french: "Nous jouons souvent au football",
          phonetics: "[nu ʒwɔ̃ su.vɑ̃ o fut.bol]",
          english: "We often play football",
          usageNote: "Activité sportive régulière.",
          icon: Icons.sports_soccer_rounded,
          audioKey: "nous_jouons_souvent_au_football",
        ),
        JSS1VocabItem(
          french: "À quelle fréquence fais-tu du sport ?",
          phonetics: "[a kɛl fʁe.kɑ̃s fɛ ty dy spɔʁ]",
          english: "How often do you play sports?",
          usageNote: "Question interrogative formelle sur la fréquence.",
          icon: Icons.help_outline_rounded,
          audioKey: "a_quelle_frequence_fais_tu_du_sport",
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: "Où se place l'adverbe de fréquence dans la phrase déclarative ?",
          options: [
            "Avant le sujet",
            "Directement après le verbe conjugué",
            "Toujours à la fin de la phrase",
            "Entre le sujet et le verbe"
          ],
          correctOptionIndex: 1,
          explanation: "En français, l'adverbe simple se place directement après le verbe conjugué (ex. 'Je mange souvent').",
        ),
        JSS1InteractiveExercise(
          prompt: "Quelle phrase est correcte pour dire 'I never cheat' ?",
          options: [
            "Je ne triche pas jamais.",
            "Je ne triche jamais.",
            "Je jamais triche.",
            "Je ne jamais triche pas."
          ],
          correctOptionIndex: 1,
          explanation: "'Jamais' remplace 'pas' dans la structure négative 'ne + verbe + jamais'.",
        ),
        JSS1InteractiveExercise(
          prompt: "Quel adverbe correspond à une fréquence de 100% ?",
          options: ["Rarement", "Parfois", "Toujours", "Souvent"],
          correctOptionIndex: 2,
          explanation: "'Toujours' exprime une action constante à 100%.",
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: "Comment dit-on 'We often read books' en français ?",
          answer: "Nous lisons souvent des livres.",
          hint: "Sujet + verbe conjugué + souvent + complément.",
        ),
        JSS1EvaluationQuestion(
          question: "Traduisez : 'He is rarely late to school.'",
          answer: "Il arrive rarement en retard à l'école.",
          hint: "Arriver + rarement + en retard.",
        ),
        JSS1EvaluationQuestion(
          question: "Répondez en français : À quelle fréquence regardes-tu la télévision ?",
          answer: "Je regarde souvent (ou parfois / toujours / rarement) la télévision.",
          hint: "Utilisez l'adverbe de votre choix.",
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: "Routine Hebdomadaire",
          instruction: "Rédigez 4 phrases dans votre cahier en utilisant : toujours, souvent, parfois et jamais.",
          exampleResponse: "1. Je révise toujours mes leçons. 2. Je joue souvent au basket. 3. Je cuisine parfois. 4. Je ne triche jamais.",
        ),
        JSS1AssignmentTask(
          category: "Interview d'un Camarade",
          instruction: "Posez 2 questions de fréquence à un camarade et notez ses réponses.",
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: "Place et Syntaxe des Adverbes de Fréquence",
        explanation: "L'adverbe de fréquence se place immédiatement après le verbe conjugué aux temps simples. Pour la négation avec 'jamais', on omet le mot 'pas' : 'ne + verbe + jamais'.",
        examples: [
          "Je mange TOUJOURS des fruits le matin.",
          "Elle écoute SOUVENT la musique française.",
          "Nous ne sommes JAMAIS en retard.",
        ],
      ),
    ),

    // ==========================================
    // SEMAINE 3: Inviter quelqu’un
    // ==========================================
    JSS1Lesson(
      term: 3,
      week: 3,
      topic: "Inviter quelqu’un",
      subtitle: "Making, accepting and politely declining invitations with standard French social formulas",
      patternType: JSS1PatternType.invitationsStudio,
      objectives: [
        "Proposer une invitation amicale ('Tu veux venir... ?', 'Je t'invite à...')",
        "Accepter chaleureusement une invitation ('Avec grand plaisir !', 'Volontiers !')",
        "Refuser poliment une invitation en fournissant une excuse courtoise ('Désolé, je ne peux pas...')",
        "Préciser l'heure et le lieu d'une rencontre sociale",
      ],
      culturalInsight:
          "En culture francophone comme nigériane, la courtoisie est primordiale lors du refus d'une invitation : on remercie d'abord l'hôte pour l'invitation, on exprime son regret et on explique brièvement son empêchement.",
      vocabItems: [
        JSS1VocabItem(
          french: "Tu veux venir chez moi ce week-end ?",
          phonetics: "[ty vø və.niʁ ʃe mwa sə wik.ɛnd]",
          english: "Do you want to come to my house this weekend?",
          usageNote: "Formule d'invitation directe entre amis.",
          icon: Icons.home_rounded,
          audioKey: "tu_veux_venir_chez_moi",
        ),
        JSS1VocabItem(
          french: "Je t'invite à mon anniversaire samedi",
          phonetics: "[ʒə t-ɛ̃.vit a mɔ̃ n-a.ni.vɛʁ.sɛʁ sam.di]",
          english: "I invite you to my birthday party on Saturday",
          usageNote: "Invitation formelle à une fête personnelle.",
          icon: Icons.cake_rounded,
          audioKey: "je_t_invite_a_mon_anniversaire",
        ),
        JSS1VocabItem(
          french: "Oui, avec grand plaisir !",
          phonetics: "[wi a.vɛk gʁɑ̃ plɛ.ziʁ]",
          english: "Yes, with great pleasure!",
          usageNote: "Acceptation très enthousiaste et polie.",
          icon: Icons.thumb_up_rounded,
          audioKey: "oui_avec_grand_plaisir",
        ),
        JSS1VocabItem(
          french: "Volontiers ! C'est super sympa",
          phonetics: "[vɔ.lɔ̃.tje sɛ sy.pɛʁ sɛ̃.pa]",
          english: "Gladly! That is super nice",
          usageNote: "Acceptation spontanée et conviviale.",
          icon: Icons.sentiment_very_satisfied_rounded,
          audioKey: "volontiers_d_accord",
        ),
        JSS1VocabItem(
          french: "Désolé(e), je ne peux pas, je dois étudier",
          phonetics: "[de.zɔ.le ʒə nə pø pa ʒə dwa z-e.ty.dje]",
          english: "Sorry, I cannot, I have to study",
          usageNote: "Refus poli avec justification de devoirs.",
          icon: Icons.sentiment_dissatisfied_rounded,
          audioKey: "desole_je_ne_peux_pas",
        ),
        JSS1VocabItem(
          french: "C'est très gentil, mais je suis occupé(e)",
          phonetics: "[sɛ tʁɛ ʒɑ̃.ti mɛ ʒə sɥi z-ɔ.ky.pe]",
          english: "That is very kind, but I am busy",
          usageNote: "Remerciement suivi d'un refus courtois.",
          icon: Icons.event_busy_rounded,
          audioKey: "c_est_gentil_mais_je_suis_occupe",
        ),
        JSS1VocabItem(
          french: "Ça te dit de jouer au basket après l'école ?",
          phonetics: "[sa tə di də ʒwe o bas.kɛt a.pʁɛ l-e.kɔl]",
          english: "Do you feel like playing basketball after school?",
          usageNote: "Expression idiomatique très courante pour suggérer une sortie.",
          icon: Icons.sports_basketball_rounded,
          audioKey: "ca_te_dit_de_jouer_au_basket",
        ),
        JSS1VocabItem(
          french: "À quelle heure commence la fête ?",
          phonetics: "[a kɛl œʁ kɔ.mɑ̃s la fɛt]",
          english: "What time does the party start?",
          usageNote: "Demande de précision horaire.",
          icon: Icons.schedule_rounded,
          audioKey: "a_quelle_heure_commence_la_fete",
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: "Quelle expression utilise-t-on pour accepter chaleureusement une invitation ?",
          options: ["Désolé, je ne peux pas", "Avec grand plaisir !", "Ça ne me dit rien", "Ne faites pas ça"],
          correctOptionIndex: 1,
          explanation: "'Avec grand plaisir !' et 'Volontiers !' expriment un accord enthousiaste.",
        ),
        JSS1InteractiveExercise(
          prompt: "Comment formuler poliment un refus d'invitation ?",
          options: [
            "Non, tais-toi !",
            "C'est gentil, mais je suis déjà occupé(e).",
            "Tu dois venir !",
            "Il est interdit d'entrer."
          ],
          correctOptionIndex: 1,
          explanation: "Un refus poli commence par remercier l'hôte ('C'est gentil') avant d'expliquer son empêchement.",
        ),
        JSS1InteractiveExercise(
          prompt: "Que signifie : 'Ça te dit de venir chez moi ?'",
          options: ["Do you want to come to my place?", "Where do you live?", "What is your name?", "How old are you?"],
          correctOptionIndex: 0,
          explanation: "'Ça te dit de + infinitif ?' équivaut à 'Do you feel like / Do you want to... ?'.",
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: "Comment invite-t-on un ami à son anniversaire en français ?",
          answer: "Je t'invite à mon anniversaire (samedi / ce week-end).",
          hint: "Je t'invite à...",
        ),
        JSS1EvaluationQuestion(
          question: "Donnez 2 expressions françaises pour dire 'Yes, gladly!'.",
          answer: "'Volontiers !' et 'Oui, avec grand plaisir !'.",
          hint: "Volontiers / Avec plaisir.",
        ),
        JSS1EvaluationQuestion(
          question: "Traduisez : 'Sorry, I cannot come because I have homework.'",
          answer: "Désolé(e), je ne peux pas venir parce que j'ai des devoirs.",
          hint: "Désolé + je ne peux pas venir + parce que...",
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: "Carte d'Invitation",
          instruction: "Rédigez une jolie carte d'invitation pour votre fête d'anniversaire en indiquant l'heure, la date et le lieu.",
          exampleResponse: "Cher ami, Je t'invite à mon anniversaire samedi 14 juin à 15h chez moi à Ikeja. Viens faire la fête !",
        ),
        JSS1AssignmentTask(
          category: "Dialogue de Réponse",
          instruction: "Écrivez un mini-dialogue de 4 répliques entre deux camarades (une invitation et un refus poli argumenté).",
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: "Structures de l'Invitation et des Réponses",
        explanation: "Pour inviter, on utilise 'Tu veux + infinitif ?', 'Ça te dit de + infinitif ?' ou 'Je t'invite à + nom'. Le verbe 'pouvoir' au présent permet d'exprimer la possibilité : 'Je peux / Je ne peux pas'.",
        examples: [
          "Tu veux jouer au football avec nous ?",
          "Ça te dit d'aller à la plage dimanche ?",
          "Je ne peux pas sortir ce soir.",
        ],
      ),
    ),

    // ==========================================
    // SEMAINE 4: Donner un ordre, interdire, autoriser
    // ==========================================
    JSS1Lesson(
      term: 3,
      week: 4,
      topic: "Donner un ordre, interdire, autoriser",
      subtitle: "Commands, prohibition, giving authorization, classroom regulations and public signage",
      patternType: JSS1PatternType.commandsAndProhibitionsStudio,
      objectives: [
        "Donner des consignes et ordres clairs à l'impératif ('Faites attention !', 'Taisez-vous !')",
        "Exprimer des interdictions strictes ('Ne bavardez pas !', 'Il est interdit de...')",
        "Accorder des autorisations et des permissions ('Vous pouvez entrer', 'C'est permis')",
        "Reconnaître et interpréter les panneaux de signalisation et le règlement de l'école",
      ],
      culturalInsight:
          "Dans les collèges nigérians et francophones, le respect du règlement intérieur garantit un climat d'apprentissage studieux et sécurisé. Les professeurs utilisent l'impératif pour guider les élèves.",
      vocabItems: [
        JSS1VocabItem(
          french: "Faites attention et écoutez !",
          phonetics: "[fɛt a.tɑ̃.sjɔ̃ e e.ku.te]",
          english: "Pay attention and listen!",
          usageNote: "Consigne impérative adressée à toute la classe (forme 'Vous').",
          icon: Icons.campaign_rounded,
          audioKey: "faites_attention_ordre",
        ),
        JSS1VocabItem(
          french: "Taisez-vous et faites silence !",
          phonetics: "[tɛ.ze vu e fɛt si.lɑ̃s]",
          english: "Be quiet and keep silent!",
          usageNote: "Ordre de discipline pour rétablir le calme.",
          icon: Icons.volume_off_rounded,
          audioKey: "taisez_vous_silence",
        ),
        JSS1VocabItem(
          french: "Ne bavardez pas pendant le cours !",
          phonetics: "[nə ba.vaʁ.de pa pɑ̃.dɑ̃ lə kuʁ]",
          english: "Do not chat during the lesson!",
          usageNote: "Interdiction adressée aux élèves avec 'Ne ... pas'.",
          icon: Icons.speaker_notes_off_rounded,
          audioKey: "ne_bavardez_pas_en_classe",
        ),
        JSS1VocabItem(
          french: "Il est strictement interdit de tricher",
          phonetics: "[il ɛ stʁik.tə.mɑ̃ ɛ̃.tɛʁ.di də tʁi.ʃe]",
          english: "It is strictly forbidden to cheat",
          usageNote: "Formule officielle d'interdiction dans les règlements d'examen.",
          icon: Icons.cancel_rounded,
          audioKey: "il_est_interdit_de_tricher",
        ),
        JSS1VocabItem(
          french: "Défense de fumer / Ne pas entrer",
          phonetics: "[de.fɑ̃s də fy.me / nə paz ɑ̃.tʁe]",
          english: "No smoking / Do not enter",
          usageNote: "Panneau d'interdiction public sur les portes et murs.",
          icon: Icons.do_not_disturb_on_rounded,
          audioKey: "defense_de_fumer_ne_pas_entrer",
        ),
        JSS1VocabItem(
          french: "Vous pouvez entrer dans la classe",
          phonetics: "[vu pu.ve z-ɑ̃.tʁe dɑ̃ la klas]",
          english: "You may enter the classroom",
          usageNote: "Formule d'autorisation donnée par le professeur.",
          icon: Icons.meeting_room_rounded,
          audioKey: "vous_pouvez_entrer_tu_peux_sortir",
        ),
        JSS1VocabItem(
          french: "C'est permis, vous avez l'autorisation",
          phonetics: "[sɛ pɛʁ.mi vu z-a.ve l-o.tɔ.ʁi.za.sjɔ̃]",
          english: "It is permitted, you have authorization",
          usageNote: "Confirmation officielle qu'une action est licite.",
          icon: Icons.verified_rounded,
          audioKey: "c_est_permis_vous_avez_l_autorisation",
        ),
        JSS1VocabItem(
          french: "Rangez vos affaires et asseyez-vous",
          phonetics: "[ʁɑ̃.ʒe voz a.fɛʁ e a.sɛ.je vu]",
          english: "Pack up your things and sit down",
          usageNote: "Consigne d'organisation scolaire usuelle.",
          icon: Icons.chair_rounded,
          audioKey: "rangez_vos_affaires_asseyez_vous",
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: "Quelle formule exprime une interdiction formelle ?",
          options: ["Vous pouvez sortir", "Il est interdit de tricher", "C'est permis", "Faites attention"],
          correctOptionIndex: 1,
          explanation: "'Il est interdit de + infinitif' exprime une interdiction officielle et absolue.",
        ),
        JSS1InteractiveExercise(
          prompt: "À l'impératif, que fait-on avec les pronoms sujets (tu, nous, vous) ?",
          options: [
            "On les double",
            "On les supprime totalement (ex. 'Écoutez !')",
            "On les place à la fin",
            "On les remplace par 'il'"
          ],
          correctOptionIndex: 1,
          explanation: "À l'impératif, le verbe s'emploie directement sans pronom sujet.",
        ),
        JSS1InteractiveExercise(
          prompt: "Que signifie le panneau 'Défense de faire du bruit' ?",
          options: ["Making noise is allowed", "No making noise / Silence required", "Play music now", "Open the door"],
          correctOptionIndex: 1,
          explanation: "'Défense de' signifie qu'il est rigoureusement défendu de faire l'action.",
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: "Donnez 2 consignes en français données couramment par le professeur.",
          answer: "'Silence s'il vous plaît !' et 'Ouvrez vos cahiers à la page dix !'.",
          hint: "Impératif pluriel (forme en -ez).",
        ),
        JSS1EvaluationQuestion(
          question: "Traduisez : 'It is forbidden to run in the corridors.'",
          answer: "Il est interdit de courir dans les couloirs.",
          hint: "Il est interdit de + courir.",
        ),
        JSS1EvaluationQuestion(
          question: "Comment autorise-t-on un élève à s'asseoir en classe ?",
          answer: "Vous pouvez vous asseoir (ou 'Assieds-toi / Asseyez-vous !').",
          hint: "Vous pouvez + verbe.",
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: "Règlement Scolaire",
          instruction: "Écrivez 3 règles pour la classe de JSS1 (2 interdictions et 1 autorisation).",
          exampleResponse: "1. Il est interdit de manger pendant le cours. 2. Ne bavardez pas en classe. 3. Vous pouvez poser des questions.",
        ),
        JSS1AssignmentTask(
          category: "Panneaux de Signalisation",
          instruction: "Dessinez 2 panneaux de signalisation de votre école et inscrivez leur consigne en français.",
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: "L'Impératif et les Formules d'Interdiction / Autorisation",
        explanation: "L'impératif s'emploie pour donner un ordre sans pronom sujet. Pour interdire : 'Ne + verbe + pas', 'Il est interdit de + infinitif', 'Défense de + infinitif'. Pour autoriser : 'Vous pouvez + infinitif', 'C'est permis'.",
        examples: [
          "Écoutez bien la leçon !",
          "Ne courez pas dans l'escalier !",
          "Il est interdit d'utiliser son téléphone pendant l'examen.",
        ],
      ),
    ),

    // ==========================================
    // SEMAINE 5: Demander la permission, conseiller
    // ==========================================
    JSS1Lesson(
      term: 3,
      week: 5,
      topic: "Demander la permission, conseiller",
      subtitle: "Asking for permission, giving helpful advice and study tips using polite conditional and modal formulas",
      patternType: JSS1PatternType.permissionAndAdviceStudio,
      objectives: [
        "Demander poliment la permission ('Puis-je... ?', 'Est-ce que je peux... ?', 'Permettez-moi de...')",
        "Donner des conseils bienveillants pour réussir ses études ('Tu devrais...', 'Il faut...')",
        "Utiliser le conditionnel de politesse et les structures de recommandation",
        "Interagir avec courtoisie avec ses professeurs et ses pairs",
      ],
      culturalInsight:
          "La formule inversée 'Puis-je ?' est la plus élégante et respectueuse de la langue française lorsqu'un élève s'adresse à un adulte, un enseignant ou une autorité scolaire.",
      vocabItems: [
        JSS1VocabItem(
          french: "Puis-je emprunter votre dictionnaire ?",
          phonetics: "[pɥi ʒə ɑ̃.pʁœ̃.te vɔtʁ dik.sjɔ.nɛʁ]",
          english: "May I borrow your dictionary, Sir/Madam?",
          usageNote: "Inversion d'une extrême politesse (on dit 'Puis-je ?' et non 'Peux-je ?').",
          icon: Icons.menu_book_rounded,
          audioKey: "puis_je_emprunter_votre_dictionnaire",
        ),
        JSS1VocabItem(
          french: "Est-ce que je peux poser une question ?",
          phonetics: "[ɛs kə ʒə pø po.ze yn kɛs.tjɔ̃]",
          english: "Can I ask a question?",
          usageNote: "Demande de permission courante en classe.",
          icon: Icons.contact_support_rounded,
          audioKey: "est_ce_que_je_peux_poser_une_question",
        ),
        JSS1VocabItem(
          french: "Permettez-moi de sortir, s'il vous plaît",
          phonetics: "[pɛʁ.mɛ.te mwa də sɔʁ.tiʁ sil vu plɛ]",
          english: "Allow me to step out, please",
          usageNote: "Demande très respectueuse pour quitter momentanément la pièce.",
          icon: Icons.door_front_door_rounded,
          audioKey: "permettez_moi_de_sortir_sil_vous_plait",
        ),
        JSS1VocabItem(
          french: "Oui, bien sûr, vas-y !",
          phonetics: "[wi bjɛ̃ syʁ va z-i]",
          english: "Yes, of course, go ahead!",
          usageNote: "Accord bienveillant donné à un élève.",
          icon: Icons.thumb_up_alt_rounded,
          audioKey: "oui_bien_sur_vas_y",
        ),
        JSS1VocabItem(
          french: "Tu devrais réviser tes leçons chaque soir",
          phonetics: "[ty də.vʁɛ ʁe.vi.ze te lə.sɔ̃ ʃak swaʁ]",
          english: "You should review your lessons every evening",
          usageNote: "Conseil académique avec le conditionnel 'Tu devrais'.",
          icon: Icons.edit_calendar_rounded,
          audioKey: "tu_devrais_reviser_tes_lecons",
        ),
        JSS1VocabItem(
          french: "Il faut bien écouter le professeur en classe",
          phonetics: "[il fo bjɛ̃ n-e.ku.te lə pʁɔ.fɛ.sœʁ ɑ̃ klas]",
          english: "One must listen well to the teacher in class",
          usageNote: "Conseil sous forme d'obligation générale nécessaire.",
          icon: Icons.hearing_rounded,
          audioKey: "il_faut_bien_ecouter_le_professeur",
        ),
        JSS1VocabItem(
          french: "Tu ferais bien de te reposer un peu",
          phonetics: "[ty fə.ʁɛ bjɛ̃ də tə ʁə.po.ze œ̃ pø]",
          english: "You would do well to rest a little",
          usageNote: "Conseil de bien-être adressé à un camarade fatigué.",
          icon: Icons.bed_rounded,
          audioKey: "tu_ferais_bien_de_te_reposer",
        ),
        JSS1VocabItem(
          french: "À mon avis, c'est la meilleure solution",
          phonetics: "[a mɔ̃ n-a.vi sɛ la mɛ.jœʁ sɔ.ly.sjɔ̃]",
          english: "In my opinion, it is the best solution",
          usageNote: "Introduction polie d'une suggestion ou d'un avis.",
          icon: Icons.lightbulb_rounded,
          audioKey: "a_mon_avis_meilleure_solution",
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: "Quelle est la forme correcte et polie de l'inversion du verbe 'pouvoir' avec 'je' ?",
          options: ["Peux-je ?", "Puis-je ?", "Pouvons-je ?", "Peut-je ?"],
          correctOptionIndex: 1,
          explanation: "En français soigné, l'inversion est toujours 'Puis-je ?' et jamais 'Peux-je ?'.",
        ),
        JSS1InteractiveExercise(
          prompt: "Pour donner un conseil amical sans brusquer, on emploie le conditionnel :",
          options: ["Tu dois", "Tu devrais", "Tu fais", "Tu vas"],
          correctOptionIndex: 1,
          explanation: "'Tu devrais + infinitif' adoucit l'obligation et exprime un conseil bienveillant.",
        ),
        JSS1InteractiveExercise(
          prompt: "Que signifie 'Permettez-moi de parler' ?",
          options: ["Allow me to speak", "Stop speaking", "Where do you speak?", "Speak louder"],
          correctOptionIndex: 0,
          explanation: "'Permettez-moi de' demande solennellement la permission.",
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: "Comment demandez-vous poliment à votre professeur la permission de boire de l'eau ?",
          answer: "Monsieur/Madame, puis-je boire de l'eau, s'il vous plaît ?",
          hint: "Puis-je + boire de l'eau.",
        ),
        JSS1EvaluationQuestion(
          question: "Donnez un conseil d'étude en français à un élève qui prépare le BECE.",
          answer: "Tu devrais réviser régulièrement tes notes et pratiquer le vocabulaire.",
          hint: "Tu devrais + infinitif.",
        ),
        JSS1EvaluationQuestion(
          question: "Traduisez : 'You must listen carefully in class.'",
          answer: "Il faut écouter attentivement en classe (ou Tu dois bien écouter).",
          hint: "Il faut + écouter.",
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: "Guide du Succès Scolaire",
          instruction: "Rédigez 3 conseils d'étude pour vos camarades en utilisant 'Tu devrais...', 'Il faut...' et 'Tu ferais bien de...'.",
          exampleResponse: "1. Tu devrais faire tes devoirs à l'heure. 2. Il faut lire des livres en français. 3. Tu ferais bien de bien dormir avant l'examen.",
        ),
        JSS1AssignmentTask(
          category: "Formules de Politesse",
          instruction: "Écrivez 2 demandes de permission très polies à adresser au Principal du collège.",
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: "Permission Polie et Conseils (Conditionnel & Verbes Modaux)",
        explanation: "Pour demander la permission : 'Puis-je + infinitif ?' ou 'Est-ce que je peux + infinitif ?'. Pour conseiller : 'Tu devrais + infinitif' (conditionnel de devoir) ou 'Il faut + infinitif' (forme impersonnelle de nécessité).",
        examples: [
          "Puis-je entrer dans la salle ?",
          "Tu devrais poser des questions quand tu ne comprends pas.",
          "Il faut bien s'entraîner pour réussir le concours.",
        ],
      ),
    ),

    // ==========================================
    // SEMAINE 6: Expliquer une démarche / donner un itinéraire
    // ==========================================
    JSS1Lesson(
      term: 3,
      week: 6,
      topic: "Expliquer une démarche à quelqu’un",
      subtitle: "Giving directions, navigating urban routes and explaining step-by-step procedures",
      patternType: JSS1PatternType.directionsAndProceduresStudio,
      objectives: [
        "Indiquer précisément un itinéraire dans la ville ('Allez tout droit', 'Tournez à droite / à gauche')",
        "Situer des bâtiments publics à l'aide de prépositions de lieu ('en face de', 'à côté de', 'au carrefour')",
        "Structurer une démarche ou une procédure avec des connecteurs logiques ('D'abord', 'Ensuite', 'Puis', 'Enfin')",
        "Renseigner un visiteur égaré avec courtoisie",
      ],
      culturalInsight:
          "Pour demander son chemin en France ou dans les pays francophones, il est indispensable de débuter par une salutation de politesse : 'Pardon Monsieur / Excusez-moi Madame, où se trouve... ?'.",
      vocabItems: [
        JSS1VocabItem(
          french: "Pardon Monsieur, où se trouve la bibliothèque ?",
          phonetics: "[paʁ.dɔ̃ mə.sjø u sə tʁuv la bi.bli.jɔ.tɛk]",
          english: "Excuse me Sir, where is the library located?",
          usageNote: "Question type courtoise pour demander son chemin dans la ville.",
          icon: Icons.person_pin_circle_rounded,
          audioKey: "pardon_monsieur_ou_se_trouve",
        ),
        JSS1VocabItem(
          french: "Allez tout droit sur deux cents mètres",
          phonetics: "[a.le tu dʁwa syʁ dø sɑ̃ mɛtʁ]",
          english: "Go straight ahead for two hundred meters",
          usageNote: "Indication de trajectoire rectiligne.",
          icon: Icons.arrow_upward_rounded,
          audioKey: "allez_tout_droit",
        ),
        JSS1VocabItem(
          french: "Tournez à droite / Tournez à gauche",
          phonetics: "[tuʁ.ne a dʁwat / tuʁ.ne a goʃ]",
          english: "Turn right / Turn left",
          usageNote: "Changement de direction à une intersection.",
          icon: Icons.turn_right_rounded,
          audioKey: "tournez_a_droite_a_gauche",
        ),
        JSS1VocabItem(
          french: "Prenez la deuxième rue à droite",
          phonetics: "[pʁə.ne la dø.zjɛm ʁy a dʁwat]",
          english: "Take the second street on the right",
          usageNote: "Utilisation des adjectifs numéraux ordinaux (première, deuxième, troisième).",
          icon: Icons.alt_route_rounded,
          audioKey: "prenez_la_deuxieme_rue_a_droite",
        ),
        JSS1VocabItem(
          french: "Traversez le grand carrefour",
          phonetics: "[tʁa.vɛʁ.se lə gʁɑ̃ kaʁ.fuʁ]",
          english: "Cross the big junction / intersection",
          usageNote: "Franchir un rond-point ou une intersection.",
          icon: Icons.traffic_rounded,
          audioKey: "traversez_le_carrefour",
        ),
        JSS1VocabItem(
          french: "C'est en face de l'hôpital",
          phonetics: "[sɛ t-ɑ̃ fas də l-o.pi.tal]",
          english: "It is opposite the hospital",
          usageNote: "Positionnement en vis-à-vis d'un repère connu.",
          icon: Icons.local_hospital_rounded,
          audioKey: "c_est_en_face_de_l_hopital",
        ),
        JSS1VocabItem(
          french: "C'est juste à côté de la poste",
          phonetics: "[sɛ ʒyst a ko.te də la pɔst]",
          english: "It is right next to the post office",
          usageNote: "Proximité immédiate (adjacence).",
          icon: Icons.markunread_mailbox_rounded,
          audioKey: "c_est_a_cote_de_la_poste",
        ),
        JSS1VocabItem(
          french: "D'abord, remplissez la fiche d'inscription",
          phonetics: "[da.bɔʁ ʁɑ̃.pli.se la fiʃ d-ɛ̃s.kʁip.sjɔ̃]",
          english: "First, fill out the registration form",
          usageNote: "Première étape d'une démarche administrative.",
          icon: Icons.assignment_rounded,
          audioKey: "remplissez_d_abord_la_fiche",
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: "Quelle est la différence entre 'Tout droit' et 'À droite' ?",
          options: [
            "'Tout droit' signifie tout droit vers l'avant, 'À droite' indique le côté droit",
            "C'est la même chose",
            "'Tout droit' signifie vers la gauche",
            "'À droite' signifie faire demi-tour"
          ],
          correctOptionIndex: 0,
          explanation: "Attention au piège : 'Tout droit' = straight ahead, 'À droite' = to the right.",
        ),
        JSS1InteractiveExercise(
          prompt: "Pour expliquer une démarche dans l'ordre chronologique, on utilise :",
          options: [
            "Hier, Aujourd'hui, Demain",
            "D'abord, Ensuite, Puis, Enfin",
            "Toujours, Souvent, Parfois",
            "Grand, Petit, Lourd"
          ],
          correctOptionIndex: 1,
          explanation: "Les connecteurs 'D'abord, Ensuite, Puis, Enfin' permettent d'ordonner une procédure.",
        ),
        JSS1InteractiveExercise(
          prompt: "Que signifie 'C'est en face de la banque' ?",
          options: ["It is behind the bank", "It is opposite the bank", "It is inside the bank", "It is far from the bank"],
          correctOptionIndex: 1,
          explanation: "'En face de' indique une position directement opposée et visible en face.",
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: "Comment guidez-vous un passant vers le marché en 2 étapes ?",
          answer: "Allez tout droit, puis tournez à gauche au carrefour.",
          hint: "Allez tout droit + tournez à gauche.",
        ),
        JSS1EvaluationQuestion(
          question: "Traduisez : 'Take the first street on the left.'",
          answer: "Prenez la première rue à gauche.",
          hint: "Prenez + la première rue + à gauche.",
        ),
        JSS1EvaluationQuestion(
          question: "Citez les 4 connecteurs d'étapes d'une démarche en français.",
          answer: "D'abord, Ensuite, Puis, Enfin.",
          hint: "D'abord ... Ensuite ... Puis ... Enfin.",
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: "Itinéraire Maison-École",
          instruction: "Rédigez l'itinéraire de votre maison jusqu'à votre école en 4 phrases guidées.",
          exampleResponse: "1. Sortez de la maison et allez tout droit. 2. Au grand rond-point, tournez à droite. 3. Prenez la deuxième rue. 4. L'école est en face de la banque.",
        ),
        JSS1AssignmentTask(
          category: "Explication de Démarche",
          instruction: "Expliquez les 4 étapes pour emprunter un livre à la bibliothèque en utilisant : D'abord, Ensuite, Puis, Enfin.",
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: "Impératif d'Orientation & Prépositions Spatiales",
        explanation: "Pour donner un itinéraire, on utilise l'impératif des verbes de mouvement : 'Allez', 'Tournez', 'Prenez', 'Traversez', 'Continuez'. Les repères spatiaux utilisent des prépositions composées : 'en face de', 'à côté de', 'au bout de', 'au coin de'.",
        examples: [
          "Allez tout droit jusqu'au feu tricolore.",
          "Prenez la troisième rue à droite.",
          "La pharmacie se trouve à côté du supermarché.",
        ],
      ),
    ),

    // ==========================================
    // SEMAINE 7: Révision des Fonctions Communicatives & Jeux de Rôles
    // ==========================================
    JSS1Lesson(
      term: 3,
      week: 7,
      topic: "Révision des Fonctions Communicatives",
      subtitle: "Integrating learned communicative patterns in dialogues, sketches and realistic role plays across real-life contexts",
      patternType: JSS1PatternType.communicativeRoleplayStudio,
      objectives: [
        "Réactiver et intégrer l'ensemble des fonctions communicatives apprises durant l'année",
        "Jouer des saynètes et sketchs réalistes (Au marché, À l'infirmerie, À l'accueil, Invitations)",
        "Passer avec aisance du rôle d'interlocuteur A à interlocuteur B avec prononciation authentique",
        "Renforcer l'assurance et la spontanéité de l'expression orale interactive",
      ],
      culturalInsight:
          "Le théâtre et le jeu de rôles sont les méthodes les plus efficaces et ludiques pour maîtriser une langue vivante en classe de JSS1. Les sketches simulent la vie quotidienne au Nigeria et dans l'espace francophone.",
      vocabItems: [
        JSS1VocabItem(
          french: "Bonjour Madame, combien coûte ce cahier ?",
          phonetics: "[bɔ̃.ʒuʁ ma.dam kɔ̃.bjɛ̃ kut sə ka.je]",
          english: "Hello Madam, how much does this notebook cost?",
          usageNote: "Scène du Marché : Demande de prix d'un article scolaire.",
          icon: Icons.shopping_basket_rounded,
          audioKey: "bonjour_combien_coute_ce_cahier",
        ),
        JSS1VocabItem(
          french: "Bonjour ! Ça coûte cinq cents nairas",
          phonetics: "[bɔ̃.ʒuʁ sa kut sɛ̃ sɑ̃ naj.ʁa]",
          english: "Hello! It costs five hundred nairas",
          usageNote: "Scène du Marché : Indication d'un prix en monnaie locale.",
          icon: Icons.payments_rounded,
          audioKey: "ca_coute_cinq_cents_nairas",
        ),
        JSS1VocabItem(
          french: "Où avez-vous mal ? J'ai mal au ventre",
          phonetics: "[u a.ve vu mal / ʒe mal o vɑ̃tʁ]",
          english: "Where does it hurt? I have a stomach ache",
          usageNote: "Scène de l'Infirmerie : Consultation médicale de base.",
          icon: Icons.healing_rounded,
          audioKey: "ou_avez_vous_mal_mal_au_ventre",
        ),
        JSS1VocabItem(
          french: "Prenez ce médicament et reposez-vous",
          phonetics: "[pʁə.ne sə me.di.ka.mɑ̃ e ʁə.po.ze vu]",
          english: "Take this medicine and get some rest",
          usageNote: "Scène de l'Infirmerie : Conseil médical et ordonnance.",
          icon: Icons.medication_rounded,
          audioKey: "prenez_ce_medicament_reposez_vous",
        ),
        JSS1VocabItem(
          french: "Pardon Monsieur, puis-je parler au délégué ?",
          phonetics: "[paʁ.dɔ̃ mə.sjø pɥi ʒə paʁ.le o de.le.ge]",
          english: "Excuse me Sir, may I speak with the class prefect?",
          usageNote: "Scène d'Accueil : Visiteur recherchant un responsable d'élèves.",
          icon: Icons.person_search_rounded,
          audioKey: "puis_je_parler_au_delegue",
        ),
        JSS1VocabItem(
          french: "Oui, il est dans la classe de JSS1 au premier étage",
          phonetics: "[wi il ɛ dɑ̃ la klas də ʒi.ɛs.ɛs.wʌn o pʁə.mje e.taʒ]",
          english: "Yes, he is in the JSS1 classroom on the first floor",
          usageNote: "Scène d'Accueil : Orientation spatiale d'un visiteur dans l'école.",
          icon: Icons.domain_rounded,
          audioKey: "il_est_dans_la_classe_de_jss1",
        ),
        JSS1VocabItem(
          french: "Tu veux venir regarder le match samedi ?",
          phonetics: "[ty vø və.niʁ ʁə.gaʁ.de lə matʃ sam.di]",
          english: "Do you want to come watch the football match on Saturday?",
          usageNote: "Scène de Loisir : Invitation amicale à un événement sportif.",
          icon: Icons.sports_soccer_rounded,
          audioKey: "tu_veux_venir_regarder_le_match",
        ),
        JSS1VocabItem(
          french: "C'est une excellente idée, j'arrive à 15 heures !",
          phonetics: "[sɛ t-yn ɛk.sɛ.lɑ̃t i.de ʒa.ʁiv a kɛ̃z œʁ]",
          english: "That is an excellent idea, I will arrive at 3 PM!",
          usageNote: "Scène de Loisir : Acceptation enthousiaste avec heure précise.",
          icon: Icons.alarm_on_rounded,
          audioKey: "excellente_idee_j_arrive_a_15h",
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: "Dans un sketch au marché, quelle est la réplique adéquate pour demander un prix ?",
          options: [
            "Bonjour Madame, combien coûte ce livre ?",
            "Où avez-vous mal ?",
            "Faites attention !",
            "Il pleut aujourd'hui"
          ],
          correctOptionIndex: 0,
          explanation: "'Combien coûte... ?' est la formule universelle pour s'informer d'un prix.",
        ),
        JSS1InteractiveExercise(
          prompt: "À l'infirmerie, pour exprimer une douleur à la tête, l'élève dit :",
          options: ["J'ai mal au ventre", "J'ai mal à la tête", "J'ai mal aux pieds", "Je suis très content"],
          correctOptionIndex: 1,
          explanation: "Structure 'Avoir mal à la + tête' (tête étant féminin).",
        ),
        JSS1InteractiveExercise(
          prompt: "Comment un ami accepte-t-il une invitation au match de football ?",
          options: [
            "Non, c'est interdit",
            "C'est une excellente idée, j'arrive !",
            "Taisez-vous !",
            "Je ne triche jamais"
          ],
          correctOptionIndex: 1,
          explanation: "'C'est une excellente idée !' valide une sortie avec plaisir.",
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: "Jouez en français la négociation d'un prix au marché entre un acheteur et une commerçante.",
          answer: "- Bonjour Madame, combien coûte ce sac ? - Bonjour ! Ça coûte deux mille nairas.",
          hint: "Demande de prix + réponse en nairas.",
        ),
        JSS1EvaluationQuestion(
          question: "Que dit l'infirmière scolaire à un élève fiévreux ?",
          answer: "Où avez-vous mal ? Prenez ce comprimé et reposez-vous.",
          hint: "Où avez-vous mal ? + Conseil.",
        ),
        JSS1EvaluationQuestion(
          question: "Invitez votre voisin de classe à étudier la bibliothèque après les cours.",
          answer: "Tu veux venir étudier avec moi à la bibliothèque après les cours ?",
          hint: "Tu veux venir + étudier à la bibliothèque.",
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: "Théâtre en Binôme",
          instruction: "Choisissez l'un des 4 scénarios et écrivez le dialogue complet de 6 répliques avec votre binôme.",
          exampleResponse: "A: Bonjour Chukwuma ! B: Bonjour Amina ! A: Tu veux venir chez moi samedi ? B: Avec plaisir ! À quelle heure ? A: À 14 heures. B: Parfait, à samedi !",
        ),
        JSS1AssignmentTask(
          category: "Enregistrement Oral",
          instruction: "Enregistrez-vous en train de réciter les deux rôles du dialogue du marché scolaire.",
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: "Synthèse des Actes de Parole en Situation Réelle",
        explanation: "La communication vivante associe les salutations, les demandes polies ('Puis-je...'), les prix ('Combien coûte... ?'), l'expression des sensations physiques ('Avoir mal à...') et la localisation temporelle ('à 15 heures').",
        examples: [
          "Bonjour Monsieur, avez-vous de l'eau fraîche ?",
          "J'ai mal au dos depuis hier soir.",
          "Rendez-vous devant le collège à seize heures pile.",
        ],
      ),
    ),

    // ==========================================
    // SEMAINE 8: Atelier d'Expression Écrite et Orale (BECE Prep)
    // ==========================================
    JSS1Lesson(
      term: 3,
      week: 8,
      topic: "Pratique de l'expression écrite et orale (BECE)",
      subtitle: "Guided composition, listening comprehension, spelling & dictation clinic and BECE / Junior WAEC exam drills",
      patternType: JSS1PatternType.writtenOralWorkshopStudio,
      objectives: [
        "Rédiger un paragraphe suivi et cohérent de présentation personnelle et de description (Autoportrait en 6 phrases)",
        "Maîtriser l'orthographe lexicale, les accents français (aigu, grave, circonflexe, cédille, tréma) et les accords de base",
        "S'entraîner aux épreuves types d'écoute, de compréhension écrite et de QCM du BECE / Junior WAEC",
        "Développer des stratégies d'examen rigoureuses pour exceller à l'évaluation nationale",
      ],
      culturalInsight:
          "Le BECE (Basic Education Certificate Examination) sanctionne la fin du premier cycle secondaire au Nigeria. Une solide maîtrise du français écrit et oral offre un atout académique et professionnel exceptionnel aux élèves nigérians.",
      vocabItems: [
        JSS1VocabItem(
          french: "La rédaction et la composition écrite",
          phonetics: "[la ʁe.dak.sjɔ̃ e la kɔ̃.po.zi.sjɔ̃ e.kʁit]",
          english: "Essay writing and written composition",
          usageNote: "Activité centrale d'expression écrite guidée.",
          icon: Icons.edit_note_rounded,
          audioKey: "la_redaction_la_composition",
        ),
        JSS1VocabItem(
          french: "La dictée et l'orthographe française",
          phonetics: "[la dik.te e l-ɔʁ.tɔ.gʁaf fʁɑ̃.sɛz]",
          english: "Dictation and French spelling",
          usageNote: "Exercice rigoureux de correspondance phonie-graphie.",
          icon: Icons.spellcheck_rounded,
          audioKey: "la_dictee_et_l_orthographe",
        ),
        JSS1VocabItem(
          french: "La compréhension orale et auditive",
          phonetics: "[la kɔ̃.pʁe.ɑ̃.sjɔ̃ ɔ.ʁal e o.di.tiv]",
          english: "Listening comprehension",
          usageNote: "Écoute attentive d'enregistrements audio pour répondre à des questions.",
          icon: Icons.headphones_rounded,
          audioKey: "la_comprehension_orale",
        ),
        JSS1VocabItem(
          french: "Choisissez la bonne réponse parmi les options",
          phonetics: "[ʃwa.zi.se la bɔn ʁe.pɔ̃s paʁ.mi le z-ɔp.sjɔ̃]",
          english: "Choose the correct answer among the options",
          usageNote: "Consigne universelle des épreuves de QCM (Multiple Choice Questions).",
          icon: Icons.check_circle_outline_rounded,
          audioKey: "choisissez_la_bonne_reponse",
        ),
        JSS1VocabItem(
          french: "Complétez le texte à trous avec les mots justes",
          phonetics: "[kɔ̃.ple.te lə tɛkst a tʁu a.vɛk le mo ʒyst]",
          english: "Fill in the blanks with the correct words",
          usageNote: "Exercice classique de grammaire et vocabulaire.",
          icon: Icons.space_bar_rounded,
          audioKey: "completez_le_texte_a_trous",
        ),
        JSS1VocabItem(
          french: "Présentez-vous en six phrases complètes",
          phonetics: "[pʁe.zɑ̃.te vu z-ɑ̃ sis fʁaz kɔ̃.plɛt]",
          english: "Introduce yourself in six complete sentences",
          usageNote: "Consigne d'autoportrait pour l'épreuve de composition.",
          icon: Icons.badge_rounded,
          audioKey: "presentez_vous_en_six_phrases",
        ),
        JSS1VocabItem(
          french: "Félicitations pour vos excellents progrès !",
          phonetics: "[fe.li.si.ta.sjɔ̃ puʁ voz ɛk.sɛ.lɑ̃ pʁɔ.gʁɛ]",
          english: "Congratulations on your excellent progress!",
          usageNote: "Encouragement bienveillant pour stimuler la confiance de l'élève.",
          icon: Icons.auto_awesome_rounded,
          audioKey: "felicitations_pour_vos_progres",
        ),
        JSS1VocabItem(
          french: "Bonne chance pour l'examen annuel du BECE !",
          phonetics: "[bɔn ʃɑ̃s puʁ l-ɛg.za.mɛ̃ a.njɥɛl dy bi.i.si.i]",
          english: "Good luck for the annual BECE examination!",
          usageNote: "Vœu officiel de réussite aux examens d'État.",
          icon: Icons.stars_rounded,
          audioKey: "bonne_chance_examen_annuel",
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: "Quelle phrase est grammaticalement correcte pour un autoportrait de garçon ?",
          options: [
            "Je m'appelle Chukwuma, je suis nigérian et j'ai douze ans.",
            "Je m'appelle Chukwuma, je suis nigériane et j'ai douze ans.",
            "Je suis Chukwuma, je suis nigérian et je suis douze ans.",
            "Je m'appelle Chukwuma et je douze ans."
          ],
          correctOptionIndex: 0,
          explanation: "Accord masculin 'nigérian' + expression de l'âge avec le verbe avoir 'j'ai douze ans'.",
        ),
        JSS1InteractiveExercise(
          prompt: "Quel mot comporte un accent circonflexe ?",
          options: ["Élève", "Fête", "Français", "Très"],
          correctOptionIndex: 1,
          explanation: "'Fête' comporte un accent circonflexe sur le 'ê'.",
        ),
        JSS1InteractiveExercise(
          prompt: "Pour exprimer le métier futur, on dit :",
          options: [
            "À l'avenir, je voudrais devenir ingénieur.",
            "À l'avenir, je suis ingénieur.",
            "À l'avenir, j'ai ingénieur.",
            "À l'avenir, je fais ingénieur."
          ],
          correctOptionIndex: 0,
          explanation: "'Je voudrais devenir + profession' exprime élégamment l'aspiration future.",
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: "Écrivez votre autoportrait en 3 phrases (Nom, Âge, Profession future).",
          answer: "Je m'appelle [Nom], j'ai [Âge] ans et je voudrais devenir [Profession].",
          hint: "Je m'appelle ... J'ai ... ans ... Je voudrais devenir ...",
        ),
        JSS1EvaluationQuestion(
          question: "Citez 3 mots français comportant une cédille (ç).",
          answer: "Français, garçon, leçon.",
          hint: "Français, leçon, garçon.",
        ),
        JSS1EvaluationQuestion(
          question: "Corrigez la faute : 'Elle est un grand médecin.'",
          answer: "Elle est médecin (sans article) ou Elle est un grand médecin (l'article s'ajoute devant l'adjectif qualificatif).",
          hint: "On ne met pas d'article directement devant la profession : Elle est médecin.",
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: "Composition Complète",
          instruction: "Rédigez dans votre cahier une composition de 6 phrases intitulée 'Mon Année en JSS1 et mes Projets'.",
          exampleResponse: "Je m'appelle Ngozi. J'ai douze ans et j'habite à Lagos. Cette année en JSS1, j'ai appris le français. J'adore les cours et mes camarades. À l'avenir, je voudrais être avocate. Je suis fière de mes progrès !",
        ),
        JSS1AssignmentTask(
          category: "Fiche de Révision des Accents",
          instruction: "Listez dans votre cahier 2 exemples pour chaque type d'accent : aigu, grave, circonflexe, cédille et tréma.",
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: "Guide de Rédaction & d'Orthographe pour l'Examen BECE",
        explanation: "1) Accord des adjectifs de nationalité (nigérian / nigériane, français / française). 2) Utilisation du verbe AVOIR pour l'âge ('J'ai 12 ans'). 3) Emploi du verbe ÊTRE sans article indéfini pour les métiers ('Il est docteur'). 4) Richesse des connecteurs.",
        examples: [
          "Je m'appelle Tobi et je suis nigérian.",
          "Elle a treize ans et elle habite à Port Harcourt.",
          "Mon père est architecte et ma mère est professeure.",
        ],
      ),
    ),

    // ==========================================
    // SEMAINE 9: Grand Bilan Annuel & Remise des Diplômes JSS1
    // ==========================================
    JSS1Lesson(
      term: 3,
      week: 9,
      topic: "Grand Bilan Annuel & Remise des Diplômes JSS1",
      subtitle: "Comprehensive 4-team all-year championship quiz rally and official JSS1 French graduation diploma ceremony",
      patternType: JSS1PatternType.term3AnnualGrandRally,
      objectives: [
        "Passer en revue et célébrer l'ensemble des connaissances acquises durant les 3 trimestres de JSS1",
        "Participer avec dynamisme au Grand Rallye des 4 Équipes (Bleue, Verte, Or, Rouge)",
        "Générer et célébrer le Diplôme Officiel d'Honneur en Langue Française pour la classe de JSS1",
        "Se préparer avec enthousiasme et fierté pour le passage en classe de JSS2",
      ],
      culturalInsight:
          "La remise des prix et diplômes de fin d'année scolaire célèbre le travail assidu des élèves et leur promotion triomphale vers le niveau supérieur (Junior Secondary School 2). Félicitations à toute la promotion JSS1 !",
      vocabItems: [
        JSS1VocabItem(
          french: "Grand Rallye Annuel des Champions de Français JSS1",
          phonetics: "[gʁɑ̃ ʁa.li a.njɥɛl de ʃɑ̃.pjɔ̃ də fʁɑ̃.sɛ ʒi.ɛs.ɛs.wʌn]",
          english: "Grand Annual French Champions Rally JSS1",
          usageNote: "Grand défi ludique final de l'année scolaire.",
          icon: Icons.emoji_events_rounded,
          audioKey: "grand_rallye_annuel_des_champions",
        ),
        JSS1VocabItem(
          french: "Station 1 : Les bases du premier trimestre",
          phonetics: "[sta.sjɔ̃ œ̃ le baz dy pʁə.mje tʁi.mɛstʁ]",
          english: "Station 1: Foundations of Term 1",
          usageNote: "Salutations, alphabet, identité, goûts et loisirs.",
          icon: Icons.looks_one_rounded,
          audioKey: "station_1_bases_trimestre_1",
        ),
        JSS1VocabItem(
          french: "Station 2 : Le deuxième trimestre en action",
          phonetics: "[sta.sjɔ̃ dø lə dø.zjɛm tʁi.mɛstʁ ɑ̃ n-ak.sjɔ̃]",
          english: "Station 2: Term 2 in Action",
          usageNote: "Métiers, objets, l'heure, calendrier et routine quotidienne.",
          icon: Icons.looks_two_rounded,
          audioKey: "station_2_trimestre_2_en_action",
        ),
        JSS1VocabItem(
          french: "Station 3 : La maîtrise du troisième trimestre",
          phonetics: "[sta.sjɔ̃ tʁwa la mɛ.tʁiz dy tʁwa.zjɛm tʁi.mɛstʁ]",
          english: "Station 3: Mastery of Term 3",
          usageNote: "Météo, fréquence, invitations, règlements et itinéraires.",
          icon: Icons.looks_3_rounded,
          audioKey: "station_3_maitrise_trimestre_3",
        ),
        JSS1VocabItem(
          french: "Station 4 : Défi suprême de communication",
          phonetics: "[sta.sjɔ̃ katʁ de.fi sy.pʁɛm də kɔ.my.ni.ka.sjɔ̃]",
          english: "Station 4: Supreme Communication Challenge",
          usageNote: "Synthèse orale, sketchs et questions pièges.",
          icon: Icons.looks_4_rounded,
          audioKey: "station_4_defi_supreme",
        ),
        JSS1VocabItem(
          french: "Victoire éclatante ! Dix points pour l'équipe !",
          phonetics: "[vik.twaʁ e.kla.tɑ̃t di pwɛ̃ puʁ l-e.kip]",
          english: "Brilliant victory! Ten points for the team!",
          usageNote: "Annonce du score lors du buzzer rally.",
          icon: Icons.military_tech_rounded,
          audioKey: "victoire_eclatante_dix_points",
        ),
        JSS1VocabItem(
          french: "Diplôme officiel d'honneur en langue française JSS1",
          phonetics: "[di.plom ɔ.fi.sjɛl d-ɔ.nœʁ ɑ̃ lɑ̃g fʁɑ̃.sɛz]",
          english: "Official JSS1 French Honor Diploma Certificate",
          usageNote: "Certificat officiel de fin de cycle JSS1 conforme NERDC.",
          icon: Icons.workspace_premium_rounded,
          audioKey: "diplome_officiel_de_francais_jss1",
        ),
        JSS1VocabItem(
          french: "Bravo à tous les élèves ! Rendez-vous en JSS2 !",
          phonetics: "[bʁa.vo a tu le z-e.lɛv ʁɑ̃.de vu z-ɑ̃ ʒi.ɛs.ɛs.tu]",
          english: "Well done to all students! See you in JSS2!",
          usageNote: "Clôture festive du programme annuel de JSS1.",
          icon: Icons.celebration_rounded,
          audioKey: "bravo_a_tous_rendez_vous_en_jss2",
        ),
      ],
      classworkExercises: [
        JSS1InteractiveExercise(
          prompt: "Quel est l'article indéfini pluriel pour tous les noms en français ?",
          options: ["Un", "Une", "Des", "Les"],
          correctOptionIndex: 2,
          explanation: "'Des' est l'article indéfini pluriel universel (masculin et féminin).",
        ),
        JSS1InteractiveExercise(
          prompt: "Comment dit-on 'It is 8:30 AM' en français ?",
          options: [
            "Il est huit heures et demie du matin.",
            "Il fait huit heures et demie.",
            "Il y a huit heures.",
            "Il est huit heures moins le quart."
          ],
          correctOptionIndex: 0,
          explanation: "'Il est + heure + et demie' indique la demi-heure.",
        ),
        JSS1InteractiveExercise(
          prompt: "Quelle formule utilise-t-on pour demander poliment son chemin en ville ?",
          options: [
            "Pardon Monsieur, où se trouve la poste ?",
            "Donne-moi la poste !",
            "Taisez-vous immédiatement !",
            "Je ne triche jamais"
          ],
          correctOptionIndex: 0,
          explanation: "'Pardon Monsieur, où se trouve... ?' est la formule de politesse idéale pour s'orienter.",
        ),
      ],
      evaluationQuestions: [
        JSS1EvaluationQuestion(
          question: "Récapitulez les 3 grandes réussites de votre année de français en JSS1.",
          answer: "1. Saluer et se présenter. 2. Dire l'heure et décrire les métiers. 3. Exprimer la météo, la fréquence et s'orienter en ville.",
          hint: "Term 1 + Term 2 + Term 3.",
        ),
        JSS1EvaluationQuestion(
          question: "Conjuguez le verbe 'ÊTRE' au présent de l'indicatif avec toutes les personnes.",
          answer: "Je suis, tu es, il/elle est, nous sommes, vous êtes, ils/elles sont.",
          hint: "Je suis, tu es, il est, nous sommes, vous êtes, ils sont.",
        ),
        JSS1EvaluationQuestion(
          question: "Conjuguez le verbe 'AVOIR' au présent de l'indicatif avec toutes les personnes.",
          answer: "J'ai, tu as, il/elle a, nous avons, vous avez, ils/elles ont.",
          hint: "J'ai, tu as, il a, nous avons, vous avez, ils ont.",
        ),
      ],
      assignmentTasks: [
        JSS1AssignmentTask(
          category: "Portfolio Annuel",
          instruction: "Rassemblez vos compositions des trois trimestres et créez votre Portfolio Officiel de Français JSS1.",
          exampleResponse: "Portfolio de Français JSS1 complet, validé avec mention Très Honorable par le professeur.",
        ),
        JSS1AssignmentTask(
          category: "Projet pour JSS2",
          instruction: "Écrivez 3 objectifs que vous souhaitez accomplir en français l'année prochaine en classe de JSS2.",
        ),
      ],
      grammarNote: JSS1GrammarNote(
        title: "Bilan Grammatical Annuel JSS1 (Socle de Base)",
        explanation: "1) Les auxiliaires fondamentaux ÊTRE et AVOIR. 2) Les verbes du 1er groupe en -ER (parler, habiter, aimer, jouer). 3) Les structures impersonnelles (Il fait, Il y a, Il est + heure, Il faut). 4) Les adjectifs qualificatifs et accords en genre et en nombre.",
        examples: [
          "Je suis élève, j'ai douze ans et j'aime le français.",
          "Il est dix heures, il fait beau et nous sommes prêts.",
          "Félicitations pour votre réussite en JSS1 !",
        ],
      ),
    ),
  ];
}
