# Lang Huey - Project Changelog & Decision Log

All notable decisions, architectural thoughts, rationale, and project actions are recorded in this log.

---

## [Unreleased] - 2026-08-28

### Grade 4 / Primary 4 French Standalone App Architecture (`P4_FRENCH`)
- **First Production Target**: Selected **Grade 4 / Primary 4 French Language** as the first complete standalone classroom smartboard application.
- **Platform Stack**: **Flutter / Dart** targeting **Android APK** (optimized for Android Interactive Flat Panels / Smartboards with landscape orientation, high touch ergonomics, and 100% offline runtime).
- **Execution Strategy (Term-by-Term Build)**:
  - **Sequential Delivery**: Complete **Term 1 (Weeks 1–13)** fully at a stretch before proceeding to subsequent terms.
  - **Zero Media First / Logic-First Pipeline**: Build all UI layouts, interactive mechanics, topic-specific learning patterns, vocabulary data, and evaluation flows first with clean vector/text elements. Focus specifically on audio/media asset production in the next dedicated pass.
- **Curriculum & Scope Clarification**:
  - **Classroom Teaching & Interactive Revision Engine**: The smartboard app is strictly for interactive classroom teaching, pronunciation, vocabulary drills, classwork, and interactive revision.
  - **No In-App Exam Holding**: Formal exams (Mid-Term Week 5, End-of-Term Week 12) will *not* be computerized tests on the app. Exam weeks will provide comprehensive review recaps and printable revision notes for the teacher.
- **Topic-Specific Interactive Learning Patterns**: Bespoke pedagogical mechanics tailored to each lesson topic (Border Map Explorer, Time-of-Day Context Dial, Magic Words Chest & "La Bise" Cultural Showcase, Personal ID Card Builder, Numbers 1-20 Soundboard, Dialogue Sequencer, and Revision Drills).
- **Teacher Cue Bar Separation**: Removed on-screen Teacher Cue Bar from smartboard display to preserve an immersive, distraction-free student experience. Teacher guidance and lesson pacing transitioned into an external Teacher's Manual companion.
- **Term 1 Multimedia Sprint & Universal Audio Engine Complete**:
  - **95 Standard 44.1kHz MP3 Audio Assets**: Generated and verified across all 13 weeks in `mvp/assets/audio/p4_term1/` for universal compatibility across Windows Media Player, Groove, VLC, and Android smartboard hardware.
  - **Classroom SFX Audio Engine**: Synthesized and wired dedicated UI audio feedback:
    - `sfx_correct.mp3`: Cheerful two-tone ascending chime for correct smartboard drill answers.
    - `sfx_incorrect.mp3`: Gentle low tone for retry attempts.
    - `sfx_click.mp3`: Subtle pop for tactile option selection.
    - `sfx_celebrate.mp3`: Triumphant 4-note fanfare on drill completion and vacation screens.
  - **Complete Interactive Widget Audio Wiring**: Wired native audio triggers and speaker badges into all 10 bespoke pattern widgets ([MapExplorer](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/map_explorer_widget.dart), [GreetingDial](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/greeting_dial_widget.dart), [MagicWords](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/magic_words_widget.dart), [IdentitySentenceBuilder](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/identity_sentence_builder_widget.dart), [NumberAndAge](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/number_and_age_widget.dart), [FarewellMatcher](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/farewell_matcher_widget.dart), [DialogueSequencer](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/dialogue_sequencer_widget.dart), [IdCardWorkshop](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/id_card_workshop_widget.dart), [RevisionRally](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/revision_rally_widget.dart), [VacationCelebration](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/vacation_celebration_widget.dart)) and the [P4LessonPlayerScreen](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/screens/lesson/p4_lesson_player_screen.dart) Vocabulary Station.
  - **Visual Asset Suite**: Integrated high-contrast vector flags (Bénin, Niger, Tchad, Cameroun, Nigeria), time-of-day badges, cultural cards (*La Bise*), and student ID templates in `mvp/assets/images/p4_term1/`.
