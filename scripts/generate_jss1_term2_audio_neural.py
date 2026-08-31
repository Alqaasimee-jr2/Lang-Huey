# -*- coding: utf-8 -*-
import os
import asyncio
import shutil
import glob
import edge_tts

# Target Directories
AUDIO_DIR = r"c:\Users\DELL\Desktop\Lang Huey\JSS1_FRENCH\assets\audio\jss1_term2"
IMAGES_DIR = r"c:\Users\DELL\Desktop\Lang Huey\JSS1_FRENCH\assets\images\jss1_term2"
ARTIFACTS_DIR = r"C:\Users\DELL\.gemini\antigravity-ide\brain\0db0fd30-6197-4ef2-b8a5-9d6354eca748"

os.makedirs(AUDIO_DIR, exist_ok=True)
os.makedirs(IMAGES_DIR, exist_ok=True)

# Copy generated images to project assets
IMAGE_MAP = {
    "jss1_object_properties_stage": "jss1_object_properties_stage.jpg",
    "jss1_polite_requests_reception": "jss1_polite_requests_reception.jpg",
    "jss1_professions_careers": "jss1_professions_careers.jpg",
    "jss1_clock_time_school": "jss1_clock_time_school.jpg",
    "jss1_weekly_calendar_nigeria": "jss1_weekly_calendar_nigeria.jpg",
    "jss1_term2_rally_trophy": "jss1_term2_rally_trophy.jpg",
}

for prefix, target_name in IMAGE_MAP.items():
    matches = glob.glob(os.path.join(ARTIFACTS_DIR, f"{prefix}*.jpg"))
    if matches:
        latest = max(matches, key=os.path.getmtime)
        dest = os.path.join(IMAGES_DIR, target_name)
        shutil.copy2(latest, dest)
        print(f"Copied image: {latest} -> {dest}")

