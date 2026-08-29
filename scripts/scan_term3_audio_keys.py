import os
import re

LESSONS_FILE = r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\data\p4_term3_lessons.dart"
PATTERNS_DIR = r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\term3"

with open(LESSONS_FILE, "r", encoding="utf-8") as f:
    lessons_text = f.read()

# Extract from lessons: P4VocabItem(french: '...', english: '...', audioKey: '...')
vocab_matches = re.findall(r"P4VocabItem\s*\(\s*french:\s*['\"]([^'\"]+)['\"],\s*english:\s*['\"][^'\"]+['\"],\s*audioKey:\s*['\"]([^'\"]+)['\"]", lessons_text)
print(f"Found {len(vocab_matches)} vocab audio pairs in lessons file.")

# Extract audioKey patterns from widget files
widget_audios = {}
for fname in os.listdir(PATTERNS_DIR):
    if fname.endswith(".dart"):
        fpath = os.path.join(PATTERNS_DIR, fname)
        with open(fpath, "r", encoding="utf-8") as f:
            w_text = f.read()
        # Find playPhrase('...') or playAudio('...') or 'audioKey': '...'
        calls = re.findall(r"(?:playPhrase|playAudio)\s*\(\s*['\"]([^'\"]+)['\"]", w_text)
        keys = re.findall(r"['\"]audioKey['\"]\s*:\s*['\"]([^'\"]+)['\"]", w_text)
        for k in calls + keys:
            widget_audios[k] = True

print(f"Found {len(widget_audios)} unique audio keys in pattern widgets.")
