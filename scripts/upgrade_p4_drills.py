import re
import os

def clean_dart_str(s):
    s = s.replace("\\'", "'")
    s = s.replace("'", "\\'")
    s = s.replace('$', '\\$')
    return s.strip()

def process_p4_file(filepath, week_styles):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Remove const if present on lesson models
    content = content.replace('const P4Lesson(', 'P4Lesson(')

    parts = content.split('P4Lesson(')
    header = parts[0]
    new_parts = [header]

    for part in parts[1:]:
        # Extract week number
        week_match = re.search(r'week:\s*(\d+)', part)
        week_num = int(week_match.group(1)) if week_match else 1
        style = week_styles.get(week_num, 'interactiveStudio')

        # 1. Add teachingStyle if not present
        if 'teachingStyle:' not in part:
            pattern_match = re.search(r'(patternType:\s*[^,\n]+,)', part)
            if pattern_match:
                matched = pattern_match.group(1)
                part = part.replace(matched, f"{matched}\n    teachingStyle: TeachingStyle.{style},", 1)

        # 2. Extract vocabulary items
        vocab_matches = re.findall(
            r'P4VocabItem\s*\(\s*french:\s*[\'"]((?:[^\'"]|(?<=\\)\'|(?<=\\)")*)[\'"]\s*,\s*phonetics:\s*[\'"][^\'"]*[\'"]\s*,\s*english:\s*[\'"]((?:[^\'"]|(?<=\\)\'|(?<=\\)")*)[\'"]',
            part
        )

        drill_count = len(re.findall(r'P4(?:Interactive|Classwork)Exercise\s*\(', part))
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
                pair_lines.append(f"          DrillPair(french: '{clean_dart_str(fr)}', english: '{clean_dart_str(en)}'),")
            pairs_code = "\n".join(pair_lines)
        else:
            pairs_code = "          DrillPair(french: 'Bonjour', english: 'Hello'),\n          DrillPair(french: 'Merci', english: 'Thank you'),"

        new_drills.append(f"""      P4InteractiveExercise(
        type: DrillType.pairMatch,
        prompt: 'Match each French word with its correct English meaning:',
        pairs: [
{pairs_code}
        ],
        explanation: 'Excellent travail ! All vocabulary pairs have been correctly matched.',
      ),""")

        # Drill 2: Fill in the blank (Vocab 0)
        if len(v_list) >= 1:
            target_fr = clean_dart_str(v_list[0][0])
            target_en = clean_dart_str(v_list[0][1])
            distractors = [clean_dart_str(v_list[i][0]) for i in range(1, len(v_list))]
            while len(distractors) < 3:
                distractors.append('oui')
            bank = [target_fr] + distractors[:3]
            bank_str = ", ".join([f"'{b}'" for b in bank])
            new_drills.append(f"""      P4InteractiveExercise(
        type: DrillType.fillGap,
        prompt: 'Complete the sentence with the correct missing word ({target_en}):',
        sentenceWithGap: 'En classe de français, on dit ___ pour cette expression.',
        wordBank: [{bank_str}],
        correctGapWord: '{target_fr}',
        explanation: 'Bravo ! "{target_fr}" means "{target_en}".',
      ),""")

        # Drill 3: True / False
        new_drills.append(f"""      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: In French, polite greetings and good pronunciation are important when speaking to friends and teachers.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Politeness and clear pronunciation are key in French classroom speaking.',
      ),""")

        # Drill 4: Vocabulary Meaning / Tap Translation (Vocab 1)
        if len(v_list) >= 2:
            target_fr2 = clean_dart_str(v_list[1][0])
            target_en2 = clean_dart_str(v_list[1][1])
            distractor_ens = [clean_dart_str(v_list[i][1]) for i in range(len(v_list)) if i != 1]
            while len(distractor_ens) < 3:
                distractor_ens.append('to speak kindly')
            opts = [target_en2] + distractor_ens[:3]
            opts_str = ", ".join([f"'{o}'" for o in opts])
            new_drills.append(f"""      P4InteractiveExercise(
        type: DrillType.tapTranslation,
        prompt: 'What does "{target_fr2}" mean in English?',
        options: [{opts_str}],
        correctOptionIndex: 0,
        explanation: 'Parfait ! "{target_fr2}" translates to "{target_en2}".',
      ),""")

        # Drill 5: Classroom Practice Drill
        new_drills.append(f"""      P4InteractiveExercise(
        type: DrillType.singleChoice,
        prompt: 'Which expression is best used to practice French together in class?',
        options: ['Écoutez et répétez !', 'Silence absolu', 'Au revoir immédiatement', 'Non merci'],
        correctOptionIndex: 0,
        explanation: '"Écoutez et répétez !" (Listen and repeat!) is the golden classroom rule for learning French.',
      ),""")

        # Drill 6: Pronunciation drill
        new_drills.append(f"""      P4InteractiveExercise(
        type: DrillType.trueFalse,
        prompt: 'True or False: Listening carefully to native French pronunciation helps build speaking confidence.',
        options: ['VRAI (True)', 'FAUX (False)'],
        correctOptionIndex: 0,
        explanation: 'Vrai ! Active listening and repeating aloud build natural accent and fluency.',
      ),""")

        to_add = new_drills[:needed]
        drills_addition = "\n".join(to_add)

        # Inject before evaluationQuestions:
        idx = part.find('evaluationQuestions:')
        if idx != -1:
            ex_end = part.rfind('],', 0, idx)
            if ex_end != -1:
                part = part[:ex_end] + drills_addition + "\n    " + part[ex_end:]

        new_parts.append(part)

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write('P4Lesson('.join(new_parts))
    print(f"Successfully processed {filepath}")

def main():
    t1_styles = {
        1: 'interactiveStudio',
        2: 'dialogueConversation',
        3: 'dialogueConversation',
        4: 'interactiveStudio',
        5: 'phoneticSoundboard',
        6: 'storyNarrative',
        7: 'interactiveStudio',
        8: 'dialogueConversation',
        9: 'dialogueConversation',
        10: 'interactiveStudio',
        11: 'phoneticSoundboard',
        12: 'storyNarrative',
        13: 'storyNarrative',
    }

    t2_styles = {
        1: 'interactiveStudio',
        2: 'interactiveStudio',
        3: 'dialogueConversation',
        4: 'interactiveStudio',
        5: 'phoneticSoundboard',
        6: 'storyNarrative',
        7: 'interactiveStudio',
        8: 'interactiveStudio',
        9: 'interactiveStudio',
        10: 'interactiveStudio',
        11: 'phoneticSoundboard',
        12: 'phoneticSoundboard',
        13: 'storyNarrative',
    }

    t3_styles = {
        1: 'interactiveStudio',
        2: 'storyNarrative',
        3: 'dialogueConversation',
        4: 'interactiveStudio',
        5: 'phoneticSoundboard',
        6: 'storyNarrative',
        7: 'interactiveStudio',
        8: 'dialogueConversation',
        9: 'interactiveStudio',
        10: 'interactiveStudio',
        11: 'phoneticSoundboard',
        12: 'phoneticSoundboard',
        13: 'storyNarrative',
    }

    base = r"c:\Users\DELL\Desktop\Lang Huey\mvp\lib\data"
    process_p4_file(os.path.join(base, "p4_term1_lessons.dart"), t1_styles)
    process_p4_file(os.path.join(base, "p4_term2_lessons.dart"), t2_styles)
    process_p4_file(os.path.join(base, "p4_term3_lessons.dart"), t3_styles)

if __name__ == "__main__":
    main()
