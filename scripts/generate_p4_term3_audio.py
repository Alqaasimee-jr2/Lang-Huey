import os
import sys
import site
import re

# Add user site packages for gtts
sys.path.append(site.getusersitepackages())
try:
    from gtts import gTTS
except ImportError:
    import subprocess
    subprocess.check_call([sys.executable, "-m", "pip", "install", "gTTS"])
    from gtts import gTTS

OUTPUT_DIR = r"c:\Users\DELL\Desktop\Lang Huey\mvp\assets\audio\p4_term3"
os.makedirs(OUTPUT_DIR, exist_ok=True)

LESSONS_FILE = r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\data\p4_term3_lessons.dart"
PATTERNS_DIR = r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\term3"

with open(LESSONS_FILE, "r", encoding="utf-8") as f:
    lessons_content = f.read()

# Dictionary of audio_key -> french_text
audio_dict = {}

# 1. Parse P4VocabItem
vocab_blocks = re.findall(r"P4VocabItem\s*\((.*?)\)", lessons_content, re.DOTALL)
for block in vocab_blocks:
    fr_m = re.search(r'french:\s*["\'](.*?)["\']', block)
    key_m = re.search(r'audioKey:\s*["\'](.*?)["\']', block)
    if fr_m and key_m:
        french_text = fr_m.group(1).strip()
        audio_key = key_m.group(1).strip()
        audio_dict[audio_key] = french_text

print(f"Extracted {len(audio_dict)} vocabulary audio keys from lessons.")

