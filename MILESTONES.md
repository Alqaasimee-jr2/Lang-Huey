# Lang Huey - Master Project Milestones & Roadmap

This document details pre-decided future milestones for the development, validation, deployment, and content integration of **Lang Huey**.

---

## Milestone 0: Lang Huey Prelaunch Platform (`lang-huey.vercel.app`) 🌐 *(Phase 0 Deliverable Completed)*
- [x] Integrate Official Lang Huey Brand Guidelines v1.0 & Strategic Refinements.
- [x] Build Next.js App Router Prelaunch Community & Waitlist Platform:
  - [x] Navbar: Lang Huey wordmark + Mobile drawer + Gold pill CTA.
  - [x] Hero: Deep Teal `#0D7377`, Inter Black headline *"french class. no teacher. no problem."*, Smartboard video showcase, Executive Brief link.
  - [x] LanguageTicker: Francophone flag badges & multi-language roadmap.
  - [x] Reality in Nigerian Schools: 3 interactive pain cards (Teacher shortage, Network dependency, Exam preparation gap).
  - [x] Introducing Lang Huey & Teacher Cue Bar Spotlight: Interactive on-screen guidance showcase.
  - [x] Interactive Smartboard Simulator: Live vocabulary audio phonetics (*Bonjour*, *Merci*, *Le Bénin*, *Au revoir*), 0.8x/1.0x speed toggle, live Teacher Cue Bar updates & check drill.
  - [x] NERDC Curriculum Showcase: Complete Primary 4 (39 weeks), Primary 5 (39 weeks), JSS1 French coverage & 30 bespoke pattern widgets.
  - [x] Prelaunch Community Form & Lead Routing: Automatic lead message generation directly to **+234 707 076 3135** + `localStorage` persistence.
  - [x] Post-Signup Modal: Instant redirect to Official WhatsApp Community Channel (`https://whatsapp.com/channel/0029Vb8YQkw96H4b8tpk0H0h`) and direct message.
  - [x] Dedicated Executive Board Brief Route (`/executive-brief`): Print/Save as PDF ready.
  - [x] Founder Note & Footer: Abdullah's story, NIT7ER attribution, direct phone and channel links.
- [x] Enforce Strict Brand & SEO Guidelines:
  - [x] Colors: Deep Teal `#0D7377`, Turquoise `#14BDCC`, Warm Cream `#F5F0E8`, Charcoal `#1C1C1C`, White `#FFFFFF`, Amber Gold `#F4A832`.
  - [x] Gold Rule: Amber Gold touches **ONE element per screen max**.
  - [x] SEO & Social Previews: Full Open Graph (1200x630), Twitter cards, JSON-LD structured data, sitemap.xml, robots.txt.
  - [x] Mobile Ergonomics: 100% responsive display across all mobile & tablet viewports with floating WhatsApp inquiry button.

## Milestone 1: Project Foundation & Core Architecture 🎯
- [x] Establish Project Repository, Rules, Changelog, and Milestone documentation.
- [ ] Define `.langhueypack` JSON & Audio Asset Schema (aligned with NERDC Scheme of Work: JSS1 French Terms 1-3).
- [ ] Implement Offline Local Asset Engine & Hardware Activation Key verification state machine.

## Milestone 2: Smartboard Interactive Classroom Engine 🖥️
- [ ] Build Smartboard-optimized UI/UX (Ultra-legible typography, 4K/1080p scaling, high touch-target ergonomics).
- [ ] Implement Audio Engine with native pronunciation playback, speed control (0.8x / 1.0x), and repetition loops.
- [ ] Create visual flashcard, vocabulary grid, and phonetic display components.

## Milestone 3: Teacher Facilitator System & Duolingo-Style Onboarding 👩‍🏫
- [ ] Design interactive 2-minute **First-Time Teacher Walkthrough** (orienting non-French teachers on how to run a lesson).
- [ ] Implement **60-Second Pre-Lesson Briefing Card** (Lesson objectives, key phonetic hints for teacher, physical classroom setup).
- [ ] Build live on-screen **Facilitator Guidance Overlay** (Step-by-step Standard English prompts for active class).
- [ ] Implement **30-Minute Structured Lesson Period Timer** & Section Navigators (Warmup -> Audio Drill -> Interactive Games -> Wrap-up Quiz).

## Milestone 4: Government Scheme of Work Content Bundles (French & Chinese) 🇳🇬
- [x] Author & digitize 3 Full Terms of Nigerian Scheme of Work for Primary 4 French (`mvp/`):
  - [x] **Term 1 (Weeks 1–13)**: Greetings, Numbers 1–20, Age, Identity & Francophone Geography (Complete + 95 Audio files + 10 Pattern Widgets).
  - [x] **Term 2 (Weeks 1–13)**: Family, School Environment, Objects, Prepositions & Colors (Complete + 183 Audio files + 10 Pattern Widgets).
  - [x] **Term 3 (Weeks 1–13)**: Telling Time, Daily Routine, Food/Meals, Body Anatomy, Clothes & Weather (Complete + 168 Audio files + 10 Pattern Widgets + Graduation Diploma).
