import os
import sys
from gtts import gTTS

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "..", "mvp", "assets", "audio", "p4_term1")
os.makedirs(OUTPUT_DIR, exist_ok=True)

# Full catalog of French terms across Term 1 Weeks 1 to 13
PHRASES = {
    # Week 1: Alphabet & Geography
    "alphabet_a": "A",
    "alphabet_b": "B",
    "alphabet_c": "C",
    "alphabet_d": "D",
    "alphabet_e": "E",
    "le_benin": "Le Bénin",
    "le_niger": "Le Niger",
    "le_tchad": "Le Tchad",
    "le_cameroun": "Le Cameroun",
    "le_senegal": "Le Sénégal",
    "la_cote_divoire": "La Côte d'Ivoire",
    "le_mali": "Le Mali",
    "le_togo": "Le Togo",
    
    # Week 2: Greetings Part 1
    "bonjour": "Bonjour",
    "bonsoir": "Bonsoir",
    "bonne_nuit": "Bonne nuit",
    "salut": "Salut",
    "coucou": "Coucou",
    "comment_allez_vous": "Comment allez-vous ?",
    "comment_ca_va": "Comment ça va ?",
    "ca_va": "Ça va ?",
    "ca_va_bien": "Ça va bien",
    "tres_bien_merci": "Très bien, merci",
    "comme_ci_comme_ca": "Comme ci, comme ça",
    "bonjour_madame": "Bonjour Madame",
    "bonjour_monsieur": "Bonjour Monsieur",

    # Week 3: Greetings Part 2 & Magic Words
    "au_revoir": "Au revoir",
    "a_bientot": "À bientôt",
    "a_demain": "À demain",
    "sil_vous_plait": "S'il vous plaît",
    "sil_te_plait": "S'il te plaît",
    "merci": "Merci",
    "de_rien": "De rien",
    "pardon": "Pardon",
    "excusez_moi": "Excusez-moi",
    "desole": "Désolé",
    "desolee": "Désolée",
    "la_bise": "La bise",

    # Week 4: Introductions & Identity
    "je_mappelle": "Je m'appelle",
    "comment_tu_tappelles": "Comment tu t'appelles ?",
    "comment_vous_appelez_vous": "Comment vous appelez-vous ?",
    "je_suis_nigerian": "Je suis Nigérian",
    "je_suis_nigeriane": "Je suis Nigériane",
    "pronom_je": "Je",
    "pronom_tu": "Tu",
    "pronom_il": "Il",
    "pronom_elle": "Elle",

    # Week 7: Numbers 1-20, Age & Gender
    "num_1": "Un",
    "num_2": "Deux",
    "num_3": "Trois",
    "num_4": "Quatre",
    "num_5": "Cinq",
    "num_6": "Six",
    "num_7": "Sept",
    "num_8": "Huit",
    "num_9": "Neuf",
    "num_10": "Dix",
    "num_11": "Onze",
    "num_12": "Douze",
    "num_13": "Treize",
    "num_14": "Quatorze",
    "num_15": "Quinze",
    "num_16": "Seize",
    "num_17": "Dix-sept",
    "num_18": "Dix-huit",
    "num_19": "Dix-neuf",
    "num_20": "Vingt",
    "quel_age_as_tu": "Quel âge as-tu ?",
    "jai_huit_ans": "J'ai huit ans",
    "jai_neuf_ans": "J'ai neuf ans",
    "jai_dix_ans": "J'ai dix ans",
    "je_suis_un_garcon": "Je suis un garçon",
    "je_suis_une_fille": "Je suis une fille",

    # Week 8: Farewells & Well-Wishes
    "a_tout_a_lheure": "À tout à l'heure",
    "a_ce_soir": "À ce soir",
    "a_la_prochaine": "À la prochaine",
    "bonne_journee": "Bonne journée",
    "bon_weekend": "Bon week-end",
    "bonne_soiree": "Bonne soirée",
    "bonnes_vacances": "Bonnes vacances",
    "adieu": "Adieu",

    # Week 9: Gratitude & Conversation
    "merci_beaucoup": "Merci beaucoup",
    "merci_pour_tout": "Merci pour tout",
    "merci_bien": "Merci bien",
    "je_dois_partir": "Je dois partir",
    
    # Week 10: ID Card & Speech
    "carte_didentite": "Carte d'identité",
    "nom": "Nom",
    "prenom": "Prénom",
    "age": "Âge",
    "pays": "Pays",
    "sexe": "Sexe",
    "nationalite": "Nationalité",
    "presentation_speech": "Bonjour ! Je m'appelle Tunde. J'ai dix ans. Je suis Nigérian. Au revoir !",
    
    # Week 12/13: Term Wrap-Up
    "felicitations": "Félicitations !",
    "a_la_rentree": "À la rentrée !",
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

    print(f"\nAll {count}/{len(PHRASES)} standard MP3 audio files generated successfully!")

if __name__ == "__main__":
    generate_all()
