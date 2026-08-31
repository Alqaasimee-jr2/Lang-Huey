# -*- coding: utf-8 -*-
import os
import asyncio
import shutil
import glob
import edge_tts

# Target Directories
AUDIO_DIR = r"c:\Users\DELL\Desktop\Lang Huey\JSS1_FRENCH\assets\audio\jss1_term3"
IMAGES_DIR = r"c:\Users\DELL\Desktop\Lang Huey\JSS1_FRENCH\assets\images\jss1_term3"
ARTIFACTS_DIR = r"C:\Users\DELL\.gemini\antigravity-ide\brain\0db0fd30-6197-4ef2-b8a5-9d6354eca748"

os.makedirs(AUDIO_DIR, exist_ok=True)
os.makedirs(IMAGES_DIR, exist_ok=True)

# Copy generated images to project assets
IMAGE_MAP = {
    "jss1_weather_and_seasons": "jss1_weather_and_seasons.jpg",
    "jss1_invitations_social": "jss1_invitations_social.jpg",
    "jss1_rules_signage": "jss1_rules_signage.jpg",
    "jss1_directions_city_map": "jss1_directions_city_map.jpg",
    "jss1_communicative_theatre": "jss1_communicative_theatre.jpg",
    "jss1_graduation_diploma_celebration": "jss1_graduation_diploma_celebration.jpg",
}

for prefix, target_name in IMAGE_MAP.items():
    matches = glob.glob(os.path.join(ARTIFACTS_DIR, f"{prefix}*.jpg"))
    if matches:
        latest = max(matches, key=os.path.getmtime)
        dest = os.path.join(IMAGES_DIR, target_name)
        shutil.copy2(latest, dest)
        print(f"Copied image: {latest} -> {dest}")

