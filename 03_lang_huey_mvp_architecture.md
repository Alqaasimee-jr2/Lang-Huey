# Lang Huey — MVP Technical Architecture
**Version:** 1.0
**Date:** August 2025
**Platform:** Android APK
**Stack:** Flutter / Dart
**Scope:** Proof of concept — flow validation only
**License:** NOT included in MVP

---

## 1. MVP Objective

Prove the product works before building the product for sale.

The MVP answers one question: **can a non-French-speaking staff member run a complete structured French lesson on a smartboard using this app, from splash screen to lesson summary, without confusion?**

If yes — build the real product.
If no — fix what breaks before investing in content, licensing, or sales.

---

## 2. What Is In MVP

- Splash screen
- 2-slide onboarding / intro
- Lesson select screen (main menu)
- Lesson player — vocabulary item state
- Lesson player — check question state
- Lesson summary screen
- Placeholder content throughout (no real French audio or curriculum)
- Hardcoded lesson data (no encrypted pack, no file loading)
- No license system
- No payment integration
- No backend
- No analytics

---

## 3. What Is NOT In MVP

- License key system (ships pre-launch, not in prototype)
- Encrypted content pack (.lpack)
- Real French audio recordings
- NERDC curriculum content
- Hardware binding
- Paystack integration
- Admin panel
- Teacher dashboard
- Progress tracking across sessions
- Internet connectivity of any kind

---

## 4. Tech Stack

| Layer | Choice | Reason |
|---|---|---|
| Framework | Flutter 3.x | Known stack. Offline-first. Android target. |
| Language | Dart | Native to Flutter. No context switch. |
| State management | Provider | Simple. 3 screens. No overkill. |
| Audio | just_audio | Offline MP3 playback. Robust on Android. |
| Local storage | shared_preferences | Store "intro seen" flag only at MVP |
| Fonts | google_fonts | Nunito + Inter. Free. No licensing. |
| Navigation | Navigator 2.0 (basic) | Simple push/pop for 6 screens |

---

## 5. Project Structure

```
lang_huey/
├── lib/
│   ├── main.dart                        # Entry. Runs app. Checks intro flag.
│   ├── app.dart                         # MaterialApp. Theme. Routes.
│   │
│   ├── theme/
│   │   ├── colors.dart                  # All brand colour constants
│   │   └── text_styles.dart             # All text style definitions
│   │
│   ├── models/
│   │   ├── lesson.dart                  # Lesson model
│   │   ├── lesson_item.dart             # Vocab item model
│   │   └── check_question.dart          # Quiz question model
│   │
│   ├── data/
│   │   └── placeholder_lessons.dart     # Hardcoded placeholder lesson data
│   │
│   ├── screens/
│   │   ├── splash/
│   │   │   └── splash_screen.dart
│   │   ├── intro/
│   │   │   └── intro_screen.dart        # 2-slide onboarding
│   │   ├── menu/
│   │   │   └── lesson_select_screen.dart
│   │   ├── player/
│   │   │   ├── lesson_player_screen.dart
│   │   │   ├── widgets/
│   │   │   │   ├── vocab_item_view.dart
│   │   │   │   ├── check_question_view.dart
│   │   │   │   ├── teacher_cue_bar.dart
│   │   │   │   └── control_bar.dart
│   │   └── summary/
│   │       └── lesson_summary_screen.dart
│   │
│   └── services/
│       └── audio_service.dart           # just_audio wrapper
│
├── assets/
│   ├── images/
│   │   └── placeholder.png              # Single placeholder image for MVP
│   └── audio/
│       └── placeholder.mp3             # Single placeholder audio for MVP
│
└── pubspec.yaml
```

---

## 6. Theme File

```dart
// lib/theme/colors.dart
import 'package:flutter/material.dart';

class LHColors {
  static const teal       = Color(0xFF0D7377);
  static const turquoise  = Color(0xFF14BDCC);
  static const gold       = Color(0xFFF4A832);
  static const cream      = Color(0xFFF5F0E8);
  static const charcoal   = Color(0xFF1C1C1C);
  static const dark       = Color(0xFF1A1A2E);
  static const nearBlack  = Color(0xFF111C1D);
  static const white      = Color(0xFFFFFFFF);
  static const grey       = Color(0xFF888888);
  static const correct    = Color(0xFF4CAF82);
  static const incorrect  = Color(0xFFE24B4A);
}
```

