import re
import os

def clean_dart_str(s):
    s = s.replace("\\'", "'")
    s = s.replace("'", "\\'")
    s = s.replace('$', '\\$')
    return s.strip()

def process_jss2_file(filepath, week_styles):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Remove const from const JSS2LessonModel
    content = content.replace('const JSS2LessonModel(', 'JSS2LessonModel(')
    content = content.replace('static const List<JSS2LessonModel> weeks = [', 'static final List<JSS2LessonModel> weeks = [')

    parts = content.split('JSS2LessonModel(')
    header = parts[0]
    new_parts = [header]

    for part in parts[1:]:
        # Extract week number
        week_match = re.search(r'weekNumber:\s*(\d+)', part)
        week_num = int(week_match.group(1)) if week_match else 1
        style = week_styles.get(week_num, 'interactiveStudio')

        # 1. Add teachingStyle if not present
        if 'teachingStyle:' not in part:
            pattern_match = re.search(r'(patternType:\s*[^,\n]+,)', part)
            if pattern_match:
                matched = pattern_match.group(1)
                part = part.replace(matched, f"{matched}\n      teachingStyle: TeachingStyle.{style},", 1)

        # 2. Extract vocabulary items
        vocab_matches = re.findall(
            r'JSS2VocabItem\s*\(\s*french:\s*[\'"]((?:[^\'"]|(?<=\\)\'|(?<=\\)")*)[\'"]\s*,\s*phonetics:\s*[\'"][^\'"]*[\'"]\s*,\s*english:\s*[\'"]((?:[^\'"]|(?<=\\)\'|(?<=\\)")*)[\'"]',
            part
        )

        drill_count = len(re.findall(r'JSS2InteractiveExercise\s*\(', part))
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

        new_drills.append(f"""        JSS2InteractiveExercise(
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
            new_drills.append(f"""        JSS2InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word ({target_en}):',
          sentenceTemplate: 'Le mot correct est ___ pour cette expression.',
          wordBank: [{bank_str}],
          correctWord: '{target_fr}',
          explanation: 'Correct! "{target_fr}" translates to "{target_en}".',
        ),""")

        # Drill 3: True / False
        new_drills.append(f"""        JSS2InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In French, paying close attention to correct prepositions, agreements, and polite formulas is essential.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Accuracy with prepositions and polite speech is fundamental in JSS2 French.',
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
            new_drills.append(f"""        JSS2InteractiveExercise(
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
            new_drills.append(f"""        JSS2InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Choose the correct French term for "{target_en3}":',
          sentenceTemplate: 'En classe, nous disons ___ avec politesse.',
          wordBank: [{bank3_str}],
          correctWord: '{target_fr3}',
          explanation: 'Exact ! "{target_fr3}" means "{target_en3}".',
        ),""")

        # Drill 6: Speaking & Practice Drill
        new_drills.append(f"""        JSS2InteractiveExercise(
          prompt: 'Which of the following is an essential habit for mastering French in JSS2?',
          options: ['Practicing spoken dialogue with enthusiasm', 'Staying completely silent', 'Ignoring pronunciation rules', 'Reading without listening'],
          correctOptionIndex: 0,
          explanation: 'Active speaking and confident practice are key to fluency in French.',
        ),""")

        # Drill 7: Practical True or False
        new_drills.append(f"""        JSS2InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: French vocabulary learned in this lesson can be used in daily school and communicative conversations.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Practical vocabulary is designed for everyday communication.',
        ),""")

        # Take exactly as many as needed to reach at least 6
        to_add = new_drills[:needed]
        anchor = "      ],\n      evaluation:"
        if anchor in part:
            replacement = "\n".join(to_add) + "\n      ],\n      evaluation:"
            part = part.replace(anchor, replacement, 1)

        new_parts.append(part)

    new_content = 'JSS2LessonModel('.join(new_parts)
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)
    print(f"Updated and expanded drills in {filepath}")

if __name__ == '__main__':
    term1_styles = {
        1: 'interactiveStudio',
        2: 'interactiveStudio',
        3: 'conversationalDialogue',
        4: 'conversationalDialogue',
        5: 'interactiveStudio',
        6: 'storyNarrative',
        7: 'interactiveStudio',
        8: 'conversationalDialogue',
        9: 'interactiveStudio',
    }
    term2_styles = {
        1: 'interactiveStudio',
        2: 'storyNarrative',
        3: 'conversationalDialogue',
        4: 'interactiveStudio',
        5: 'conversationalDialogue',
        6: 'interactiveStudio',
        7: 'interactiveStudio',
        8: 'interactiveStudio',
        9: 'interactiveStudio',
    }
    term3_styles = {
        1: 'interactiveStudio',
        2: 'storyNarrative',
        3: 'storyNarrative',
        4: 'conversationalDialogue',
        5: 'conversationalDialogue',
        6: 'interactiveStudio',
        7: 'conversationalDialogue',
        8: 'interactiveStudio',
        9: 'interactiveStudio',
    }

    base = r"c:\Users\DELL\Desktop\Lang Huey\JSS 2_FRENCH\lib\data"
    process_jss2_file(os.path.join(base, "jss2_term1_lessons.dart"), term1_styles)
    process_jss2_file(os.path.join(base, "jss2_term2_lessons.dart"), term2_styles)
    process_jss2_file(os.path.join(base, "jss2_term3_lessons.dart"), term3_styles)