# Complete dictionary of all Term 2 audio keys with authentic French text & accents
PHRASES = {
    # Week 1: Exprimer les propriétés des objets
    "grand_grande": "Grand. Grande.",
    "petit_petite": "Petit. Petite.",
    "rond_ronde": "Rond. Ronde.",
    "carre_carree": "Carré. Carrée.",
    "lourd_lourde": "Lourd. Lourde.",
    "leger_legere": "Léger. Légère.",
    "dur_dure": "Dur. Dure.",
    "doux_douce": "Doux. Douce.",
    "de_quelle_couleur_est_cet_objet": "De quelle couleur est cet objet ?",

    # Week 2: Demander quelque chose à quelqu'un
    "sil_vous_plait": "S'il vous plaît.",
    "sil_te_plait": "S'il te plaît.",
    "je_voudrais": "Je voudrais...",
    "peux_tu_me_preter_ton_stylo": "Peux-tu me prêter ton stylo, s'il te plaît ?",
    "prete_moi_ta_regle": "Prête-moi ta règle, s'il te plaît !",
    "puis_je_voir_le_principal": "Puis-je voir Monsieur le Principal ?",
    "est_ce_que_madame_dupont_est_la": "Est-ce que Madame Dupont est là ?",
    "voici_pour_toi_tenez": "Voici pour toi. Tenez, Monsieur.",
    "merci_beaucoup_de_rien": "Merci beaucoup ! De rien.",

    # Week 3: Décrire les professions
    "le_medecin": "Le médecin. La femme médecin.",
    "l_enseignant_l_enseignante": "L'enseignant. L'enseignante.",
    "l_ingenieur_l_ingenieure": "L'ingénieur. L'ingénieure.",
    "l_avocat_l_avocate": "L'avocat. L'avocate.",
    "l_infirmier_l_infirmiere": "L'infirmier. L'infirmière.",
    "le_commercant_la_commercante": "Le commerçant. La commerçante.",
    "il_soigne_les_malades": "Il soigne les malades à l'hôpital.",
    "elle_enseigne_aux_eleves": "Elle enseigne aux élèves dans la classe.",
    "que_fait_il_dans_la_vie": "Que fait-il dans la vie ?",

    # Week 4: Demander et donner l'heure
    "quelle_heure_est_il": "Quelle heure est-il ?",
    "il_est_huit_heures_pile": "Il est huit heures pile.",
    "il_est_huit_heures_et_quart": "Il est huit heures et quart.",
    "il_est_huit_heures_et_demie": "Il est huit heures et demie.",
    "il_est_neuf_heures_moins_le_quart": "Il est neuf heures moins le quart.",
    "il_est_midi": "Il est midi pile.",
    "il_est_minuit": "Il est minuit pile.",
    "a_quelle_heure_commence_le_cours": "À quelle heure commence le cours ?",
    "le_matin_l_apres_midi_le_soir": "Le matin. L'après-midi. Le soir.",

    # Week 5: Horaires et routine de la journée
    "a_six_heures_je_me_reveille": "À six heures du matin, je me réveille.",
    "je_me_lave_et_je_m_habille": "Je me lave et je m'habille.",
    "a_sept_heures_je_prends_le_petit_dejeuner": "À sept heures, je prends le petit-déjeuner.",
    "a_sept_heures_et_demie_je_vais_a_l_ecole": "À sept heures et demie, je pars à l'école.",
    "a_huit_heures_les_cours_commencent": "À huit heures pile, les cours commencent.",
    "a_midi_je_dejeune_avec_mes_amis": "À midi, je déjeune avec mes camarades.",
    "a_quatorze_heures_je_rentre_a_la_maison": "À quatorze heures, je rentre à la maison.",
    "a_dix_huit_heures_je_fais_mes_devoirs": "À dix-huit heures, je fais mes devoirs.",
    "a_vingt_et_une_heures_je_me_couche": "À vingt et une heures, je me couche.",

    # Week 6: Dire les dates
    "les_7_jours_de_la_semaine": "Les sept jours de la semaine : lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche.",
    "les_12_mois_de_l_annee": "Les douze mois de l'année : janvier, février, mars, avril, mai, juin, juillet, août, septembre, octobre, novembre, décembre.",
    "quelle_est_la_date_d_aujourd_hui": "Quelle est la date d'aujourd'hui ?",
    "aujourd_hui_c_est_le": "Aujourd'hui c'est le premier octobre deux mille vingt-six.",
    "le_premier_octobre": "Le premier octobre : Fête de l'Indépendance du Nigeria.",
    "quelle_est_la_date_de_ton_anniversaire": "Quelle est la date de ton anniversaire ?",
    "mon_anniversaire_est_le_quinze_mai": "Mon anniversaire est le quinze mai.",
    "hier_aujourd_hui_demain": "Hier, aujourd'hui, demain.",
    "en_quel_mois_sommes_nous": "En quel mois sommes-nous ?",

    # Week 7: Situer un événement (Chronologie)
    "avant": "Avant.",
    "apres": "Après.",
    "pendant": "Pendant.",
    "d_abord": "D'abord.",
    "ensuite_puis": "Ensuite. Puis.",
    "enfin_finalement": "Enfin. Finalement.",
    "avant_de_manger_je_me_lave_les_mains": "Avant de manger, je me lave les mains.",
    "pendant_la_classe_les_eleves_ecoutent": "Pendant la classe, les élèves écoutent attentivement.",
    "apres_l_ecole_je_rentre_chez_moi": "Après l'école, je rentre chez moi faire mes devoirs.",

    # Week 8: Activités de tous les jours de la semaine
    "le_lundi_j_ai_cours_de_francais": "Le lundi, j'ai cours de français avec mes camarades.",
    "le_mardi_je_fais_des_mathematiques": "Le mardi, je fais des mathématiques et des sciences.",
    "le_mercredi_apres_midi_je_joue_au_football": "Le mercredi après-midi, je joue au football.",
    "le_jeudi_je_vais_a_la_bibliotheque": "Le jeudi, je vais à la bibliothèque pour lire des romans.",
    "le_vendredi_nous_nettoyons_la_classe": "Le vendredi, nous nettoyons la classe et participons au club.",
    "le_samedi_je_fais_le_menage": "Le samedi, je fais le ménage, la lessive et je me repose.",
    "le_dimanche_nous_allons_au_culte": "Le dimanche, nous allons au culte et déjeunons en famille.",
    "que_fais_tu_le_week_end": "Que fais-tu le week-end ?",
    "tous_les_jours_j_apprends_le_francais": "Tous les jours, j'apprends le français avec joie.",

    # Week 9: Grand Revision Rally
    "station_1_proprietes_et_demandes": "Station un : Propriétés des objets et demandes polies.",
    "station_2_metiers_et_professions": "Station deux : Les métiers et professions.",
    "station_3_heure_horaires_et_dates": "Station trois : L'heure, les horaires et les dates.",
    "station_4_chronologie_et_semaine": "Station quatre : Chronologie et activités de la semaine.",
    "l_equipe_rouge_bleue_verte_or": "L'équipe rouge, bleue, verte et or.",
    "appuyez_sur_le_buzzer_pour_repondre": "Appuyez sur le buzzer pour répondre !",
    "bonne_reponse_cinq_points": "Bonne réponse ! Cinq points pour l'équipe !",
    "felicitations_pour_le_deuxieme_trimestre": "Félicitations pour le deuxième trimestre ! Bravo à toutes les équipes !",
}

async def generate_audio():
    print(f"Synthesizing {len(PHRASES)} Term 2 audio files with fr-FR-DeniseNeural...")
    success_count = 0
    for key, text in PHRASES.items():
        out_path = os.path.join(AUDIO_DIR, f"{key}.mp3")
        try:
            communicate = edge_tts.Communicate(text, voice="fr-FR-DeniseNeural", rate="-4%")
            await communicate.save(out_path)
            success_count += 1
            print(f"[{success_count}/{len(PHRASES)}] Generated: {key}.mp3")
        except Exception as e:
            print(f"Error generating {key}: {e}")

    print(f"\nCompleted! Generated {success_count}/{len(PHRASES)} audio files in {AUDIO_DIR}")

if __name__ == "__main__":
    asyncio.run(generate_audio())
