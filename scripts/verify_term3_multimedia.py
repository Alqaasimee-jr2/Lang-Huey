import os
import re

AUDIO_DIR = r"c:\Users\DELL\Desktop\Lang Huey\mvp\assets\audio\p4_term3"
IMAGE_DIR = r"c:\Users\DELL\Desktop\Lang Huey\mvp\assets\images\p4_term3"
LESSONS_FILE = r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\data\p4_term3_lessons.dart"
PATTERNS_DIR = r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\term3"

# 1. Check Images
expected_images = [
    "term3_banner.png",
    "clock_diagram.png",
    "daily_routine_timeline.png",
    "three_meals_pyramid.png",
    "body_anatomy_chart.png",
    "health_hygiene_card.png",
    "weather_seasons_map.png",
    "graduation_certificate_template.png",
]
missing_images = []
for img_name in expected_images:
    ipath = os.path.join(IMAGE_DIR, img_name)
    if not os.path.exists(ipath):
        missing_images.append(img_name)

print(f"--- IMAGE ASSETS VERIFICATION ---")
print(f"Total expected diagrams: {len(expected_images)}, Missing: {len(missing_images)}")
if missing_images:
    print(f"Missing images: {missing_images}")
else:
    print("[PASS] All 8 Term 3 educational diagram cards exist!")

# 2. Check Audio Keys from Lessons
with open(LESSONS_FILE, "r", encoding="utf-8") as f:
    lessons_content = f.read()

lesson_keys = re.findall(r'audioKey:\s*["\'](.*?)["\']', lessons_content)
print(f"\n--- LESSONS AUDIO KEYS VERIFICATION ---")
print(f"Total audio keys in p4_term3_lessons.dart: {len(lesson_keys)}")

missing_lesson_audio = []
for k in set(lesson_keys):
    apath = os.path.join(AUDIO_DIR, f"{k}.mp3")
    if not os.path.exists(apath):
        missing_lesson_audio.append(k)

print(f"Unique keys in lessons: {len(set(lesson_keys))}, Missing: {len(missing_lesson_audio)}")
if missing_lesson_audio:
    print(f"Missing lesson audio files: {missing_lesson_audio}")

# 3. Check Audio Keys from Pattern Widgets
widget_keys = []
for fname in os.listdir(PATTERNS_DIR):
    if fname.endswith(".dart"):
        fpath = os.path.join(PATTERNS_DIR, fname)
        with open(fpath, "r", encoding="utf-8") as f:
            w_text = f.read()
        calls = re.findall(r"(?:playPhrase|playAudio)\s*\(\s*['\"]([^'\"]+)['\"]", w_text)
        keys = re.findall(r"['\"]audioKey['\"]\s*:\s*['\"]([^'\"]+)['\"]", w_text)
        widget_keys.extend(calls + keys)

print(f"\n--- PATTERN WIDGET AUDIO VERIFICATION ---")
print(f"Total widget audio references: {len(widget_keys)}")
missing_widget_audio = []
for k in set(widget_keys):
    apath = os.path.join(AUDIO_DIR, f"{k}.mp3")
    if not os.path.exists(apath):
        missing_widget_audio.append(k)

print(f"Unique keys in pattern widgets: {len(set(widget_keys))}, Missing: {len(missing_widget_audio)}")
if missing_widget_audio:
    print(f"Missing widget audio files: {missing_widget_audio}")

if not missing_images and not missing_lesson_audio and not missing_widget_audio:
    print("\n[ALL PASS] 100% of Term 3 multimedia assets (audio & images) are verified and present!")
else:
    print("\n[IN PROGRESS] Some audio files are still generating...")
