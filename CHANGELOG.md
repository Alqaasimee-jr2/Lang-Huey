# Lang Huey - Project Changelog & Decision Log

All notable decisions, architectural thoughts, rationale, and project actions are recorded in this log.

---

## [Unreleased] - 2026-08-22

### Project Kickoff & Conceptualization
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
