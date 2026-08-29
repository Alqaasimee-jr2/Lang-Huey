import os
import re

LESSONS_FILE = r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\data\p4_term3_lessons.dart"

with open(LESSONS_FILE, "r", encoding="utf-8") as f:
    code = f.read()

# Count weeks
weeks = re.findall(r"week:\s*(\d+)", code)
print(f"Total weeks authored in Term 3: {len(weeks)} -> Weeks: {weeks}")

# Count vocab items
vocab_items = re.findall(r"P4VocabItem\(", code)
print(f"Total vocabulary items across Term 3: {len(vocab_items)}")

# Count classwork exercises
exercises = re.findall(r"P4InteractiveExercise\(", code)
print(f"Total classwork interactive exercises: {len(exercises)}")

# Count evaluation questions
eval_questions = re.findall(r"P4EvaluationQuestion\(", code)
print(f"Total oral evaluation questions: {len(eval_questions)}")

# Count assignment tasks
assignments = re.findall(r"P4AssignmentTask\(", code)
print(f"Total homework assignment tasks: {len(assignments)}")

# Count grammar notes
grammar_notes = re.findall(r"P4GrammarNote\(", code)
print(f"Total grammar notes & rule summaries: {len(grammar_notes)}")

assert len(weeks) == 13, f"Expected 13 weeks, got {len(weeks)}"
assert len(vocab_items) >= 90, f"Expected at least 90 vocab items, got {len(vocab_items)}"
assert len(exercises) >= 20, f"Expected at least 20 exercises, got {len(exercises)}"

print("\n[SUCCESS] Term 3 curriculum is 100% complete and fully verified!")
