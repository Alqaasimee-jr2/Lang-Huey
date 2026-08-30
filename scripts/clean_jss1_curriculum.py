# -*- coding: utf-8 -*-
import os
import re

DATA_FILE = r"c:\Users\DELL\Desktop\Lang Huey\JSS1_FRENCH\lib\data\jss1_term1_lessons.dart"

with open(DATA_FILE, "r", encoding="utf-8") as f:
    content = f.read()

parts = re.split(r'\n\s*// =+\n\s*// WEEK \d+:', content)
header = parts[0]
weeks_raw = parts[1:] # 13 elements

# Indices to keep:
# 0: W1 (Classroom Commands)
# 1: W2 (Greetings & Politeness)
# 2: W3 (Introducing Oneself)
# 3: W4 (Spelling & Accents)
# 5: W6 (Presenting Others)
# 7: W8 (Describing Someone)
# 8: W9 (Hobbies & Leisure)
# 9: W10 (Likes & Preferences)
# 10: W11 (Revision Rally)
indices_to_keep = [0, 1, 2, 3, 5, 7, 8, 9, 10]

cleaned_weeks = []
for new_week_num, orig_idx in enumerate(indices_to_keep, start=1):
    raw_week = weeks_raw[orig_idx].strip()
    
    # If the last item has '];' at the end, clean it off
    if raw_week.endswith('];\n}') or raw_week.endswith('];'):
        raw_week = re.sub(r'\];\s*\}\s*$', '', raw_week).strip()
    
    # Ensure it ends with comma
    if not raw_week.endswith(','):
        raw_week += ','
        
    # Replace week: X with week: new_week_num
    raw_week = re.sub(r'week:\s*\d+,', f'week: {new_week_num},', raw_week, count=1)
    
    # Topic
    topic_match = re.search(r"topic:\s*['\"]([^'\"]+)['\"]", raw_week)
    topic_title = topic_match.group(1).upper() if topic_match else f"WEEK {new_week_num}"
    
    banner = f"    // ==========================================\n    // WEEK {new_week_num}: {topic_title}\n    // ==========================================\n    "
    cleaned_weeks.append(banner + raw_week)

output_code = header.strip() + "\n" + "\n\n".join(cleaned_weeks) + "\n  ];\n}\n"

with open(DATA_FILE, "w", encoding="utf-8") as f:
    f.write(output_code)

print("Successfully written 9 instructional & revision weeks to jss1_term1_lessons.dart!")
