# -*- coding: utf-8 -*-
import os
import re

# Read original or git version of jss1_term1_lessons.dart
# Let's check git checkout to get clean source, then extract the 9 lessons properly.
os.system(r'git checkout -- "c:\Users\DELL\Desktop\Lang Huey\JSS1_FRENCH\lib\data\jss1_term1_lessons.dart"')

DATA_FILE = r"c:\Users\DELL\Desktop\Lang Huey\JSS1_FRENCH\lib\data\jss1_term1_lessons.dart"

with open(DATA_FILE, "r", encoding="utf-8") as f:
    text = f.read()

# Find all occurrences of JSS1Lesson(
lesson_starts = [m.start() for m in re.finditer(r"\bJSS1Lesson\s*\(", text)]
print(f"Found {len(lesson_starts)} JSS1Lesson starts.")

lessons = []
for start in lesson_starts:
    # Find matching closing paren
    paren_count = 0
    in_str = False
    str_char = ''
    i = start
    while i < len(text):
        c = text[i]
        if in_str:
            if c == '\\':
                i += 2
                continue
            elif c == str_char:
                in_str = False
        else:
            if c in ("'", '"'):
                in_str = True
                str_char = c
            elif c == '(':
                paren_count += 1
            elif c == ')':
                paren_count -= 1
                if paren_count == 0:
                    lessons.append(text[start:i+1])
                    break
        i += 1

print(f"Extracted {len(lessons)} full JSS1Lesson objects.")

# Filter to only the 9 teaching & revision lessons:
# Original 13:
# 0: Week 1 (Classroom Commands) -> KEEP
# 1: Week 2 (Greetings) -> KEEP
# 2: Week 3 (Self-Intro) -> KEEP
# 3: Week 4 (Spelling) -> KEEP
# 4: Week 5 (Midterm Exam) -> DROP
# 5: Week 6 (Present Others) -> KEEP (Week 5)
# 6: Week 7 (Midterm Break) -> DROP
# 7: Week 8 (Describe Someone) -> KEEP (Week 6)
# 8: Week 9 (Hobbies) -> KEEP (Week 7)
# 9: Week 10 (Preferences) -> KEEP (Week 8)
# 10: Week 11 (Revision Rally) -> KEEP (Week 9)
# 11: Week 12 (Final Exam) -> DROP
# 12: Week 13 (Vacation) -> DROP

indices = [0, 1, 2, 3, 5, 7, 8, 9, 10]
kept_lessons = []

for new_week_num, idx in enumerate(indices, start=1):
    l_str = lessons[idx]
    # Update week: X,
    l_str = re.sub(r"\bweek:\s*\d+,", f"week: {new_week_num},", l_str, count=1)
    
    # Extract topic
    topic_match = re.search(r"topic:\s*['\"]([^'\"]+)['\"]", l_str)
    topic = topic_match.group(1) if topic_match else f"Week {new_week_num}"
    
    banner = f"    // ==========================================\n    // WEEK {new_week_num}: {topic.upper()}\n    // ==========================================\n    "
    kept_lessons.append(banner + l_str)

header = """import 'package:flutter/material.dart';
import '../models/jss1_lesson_model.dart';

class JSS1Term1Lessons {
  static const List<JSS1Lesson> weeks = [
"""

body = ",\n\n".join(kept_lessons)

footer = """
  ];
}
"""

with open(DATA_FILE, "w", encoding="utf-8") as f:
    f.write(header + body + footer)

print(f"Successfully generated clean 9-lesson curriculum file at {DATA_FILE}")
