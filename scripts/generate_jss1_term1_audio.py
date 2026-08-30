import os
from gtts import gTTS

# Target directory
AUDIO_DIR = r"c:\Users\DELL\Desktop\Lang Huey\JSS1_FRENCH\assets\audio\jss1_term1"
os.makedirs(AUDIO_DIR, exist_ok=True)

# Complete dictionary of JSS1 Term 1 vocabulary and phrases
PHRASES = {
    # Week 1: Words used in classroom
    "levez_vous": "Levez-vous !",
    "asseyez_vous": "Asseyez-vous !",
    "ouvrez_vos_livres": "Ouvrez vos livres !",
    "fermez_vos_cahiers": "Fermez vos cahiers !",
    "ecoutez_attentivement": "Écoutez attentivement !",
    "repetez_apres_moi": "Répétez après moi !",
    "regardez_le_tableau": "Regardez le tableau !",
    "silence_sil_vous_plait": "Silence, s'il vous plaît !",
    "puis_je_sortir": "Puis-je sortir ?",

    # Week 2: Saluer (Greetings)
    "bonjour_monsieur_madame": "Bonjour Monsieur, Madame",
    "bonsoir": "Bonsoir !",
    "salut": "Salut !",
    "comment_allez_vous": "Comment allez-vous ?",
    "comment_vas_tu": "Comment vas-tu ? Ça va ?",
    "tres_bien_merci_et_vous": "Très bien, merci ! Et vous ?",
    "enchante": "Enchanté !",
    "sil_vous_plait_de_rien": "S'il vous plaît. De rien.",
    "au_revoir_et_a_demain": "Au revoir et à demain !",

    # Week 3: Se présenter (Self introduction)
    "je_mappelle": "Je m'appelle...",
    "jai_douze_ans": "J'ai douze ans.",
    "je_suis_nigerian": "Je suis nigérian. Je suis nigériane.",
    "je_viens_de_lagos": "Je viens de Lagos. Je viens du Nigeria.",
    "jhabite_a_abuja": "J'habite à Abuja.",
    "je_suis_eleve_en_jss1": "Je suis élève en JSS1.",
    "comment_vous_appelez_vous": "Comment vous appelez-vous ?",
    "quel_age_as_tu": "Quel âge as-tu ?",

    # Week 4: Épeler un mot
    "comment_ca_secrit": "Comment ça s'écrit ?",
    "ca_sepelle": "Ça s'épèle...",
    "accent_aigu": "L'accent aigu. É.",
    "accent_grave": "L'accent grave. È.",
    "accent_circonflexe": "L'accent circonflexe. Ê.",
    "la_cedille": "La cédille. Ç.",
    "le_trema": "Le tréma. Ï.",
    "en_majuscule_en_minuscule": "En majuscule. En minuscule.",

    # Week 5: Midterm exam
    "examen_de_mi_trimestre": "L'examen de mi-trimestre.",
    "faites_attention": "Faites attention !",
    "bonne_chance_a_tous": "Bonne chance à tous !",
    "cest_la_bonne_reponse": "C'est la bonne réponse !",
    "note_maximale_20_sur_20": "La note maximale : vingt sur vingt.",

    # Week 6: Présenter quelqu'un
    "voici_mon_ami": "Voici mon ami. Voici mon amie.",
    "il_elle_sappelle": "Il s'appelle David. Elle s'appelle Amina.",
    "il_a_treize_ans": "Il a treize ans. Elle a douze ans.",
    "il_est_nigerian": "Il est nigérian. Elle est nigériane.",
    "cest_mon_camarade_de_classe": "C'est mon camarade de classe.",
    "je_vous_presente": "Je vous présente Monsieur Dupont.",
    "qui_est_ce": "Qui est-ce ? C'est mon ami.",

    # Week 7: Midterm break (Francophone world)
    "le_monde_francophone": "Le monde francophone.",
    "le_benin_porto_novo": "Le Bénin. La capitale est Porto-Novo.",
    "le_niger_niamey": "Le Niger. La capitale est Niamey.",
    "le_cameroun_yaounde": "Le Cameroun. La capitale est Yaoundé.",
    "le_tchad_ndjamena": "Le Tchad. La capitale est N'Djaména.",
    "la_france_paris": "La France. La capitale est Paris.",
    "bonnes_vacances_mi_trimestre": "Bonnes vacances de mi-trimestre !",

    # Week 8: Décrire quelqu'un
    "grand_grande": "Grand. Grande.",
    "petit_petite": "Petit. Petite.",
    "mince_gros_grosse": "Mince. Gros. Grosse.",
    "beau_belle": "Beau. Belle.",
    "teint_clair_teint_noir": "Teint clair. Teint noir.",
    "intelligent_intelligente": "Intelligent. Intelligente.",
    "gentil_gentille": "Gentil. Gentille.",
    "travailleur_travailleuse": "Travailleur. Travailleuse.",
    "comment_est_il": "Comment est-il ? Comment est-elle ?",

    # Week 9: Parler de ses loisirs
    "jouer_au_football": "Jouer au football.",
    "ecouter_de_la_musique": "Écouter de la musique.",
    "lire_des_livres": "Lire des livres et des romans.",
    "regarder_la_television": "Regarder la télévision.",
    "faire_du_velo_nager": "Faire du vélo. Nager.",
    "dessiner_et_peindre": "Dessiner et peindre.",
    "chanter_et_danser": "Chanter et danser.",
    "quest_ce_que_tu_fais_temps_libre": "Qu'est-ce que tu fais pendant ton temps libre ?",

    # Week 10: Exprimer ses goûts et préférences
    "jadore": "J'adore !",
    "jaime_beaucoup": "J'aime beaucoup.",
    "je_prefere": "Je préfère le football à la natation.",
    "je_naime_pas": "Je n'aime pas le bruit.",
    "je_deteste": "Je déteste les mensonges.",
    "pourquoi_parce_que": "Pourquoi ? Parce que c'est super !",
    "cest_delicieux_interessant": "C'est délicieux, très intéressant et amusant.",

    # Week 11: Révision
    "grand_rallye_revision": "Le grand rallye de révision.",
    "etes_vous_prets": "Êtes-vous prêts ? Oui, nous sommes prêts !",
    "felicitations_pour_vos_efforts": "Félicitations pour vos efforts !",
    "champion_de_la_classe": "Champion de la classe !",

    # Week 12: Examen
    "examen_de_fin_de_trimestre": "L'examen de fin de trimestre.",
    "lisez_attentivement_les_questions": "Lisez attentivement les questions !",
    "vous_avez_termine": "Vous avez terminé ? Oui, Madame !",
    "excellente_performance": "Excellente performance !",

    # Week 13: Clôture & Vacances
    "bonnes_vacances_a_tous": "Bonnes vacances à tous !",
    "passez_de_bonnes_fetes": "Passez de très bonnes fêtes !",
    "certificat_de_reussite": "Le certificat de réussite.",
    "rendez_vous_deuxieme_trimestre": "Rendez-vous au deuxième trimestre !"
}

def generate_all():
    print(f"Generating {len(PHRASES)} native French audio files for JSS1 Term 1...")
    for key, text in PHRASES.items():
        out_path = os.path.join(AUDIO_DIR, f"{key}.mp3")
        if not os.path.exists(out_path):
            print(f"Synthesizing: {key} -> '{text}'")
            tts = gTTS(text=text, lang="fr", slow=False)
            tts.save(out_path)
        else:
            print(f"Already exists: {key}")
    print("All JSS1 Term 1 audio files generated successfully!")

if __name__ == "__main__":
    generate_all()