```dart
// lib/theme/text_styles.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class LHText {
  // App display — smartboard sizing
  static TextStyle display(Color color) => GoogleFonts.nunito(
    fontSize: 72, fontWeight: FontWeight.w900, color: color
  );
  static TextStyle heading(Color color) => GoogleFonts.nunito(
    fontSize: 48, fontWeight: FontWeight.w700, color: color
  );
  static TextStyle subheading(Color color) => GoogleFonts.nunito(
    fontSize: 32, fontWeight: FontWeight.w600, color: color
  );
  static TextStyle body(Color color) => GoogleFonts.inter(
    fontSize: 24, fontWeight: FontWeight.w400, color: color
  );
  static TextStyle cue(Color color) => GoogleFonts.inter(
    fontSize: 22, fontWeight: FontWeight.w400, color: color
  );
  static TextStyle label(Color color) => GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w500,
    color: color, letterSpacing: 2.0
  );
}
```

---

## 7. Data Models

```dart
// lib/models/lesson_item.dart
class LessonItem {
  final String word;
  final String translation;
  final String imagePath;
  final String audioPath;
  final String teacherCue;

  LessonItem({
    required this.word,
    required this.translation,
    required this.imagePath,
    required this.audioPath,
    required this.teacherCue,
  });
}

// lib/models/check_question.dart
class CheckQuestion {
  final String prompt;
  final List<String> options;
  final int correctIndex;
  final String teacherCue;
  final String correctTeacherCue;
  final String incorrectTeacherCue;

  CheckQuestion({
    required this.prompt,
    required this.options,
    required this.correctIndex,
    required this.teacherCue,
    required this.correctTeacherCue,
    required this.incorrectTeacherCue,
  });
}

// lib/models/lesson.dart
class Lesson {
  final String id;
  final String title;
  final String teacherIntroCue;
  final List<LessonItem> items;
  final List<CheckQuestion> checkQuestions;

  Lesson({
    required this.id,
    required this.title,
    required this.teacherIntroCue,
    required this.items,
    required this.checkQuestions,
  });
}
```

---

## 8. Placeholder Data

