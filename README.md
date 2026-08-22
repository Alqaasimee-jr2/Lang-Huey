<div align="center">

# 🇳🇬 Lang Huey

**The Offline Foreign Language Classroom Delivery Engine for Nigerian Smartboards**

[![React](https://img.shields.io/badge/React-18.2-0D7377?style=for-the-badge&logo=react&logoColor=14BDCC)](https://react.dev)
[![Vite](https://img.shields.io/badge/Vite-5.0-F4A832?style=for-the-badge&logo=vite&logoColor=1C1C1C)](https://vitejs.dev)
[![Live Web App](https://img.shields.io/badge/Live_Site-lang--huey.vercel.app-14BDCC?style=for-the-badge&logo=vercel&logoColor=white)](https://lang-huey.vercel.app)
[![Target Platform](https://img.shields.io/badge/Target_Platform-Android_Smartboards-0D7377?style=for-the-badge&logo=android&logoColor=white)](#)
[![Curriculum](https://img.shields.io/badge/Curriculum-NERDC_Aligned-0D7377?style=for-the-badge)](#)
[![Status](https://img.shields.io/badge/Status-Prelaunch_&_Ideation-F4A832?style=for-the-badge)](#)

<p align="center">
  <a href="https://lang-huey.vercel.app" target="_blank">🌐 Live Prelaunch Website</a> &bull;
  <a href="#-about-lang-huey">About</a> &bull;
  <a href="#-the-core-innovation">Core Innovation</a> &bull;
  <a href="#-brand-system">Brand System</a> &bull;
  <a href="#-curriculum-scope">Curriculum Scope</a> &bull;
  <a href="#-getting-started">Getting Started</a> &bull;
  <a href="#-roadmap">Roadmap</a>
</p>

---

</div>

## 📖 The Origin Story

> *"My mother runs a private school in Lagos. She couldn't find a French teacher. So I built one."*  
> &mdash; **NIT7ER, Creator of Lang Huey**

Across Nigeria, qualified foreign language teachers (French, Mandarin Chinese, Spanish) are scarce and expensive. Private secondary schools face constant teacher turnover, irregular timetable slots, and unreliable live virtual classes that fail due to unstable internet.

**Lang Huey** turns underused Android Smartboards into fully functioning language classrooms. It enables **any staff member** — regardless of prior foreign language knowledge — to deliver structured, Ministry of Education (NERDC) aligned language lessons **100% offline**.


---

## ✨ The Core Product Innovation: The Teacher Cue Bar

The heart of Lang Huey is the **On-Screen Teacher Cue Bar** located at the bottom of every lesson slide.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│                            🇫🇷  Bonjour !                                    │
│                         Hello / Good morning                                │
│                                                                             │
├─────────────────────────────────────────────────────────────────────────────┤
│ 💡 TEACHER CUE: Play audio twice. Ask class to repeat "Bonjour" after each. │
└─────────────────────────────────────────────────────────────────────────────┘
```

It scripts exact step-by-step instructions in Standard English (*"Ask Student A to touch 'l'école' on the board"*, *"Play pronunciation audio 2x"*), transforming supervising staff into confident classroom facilitators.

---

## 🎨 Official Brand System (v1.0)

Lang Huey follows a strict, highly aesthetic design architecture engineered for back-of-the-classroom visibility and ultra-fast web conversion:

| Element | Specification | Hex / Token | Usage |
| :--- | :--- | :--- | :--- |
| **Primary** | Deep Teal | `#0D7377` | Dark decision sections, Hero, Navbar, Footer |
| **Secondary** | Turquoise | `#14BDCC` | Icons, highlights, frames, subheadings |
| **Base** | Warm Cream | `#F5F0E8` | Content sections, cards, page background |
| **Accent** | Amber Gold | `#F4A832` | **The Gold Rule**: Touches ONE CTA button per screen max |
| **Text** | Charcoal | `#1C1C1C` | Body copy, dark UI text |
| **Surface** | White | `#FFFFFF` | Container cards, modals, interactive widgets |

### ⚡ Brand Voice
- **Direct**: Short sentences, active voice, zero jargon (*"No French teacher? No problem."*)
- **Confident**: State facts, never hedge (*"Your French class runs today."*)
- **Human**: The founder story is always present (*"Built by a Nigerian, for Nigerian schools."*)
- **Specific**: Numbers over abstractions (*"JSS1. Term 1. Lesson 1. Press play."*)

---

## 📚 NERDC Curriculum Scope (JSS1 French — Term 1)

Every lesson in Lang Huey is mapped directly to the Nigerian Educational Research & Development Council syllabus:

- 🇳🇬 **Week 1–2**: Greetings & Self-Introduction (*Salutations et Présentation*)
- 🇳🇬 **Week 3–4**: School Environment & Classroom Objects (*L'école et les objets*)
- 🇳🇬 **Week 5–6**: Numbers 1–100 & Age (*Les Nombres et l'Âge*)
- 🇳🇬 **Week 7–8**: Family & Home Life (*La Famille*)

---

## 📁 Repository Structure

```
Lang Huey/
├── README.md                           # 🌟 Glamorous repository documentation
├── CHANGELOG.md                        # Master decision & action log
├── MILESTONES.md                       # Project roadmap & milestone tracking
├── .gitignore                          # Git exclusions (node_modules, build outputs)
├── linguaboard_landing_page_brief.md   # Landing page master brief
├── linguaboard_product_brief.md        # Master product brief
├── linguaboard_strategic_insight.md    # Strategic insights brief
└── website/                            # 🚀 React 18 + Vite Prelaunch Website
    ├── index.html                      # Single Page Application entry point
    ├── lang-huey-executive-brief.html  # Printable Board Executive Brief (PDF View)
    ├── package.json                    # Dependencies & scripts
    ├── vite.config.js                  # Vite bundler configuration
    └── src/
        ├── App.jsx                     # Master React layout container
        ├── main.jsx                    # React 18 root renderer
        ├── components/                 # Modular JSX UI Components
        │   ├── Navbar.jsx              # Brand header & Gold CTA
        │   ├── Hero.jsx                # Headline & Animated Video Showcase
        │   ├── LanguageTicker.jsx      # Supported language flags ribbon
        │   ├── RealitySection.jsx      # Pain cards (No Teacher, Budget Drain, Exams)
        │   ├── SolutionSection.jsx     # Teacher Cue Bar demonstration
        │   ├── FeaturesSection.jsx     # 3 Core Pillars + NERDC Snippet Card
        │   ├── PrelaunchCommunityForm.jsx # Smartboard qualification filter form
        │   ├── FounderNote.jsx         # Abdullah's quote
        │   ├── WaveBanner.jsx          # Deep Teal wave CTA banner
        │   ├── Footer.jsx              # Near-black footer & WhatsApp link
        │   └── PostSignupModal.jsx     # Institutional Guarantee & WhatsApp redirect modal
        └── css/
            └── style.css               # Brand Guidelines v1.0 CSS & animations
```

---

## 🛠️ Local Development Setup

To run the prelaunch website locally on your machine:

```bash
# 1. Clone the repository
git clone https://github.com/Alqaasimee-jr2/Lang-Huey.git

# 2. Navigate to the website folder
cd Lang-Huey/website

# 3. Install dependencies
npm install

# 4. Start local Vite dev server
npm run dev
```

The site will be live at `http://localhost:3000`.

To build static production assets:
```bash
npm run build
```

---

## 🎯 Project Roadmap

- [x] **Milestone 0 (Phase 0)**: Master Specification, Brand Guidelines v1.0, and Prelaunch Website (`langhuey.com.ng`) with WhatsApp Community Channel Funnel.
- [ ] **Milestone 1 (MVP)**: Lang Huey 3-Screen Smartboard App Engine (Lesson Select, Player with Teacher Cue Bar, Summary Screen).
- [ ] **Milestone 2 (Content Package)**: Full JSS1 French 3-Term Content Package (24 lessons with local audio recordings).
- [ ] **Milestone 3 (Expansion)**: Mandarin Chinese JSS1 Pack & Android APK Hardware Key Encryption Engine.

---

<div align="center">

### 💬 Join the Lang Huey Founding Community

Are you a private school proprietor, principal, or administrator in Nigeria?  
Connect directly with Abdullah on WhatsApp to shape the product:

[**Join Lang Huey WhatsApp Channel &rarr;**](https://chat.whatsapp.com/sample-channel-invite)

*Lang Huey is not affiliated with any foreign edtech platform. &copy; 2026 Lang Huey.*

</div>
