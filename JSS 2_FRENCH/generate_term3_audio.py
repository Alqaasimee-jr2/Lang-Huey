import asyncio
import os
import re
import edge_tts

VOICE = "fr-FR-DeniseNeural"
RATE = "-4%"
OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "assets", "audio", "jss2_term3")
LESSONS_FILE = os.path.join(os.path.dirname(__file__), "lib", "data", "jss2_term3_lessons.dart")

async def generate_audio(text: str, filename: str):
    communicate = edge_tts.Communicate(text, VOICE, rate=RATE)
    filepath = os.path.join(OUTPUT_DIR, f"{filename}.mp3")
    await communicate.save(filepath)
    print(f"Generated: {filename}.mp3 -> '{text}'")

def extract_vocab(file_path):
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Match each JSS2VocabItem constructor and extract fields robustly
    blocks = re.findall(r"JSS2VocabItem\s*\((.*?)\)", content, re.DOTALL)
    items = []
    for block in blocks:
        french_m = re.search(r'french:\s*(?:\'((?:\\\'|[^\'])*)\'|"([^"]*)")', block)
        audio_m = re.search(r'audioKey:\s*[\'"]([^\'"]+)[\'"]', block)
        if french_m and audio_m:
            french = french_m.group(1) if french_m.group(1) is not None else french_m.group(2)
            audio_key = audio_m.group(1)
            items.append((french, audio_key))
    return items

async def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    vocab_items = extract_vocab(LESSONS_FILE)
    print(f"Found {len(vocab_items)} vocabulary items to synthesize.")

    for french, audio_key in vocab_items:
        clean_text = french.replace("\\'", "'")
        # If there are slashes like "font / égalent", speak the first one or clean for TTS
        clean_text = clean_text.replace(" / ", ", ou ")
        dest_file = os.path.join(OUTPUT_DIR, f"{audio_key}.mp3")
        if not os.path.exists(dest_file):
            try:
                await generate_audio(clean_text, audio_key)
            except Exception as e:
                print(f"Error on {audio_key}: {e}")
        else:
            print(f"Already exists: {audio_key}.mp3")

if __name__ == "__main__":
    asyncio.run(main())
