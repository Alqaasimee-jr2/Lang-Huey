# -*- coding: utf-8 -*-
import os
import re

DATA_FILE = r"c:\Users\DELL\Desktop\Lang Huey\JSS1_FRENCH\lib\data\jss1_term1_lessons.dart"

with open(DATA_FILE, "r", encoding="utf-8") as f:
    text = f.read()

# Match every JSS1Lesson(...)
lesson_blocks = re.findall(r"(JSS1Lesson\s*\(.*?\n\s*\),)", text, re.DOTALL)
print(f"Extracted {len(lesson_blocks)} raw lesson blocks.")

formatted_lessons = []
for i, block in enumerate(lesson_blocks, start=1):
    # Ensure week number is updated to i
    block = re.sub(r"week:\s*\d+,", f"week: {i},", block, count=1)
    
    # Extract topic
    topic_match = re.search(r"topic:\s*['\"]([^'\"]+)['\"]", block)
    topic_str = topic_match.group(1) if topic_match else f"Lesson {i}"
    
    banner = f"    // ==========================================\n    // WEEK {i}: {topic_str.upper()}\n    // ==========================================\n    "
    formatted_lessons.append(banner + block.strip())

header = """import 'package:flutter/material.dart';
import '../models/jss1_lesson_model.dart';

class JSS1Term1Lessons {
  static const List<JSS1Lesson> weeks = [
"""

footer = """
  ];
}
"""

clean_code = header + "\n\n".join(formatted_lessons) + footer

with open(DATA_FILE, "w", encoding="utf-8") as f:
    f.write(clean_code)

print(f"Rebuilt jss1_term1_lessons.dart with {len(formatted_lessons)} clean instructional & revision lessons.")
