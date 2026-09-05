# -*- coding: utf-8 -*-
import os
import asyncio
import edge_tts

# Audio clips for the 3 onboarding slides
CLIPS = {
    "onboarding_slide1_bonjour.mp3": "Bonjour tout le monde ! Je m'appelle Huey.",
    "onboarding_slide2_voix_haute.mp3": "Ici, on apprend à voix haute ! Répétez avec fierté !",
    "onboarding_slide3_aventure.mp3": "C'est parti ! Prêts pour l'aventure ? Allons-y !",
}

# Target directories across all 5 class projects
BASE_DIR = r"c:\Users\DELL\Desktop\Lang Huey"
TARGET_DIRS = [
    os.path.join(BASE_DIR, "mvp", "assets", "audio", "onboarding"),
    os.path.join(BASE_DIR, "P5_FRENCH", "assets", "audio", "onboarding"),
    os.path.join(BASE_DIR, "JSS1_FRENCH", "assets", "audio", "onboarding"),
    os.path.join(BASE_DIR, "JSS 2_FRENCH", "assets", "audio", "onboarding"),
    os.path.join(BASE_DIR, "JSS 3_FRENCH", "assets", "audio", "onboarding"),
]

VOICE = "fr-FR-DeniseNeural"
RATE = "-4%"

async def generate_audio():
    for target_dir in TARGET_DIRS:
        os.makedirs(target_dir, exist_ok=True)
        print(f"Ensuring directory: {target_dir}")

    for filename, text in CLIPS.items():
        print(f"Synthesizing '{filename}': {text}")
        communicate = edge_tts.Communicate(text, VOICE, rate=RATE)
        temp_file = os.path.join(BASE_DIR, "scripts", f"temp_{filename}")
        await communicate.save(temp_file)

        # Copy to all target directories
        with open(temp_file, "rb") as f:
            data = f.read()

        for target_dir in TARGET_DIRS:
            dest = os.path.join(target_dir, filename)
            with open(dest, "wb") as f:
                f.write(data)
            print(f"  -> Saved {dest} ({len(data)} bytes)")

        if os.path.exists(temp_file):
            os.remove(temp_file)

    print("All onboarding audio synthesized successfully!")

if __name__ == "__main__":
    asyncio.run(generate_audio())
