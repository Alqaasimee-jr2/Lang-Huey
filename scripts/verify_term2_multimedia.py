import os
import re

AUDIO_DIR = r"c:\Users\DELL\Desktop\Lang Huey\mvp\assets\audio\p4_term2"
PATTERNS_DIR = r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\term2"
LESSONS_FILE = r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\data\p4_term2_lessons.dart"

existing_audio = {f.replace(".mp3", "") for f in os.listdir(AUDIO_DIR) if f.endswith(".mp3")}
print(f"Total MP3 audio files in assets/audio/p4_term2: {len(existing_audio)}")

# Find all audio keys referenced in Term 2 patterns
keys_found = set()
for root, _, files in os.walk(PATTERNS_DIR):
    for file in files:
        if file.endswith(".dart"):
            filepath = os.path.join(root, file)
            with open(filepath, "r", encoding="utf-8") as f:
                content = f.read()
                matches = re.findall(r"(?:_playAudio|playPhrase)\(['\"]([a-zA-Z0-9_]+)['\"]", content)
                for m in matches:
                    keys_found.add((m, file))
                matches_map = re.findall(r"['\"]audio(?:Key)?['\"]\s*:\s*['\"]([a-zA-Z0-9_]+)['\"]", content)
                for m in matches_map:
                    keys_found.add((m, file))

# Check Term 2 lessons file
with open(LESSONS_FILE, "r", encoding="utf-8") as f:
    content = f.read()
    matches = re.findall(r"audioKey:\s*['\"]([a-zA-Z0-9_]+)['\"]", content)
    for m in matches:
        keys_found.add((m, "p4_term2_lessons.dart"))

print(f"Total distinct audio keys referenced in Term 2: {len(keys_found)}")

# Also check fallback in term 1 folder if needed
T1_DIR = r"c:\Users\DELL\Desktop\Lang Huey\mvp\assets\audio\p4_term1"
existing_t1 = {f.replace(".mp3", "") for f in os.listdir(T1_DIR) if f.endswith(".mp3")}

missing = []
for key, src in sorted(keys_found):
    if key not in existing_audio and key not in existing_t1:
        missing.append((key, src))

if missing:
    print(f"\n[ERROR] Missing {len(missing)} audio files:")
    for key, src in missing:
        print(f"  - '{key}' referenced in {src}")
else:
    print("\n[SUCCESS] 100% of referenced Term 2 audio keys exist and match universal MP3 audio files!")
