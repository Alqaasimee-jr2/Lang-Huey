import os
import re

AUDIO_DIR = r"c:\Users\DELL\Desktop\Lang Huey\JSS1_FRENCH\assets\audio\jss1_term1"
DATA_FILE = r"c:\Users\DELL\Desktop\Lang Huey\JSS1_FRENCH\lib\data\jss1_term1_lessons.dart"

def verify():
    with open(DATA_FILE, "r", encoding="utf-8") as f:
        content = f.read()

    # Find all audioKey: 'xyz'
    keys = re.findall(r"audioKey:\s*'([^']+)'", content)
    unique_keys = set(keys)
    print(f"Total audio keys in data file: {len(keys)} (Unique: {len(unique_keys)})")

    missing = []
    found = []
    for key in sorted(unique_keys):
        path = os.path.join(AUDIO_DIR, f"{key}.mp3")
        if os.path.exists(path):
            found.append(key)
        else:
            missing.append(key)

    print(f"Found on disk: {len(found)} / {len(unique_keys)}")
    if missing:
        print(f"MISSING AUDIO KEYS ({len(missing)}):")
        for m in missing:
            print(f"  - {m}")
    else:
        print("PERFECT: 100% of all JSS1 Term 1 audio keys are present on disk!")

if __name__ == "__main__":
    verify()
