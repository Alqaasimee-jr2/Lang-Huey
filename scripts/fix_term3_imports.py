import os
import re

DIR_PATH = r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\widgets\patterns\term3"
LESSONS_FILE = r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\data\p4_term3_lessons.dart"

for fname in os.listdir(DIR_PATH):
    if fname.endswith(".dart"):
        fpath = os.path.join(DIR_PATH, fname)
        with open(fpath, "r", encoding="utf-8") as f:
            content = f.read()
        
        # Fix import path: ../../services -> ../../../services
        content = content.replace("import '../../services/p4_audio_service.dart';", "import '../../../services/p4_audio_service.dart';")
        content = content.replace("Icons.styler_rounded", "Icons.accessibility_rounded")
        
        with open(fpath, "w", encoding="utf-8") as f:
            f.write(content)

with open(LESSONS_FILE, "r", encoding="utf-8") as f:
    l_content = f.read()
l_content = l_content.replace("Icons.styler_rounded", "Icons.accessibility_rounded")
with open(LESSONS_FILE, "w", encoding="utf-8") as f:
    f.write(l_content)

print("Fixed imports and icon identifiers across Term 3 widgets and lessons data!")