# Complete dictionary of all Term 3 audio keys with authentic French text & accents
PHRASES = {
    # Week 1: Demander et indiquer le temps qu’il fait
    "quel_temps_fait_il": "Quel temps fait-il aujourd'hui ?",
    "il_fait_beau_il_fait_chaud": "Il fait beau et il fait chaud.",
    "il_fait_froid_il_fait_frais": "Il fait frais et il fait froid.",
    "il_pleut_il_y_a_de_la_pluie": "Il pleut abondamment aujourd'hui.",
    "il_y_a_du_vent_il_y_a_du_soleil": "Il y a du vent et il y a du soleil.",
    "la_saison_des_pluies": "La saison des pluies au Nigeria.",
    "la_saison_seche_l_harmattan": "La saison sèche et l'harmattan.",
    "printemps_ete_automne_hiver": "Le printemps, l'été, l'automne et l'hiver.",

    # Week 2: Exprimer la fréquence d’une activité
    "toujours": "Toujours.",
    "souvent": "Souvent.",
    "parfois_quelquefois": "Parfois. Quelquefois.",
    "rarement": "Rarement.",
    "ne_jamais": "Ne jamais. Je ne triche jamais.",
    "je_fais_toujours_mes_devoirs": "Je fais toujours mes devoirs avant de dormir.",
    "nous_jouons_souvent_au_football": "Nous jouons souvent au football le mercredi.",
    "a_quelle_frequence_fais_tu_du_sport": "À quelle fréquence fais-tu du sport ?",

    # Week 3: Inviter quelqu’un
    "tu_veux_venir_chez_moi": "Tu veux venir chez moi ce week-end ?",
    "je_t_invite_a_mon_anniversaire": "Je t'invite à mon anniversaire samedi.",
    "oui_avec_grand_plaisir": "Oui, avec grand plaisir !",
    "volontiers_d_accord": "Volontiers ! D'accord !",
    "desole_je_ne_peux_pas": "Désolé, je ne peux pas, je dois étudier.",
    "c_est_gentil_mais_je_suis_occupe": "C'est gentil, mais je suis occupé.",
    "ca_te_dit_de_jouer_au_basket": "Ça te dit de jouer au basket après l'école ?",
    "a_quelle_heure_commence_la_fete": "À quelle heure commence la fête ?",

    # Week 4: Donner un ordre, interdire, autoriser
    "faites_attention_ordre": "Faites attention et écoutez attentivement !",
    "taisez_vous_silence": "Taisez-vous et faites silence !",
    "ne_bavardez_pas_en_classe": "Ne bavardez pas pendant le cours !",
    "il_est_interdit_de_tricher": "Il est strictement interdit de tricher.",
    "defense_de_fumer_ne_pas_entrer": "Défense de fumer. Ne pas entrer.",
    "vous_pouvez_entrer_tu_peux_sortir": "Vous pouvez entrer dans la classe.",
    "c_est_permis_vous_avez_l_autorisation": "C'est permis, vous avez l'autorisation.",
    "rangez_vos_affaires_asseyez_vous": "Rangez vos affaires et asseyez-vous.",

    # Week 5: Demander la permission, conseiller
    "puis_je_emprunter_votre_dictionnaire": "Puis-je emprunter votre dictionnaire, s'il vous plaît ?",
    "est_ce_que_je_peux_poser_une_question": "Est-ce que je peux poser une question ?",
    "permettez_moi_de_sortir_sil_vous_plait": "Permettez-moi de sortir, s'il vous plaît.",
    "oui_bien_sur_vas_y": "Oui, bien sûr, vas-y !",
    "tu_devrais_reviser_tes_lecons": "Tu devrais réviser tes leçons chaque soir.",
    "il_faut_bien_ecouter_le_professeur": "Il faut bien écouter le professeur en classe.",
    "tu_ferais_bien_de_te_reposer": "Tu ferais bien de te reposer un peu.",
    "a_mon_avis_meilleure_solution": "À mon avis, c'est la meilleure solution.",

    # Week 6: Expliquer une démarche / donner un itinéraire
    "pardon_monsieur_ou_se_trouve": "Pardon Monsieur, où se trouve la bibliothèque ?",
    "allez_tout_droit": "Allez tout droit sur deux cents mètres.",
    "tournez_a_droite_a_gauche": "Tournez à droite, puis tournez à gauche.",
    "prenez_la_deuxieme_rue_a_droite": "Prenez la deuxième rue à droite.",
    "traversez_le_carrefour": "Traversez prudemment le carrefour.",
    "c_est_en_face_de_l_hopital": "C'est en face de l'hôpital public.",
    "c_est_a_cote_de_la_poste": "C'est juste à côté de la poste.",
    "remplissez_d_abord_la_fiche": "Pour vous inscrire, remplissez d'abord la fiche.",

    # Week 7: Révision des Fonctions Communicatives & Jeux de Rôles
    "bonjour_combien_coute_ce_cahier": "Bonjour Madame, combien coûte ce beau cahier ?",
    "ca_coute_cinq_cents_nairas": "Bonjour ! Ça coûte cinq cents nairas.",
    "ou_avez_vous_mal_mal_au_ventre": "Où avez-vous mal ? J'ai mal au ventre, Madame.",
    "prenez_ce_medicament_reposez_vous": "Prenez ce médicament et reposez-vous.",
    "puis_je_parler_au_delegue": "Pardon Monsieur, puis-je parler au délégué de classe ?",
    "il_est_dans_la_classe_de_jss1": "Oui, il est dans la classe de J S S 1 au premier étage.",
    "tu_veux_venir_regarder_le_match": "Tu veux venir regarder le grand match de football samedi ?",
    "excellente_idee_j_arrive_a_15h": "C'est une excellente idée, j'arrive chez toi à quinze heures !",

    # Week 8: Atelier d'Expression Écrite et Orale (BECE Prep)
    "la_redaction_la_composition": "La rédaction et la composition écrite.",
    "la_dictee_et_l_orthographe": "La dictée et l'orthographe française.",
    "la_comprehension_orale": "La compréhension orale en classe.",
    "choisissez_la_bonne_reponse": "Choisissez la bonne réponse parmi les options.",
    "completez_le_texte_a_trous": "Complétez le texte à trous avec les mots justes.",
    "presentez_vous_en_six_phrases": "Présentez-vous en six phrases complètes.",
    "felicitations_pour_vos_progres": "Félicitations pour vos excellents progrès tout au long de l'année !",
    "bonne_chance_examen_annuel": "Bonne chance pour l'examen annuel du B E C E !",

    # Week 9: Grand Bilan Annuel & Remise des Diplômes JSS1
    "grand_rallye_annuel_des_champions": "Grand Rallye Annuel des Champions de Français J S S 1 !",
    "station_1_bases_trimestre_1": "Station un : Les bases du premier trimestre.",
    "station_2_trimestre_2_en_action": "Station deux : Le deuxième trimestre en action.",
    "station_3_maitrise_trimestre_3": "Station trois : La maîtrise du troisième trimestre.",
    "station_4_defi_supreme": "Station quatre : Défi suprême de communication.",
    "victoire_eclatante_dix_points": "Victoire éclatante ! Dix points pour l'équipe !",
    "diplome_officiel_de_francais_jss1": "Diplôme officiel d'honneur en langue française décerné pour la classe de J S S 1.",
    "bravo_a_tous_rendez_vous_en_jss2": "Bravo à tous les élèves ! Félicitations et rendez-vous en classe de J S S 2 !",
}

async def generate_audio():
    print(f"Synthesizing {len(PHRASES)} Term 3 audio files with fr-FR-DeniseNeural...")
    success_count = 0
    for key, text in PHRASES.items():
        out_path = os.path.join(AUDIO_DIR, f"{key}.mp3")
        if os.path.exists(out_path) and os.path.getsize(out_path) > 500:
            success_count += 1
            print(f"[{success_count}/{len(PHRASES)}] Already exists: {key}.mp3")
            continue

        done = False
        for attempt in range(3):
            try:
                communicate = edge_tts.Communicate(text, voice="fr-FR-DeniseNeural", rate="-4%")
                await communicate.save(out_path)
                success_count += 1
                print(f"[{success_count}/{len(PHRASES)}] Generated: {key}.mp3")
                done = True
                break
            except Exception as e:
                print(f"Attempt {attempt+1} error generating {key}: {e}")
                await asyncio.sleep(1)

        if not done:
            try:
                from gtts import gTTS
                tts = gTTS(text=text, lang='fr', slow=False)
                tts.save(out_path)
                success_count += 1
                print(f"[{success_count}/{len(PHRASES)}] Generated via gTTS fallback: {key}.mp3")
            except Exception as e2:
                print(f"Fallback error for {key}: {e2}")

    print(f"\nCompleted! Total verified: {success_count}/{len(PHRASES)} audio files in {AUDIO_DIR}")

if __name__ == "__main__":
    asyncio.run(generate_audio())
