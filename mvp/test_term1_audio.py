import os
import re

audio_dir = r"c:\Users\DELL\Desktop\Lang Huey\mvp\assets\audio\p4_term1"
existing_audio_files = {f for f in os.listdir(audio_dir) if f.endswith('.mp3')}

files_to_check = [
    r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\data\p4_term1_lessons.dart",
    r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\screens\lesson\p4_lesson_player_screen.dart",
    r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\map_explorer_widget.dart",
    r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\greeting_dial_widget.dart",
    r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\magic_words_widget.dart",
    r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\identity_sentence_builder_widget.dart",
    r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\number_and_age_widget.dart",
    r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\farewell_matcher_widget.dart",
    r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\dialogue_sequencer_widget.dart",
    r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\id_card_workshop_widget.dart",
    r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\revision_rally_widget.dart",
    r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\vacation_celebration_widget.dart",
]

missing_keys = []
all_found_keys = set()

for file_path in files_to_check:
    if not os.path.exists(file_path):
        continue
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Find audioKey: '...'
    keys1 = re.findall(r"audioKey:\s*['\"]([^'\"]+)['\"]", content)
    # Find playPhrase('...')
    keys2 = re.findall(r"playPhrase\(['\"]([^'\"]+)['\"]\)", content)
    # Find 'audio': '...'
    keys3 = re.findall(r"['\"]audio['\"]:\s*['\"]([^'\"]+)['\"]", content)

    combined = set(keys1 + keys2 + keys3)
    for k in combined:
        all_found_keys.add(k)
        mp3_name = f"{k}.mp3"
        if mp3_name not in existing_audio_files:
            missing_keys.append((os.path.basename(file_path), k, mp3_name))

print("=== CHECK RESULTS ===")
print(f"Total Unique Keys Referenced: {len(all_found_keys)}")
print(f"Total Existing MP3 Files: {len(existing_audio_files)}")
if missing_keys:
    print(f"MISSING AUDIO KEYS ({len(missing_keys)}):")
    for f, k, m in missing_keys:
        print(f"  In {f}: key='{k}' (looking for {m})")
else:
    print("ALL REFERENCED AUDIO KEYS EXIST AS MP3 FILES!")
