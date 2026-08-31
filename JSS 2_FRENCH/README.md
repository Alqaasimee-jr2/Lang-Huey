<div align="center">

# 🇳🇬 Lang Huey — JSS 2 French (Junior Secondary School 2)

**The Standalone Offline French Classroom Smartboard Application for Nigerian Secondary Schools**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-0D7377?style=for-the-badge&logo=flutter&logoColor=14BDCC)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0D7377?style=for-the-badge&logo=dart&logoColor=14BDCC)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Android_Smartboards_|_Desktop_|_Web-0D7377?style=for-the-badge&logo=android&logoColor=white)](#)
[![Curriculum](https://img.shields.io/badge/Curriculum-NERDC_JSS2_Aligned-0D7377?style=for-the-badge)](#)
[![Test Suite](https://img.shields.io/badge/Automated_Tests-18%2F18_Passing_(100%25)-10B981?style=for-the-badge)](#)

</div>

---

## 📖 Overview

**JSS 2 French** is a specialized, 100% offline smartboard classroom application built for Nigerian Junior Secondary School 2 (Year 8) classrooms. It provides a complete, structured interactive French curriculum enabling non-specialist teachers to facilitate French lessons through:
- High-legibility 4K/1080p touch interfaces.
- Step-by-step Standard English **Teacher Facilitator Guidance Cue Bars**.
- 84 authentic 44.1kHz neural French audio pronunciation clips (`fr-FR-DeniseNeural`).
- 9 bespoke kinetic smartboard widgets designed for tactile classroom collaboration.

---

## 📚 Curriculum Breakdown — Premier Trimestre (Term 1)

In accordance with Lang Huey's instructional policy, the official Nigerian NERDC JSS2 Term 1 scheme of work is structured into **9 high-impact instructional and revision weeks**:

| Week | Unité / Theme | Communicative & Grammatical Scope | Interactive Pattern Widget | Audio Assets |
| :---: | :--- | :--- | :--- | :---: |
| **1** | **Unité 1 : Demander et expliquer la position** | Spatial prepositions (*sur, sous, devant, derrière, dans, entre, à côté de, à gauche/droite*), asking location (*Où est / Où se trouve*), contractions with *de*. | `JSS2SpatialPositionStudioWidget` | 10 |
| **2** | **Unité 2 : Situer les lieux** | Public town buildings (*la poste, la banque, l'hôpital, l'école, le marché, la pharmacie, le commissariat, la gare*), distance gauge (*près de, loin de, en face de*). | `JSS2LocatingPlacesStudioWidget` | 10 |
| **3** | **Unité 3 : Accueillir et guider quelqu'un** | Indoor reception, multi-floor building floorplans (*RDC, 1er étage, 2e étage*), welcoming formulas (*Bienvenue, entrez je vous en prie, suivez-moi*). | `JSS2IndoorWelcomingGuidingStudioWidget` | 10 |
| **4** | **Unité 4 : Demander et indiquer le chemin** | Outdoor wayfinding & city street navigation (*Continuez tout droit, tournez à gauche au carrefour, prenez la 2e rue, traversez le pont*). | `JSS2DirectionsAndWayfindingStudioWidget` | 9 |
| **5** | **Unité 5 : Les moyens de transport** | Land, air, water, and active transit modes + **EN vs À Grammar Rule Lab** (*EN* for closed vehicles vs *À* for open/active transit). | `JSS2TransportModesStudioWidget` | 10 |
| **6** | **Unité 6 : Expliquer un trajet** | Public transit routes, 3 Metro/BRT lines, transfers (*changer à la station*), stop counts, journey timing, ticket validator simulation. | `JSS2PublicTransitRouteStudioWidget` | 10 |
| **7** | **Unité 7 : Demander et indiquer des horaires** | Electronic departures monitor (*tableau des départs*), 24h & spoken time decoding, platform gates (*quai / porte*), transit frequencies. | `JSS2SchedulesAndTimetablesStudioWidget` | 10 |
| **8** | **Unité 8 : Réagir à un problème de transport** | Transit trouble desk & assistance clinic: delays, cancellations, missed connections, lost luggage, customer service claim dialogs. | `JSS2TransportTroubleshootingStudioWidget` | 10 |
| **9** | **Grand Rallye du 1er Trimestre** | 4-Team live championship quiz arena across all 8 units with scoreboards, buzzer SFX, timer & victory podium celebration. | `JSS2Term1RevisionRallyWidget` | 5 |

---

## 🎮 9 Bespoke Smartboard Interactive Pattern Widgets

All pattern widgets are implemented in `lib/widgets/patterns/term1/`:

1. **`JSS2SpatialPositionStudioWidget`**:
   - 3D spatial stage with moveable classroom objects (livre, sac, stylo, règle, ballon).
   - Real-time sentence generation with contractions (*du tableau, de la porte*).
   - "Quiz de Positionnement" mini-game mode.
2. **`JSS2LocatingPlacesStudioWidget`** :
   - Interactive town street map with 8 landmark nodes.
   - Distance & proximity calculator between selected origin and destination buildings.
   - Contraction coach explaining `de + le = du` vs `de + la = de la`.
3. **`JSS2IndoorWelcomingGuidingStudioWidget`** :
   - Multi-floor school building floorplan navigator (RDC, 1er, 2e étage).
   - Receptionist dialog constructor and step-by-step visitor escort generator.
4. **`JSS2DirectionsAndWayfindingStudioWidget`** :
   - GPS-style turn-by-turn route builder with compass rose.
   - Action command controls (*Continuez tout droit, tournez à gauche, prenez le rond-point*).
   - Walking distance and time estimation calculator.
5. **`JSS2TransportModesStudioWidget`** :
   - 4-Category vehicle garage (Land, Air, Water, Active/2-Wheels).
   - Interactive **EN vs À sorting game** with instant score and audio feedback.
6. **`JSS2PublicTransitRouteStudioWidget`** :
   - Metro / BRT light rail transit line planner with transfer connection detection.
   - Interactive ticket validator turnstile simulator with turnstile chime.
7. **`JSS2SchedulesAndTimetablesStudioWidget`** :
   - Airport and railway electronic departures board (*Tableau des départs*).
   - 24-Hour and colloquial spoken time decoder with platform indicators.
8. **`JSS2TransportTroubleshootingStudioWidget`** :
   - Transit customer service desk simulating 4 real-world crisis scenarios.
   - Resolution voucher and ticket exchange simulator.
9. **`JSS2Term1RevisionRallyWidget`** :
   - 4-Team live championship buzzer quiz arena (*Équipe Bleue, Verte, Rouge, Jaune*).
   - Real-time score adjustments (+10 / -5), countdown timer, and victory trophy podium.

---

## 🛠️ Architecture & Directory Structure

```text
JSS 2_FRENCH/
├── assets/
│   ├── audio/
│   │   ├── jss2_term1/                 # 84 Authentic 44.1kHz MP3 neural audio files
│   │   ├── sfx_celebrate.mp3           # Championship fanfare SFX
│   │   ├── sfx_click.mp3               # UI tap SFX
│   │   ├── sfx_correct.mp3             # Correct answer chime
│   │   ├── sfx_incorrect.mp3           # Error buzz SFX
│   │   └── sfx_whoosh.mp3              # Transition whoosh
│   └── images/
│       └── jss2_term1/
│           └── jss2_spatial_positions.jpg # 3D classroom spatial illustration
├── lib/
│   ├── data/
│   │   └── jss2_term1_lessons.dart     # 9 Complete weekly lesson datasets
│   ├── models/
│   │   └── jss2_lesson_model.dart      # JSS2PatternType enum & data models
│   ├── screens/
│   │   ├── lesson/
│   │   │   └── jss2_lesson_player_screen.dart # 5-Phase lesson player
│   │   ├── roadmap/
│   │   │   └── jss2_week_roadmap_screen.dart  # 9-Week visual roadmap
│   │   └── term/
│   │       └── jss2_term_select_screen.dart   # Term selection dashboard
│   ├── services/
│   │   └── jss2_audio_service.dart     # Audio playback & SFX manager (0.8x/1.0x speed)
│   ├── theme/
│   │   ├── colors.dart                 # Official Lang Huey brand palette
│   │   └── text_styles.dart            # Smartboard typography tokens
│   ├── widgets/
│   │   └── patterns/
│   │       └── term1/                  # 9 Bespoke Term 1 pattern widgets
│   └── main.dart                       # App entry point
├── test/
│   ├── jss2_french_test.dart           # Curriculum data & schema integrity tests
│   └── jss2_widget_fit_test.dart       # 1080p/4K Smartboard UI widget fit tests
└── pubspec.yaml                        # Dependencies & asset configuration
```

---

## 🧪 Testing Procedures & Step-by-Step Verification

### 1. Automated Unit & Curriculum Schema Tests
Verifies that all 9 weekly modules conform strictly to the data contract (objectives count, audio key mapping, exercise validation, grammar notes).

```powershell
cd "c:\Users\DELL\Desktop\Lang Huey\JSS 2_FRENCH"
flutter test test/jss2_french_test.dart
```

### 2. Smartboard 1080p/4K UI Widget Fit Tests
Simulates a high-resolution smartboard display (`1920x1080`, `devicePixelRatio: 1.0`) to verify layout rendering, phase switching, and interactive touch controls across all 9 bespoke widgets.

```powershell
flutter test test/jss2_widget_fit_test.dart
```

### 3. Full Test Suite Execution
Runs the complete automated test suite:

```powershell
flutter test
```

### 4. Static Code Quality Analysis
Ensures zero syntax errors, type safety, and clean code standards:

```powershell
flutter analyze
```

---

## 📊 Verified Test Results

| Test Suite | Test Case Description | Status | Pass Rate |
| :--- | :--- | :---: | :---: |
| **`jss2_french_test.dart`** | Term 1 contains exactly 9 lessons (8 instructional + 1 revision rally) | ✅ PASSED | 100% |
| **`jss2_french_test.dart`** | Every lesson has >= 4 objectives and non-empty cultural insight | ✅ PASSED | 100% |
| **`jss2_french_test.dart`** | Every lesson has rich vocabulary with phonetics and non-empty audioKey | ✅ PASSED | 100% |
| **`jss2_french_test.dart`** | Every lesson has interactive exercises with valid correctOptionIndex | ✅ PASSED | 100% |
| **`jss2_french_test.dart`** | Every lesson has evaluation questions and comprehensive grammar notes | ✅ PASSED | 100% |
| **`jss2_french_test.dart`** | Pattern types are properly mapped across all 9 weeks | ✅ PASSED | 100% |
| **`jss2_widget_fit_test.dart`** | `JSS2TermSelectScreen` renders term cards and header branding | ✅ PASSED | 100% |
| **`jss2_widget_fit_test.dart`** | `JSS2WeekRoadmapScreen` renders all 9 week cards for Term 1 | ✅ PASSED | 100% |
| **`jss2_widget_fit_test.dart`** | Week 1 `JSS2SpatialPositionStudioWidget` renders correctly | ✅ PASSED | 100% |
| **`jss2_widget_fit_test.dart`** | Week 2 `JSS2LocatingPlacesStudioWidget` renders correctly | ✅ PASSED | 100% |
| **`jss2_widget_fit_test.dart`** | Week 3 `JSS2IndoorWelcomingGuidingStudioWidget` renders correctly | ✅ PASSED | 100% |
| **`jss2_widget_fit_test.dart`** | Week 4 `JSS2DirectionsAndWayfindingStudioWidget` renders correctly | ✅ PASSED | 100% |
| **`jss2_widget_fit_test.dart`** | Week 5 `JSS2TransportModesStudioWidget` renders correctly | ✅ PASSED | 100% |
| **`jss2_widget_fit_test.dart`** | Week 6 `JSS2PublicTransitRouteStudioWidget` renders correctly | ✅ PASSED | 100% |
| **`jss2_widget_fit_test.dart`** | Week 7 `JSS2SchedulesAndTimetablesStudioWidget` renders correctly | ✅ PASSED | 100% |
| **`jss2_widget_fit_test.dart`** | Week 8 `JSS2TransportTroubleshootingStudioWidget` renders correctly | ✅ PASSED | 100% |
| **`jss2_widget_fit_test.dart`** | Week 9 `JSS2Term1RevisionRallyWidget` renders correctly | ✅ PASSED | 100% |
| **`jss2_widget_fit_test.dart`** | `JSS2LessonPlayerScreen` loads and switches phases smoothly | ✅ PASSED | 100% |
| **Total** | **18 Automated Unit & Widget Fit Tests** | **✅ ALL 18 PASSED** | **100%** |

---

## 🚀 Running the App Locally

To launch the JSS 2 French app on desktop or an emulator:

```powershell
cd "c:\Users\DELL\Desktop\Lang Huey\JSS 2_FRENCH"
flutter run -d windows # Or android / chrome
```
