import os
import re

def enrich_p5_file(filepath, term_num, week_styles):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # We will process each lesson in the file
    # A lesson block looks like:
    # P5Lesson(
    #   term: X,
    #   week: Y,
    #   topic: ...,
    #   subtitle: ...,
    #   patternType: ...,
    #   objectives: [...],
    #   culturalInsight: ...,
    #   vocabItems: [...],
    #   classworkExercises: [...],
    #   evaluationQuestions: [...],
    #   assignmentTasks: [...],
    #   grammarNote: ...,
    # )

    for week_num in range(1, 14):
        style = week_styles.get(week_num, 'interactiveStudio')
        
        # 1. Add teachingStyle if not present
        pattern_header = rf'(week:\s*{week_num},\s*\n\s*topic:\s*[^,\n]+,\s*\n\s*subtitle:\s*[^,\n]+,\s*\n\s*patternType:\s*[^,\n]+,)'
        def add_style(m):
            matched = m.group(1)
            if 'teachingStyle:' not in matched:
                return f"{matched}\n      teachingStyle: TeachingStyle.{style},"
            return matched

        content = re.sub(pattern_header, add_style, content)

    # Write back
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Updated teaching styles in {filepath}")

if __name__ == '__main__':
    term1_styles = {
        1: 'phoneticSoundboard',
        2: 'phoneticSoundboard',
        3: 'phoneticSoundboard',
        4: 'interactiveStudio',
        5: 'conversationalDialogue',
        6: 'storyNarrative',
        7: 'interactiveStudio',
        8: 'interactiveStudio',
        9: 'interactiveStudio',
        10: 'conversationalDialogue',
        11: 'conversationalDialogue',
        12: 'storyNarrative',
        13: 'storyNarrative',
    }
    term2_styles = {
        1: 'interactiveStudio',
        2: 'interactiveStudio',
        3: 'storyNarrative',
        4: 'conversationalDialogue',
        5: 'storyNarrative',
        6: 'conversationalDialogue',
        7: 'storyNarrative',
        8: 'interactiveStudio',
        9: 'interactiveStudio',
        10: 'conversationalDialogue',
        11: 'conversationalDialogue',
        12: 'storyNarrative',
        13: 'storyNarrative',
    }
    term3_styles = {
        1: 'interactiveStudio',
        2: 'interactiveStudio',
        3: 'storyNarrative',
        4: 'conversationalDialogue',
        5: 'interactiveStudio',
        6: 'conversationalDialogue',
        7: 'storyNarrative',
        8: 'conversationalDialogue',
        9: 'interactiveStudio',
        10: 'storyNarrative',
        11: 'conversationalDialogue',
        12: 'storyNarrative',
        13: 'storyNarrative',
    }

    base = r"c:\Users\DELL\Desktop\Lang Huey\P5_FRENCH\lib\data"
    enrich_p5_file(os.path.join(base, "p5_term1_lessons.dart"), 1, term1_styles)
    enrich_p5_file(os.path.join(base, "p5_term2_lessons.dart"), 2, term2_styles)
    enrich_p5_file(os.path.join(base, "p5_term3_lessons.dart"), 3, term3_styles)
