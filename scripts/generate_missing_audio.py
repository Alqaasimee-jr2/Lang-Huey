import os
import sys
import site

sys.path.append(site.getusersitepackages())
from gtts import gTTS

OUTPUT_DIR = r"c:\Users\DELL\Desktop\Lang Huey\mvp\assets\audio\p4_term3"
os.makedirs(OUTPUT_DIR, exist_ok=True)

missing = {
    "le_dejeuner": "Le déjeuner",
    "salutations_et_presentations": "Salutations et présentations",
    "famille_et_ecole": "La famille et l'école",
    "le_diner": "Le dîner",
    "temps_corps_repas": "Le temps, le corps et les repas",
    "le_petit_dejeuner": "Le petit déjeuner",
    "sil_vous_plait": "S'il vous plaît",
    "les_yeux": "Les yeux",
    "bienvenue_en_p5": "Bienvenue en cinquième année !",
}

for k, text in missing.items():
    fpath = os.path.join(OUTPUT_DIR, f"{k}.mp3")
    tts = gTTS(text=text, lang='fr', slow=False)
    tts.save(fpath)
    print(f"Generated {k}.mp3 -> '{text}'")

print("[DONE] Generated all missing items!")
