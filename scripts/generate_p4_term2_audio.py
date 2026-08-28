import os
import sys
import site

user_site = site.getusersitepackages()
if os.path.exists(user_site) and user_site not in sys.path:
    sys.path.insert(0, user_site)

from gtts import gTTS

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "..", "mvp", "assets", "audio", "p4_term2")
os.makedirs(OUTPUT_DIR, exist_ok=True)

# Comprehensive French phrase catalog for Term 2 (Weeks 1 - 13)
# Based on NERDC curriculum & Term 2 bespoke pattern widgets
PHRASES = {
    # Week 1: Close Family Members & Mon/Ma Possessives
    "la_famille": "La famille",
    "le_pere": "Le père",
    "la_mere": "La mère",
    "le_frere": "Le frère",
    "la_soeur": "La sœur",
    "mon": "Mon",
    "ma": "Ma",
    "mes": "Mes",
    "voici": "Voici",
    "cest": "C'est",
    "jai_un_frere": "J'ai un frère",
    "jai_une_soeur": "J'ai une sœur",
    "voici_mon_pere": "Voici mon père",
    "voici_ma_mere": "Voici ma mère",
    "cest_mon_frere": "C'est mon frère",
    "cest_ma_soeur": "C'est ma sœur",
    "mes_parents": "Mes parents",
    "jaime_ma_famille": "J'aime ma famille",

    # Week 2: Extended Family & 3-Generation Family Tree
    "le_grand_pere": "Le grand-père",
    "la_grand_mere": "La grand-mère",
    "loncle": "L'oncle",
    "la_tante": "La tante",
    "le_cousin": "Le cousin",
    "la_cousine": "La cousine",
    "les_grands_parents": "Les grands-parents",
    "larbre_genealogique": "L'arbre généalogique",
    "il_sappelle": "Il s'appelle",
    "elle_sappelle": "Elle s'appelle",
    "comment_il_sappelle": "Comment il s'appelle ?",
    "comment_elle_sappelle": "Comment elle s'appelle ?",

    # Week 3: Describing Family with Adjectives & Verb "Avoir"
    "grand": "Grand",
    "grande": "Grande",
    "petit": "Petit",
    "petite": "Petite",
    "jeune": "Jeune",
    "vieux": "Vieux",
    "vieille": "Vieille",
    "beau": "Beau",
    "belle": "Belle",
    "gentil": "Gentil",
    "gentille": "Gentille",
    "jai": "J'ai",
    "tu_as": "Tu as",
    "il_a": "Il a",
    "elle_a": "Elle a",
    "mon_pere_est_grand": "Mon père est grand",
    "ma_mere_est_grande": "Ma mère est grande",
    "mon_frere_est_petit": "Mon frère est petit",
    "ma_soeur_est_petite": "Ma sœur est petite",
    "mon_grand_pere_est_vieux": "Mon grand-père est vieux",
    "ma_grand_mere_est_vieille": "Ma grand-mère est vieille",

    # Week 4: School Environment & Classroom Items
    "lecole": "L'école",
    "la_classe": "La classe",
    "la_salle_de_classe": "La salle de classe",
    "le_tableau": "Le tableau",
    "le_bureau": "Le bureau",
    "la_chaise": "La chaise",
    "le_livre": "Le livre",
    "le_cahier": "Le cahier",
    "le_stylo": "Le stylo",
    "le_crayon": "Le crayon",
    "la_gomme": "La gomme",
    "la_regle": "La règle",
    "le_sac_a_dos": "Le sac à dos",
    "le_professeur": "Le professeur",
    "leleve": "L'élève",
    "ouvre_ton_livre": "Ouvre ton livre",
    "ferme_ton_cahier": "Ferme ton cahier",
    "ecoute_le_professeur": "Écoute le professeur",

    # Week 5 & 11 & 12: Oral Revision Rally & Exam Review
    "oral_rally_week5": "Révision orale du mi-trimestre",
    "oral_rally_week11": "Grande révision orale du deuxième trimestre",
    "question_reponse": "Question et réponse",
    "bonne_chance": "Bonne chance !",
    "tres_bien_continue": "Très bien, continue !",

    # Week 7: School Campus Places & Subjects & Verb "Aller"
    "la_bibliotheque": "La bibliothèque",
    "la_cour": "La cour",
    "la_cour_de_recreation": "La cour de récréation",
    "le_bureau_du_directeur": "Le bureau du directeur",
    "les_toilettes": "Les toilettes",
    "le_francais": "Le français",
    "langlais": "L'anglais",
    "les_mathematiques": "Les mathématiques",
    "les_sciences": "Les sciences",
    "le_sport": "Le sport",
    "je_vais": "Je vais",
    "tu_vas": "Tu vas",
    "il_va": "Il va",
    "elle_va": "Elle va",
    "je_vais_a_lecole": "Je vais à l'école",
    "je_vais_a_la_bibliotheque": "Je vais à la bibliothèque",
    "je_vais_dans_la_cour": "Je vais dans la cour",
    "jaime_le_francais": "J'aime le français",

    # Week 8: School Timetable & Action Verbs
    "le_lundi": "Le lundi",
    "le_mardi": "Le mardi",
    "le_mercredi": "Le mercredi",
    "le_jeudi": "Le jeudi",
    "le_vendredi": "Le vendredi",
    "le_samedi": "Le samedi",
    "le_dimanche": "Le dimanche",
    "lemploi_du_temps": "L'emploi du temps",
    "lire": "Lire",
    "ecrire": "Écrire",
    "etudier": "Étudier",
    "jouer": "Jouer",
    "dessiner": "Dessiner",
    "chanter": "Chanter",
    "je_lis_un_livre": "Je lis un livre",
    "jecris_dans_mon_cahier": "J'écris dans mon cahier",
    "nous_etudions_le_francais": "Nous étudions le français",
    "les_eleves_jouent": "Les élèves jouent dans la cour",

    # Week 9: Spatial Prepositions & Objects
    "sur": "Sur",
    "sous": "Sous",
    "dans": "Dans",
    "devant": "Devant",
    "derriere": "Derrière",
    "a_cote_de": "À côté de",
    "entre": "Entre",
    "le_stylo_est_sur_la_table": "Le stylo est sur la table",
    "le_sac_est_sous_la_chaise": "Le sac est sous la chaise",
    "le_livre_est_dans_le_sac": "Le livre est dans le sac",
    "le_professeur_est_devant_le_tableau": "Le professeur est devant le tableau",
    "le_ballon_est_derriere_la_porte": "Le ballon est derrière la porte",

    # Week 10: Colors & Immediate Environment Integration
    "rouge": "Rouge",
    "bleu": "Bleu",
    "bleue": "Bleue",
    "jaune": "Jaune",
    "vert": "Vert",
    "verte": "Verte",
    "noir": "Noir",
    "noire": "Noire",
    "blanc": "Blanc",
    "blanche": "Blanche",
    "orange": "Orange",
    "marron": "Marron",
    "de_quelle_couleur_est": "De quelle couleur est ?",
    "le_stylo_est_bleu": "Le stylo est bleu",
    "la_regle_est_jaune": "La règle est jaune",
    "la_chaise_est_verte": "La chaise est verte",
    "enchante": "Enchanté",
    "enchantee": "Enchantée",
    "bonjour_madame_voici_mon_pere": "Bonjour Madame, voici mon père",
    "bonjour_monsieur_voici_ma_mere": "Bonjour Monsieur, voici ma mère",

    # Week 6 & 13: Mid-Term & End-of-Term Celebrations
    "bonnes_vacances": "Bonnes vacances !",
    "a_la_rentree": "À la rentrée !",
    # Compound & Revision Rally Audio Tracks
    "arbre_genealogique": "L'arbre généalogique",
    "avoir_singular": "J'ai, tu as, il a, elle a",
    "ballon_sous_table": "Le ballon est sous la table",
    "bureau_du_directeur": "Le bureau du directeur",
    "cest_le_tableau": "C'est le tableau",
    "cest_mon_cahier": "C'est mon cahier",
    "couleurs_all": "Rouge, bleu, jaune, vert, noir, blanc",
    "devant_derriere": "Devant et derrière",
    "examen_oral": "Examen oral de fin de trimestre",
    "famille_et_ecole": "La famille et l'école",
    "grand_grande": "Grand et grande",
    "grand_pere_grand_mere": "Mon grand-père et ma grand-mère",
    "jaime": "J'aime",
    "jeudi": "Jeudi",
    "jours_semaine_all": "Lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche",
    "la_revision": "La révision",
    "le_repos": "Le repos",
    "livre_et_tableau": "Le livre et le tableau",
    "lundi": "Lundi",
    "mardi": "Mardi",
    "mercredi": "Mercredi",
    "mon_ecole_et_moi": "Mon école et moi",
    "mon_frere_ma_soeur": "Mon frère et ma sœur",
    "mon_ma_mes": "Mon, ma, mes",
    "mon_pere_ma_mere": "Mon père et ma mère",
    "oncle_et_tante": "Mon oncle et ma tante",
    "petit_petite": "Petit et petite",
    "prepositions_all": "Sur, sous, dans, devant, derrière",
    "quest_ce_que_cest": "Qu'est-ce que c'est ?",
    "samedi_dimanche": "Samedi et dimanche",
    "stylo_et_cahier": "Le stylo et le cahier",
    "temps_et_repas": "Le temps et les repas",
    "tres_bien": "Très bien",
    "vendredi": "Vendredi",
    "vieux_vieille": "Vieux et vieille",
    "voici_mon_ecole": "Voici mon école",
}

def generate_all():
    if sys.platform == "win32":
        sys.stdout.reconfigure(encoding="utf-8")
        
    print(f"Generating {len(PHRASES)} standard 44.1kHz MP3 files into: {OUTPUT_DIR}")
    count = 0
    for key, text in PHRASES.items():
        out_path = os.path.join(OUTPUT_DIR, f"{key}.mp3")
        try:
            tts = gTTS(text=text, lang="fr", slow=False)
            tts.save(out_path)
            size = os.path.getsize(out_path)
            print(f"[OK] [{count+1}/{len(PHRASES)}] {key}.mp3 ({size} bytes) -> '{text}'")
            count += 1
        except Exception as e:
            print(f"[FAIL] {key}: {e}")

if __name__ == "__main__":
    generate_all()