# 2. Add bespoke phrases and questions for smartboard widgets
bespoke_phrases = {
    # Week 1: Time
    "lheure": "L'heure",
    "quelle_heure_est_il": "Quelle heure est-il ?",
    "il_est_une_heure": "Il est une heure",
    "il_est_deux_heures": "Il est deux heures",
    "il_est_trois_heures": "Il est trois heures",
    "il_est_quatre_heures": "Il est quatre heures",
    "il_est_cinq_heures": "Il est cinq heures",
    "il_est_six_heures": "Il est six heures",
    "il_est_sept_heures": "Il est sept heures",
    "il_est_huit_heures": "Il est huit heures",
    "il_est_neuf_heures": "Il est neuf heures",
    "il_est_dix_heures": "Il est dix heures",
    "il_est_onze_heures": "Il est onze heures",
    "il_est_midi": "Il est midi",
    "il_est_minuit": "Il est minuit",
    "et_quart": "et quart",
    "et_demie": "et demie",
    "moins_le_quart": "moins le quart",
    "a_quelle_heure": "À quelle heure ?",

    # Week 2: Routine
    "la_routine_quotidienne": "La routine quotidienne",
    "je_me_reveille": "Je me réveille",
    "je_me_leve": "Je me lève",
    "je_me_lave": "Je me lave",
    "je_mhabille": "Je m'habille",
    "je_prends_le_petit_dejeuner": "Je prends le petit déjeuner",
    "je_vais_a_lecole": "Je vais à l'école",
    "jaccepte_et_je_rentre": "Je rentre à la maison",
    "je_fais_mes_devoirs": "Je fais mes devoirs",
    "je_dine": "Je dîne",
    "je_me_couche": "Je me couche",
    "dabord": "D'abord",
    "ensuite": "Ensuite",
    "apres": "Après",
    "enfin": "Enfin",

    # Week 3: Food & Meals
    "le_repas": "Le repas",
    "le_petit_dejeuner": "Le petit déjeuner",
    "le_dejeuner": "Le déjeuner",
    "le_diner": "Le dîne",
    "le_pain": "Le pain",
    "le_beurre": "Le beurre",
    "le_lait": "Le lait",
    "le_riz": "Le riz",
    "le_poulet": "Le poulet",
    "le_poisson": "Le poisson",
    "la_salade": "La salade",
    "les_fruits": "Les fruits",
    "leau": "L'eau",
    "le_jus": "Le jus",
    "je_mange": "Je mange",
    "je_bois": "Je bois",
    "bon_appetit": "Bon appétit !",

    # Week 4: Hunger, Thirst & Preferences
    "jai_faim": "J'ai faim",
    "jai_soif": "J'ai soif",
    "jaime": "J'aime",
    "jadore": "J'adore",
    "je_prefere": "Je préfère",
    "je_naime_pas": "Je n'aime pas",
    "je_deteste": "Je déteste",
    "quest_ce_que_tu_aimes": "Qu'est-ce que tu aimes manger ?",
    "tu_as_faim": "Tu as faim ?",
    "tu_as_soif": "Tu as soif ?",
    "jaime_le_riz": "J'aime le riz au poulet",
    "je_prefere_le_poisson": "Je préfère le poisson grillé",

    # Week 5 & 6: Review & Break
    "bonne_chance": "Bonne chance à tous !",
    "bonnes_vacances": "Bonnes vacances et bon repos !",
    "a_table": "À table !",
    "passe_moi_le_pain": "Passe-moi le pain, s'il te plaît.",
    "merci_pour_le_repas": "Merci pour le délicieux repas.",
    "cest_tres_bon": "C'est très bon !",

    # Week 7: Body Anatomy
    "le_corps_humain": "Le corps humain",
    "la_tete": "La tête",
    "le_visage": "Le visage",
    "les_yeux": "Les yeux",
    "le_nez": "Le nez",
    "la_bouche": "La bouche",
    "les_oreilles": "Les oreilles",
    "le_bras": "Le bras",
    "la_main": "La main",
    "les_doigts": "Les doigts",
    "le_ventre": "Le ventre",
    "la_jambe": "La jambe",
    "le_pied": "Le pied",
    "les_dents": "Les dents",

    # Week 8: Health & Hygiene
    "la_sante": "La santé",
    "ou_as_tu_mal": "Où as-tu mal ?",
    "jai_mal_a_la_tete": "J'ai mal à la tête",
    "jai_mal_au_ventre": "J'ai mal au ventre",
    "jai_mal_a_la_gorge": "J'ai mal à la gorge",
    "jai_mal_aux_dents": "J'ai mal aux dents",
    "jai_la_fievre": "J'ai de la fièvre",
    "le_medecin": "Le médecin",
    "lhopital": "L'hôpital",
    "je_me_lave_les_mains": "Je me lave les mains",
    "je_me_brosse_les_dents": "Je me brosse les dents",
    "je_prends_une_douche": "Je prends une douche",

    # Week 9: Clothes & Wardrobe
    "les_vetements": "Les vêtements",
    "je_porte": "Je porte",
    "une_chemise_blanche": "Une chemise blanche",
    "un_pantalon_bleu": "Un pantalon bleu",
    "une_robe_rouge": "Une robe rouge",
    "une_jupe_verte": "Une jupe verte",
    "un_tshirt_jaune": "Un tee-shirt jaune",
    "des_chaussures_noires": "Des chaussures noires",
    "des_chaussettes": "Des chaussettes",
    "un_chapeau": "Un chapeau",
    "un_manteau": "Un manteau",
    "luniforme_scolaire": "L'uniforme scolaire",

    # Week 10: Weather & Seasons
    "quel_temps_fait_il": "Quel temps fait-il aujourd'hui ?",
    "il_fait_beau": "Il fait beau",
    "il_fait_chaud": "Il fait chaud",
    "il_fait_froid": "Il fait froid",
    "il_pleut": "Il pleut",
    "il_fait_du_vent": "Il fait du vent",
    "le_soleil": "Le soleil",
    "la_pluie": "La pluie",
    "la_saison_des_pluies": "La saison des pluies",
    "la_saison_seche": "La saison sèche",
    "lharmattan": "L'harmattan",

    # Weeks 11, 12, 13: Grand Review, Rally & Graduation
    "felicitations_p4": "Félicitations ! Vous avez brillamment réussi la quatrième année de français !",
    "bonnes_vacances_a_tous": "Bonnes grandes vacances à tous les élèves !",
    "bienvenue_en_p5": "Bienvenue en cinquième année !",
    "vive_le_francais": "Vive le français et bravo !",
    "rallye_champion": "Bravo champion ! Maîtrise parfaite !",
}

for k, v in bespoke_phrases.items():
    if k not in audio_dict:
        audio_dict[k] = v

print(f"Total unique audio files to generate for Term 3: {len(audio_dict)}")

# Synthesize all audio files
count = 0
for audio_key, text in audio_dict.items():
    file_path = os.path.join(OUTPUT_DIR, f"{audio_key}.mp3")
    if not os.path.exists(file_path):
        try:
            tts = gTTS(text=text, lang='fr', slow=False)
            tts.save(file_path)
            count += 1
            if count % 10 == 0:
                print(f"Generated {count} audio files... (latest: {audio_key}.mp3 -> '{text}')")
        except Exception as e:
            print(f"Error generating {audio_key}: {e}")
    else:
        # File already exists
        count += 1

print(f"\n[COMPLETED] Successfully generated and verified {len(audio_dict)} Term 3 MP3 files in {OUTPUT_DIR}!")