- [x] Author & digitize 3 Full Terms of Nigerian Scheme of Work for Primary 5 French (`P5_FRENCH/`):
  - [x] **Term 1 (Weeks 1–13)**: Alphabet Sounds, Counting 21–60, Currency, Presenting Others, Anatomy & Pain Clinic (Complete + 138 Audio files + 10 Pattern Widgets).
  - [x] **Term 2 (Weeks 1–13)**: Extended Family, Relatives, Community Neighbors, Gratitude Postcard, Weekly Timetable (Complete + 66 Audio files + 10 Pattern Widgets).
  - [x] **Term 3 (Weeks 1–13)**: Daily Routine 6h00–21h00, Sports Arena, Hobbies Lounge, School Subjects, Career Dreams & Food Buffet (Complete + 64 Audio files + 10 Pattern Widgets + Graduation Diploma).
  - [x] **Full-Year Automated Test Suite**: 14/14 Unit & Widget Tests passed (100% test coverage for audio assets, data schemas, and smartboard navigation).
- [x] Author & digitize Nigerian Scheme of Work for Junior Secondary School 1 (JSS1) French (`JSS1_FRENCH/`):
  - [x] **Term 1 (Weeks 1–9: Classes & Revision Only)**: Classroom Commands, Greetings & Politeness, Self-Introduction ID Card, Alphabet & Dictation, Presenting Others, Character Descriptions, Hobbies & Leisure, Tastes & Preferences, 4-Team Revision Rally (Complete + 89 Neural French Audio files + 5 Studio MPEG-1 Layer 3 SFX + 4 Gemini AI Visual Illustrations + 9 Bespoke Pattern Widgets).
  - [x] **Term 2 (Weeks 1–9: Classes & Revision Only)**: Object Properties (Size/Color/Shape/Texture), Polite Requests & Reception, Professions & Duties, Clock Time (Dual Analog/Digital), Daily Routine Timelines (6h–21h), Calendar Dates & Holidays, Event Sequencing (*Avant/Pendant/Après*), Weekly Habits Planner, Grand Term 2 4-Team Revision Rally (Complete + 80 Neural French Audio files + 6 Gemini AI Educational Illustrations + 9 Bespoke Pattern Widgets).
  - [x] **Term 3 (Weeks 1–9: Classes & Revision Only)**: Weather & Seasons Barometer, Frequency Adverbs Gauge (100% *Toujours* ➔ 0% *Jamais*), Invitations & Social Formulas, Orders/Prohibitions/Authorizations & Signage, Permission & Study Advice Clinic (*Puis-je...? / Tu devrais...*), City Navigation & Procedure Sequencer, 4 Realistic Communicative Roleplays, BECE / Junior WAEC Written & Oral Prep Workshop, Grand Annual Championship Quiz Rally & JSS1 French Graduation Diploma Ceremony (Complete + 72 Neural French Audio files + 6 Gemini AI Visual Illustrations + 9 Bespoke Pattern Widgets).
- [x] Author & digitize Nigerian Scheme of Work for Junior Secondary School 2 (JSS2) French (`JSS 2_FRENCH/`):
  - [x] **Term 1 (Weeks 1–9: Classes & Revision Only)**: Spatial Positions (*sur, sous, dans, devant, derrière, entre, à côté de*), Locating Places in Town (*près de, loin de, en face de*), Welcoming & Indoor Floorplan Navigation (*RDC, 1er étage, au bout du couloir*), Street Wayfinding & Directions (*Continuez tout droit, tournez à gauche, traversez le pont*), Modes of Transport & EN vs À Rule, Public Transit Routes & Line Transfers, Electronic Departures & Timetables, Transit Crisis Resolution & Delay Claims, Grand 4-Team Revision Championship Rally (Complete + 84 Neural French Audio files + 5 Studio SFX + 9 Bespoke Pattern Widgets).
  - [x] **Zero-Defect Automated Test Suite**: 18/18 Unit & Widget Fit Tests passed (100% data schema, interactive state, and audio coverage).
- [x] Integrate crystal-clear offline native audio clips for vocabulary, phonetics, and dialogue drills (1,039 total MP3 audio assets verified across P4, P5, JSS1 & JSS2).
- [ ] Prepare Phase 2 Chinese (Mandarin) Scheme of Work data schema & audio assets.

## Milestone 5: Smartboard Interactive Drills & Classroom Activities 🎮
- [x] Build 30 bespoke smartboard pattern widgets across Terms 1, 2 & 3 (Map Explorer, Time Dials, Routine Timelines, Wardrobe Stylist, Buffet Organizer, Preposition Playground, Speed Revision Rallies, Graduation Diploma).
- [x] Build classroom vocabulary phonetics station, classwork drills, and cultural hooks.
- [x] Audio SFX integration (correct chime, incorrect buzz, celebrate fanfare, click sound).

## Milestone 6: Android Smartboard Packaging & Offline USB Distribution 📦
- [x] Multi-term navigation routing, audio priority resolver, and 100% offline asset bundle architecture.
- [ ] Package app as an **Android Standalone APK** optimized for Android Smartboards.
- [ ] Produce User Manual & Smartboard Installation Guide for School Administrators.
