import re
import os

def clean_dart_str(s):
    s = s.replace("\\'", "'")
    s = s.replace("'", "\\'")
    s = s.replace('$', '\\$')
    return s.strip()

def process_jss3_file(filepath, week_styles):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Remove const if present on lesson models
    content = content.replace('const JSS3LessonModel(', 'JSS3LessonModel(')
    content = content.replace('static const List<JSS3LessonModel> weeks = [', 'static final List<JSS3LessonModel> weeks = [')

    parts = content.split('JSS3LessonModel(')
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
            r'JSS3VocabItem\s*\(\s*french:\s*[\'"]((?:[^\'"]|(?<=\\)\'|(?<=\\)")*)[\'"]\s*,\s*phonetics:\s*[\'"][^\'"]*[\'"]\s*,\s*english:\s*[\'"]((?:[^\'"]|(?<=\\)\'|(?<=\\)")*)[\'"]',
            part
        )

        drill_count = len(re.findall(r'JSS3InteractiveExercise\s*\(', part))
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

        new_drills.append(f"""        JSS3InteractiveExercise(
          type: DrillType.pairMatch,
          prompt: 'Match each French expression or term with its English meaning:',
          pairs: [
{pairs_code}
          ],
          explanation: 'Excellent travail ! All French-English pairs have been matched correctly.',
        ),""")

        # Drill 2: Fill in the blank (Vocab 0)
        if len(v_list) >= 1:
            target_fr = clean_dart_str(v_list[0][0])
            target_en = clean_dart_str(v_list[0][1])
            distractors = [clean_dart_str(v_list[i][0]) for i in range(1, len(v_list))]
            while len(distractors) < 3:
                distractors.append('toujours')
            bank = [target_fr] + distractors[:3]
            bank_str = ", ".join([f"'{b}'" for b in bank])
            new_drills.append(f"""        JSS3InteractiveExercise(
          type: DrillType.fillGap,
          prompt: 'Complete the sentence with the correct missing word ({target_en}):',
          sentenceWithGap: 'Dans ce contexte, le mot correct est ___ pour compléter la phrase.',
          wordBank: [{bank_str}],
          correctGapWord: '{target_fr}',
          explanation: 'Bravo ! "{target_fr}" means "{target_en}".',
        ),""")

        # Drill 3: True / False
        new_drills.append(f"""        JSS3InteractiveExercise(
          type: DrillType.trueFalse,
          prompt: 'True or False: In JSS3 French examinations (BECE), precision with tense markers, gender agreements, and sentence structure is essential.',
          options: ['VRAI (True)', 'FAUX (False)'],
          correctOptionIndex: 0,
          explanation: 'Vrai ! Structural accuracy, tense concordance, and gender agreements are central marking criteria in BECE French.',
        ),""")

        # Drill 4: Vocabulary Meaning / Tap Translation (Vocab 1)
        if len(v_list) >= 2:
            target_fr2 = clean_dart_str(v_list[1][0])
            target_en2 = clean_dart_str(v_list[1][1])
            distractor_ens = [clean_dart_str(v_list[i][1]) for i in range(len(v_list)) if i != 1]
            while len(distractor_ens) < 3:
                distractor_ens.append('to practice daily')
            opts = [target_en2] + distractor_ens[:3]
            opts_str = ", ".join([f"'{o}'" for o in opts])
            new_drills.append(f"""        JSS3InteractiveExercise(
          type: DrillType.tapTranslation,
          prompt: 'What is the English meaning of the French expression "{target_fr2}"?',
          options: [{opts_str}],
          correctOptionIndex: 0,
          explanation: 'Parfait ! "{target_fr2}" translates to "{target_en2}".',
        ),""")

        to_add = new_drills[:needed]
        drills_addition = "\n".join(to_add)

        # Inject before evaluation: [
        idx = part.find('evaluation:')
        if idx != -1:
            # Find the closing bracket of exercises
            ex_end = part.rfind('],', 0, idx)
            if ex_end != -1:
                part = part[:ex_end] + drills_addition + "\n        " + part[ex_end:]

        new_parts.append(part)

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write('JSS3LessonModel('.join(new_parts))
    print(f"Successfully processed {filepath}")

def main():
    t1_styles = {
        1: 'dialogueConversation',
        2: 'interactiveStudio',
        3: 'interactiveStudio',
        4: 'storyNarrative',
        5: 'interactiveStudio',
        6: 'interactiveStudio',
        7: 'interactiveStudio',
        8: 'storyNarrative',
        9: 'phoneticSoundboard',
    }

    t2_styles = {
        1: 'storyNarrative',
        2: 'interactiveStudio',
        3: 'storyNarrative',
        4: 'dialogueConversation',
        5: 'interactiveStudio',
        6: 'dialogueConversation',
        7: 'interactiveStudio',
        8: 'interactiveStudio',
        9: 'phoneticSoundboard',
    }

    base = r"c:\Users\DELL\Desktop\Lang Huey\JSS 3_FRENCH\lib\data"
    process_jss3_file(os.path.join(base, "jss3_term1_lessons.dart"), t1_styles)
    process_jss3_file(os.path.join(base, "jss3_term2_lessons.dart"), t2_styles)

if __name__ == "__main__":
    main()
