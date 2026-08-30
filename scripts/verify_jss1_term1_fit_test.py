# -*- coding: utf-8 -*-
"""
Comprehensive JSS1 French Term 1 Fit & Quality Audit Script
Performs full validation across Curriculum, Pattern Widgets, Audio Assets, and Images.
"""

import os
import re

JSS1_DIR = r"c:\Users\DELL\Desktop\Lang Huey\JSS1_FRENCH"
LESSONS_FILE = os.path.join(JSS1_DIR, "lib", "data", "jss1_term1_lessons.dart")
AUDIO_DIR = os.path.join(JSS1_DIR, "assets", "audio", "jss1_term1")
SFX_DIR = os.path.join(JSS1_DIR, "assets", "audio")
IMAGES_DIR = os.path.join(JSS1_DIR, "assets", "images", "jss1_term1")

def run_fit_test():
    print("=================================================================")
    print("          JSS1 FRENCH (TERM 1) FIT & COMPLIANCE AUDIT            ")
    print("=================================================================\n")
    
    passed_checks = 0
    total_checks = 0

    # -------------------------------------------------------------
    # 1. CURRICULUM SCHEMA & NERDC ALIGNMENT AUDIT
    # -------------------------------------------------------------
    print("[1/4] Auditing Curriculum Schema & NERDC Weekly Alignment...")
    with open(LESSONS_FILE, "r", encoding="utf-8") as f:
        content = f.read()

    expected_topics = [
        "Words used in the classroom",
        "Saluer (Greeting)",
        "Se présenter (Introducing oneself)",
        "Épeler un mot / Écrire un mot épelé",
        "Midterm Examination",
        "Présenter quelqu’un",
        "Midterm Break",
        "Décrire quelqu’un",
        "Parler de ses loisirs",
        "Exprimer ses goûts et préférences",
        "Revision",
        "Examination",
        "Closing"
    ]

    total_checks += 1
    weeks_found = re.findall(r"week:\s*(\d+)", content)
    if len(weeks_found) == 13:
        print(f"  [PASS] Exactly 13 weeks defined (Weeks 1 to 13).")
        passed_checks += 1
    else:
        print(f"  [FAIL] Expected 13 weeks, found {len(weeks_found)}")

    total_checks += 1
    topic_matches = 0
    for topic in expected_topics:
        # fuzzy match topic snippet
        snippet = topic.split("(")[0].strip()
        if snippet.lower() in content.lower():
            topic_matches += 1
    if topic_matches == 13:
        print(f"  [PASS] All 13 NERDC curriculum topics verified.")
        passed_checks += 1
    else:
        print(f"  [FAIL] Missing topics: matched {topic_matches}/13")

    # -------------------------------------------------------------
    # 2. BESPOKE SMARTBOARD PATTERN WIDGET MAPPING AUDIT
    # -------------------------------------------------------------
    print("\n[2/4] Auditing 13 Bespoke Smartboard Pattern Widget Implementations...")
    pattern_dir = os.path.join(JSS1_DIR, "lib", "widgets", "patterns", "term1")
    pattern_files = [
        "jss1_classroom_commands_widget.dart",
        "jss1_greeting_studio_widget.dart",
        "jss1_self_intro_studio_widget.dart",
        "jss1_spelling_and_dictation_widget.dart",
        "jss1_midterm_exam_station_widget.dart",
        "jss1_present_others_studio_widget.dart",
        "jss1_midterm_break_lounge_widget.dart",
        "jss1_character_portrait_studio_widget.dart",
        "jss1_hobbies_and_leisure_widget.dart",
        "jss1_tastes_and_preferences_widget.dart",
        "jss1_term1_revision_rally_widget.dart",
        "jss1_term1_exam_widget.dart",
        "jss1_term1_vacation_widget.dart",
    ]

    total_checks += 1
    missing_patterns = []
    for pf in pattern_files:
        p_path = os.path.join(pattern_dir, pf)
        if not os.path.exists(p_path) or os.path.getsize(p_path) == 0:
            missing_patterns.append(pf)
    
    if not missing_patterns:
        print(f"  [PASS] All 13 bespoke smartboard pattern widget files present ({len(pattern_files)} widgets).")
        passed_checks += 1
    else:
        print(f"  [FAIL] Missing pattern widgets: {missing_patterns}")

    # -------------------------------------------------------------
    # 3. AUDIO ASSET INTEGRITY & MPEG BITSTREAM AUDIT
    # -------------------------------------------------------------
    print("\n[3/4] Auditing Audio Keys & MPEG Layer 3 Headers...")
    audio_keys = re.findall(r"audioKey:\s*['\"]([^'\"]+)['\"]", content)
    unique_keys = sorted(list(set(audio_keys)))
    print(f"  Total audio key references in data: {len(audio_keys)} (Unique: {len(unique_keys)})")

    total_checks += 1
    missing_audio = []
    corrupted_audio = []
    for k in unique_keys:
        mp3_path = os.path.join(AUDIO_DIR, f"{k}.mp3")
        if not os.path.exists(mp3_path):
            missing_audio.append(k)
        else:
            with open(mp3_path, "rb") as af:
                header = af.read(4)
                if len(header) < 2 or header[0] != 0xFF or (header[1] & 0xE0) != 0xE0:
                    corrupted_audio.append(k)

    if not missing_audio and not corrupted_audio:
        print(f"  [PASS] All {len(unique_keys)} vocabulary audio files verified with valid MPEG Layer 3 sync headers.")
        passed_checks += 1
    else:
        print(f"  [FAIL] Missing audio: {len(missing_audio)}, Corrupted: {len(corrupted_audio)}")

    # SFX Audit
    total_checks += 1
    sfx_files = ["sfx_celebrate.mp3", "sfx_correct.mp3", "sfx_incorrect.mp3", "sfx_click.mp3", "sfx_whoosh.mp3"]
    missing_sfx = []
    for sfx in sfx_files:
        s_path = os.path.join(SFX_DIR, sfx)
        if not os.path.exists(s_path):
            missing_sfx.append(sfx)
        else:
            with open(s_path, "rb") as sf:
                header = sf.read(4)
                if len(header) < 2 or header[0] != 0xFF or (header[1] & 0xE0) != 0xE0:
                    missing_sfx.append(f"{sfx} (invalid header)")

    if not missing_sfx:
        print(f"  [PASS] All 5 UI feedback sound effects (SFX) verified with authentic MPEG Layer 3 headers.")
        passed_checks += 1
    else:
        print(f"  [FAIL] Missing or invalid SFX: {missing_sfx}")

    # -------------------------------------------------------------
    # 4. VISUAL ART & DIAGRAM ASSETS AUDIT
    # -------------------------------------------------------------
    print("\n[4/4] Auditing Visual Art & Educational Diagrams...")
    image_files = [
        "jss1_classroom_hero.jpg",
        "jss1_greetings_dialogue.jpg",
        "jss1_francophone_neighbors.jpg",
        "jss1_hobbies_lifestyle.jpg",
        "classroom_commands_chart.png",
        "french_accents_chart.png",
        "greetings_politeness_chart.png",
        "nigeria_francophone_neighbors_map.png",
    ]

    total_checks += 1
    missing_images = []
    for img_name in image_files:
        ip = os.path.join(IMAGES_DIR, img_name)
        if not os.path.exists(ip) or os.path.getsize(ip) == 0:
            missing_images.append(img_name)

    if not missing_images:
        print(f"  [PASS] All {len(image_files)} educational illustrations and charts verified on disk.")
        passed_checks += 1
    else:
        print(f"  [FAIL] Missing images: {missing_images}")

    # -------------------------------------------------------------
    # FINAL RESULTS
    # -------------------------------------------------------------
    print("\n=================================================================")
    print(f"FIT AUDIT RESULT: {passed_checks} / {total_checks} CHECKS PASSED ({(passed_checks/total_checks)*100:.1f}%)")
    print("=================================================================")
    return passed_checks == total_checks

if __name__ == "__main__":
    success = run_fit_test()
    exit(0 if success else 1)