- **Term 2 (Deuxième Trimestre) Full Build Completed**:
  - **13 Complete Weeks of Curriculum** (`p4_term2_lessons.dart`): Added exhaustive NERDC curriculum content covering family members (*la famille*), possessive adjectives (*mon/ma/mes*), family descriptions with singular verb *avoir* (*J'ai, Tu as, Il a, Elle a*), classroom items & school places (*l'école, la salle de classe, le tableau, le bureau, la bibliothèque, la cour*), verb *aller* (*Je vais à...*), 7 days of the week & weekly schedules (*le lundi, le mardi...*), school action verbs (*lire, écrire, étudier, jouer*), 6 core colors (*rouge, bleu, jaune, vert, noir, blanc*), and spatial prepositions (*sur, sous, dans, devant, derrière*).
  - **10 Bespoke Pattern Widgets**:
    1. [FamilyPortraitWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term2/family_portrait_widget.dart) (Week 1: *Mon/Ma* possessives & close family member introduction builder).
    2. [FamilyTreeBuilderWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term2/family_tree_builder_widget.dart) (Week 2: 3-generation smartboard family tree & naming statements *Il/Elle s'appelle*).
    3. [FamilyDescriptorWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term2/family_descriptor_widget.dart) (Week 3: Adjective agreement lab *grand/grande, petit/petite, vieux/vieille* & *Avoir* conjugator).
    4. [ClassroomExplorerWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term2/classroom_explorer_widget.dart) (Week 4: 8-item tap-to-inspect classroom stage with French gender articles).
    5. [CampusAndSubjectsWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term2/campus_and_subjects_widget.dart) (Week 7: School facilities campus map, *Aller* verb conjugator & subject preference dial *J'aime le français*).
    6. [SchoolTimetableWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term2/school_timetable_widget.dart) (Week 8: 7-day school schedule & school action verbs *lire, écrire, étudier, jouer*).
    7. [PrepositionPlaygroundWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term2/preposition_playground_widget.dart) (Week 9: Interactive spatial positioning stage for *sur, sous, dans, devant, derrière*).
    8. [ColorStudioWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term2/color_studio_widget.dart) (Week 10: 6-color palette agreement studio & Parent-Teacher meeting role-play *Enchanté(e)*).
    9. [Term2RevisionRallyWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term2/term2_revision_rally_widget.dart) (Weeks 5, 11 & 12: 4-category speed oral revision rally).
    10. [Term2VacationCelebrationWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term2/term2_vacation_celebration_widget.dart) (Weeks 6 & 13: Term wrap-up, holiday wishes *Bonnes vacances / À la rentrée*, and Term 3 preview).
  - **Multi-Term App Navigation**: Unlocked Term 2 in [P4TermSelectScreen](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/screens/term/p4_term_select_screen.dart), updated [P4WeekRoadmapScreen](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/screens/roadmap/p4_week_roadmap_screen.dart) to load Term 1 or Term 2 dynamically, and wired all Term 2 pattern widgets into [P4LessonPlayerScreen](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/screens/lesson/p4_lesson_player_screen.dart).
- **Term 1 Responsiveness & Text/Audio Alignment Sprint Complete**:
  - **Granular Dialogue Audio Triggers**:
    - [GreetingDialWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/greeting_dial_widget.dart) (Week 2): Added distinct audio triggers to Question bubbles (`comment_allez_vous.mp3`, `comment_ca_va.mp3`, `ca_va.mp3`) and Reply bubbles (`tres_bien_merci.mp3`, `ca_va_bien.mp3`) across morning, evening, and bedtime periods for formal and informal speech.
    - [MagicWordsWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/magic_words_widget.dart) (Week 3): Added interactive `subPhrases` audio chips for each expression variant (*Merci* vs *Merci beaucoup*, *Pardon* vs *Excusez-moi*, *Au revoir* vs *À demain*).
    - [IdentitySentenceBuilderWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/identity_sentence_builder_widget.dart) (Week 4): Added separate speaker buttons for the name statement (`je_mappelle.mp3`) and nationality statement (`je_suis_nigerian.mp3` / `je_suis_nigeriane.mp3`).
    - [DialogueSequencerWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/dialogue_sequencer_widget.dart) (Week 9): Added dedicated interactive speaker buttons to both Speaker A and Speaker B bubbles across all 4 conversation stages.
    - [IdCardWorkshopWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/id_card_workshop_widget.dart) (Week 10): Added sentence-by-sentence practice chips (1. *Bonjour !*, 2. *Je m'appelle...*, 3. *J'ai... ans*, 4. *Je suis Nigérian(e)*, 5. *Au revoir !*) and clearly labeled the continuous model speech (`presentation_speech.mp3`) as Tunde's model presentation.
    - [MapExplorerWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/map_explorer_widget.dart) (Week 1): Fixed country card label and audio trigger to match the spoken country name (`le_benin.mp3`, `le_niger.mp3`, `le_tchad.mp3`, `le_cameroun.mp3`).
  - **Smartboard Responsive Layout & Overflow Elimination**:
    - [P4LessonPlayerScreen](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/screens/lesson/p4_lesson_player_screen.dart):
      - `_buildObjectivesView()`: Wrapped Classroom Cultural Hook card in a `SingleChildScrollView` to prevent vertical overflow on 720p/800p smartboards.
      - `_buildVocabLabView()`: Updated GridView aspect ratio to `2.1` and allowed English translations to wrap to 2 lines cleanly.
      - `_buildClassworkView()`: Updated drill option aspect ratio to `2.6` with multi-line wrapping (`maxLines: 2`) so longer French phrases never truncate.
  - **Full Curriculum Model Harmonization**:
    - [P4Lesson](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/models/p4_lesson_model.dart): Added `P4GrammarNote` model, `P4ClassworkExercise` alias, and flexible parameter aliases to support both Term 1 and Term 2 lessons seamlessly.
  - **Automated Verification**: Ran comprehensive audio verification script (`verify_term1_alignment.py`), confirming that 100% of 151 referenced audio keys map to existing 44.1kHz MP3 files.
- **Skill Integration (`ui_ux_pro_max`)**: Integrated and verified the `ui_ux_pro_max` intelligence skill in `.agents/skills/ui_ux_pro_max` for high-impact educational smartboard UI styling and UX design patterns.
- **Monorepo & Multi-App Scalability**: Architected codebase under modular structure (`apps/p4_french/`, future `apps/p5_french/`, `apps/p6_chinese/`).

---

## [0.2.0] - 2026-08-22 (Lang Huey Master Specifications Locked)
- **Initiation**: Project "Lang Huey" officially launched.
- **Core Problem Addressed**:
  - Acute shortage and high cost of foreign language teachers (French, Mandarin, Spanish, etc.) in Nigerian schools.
  - High cost and network unreliability of virtual live classes.
  - Mismatch between generic language learning apps (Duolingo/Babbel) and government-approved schemes of work (NERDC curriculum).
- **Core Requirements Established**:
  1. **100% Offline Capability**: Must run seamlessly without internet access once installed/bundled.
  2. **Smartboard-First Design**: Optimized for large interactive displays (high contrast, large touch targets, remote/touch control, audio clarity).
  3. **Teacher-As-Facilitator Paradigm**: Designed for teachers with *zero prior knowledge* of the target foreign language. Features interactive guides, automated voiceover/pronunciation, and step-by-step facilitation prompts.
  4. **Government Scheme of Work Alignment**: Structured strictly around Ministry of Education / NERDC weekly lesson plans (Term 1-3, Weeks 1-12).

### Architectural Rationale & Initial Decisions
- **Decision 1: Modular Web-Based Runtime Architecture (Vite + HTML/CSS/JS)**:
  - *Rationale*: Interactive Flat Panels / Smartboards in Nigerian schools run a mix of Android OS and Windows mini-PCs. A lightweight web engine (PWA / Vite-packaged bundle) provides cross-platform compatibility without heavy native overhead.
- **Decision 2: Local Asset Storage & Zero External API Dependency**:
  - *Rationale*: Audio files, lesson content, and exercises will be stored locally (IndexedDB / static asset bundles) to prevent audio buffering or loading delays during live lessons.
- **Decision 3: Smartboard Facilitator Overlay & Duolingo-Inspired Onboarding**:
  - *Rationale*: Highlighting clear instructions for the teacher while keeping the Smartboard screen visually striking and distraction-free for students.
  - *Duolingo-Inspired Teacher Experience*:
    1. **Interactive First-Time Teacher Orientation (2-min Tour)**: Walks non-expert teachers through facilitating a lesson.
    2. **Pre-Lesson 60-Second Briefing**: Shows lesson objectives, phonetic pronunciation cheatsheet for the teacher, and physical classroom setup notes before starting the period.
    3. **Live On-Screen Facilitator Overlay**: Real-time step-by-step guidance on the smartboard during class.

### [0.2.0] - 2026-08-22 (Lang Huey Master Specifications Locked)
- **Brand Confirmation**: Product name is officially **Lang Huey** (`langhuey.com.ng`).
- **Core Innovation Locked**: The **Teacher Cue Bar** — an on-screen scripting system at the bottom of the Lesson Player screen instructing non-specialist teachers precisely what to say/do next (e.g. *"Play the audio twice. Ask the class to repeat 'la pomme' after each play."*).
- **MVP Content Scope**: JSS1 French (NERDC Curriculum, 3 Terms, 24 Lessons minimum, 8-10 vocabulary items per lesson with local offline audio, images, and translations).
- **Core Architecture**:
  - Single installer per class level (`.apk` for Android Smartboards).
  - AES-256 encrypted `.langhueypack` bundle for offline assets.
  - Hardware-bound activation key system (consumed from key pool on first launch).
- **Brand Palette & Design System**:
  - Deep Teal (`#0D7377`), Turquoise (`#14BDCC`), Warm Cream (`#F5F0E8`), Charcoal (`#1C1C1C`), White (`#FFFFFF`).
  - Accent Amber Gold (`#F4A832`) restricted **EXCLUSIVELY** to primary CTA buttons.
  - Typography: Nunito Bold (Headlines, lowercase style), Inter Regular (Body), Inter Medium (Tracked labels).
- **Official Lang Huey Brand Guidelines Integrated (v1.0)**:
  - **Brand Voice**: Direct, Confident, Human, Specific. Zero jargon, no AI buzzwords.
  - **Visual Hierarchy Rules**: Dark Teal carrying decisions $\rightarrow$ Warm Cream carrying content $\rightarrow$ Alternating dark/cream rhythm.
  - **Gold Rule**: Amber Gold touches **ONE element per screen maximum**.
- **Mastermind Refinements (Confirmed & Approved)**:
  1. **Tip 1 (Approved)**: 1-Page Executive Brief PDF download for School Boards & Proprietors.
  2. **Tip 2 (Approved)**: Professional Zero-Data & Hardware-Lock Guarantee on post-registration screen.
  3. **Tip 3 (Animated Showcase)**: Hero video section features a high-impact Animated Ad/Showcase demonstrating Lang Huey in smartboard classroom use.
  4. **Tip 4 (Approved)**: Post-registration page redirects to dedicated confirmation screen with instant WhatsApp Community Channel join link.
- **Execution Signal**: **FIRE ON** issued by user on 2026-08-22. Build launched!
- **Workspace Reorganization**: All prelaunch website code and assets (`index.html`, `lang-huey-executive-brief.html`, `package.json`, `src/`, `dist/`) moved into designated [website/](file:///c:/Users/DELL/Desktop/Lang%20Huey/website) folder. Development server re-anchored inside `website/`.
- **Framework Upgrade**: Prelaunch website upgraded to **React 18 + Vite** (`@vitejs/plugin-react`). Componentized into modular JSX components (`<Navbar />`, `<Hero />`, `<LanguageTicker />`, `<RealitySection />`, `<SolutionSection />`, `<FeaturesSection />`, `<PrelaunchCommunityForm />`, `<FounderNote />`, `<WaveBanner />`, `<Footer />`, `<PostSignupModal />`). Enhanced with rich micro-animations (glowing pulses, card hover scaling, smooth modal popups).
- **Brand Ownership & Ideation Policy Refinements**:
  1. **Brand Creator**: Product name is **Lang Huey**, a product created under **NIT7ER**. Creator attribution updated everywhere to **NIT7ER**.
  2. **Zero Money / Zero Pricing Policy (Prelaunch Ideation Phase)**: Removed all pricing, naira amounts, or payment package references. The landing page focuses 100% on ideation, community building, and early waitlist registration.
  3. **High-Precision SVG Iconography**: Replaced raw text/emoji placeholders with crisp Lucide SVG vector icons and clean vector flag badges.
  4. **Strict Gold Rule Enforcement**: Navbar CTA converted to Ghost Outline, reserving Amber Gold (`#F4A832`) **EXCLUSIVELY for ONE primary CTA button per view**.
  5. **Curved SVG Wave Divider & Alternating Zig-Zag**: Implemented SVG wave divider before footer and alternating visual layout flow.
- **Kinetic Video Showcase & Deployment Finalization**:
  1. **Embedded Video Showcase**: Integrated `media/showcase.mp4` into the Hero Smartboard showcase frame with overlay text cleanup for clean playback.
  2. **Punctuation & Date Lock**: Replaced em-dashes (`—`) with standard punctuation (colons, commas, hyphens) and locked all copyrights to **2026**.
  3. **Vercel Live Deployment**: Deployed prelaunch website live at [lang-huey.vercel.app](https://lang-huey.vercel.app) and synced to GitHub (`Alqaasimee-jr2/Lang-Huey.git`).