```dart
// lib/data/placeholder_lessons.dart
import '../models/lesson.dart';
import '../models/lesson_item.dart';
import '../models/check_question.dart';

final List<Lesson> placeholderLessons = [
  Lesson(
    id: '01',
    title: 'Greetings and Introduction',
    teacherIntroCue: 'Tell the class we are starting French today. We will learn how to greet people.',
    items: List.generate(10, (i) => LessonItem(
      word: 'Lorem Ipsum ${i + 1}',
      translation: 'Placeholder Translation',
      imagePath: 'assets/images/placeholder.png',
      audioPath: 'assets/audio/placeholder.mp3',
      teacherCue: 'Play the audio twice. Ask the class to repeat the word after each play.',
    )),
    checkQuestions: [
      CheckQuestion(
        prompt: 'Which word means Hello in French?',
        options: ['Option A', 'Option B', 'Option C', 'Option D'],
        correctIndex: 0,
        teacherCue: 'Ask a student to come up and tap the correct answer on the board.',
        correctTeacherCue: 'Well done. Ask the whole class to say the word together.',
        incorrectTeacherCue: 'Not quite. The correct answer is Option A. Ask the class to repeat it.',
      ),
    ],
  ),
  Lesson(
    id: '02',
    title: 'Numbers 1 to 20',
    teacherIntroCue: 'Tell the class today we are learning numbers in French.',
    items: List.generate(10, (i) => LessonItem(
      word: 'Number ${i + 1}',
      translation: 'Placeholder',
      imagePath: 'assets/images/placeholder.png',
      audioPath: 'assets/audio/placeholder.mp3',
      teacherCue: 'Play the audio. Point to the number on the board. Ask class to repeat.',
    )),
    checkQuestions: [
      CheckQuestion(
        prompt: 'What is the French word for the number 3?',
        options: ['Option A', 'Option B', 'Option C', 'Option D'],
        correctIndex: 2,
        teacherCue: 'Ask a student to tap the correct answer.',
        correctTeacherCue: 'Correct. Ask everyone to say the number together.',
        incorrectTeacherCue: 'Not this time. Show the correct answer and ask the class to repeat.',
      ),
    ],
  ),
  Lesson(id: '03', title: 'Colours', teacherIntroCue: 'Today we learn colours in French.',
    items: List.generate(8, (i) => LessonItem(word: 'Colour ${i+1}', translation: 'Placeholder',
      imagePath: 'assets/images/placeholder.png', audioPath: 'assets/audio/placeholder.mp3',
      teacherCue: 'Play audio. Ask class to repeat and point to something that colour in the room.')),
    checkQuestions: [CheckQuestion(prompt: 'Which word means Red in French?',
      options: ['Option A', 'Option B', 'Option C', 'Option D'], correctIndex: 1,
      teacherCue: 'Ask a student to tap the answer.',
      correctTeacherCue: 'Excellent. Ask class to repeat.',
      incorrectTeacherCue: 'Not quite. Correct answer is Option B.')]),
  Lesson(id: '04', title: 'Days of the Week', teacherIntroCue: 'Today we learn the days of the week in French.',
    items: List.generate(7, (i) => LessonItem(word: 'Day ${i+1}', translation: 'Placeholder',
      imagePath: 'assets/images/placeholder.png', audioPath: 'assets/audio/placeholder.mp3',
      teacherCue: 'Play audio. Ask class to repeat and clap once for each syllable.')),
    checkQuestions: [CheckQuestion(prompt: 'Which day comes after Lundi (Monday)?',
      options: ['Option A', 'Option B', 'Option C', 'Option D'], correctIndex: 0,
      teacherCue: 'Ask a student to tap the answer.',
      correctTeacherCue: 'Correct. Ask class to say all seven days together.',
      incorrectTeacherCue: 'Not quite. Show correct answer and repeat the sequence.')]),
];
```

---

## 9. Screen State Machine

```
App Launch
    │
    ▼
SplashScreen (2.5s auto)
    │
    ▼
Check shared_preferences: intro_seen?
    │
    ├── false ──▶ IntroScreen (2 slides) ──▶ set intro_seen = true
    │
    └── true ───┐
                │
                ▼
         LessonSelectScreen
                │
                ▼ (tap lesson)
         LessonPlayerScreen
                │
    ┌───────────┴───────────┐
    │                       │
    ▼                       ▼
VocabItemView         CheckQuestionView
    │                       │
    │ (last item)           │ (after reveal + 3s)
    └───────────┬───────────┘
                │
                ▼
         LessonSummaryScreen
                │
                ▼ (Return to Lessons)
         LessonSelectScreen
```

---

## 10. Screen Specifications

### Splash Screen
```
Duration: 2500ms then auto-navigate
Background: LHColors.teal
Content: centred column
  - LangHuey wordmark (Nunito Black, 72sp, white)
  - "JSS1 French Edition" (Inter Light, 28sp, turquoise)
  - AnimatedContainer loading bar (gold, 600px wide, 8px tall)
Navigation: Timer → check intro_seen → route accordingly
```

### Intro Screen
```
2 pages, PageView controller
Page 1: Cream background
  - Skip button top right
  - Illustration right (placeholder coloured container for MVP)
  - Headline left: "Any staff member can run a French class."
  - Body: "The app tells you exactly what to do at every step."
  - Progress dots + Next button

Page 2: Teal background
  - Skip button top right
  - Illustration right
  - Headline: "Fully offline. Always ready."
  - Body: "No internet. No subscriptions. Just press play."
  - Progress dots + Get Started button (gold)

On Get Started: set intro_seen = true, navigate to LessonSelect
```

### Lesson Select Screen
```
Background: LHColors.teal
AppBar: "Lang Huey" left + "JSS1 French — Term 1" right
Body: ListView of lesson cards
  LessonCard widget:
    - White surface, rounded 16px, height 100px
    - Lesson number: turquoise Nunito Bold 32sp
    - Lesson title: charcoal Nunito SemiBold 28sp
    - Play button: gold circle 64px, white play icon
    - onTap: navigate to LessonPlayerScreen(lesson: lesson)
```

