import re
import os

def clean_dart_str(s):
    # Unescape single quotes first
    s = s.replace("\\'", "'")
    # Escape single quotes for single-quoted strings
    s = s.replace("'", "\\'")
    # Escape dollar signs
    s = s.replace('$', '\\$')
    return s.strip()

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Change static const to static final
    content = content.replace('static const List<P5Lesson> weeks = [', 'static final List<P5Lesson> weeks = [')

    parts = content.split('P5Lesson(')
    header = parts[0]
    new_parts = [header]

    for part in parts[1:]:
        # Robustly match french and english in P5VocabItem
        vocab_matches = re.findall(
            r'P5VocabItem\s*\(\s*french:\s*[\'"]((?:[^\'"]|(?<=\\)\'|(?<=\\)")*)[\'"]\s*,\s*phonetics:\s*[\'"][^\'"]*[\'"]\s*,\s*english:\s*[\'"]((?:[^\'"]|(?<=\\)\'|(?<=\\)")*)[\'"]',
            part
        )

        drill_count = len(re.findall(r'P5InteractiveExercise\s*\(', part))
        needed = 6 - drill_count
        if needed <= 0:
            new_parts.append(part)
            continue

        new_drills = []
        v_list = vocab_matches

        # Drill 1: Pair Match
        if len(v_list) >= 2:
            pair_lines = []
            for fr, en in v_list[:4]:
                pair_lines.append(f"            DrillPair(french: '{clean_dart_str(fr)}', english: '{clean_dart_str(en)}'),")
            pairs_code = "\n".join(pair_lines)
        else:
            pairs_code = "            DrillPair(french: 'Bonjour', english: 'Hello'),\n            DrillPair(french: 'Merci', english: 'Thank you'),"

        new_drills.append(f"""        P5InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French phrase with its correct English meaning:',
          pairs: [
{pairs_code}
          ],
          explanation: 'Superbe ! You matched all the French and English pairs accurately.',
        ),""")

        # Drill 2: Fill in the blank (Vocab 0)
        if len(v_list) >= 1:
            target_fr = clean_dart_str(v_list[0][0])
            target_en = clean_dart_str(v_list[0][1])
            distractors = [clean_dart_str(v_list[i][0]) for i in range(1, len(v_list))]
            while len(distractors) < 3:
                distractors.append('Merci')
            bank = [target_fr] + distractors[:3]
            bank_str = ", ".join([f"'{b}'" for b in bank])
            new_drills.append(f"""        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word ({target_en}):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: [{bank_str}],
          correctWord: '{target_fr}',
          explanation: 'Correct! "{target_fr}" translates to "{target_en}".',
        ),""")

        # Drill 3: True / False
        new_drills.append(f"""        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to pronunciation and polite formulas is essential in daily conversation.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Politeness and clear pronunciation are foundational to learning French.',
        ),""")

        # Drill 4: Vocabulary Meaning Drill (Vocab 1)
        if len(v_list) >= 2:
            target_fr2 = clean_dart_str(v_list[1][0])
            target_en2 = clean_dart_str(v_list[1][1])
            distractor_ens = [clean_dart_str(v_list[i][1]) for i in range(len(v_list)) if i != 1]
            while len(distractor_ens) < 3:
                distractor_ens.append('Goodbye')
            options = [target_en2] + distractor_ens[:3]
            opts_str = ", ".join([f"'{opt}'" for opt in options])
            new_drills.append(f"""        P5InteractiveExercise(
          prompt: 'What is the correct English translation for "{target_fr2}"?',
          options: [{opts_str}],
          correctOptionIndex: 0,
          explanation: '"{target_fr2}" translates to "{target_en2}".',
        ),""")

        # Drill 5: Fill in the blank (Vocab 2 if available)
        if len(v_list) >= 3:
            target_fr3 = clean_dart_str(v_list[2][0])
            target_en3 = clean_dart_str(v_list[2][1])
            distractors3 = [clean_dart_str(v_list[i][0]) for i in range(len(v_list)) if i != 2]
            while len(distractors3) < 3:
                distractors3.append('S\\\'il vous plaît')
            bank3 = [target_fr3] + distractors3[:3]
            bank3_str = ", ".join([f"'{b}'" for b in bank3])
            new_drills.append(f"""        P5InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Choose the correct French term for "{target_en3}":',
          sentenceTemplate: 'En classe, nous disons ___ avec politesse.',
          wordBank: [{bank3_str}],
          correctWord: '{target_fr3}',
          explanation: 'Exact ! "{target_fr3}" means "{target_en3}".',
        ),""")

        # Drill 6: Speaking & Practice Drill
        new_drills.append(f"""        P5InteractiveExercise(
          prompt: 'Which of the following is an essential habit for mastering French in class?',
          options: ['Practicing spoken dialogue with enthusiasm', 'Staying completely silent', 'Ignoring pronunciation rules', 'Reading without listening'],
          correctOptionIndex: 0,
          explanation: 'Active speaking and confident practice are key to fluency in French.',
        ),""")

        # Drill 7: Practical True or False
        new_drills.append(f"""        P5InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: French vocabulary learned in this lesson can be used in daily school and family conversations.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Practical vocabulary is designed for everyday conversation.',
        ),""")

        # Take exactly as many as needed to reach at least 6
        to_add = new_drills[:needed]
        anchor = "      ],\n      evaluationQuestions:"
        if anchor in part:
            replacement = "\n".join(to_add) + "\n      ],\n      evaluationQuestions:"
            part = part.replace(anchor, replacement, 1)

        new_parts.append(part)

    new_content = 'P5Lesson('.join(new_parts)
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)
    print(f"Expanded drills in {filepath}")

if __name__ == '__main__':
    base = r"c:\Users\DELL\Desktop\Lang Huey\P5_FRENCH\lib\data"
    process_file(os.path.join(base, "p5_term1_lessons.dart"))
    process_file(os.path.join(base, "p5_term2_lessons.dart"))
    process_file(os.path.join(base, "p5_term3_lessons.dart"))
