import re

with open(r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\data\p4_term1_lessons.dart", "r", encoding="utf-8") as f:
    content = f.read()

# Let's extract each week and its vocab items and exercises
weeks = re.findall(r"week:\s*(\d+),.*?title:\s*['\"]([^'\"]+)['\"].*?vocabItems:\s*\[(.*?)\]\s*,\s*grammarNotes", content, re.DOTALL)

for w_num, w_title, v_content in weeks:
    print(f"\n--- WEEK {w_num}: {w_title} ---")
    items = re.findall(r"P4VocabItem\s*\(\s*french:\s*['\"]([^'\"]+)['\"],\s*phonetics:\s*['\"]([^'\"]+)['\"],\s*english:\s*['\"]([^'\"]+)['\"],\s*icon:[^,]+,\s*audioKey:\s*['\"]([^'\"]+)['\"]", v_content)
    for french, phonetics, english, audioKey in items:
        print(f"  [{audioKey}] \"{french}\" -> {english}")