### Lesson Player Screen
```
Background: LHColors.dark
State: LessonPlayerState (currentItemIndex, isCheckQuestion, isRevealed)

Layout stack (bottom to top):
  1. Main content area (flex)
  2. Teacher cue bar (fixed 120px)
  3. Control bar (fixed 100px)

VocabItemView:
  - White card 480×480px, rounded 20px (placeholder image inside)
  - Word: white Nunito Black 72sp
  - Translation: turquoise Inter Regular 36sp
  - Play Audio button: turquoise outline pill

CheckQuestionView:
  - Question text: white Nunito Bold 52sp, max-width 1400px
  - 2×2 grid of OptionCard widgets
  - OptionCard: white surface 420×140px rounded 20px
    - Default: white bg, charcoal text
    - Selected: turquoise border
    - Correct revealed: LHColors.correct fill, white text
    - Wrong revealed: LHColors.incorrect fill, white text

TeacherCueBar:
  - Full width, teal bg, 120px tall
  - "TEACHER: " prefix in turquoise medium
  - Cue text in white regular 22sp

ControlBar:
  - Full width, nearBlack bg, 100px tall
  - Back button: white pill
  - Repeat button: turquoise pill (vocab state only)
  - Next/Reveal button: gold pill
  - All buttons minimum 200×64px
```

### Lesson Summary Screen
```
Background: LHColors.teal
Content: centred column
  - Gold checkmark icon 120px (AnimatedScale on entry)
  - "Lesson Complete" Nunito Black 72sp white
  - Lesson title Inter Regular 28sp turquoise
  - Row of 3 StatCard widgets (white surface, rounded 16px, 280×140px)
    - Words Covered / Questions Answered / Complete %
    - Numbers in turquoise Nunito Black 52sp
  - Return to Lessons gold pill button
```

---

## 11. pubspec.yaml

```yaml
name: lang_huey
description: Offline French lesson system for Nigerian smartboards
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
  just_audio: ^0.9.36
  shared_preferences: ^2.2.2
  google_fonts: ^6.1.0

flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/audio/
```

---

## 12. Build Sequence — Day by Day

```
Day 1   Project init. Theme file. Colours. Text styles. Routes.
Day 2   Splash screen. Auto-navigate. Timer.
Day 3   Intro screen. PageView. 2 slides. Skip + Next logic.
Day 4   Lesson select screen. Lesson cards from placeholder data.
Day 5   Lesson player scaffold. Dark background. Layout zones.
Day 6   VocabItemView widget. Word, translation, image, audio button.
Day 7   TeacherCueBar widget. ControlBar widget. Layout complete.
Day 8   Audio service. just_audio. Play/repeat/stop.
Day 9   Item progression state machine. Next/Back logic.
Day 10  CheckQuestionView. 2×2 grid. Tap to select.
Day 11  Answer reveal logic. Correct/incorrect states. Auto-advance.
Day 12  Lesson summary screen. Stats. Return to menu.
Day 13  Full flow test. Splash → Summary. Fix all crashes.
Day 14  Large screen test. Font size adjustments. APK build.
```

---

## 13. MVP Done Checklist

- [ ] App builds without errors (`flutter build apk`)
- [ ] Splash screen displays and auto-navigates in 2.5 seconds
- [ ] Intro shows on first launch, skips on second launch
- [ ] Lesson select shows all 4 placeholder lessons
- [ ] Tapping a lesson navigates to lesson player
- [ ] Vocabulary items display word, translation, image, teacher cue
- [ ] Play Audio button triggers audio playback
- [ ] Next button advances through all items
- [ ] Check question displays with 4 options
- [ ] Tapping an option selects it
- [ ] Reveal shows correct/incorrect states
- [ ] Lesson summary appears after last item
- [ ] Return to Lessons navigates back to menu
- [ ] App runs 10 minutes without crashing
- [ ] App runs with no internet connection
- [ ] Teacher cue bar visible on every lesson player screen

---

*No feature not on this list gets built before the checklist is complete.*
*Last updated: August 2025*
