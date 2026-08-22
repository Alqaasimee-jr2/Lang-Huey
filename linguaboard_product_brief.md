# LinguaBoard — Master Product Brief
**Version:** 1.0  
**Date:** August 2025  
**Author:** Abdullah Qaasim  
**Status:** Pre-build — Validation Phase

---

## 1. The Origin

LinguaBoard was not designed in a boardroom. It was built because a real school in Lagos had a real problem — no French teacher. The founder's mother runs a private secondary school. She had been spending money on virtual classes that depended on unstable internet, lacked control, and could not be tied to the Nigerian curriculum in any structured way.

The solution was obvious in retrospect: an offline, curriculum-aligned, one-time software system that runs directly on the school's smartboard — no teacher needed, no internet required, no recurring cost.

That is LinguaBoard.

---

## 2. What LinguaBoard Is

LinguaBoard is an **offline language lesson delivery system** built exclusively for Nigerian secondary school smartboards.

It is not a mobile app. It is not a web platform. It is not a subscription service. It is not built for individual learners.

It is a **classroom tool** — one app, one class level, one language — that allows any staff member to run a complete, structured, government-aligned language lesson on a smartboard without speaking a word of the target language themselves.

---

## 3. The Problem It Solves

### 3.1 The Teacher Gap
Qualified French teachers are scarce in Nigerian private secondary schools. Schools that offer French on their timetable frequently cannot staff it. The consequence:
- Classes run irregularly or not at all
- Schools hire unqualified stand-ins
- Schools pay for expensive virtual lessons with unreliable internet dependency
- Students fall behind on a WAEC-examined subject

### 3.2 The Technology Gap
Most edtech solutions targeting this problem are:
- Mobile-first or browser-based (require internet)
- Built for individual learners, not classroom delivery
- Foreign-built and not aligned to Nigerian curriculum
- Subscription-based (unsustainable for Nigerian school budgets)
- Designed assuming a specialist teacher operates them

### 3.3 The Smartboard Problem
Many Nigerian private secondary schools have invested in Android smartboards. These boards sit underused during language periods because there is no software designed specifically for them in a classroom-delivery context.

LinguaBoard turns that idle hardware into a functioning language classroom.

---

## 4. The Solution — Product Architecture

### 4.1 Core Concept
One installer per class level. One language per pack. One-time payment per license. Hardware-locked to the school's board device.

```
LinguaBoard Shell (installed once, class-level specific)
    └── Language Pack (encrypted .linguapack file)
            └── Lessons, audio, images, curriculum structure
```

### 4.2 Primary Platform
**Android** — targeting Android-based smartboards (most common in Nigerian private secondary schools at the accessible price point).

Built in **Flutter/Dart** — cross-platform, offline-first by design, single codebase.

### 4.3 Screens (MVP)
Three screens only:

1. **Lesson Select Screen** — Teacher selects term and lesson from a structured list
2. **Lesson Player Screen** — Core of the product. Displays vocabulary item, image, audio playback, translation, and teacher cue text. Teacher control bar at bottom: Back / Play Audio / Repeat / Next
3. **Lesson Summary Screen** — End of lesson recap. Words covered, time spent, lesson complete marker

### 4.4 Lesson Player — The Key Innovation
The Lesson Player contains a **Teacher Cue Bar** — a line of text at the bottom of every screen that scripts what the supervising staff member should say or do next.

Example:
> *"Play the audio twice. Ask the class to repeat 'la pomme' after each play."*

This single feature is what makes LinguaBoard operable by any staff member regardless of French knowledge. It is the core product innovation — not the content, not the gamification, not the UI. The teacher cue system is what no competitor offers.

---

## 5. Language Packs

### 5.1 Launch Pack — French (JSS1)
- Aligned to NERDC/WAEC JSS1 French scheme of work
- 3 terms, approximately 8 lessons per term = 24 lessons minimum
- Each lesson: 8–10 vocabulary items with audio, image, translation, teacher cue
- End-of-lesson check questions (multiple choice, touch-to-answer on board)
- Audio recorded by founder (basic French, Grade 1 level)

### 5.2 Expansion Packs (Post-Validation)
- JSS2 French
- JSS3 French
- SS1–SS3 French
- Chinese (Mandarin) — JSS1 first
- Spanish — JSS1 first

Each expansion pack follows identical structure. Same shell, new encrypted pack file.

---

## 6. Licensing & Distribution Model

### 6.1 Purchase Flow
```
School visits linguaboard.com.ng
        ↓
Selects class level product (e.g. JSS1 French)
        ↓
Pays via Paystack (Naira, one-time)
        ↓
System pulls pre-generated key from pool → delivers key + APK download link
        ↓
School installs APK on smartboard
        ↓
First launch: enter key → hardware ID bound → activated
        ↓
Key consumed from pool — cannot be reused on another device
```

### 6.2 Pricing Structure (Pilot)
| Product | Pilot Price | Standard Price |
|---|---|---|
| JSS1 French | ₦75,000 | ₦120,000 |
| Per additional class level | ₦60,000 | ₦100,000 |
| Annual content update renewal | ₦25,000 | ₦40,000 |

### 6.3 Anti-Piracy Architecture
- APK is class-level specific — cracking JSS1 exposes nothing about JSS2 or other packs
- Content stored as AES-256 encrypted `.linguapack` file — worthless without key
- Key is hardware-bound on first activation — same key fails on second device
- Annual content renewal creates ongoing revenue even from existing customers

---

## 7. Target Market

### 7.1 Primary Buyer
**Private secondary school proprietors and principals in Lagos, Nigeria.**

Specifically:
- Schools with Android smartboards already installed
- Schools currently unable to staff French classes
- Schools charging parents premium fees and needing curriculum credibility
- International and British curriculum schools with French on timetable

### 7.2 Secondary Market (Post-Pilot)
- Private secondary schools across other Nigerian states
- Federal and state government schools (different sales approach — longer cycle)
- Nigerian diaspora private schools in UK, US, Canada with Nigerian curriculum

### 7.3 Decision Maker
The **proprietor** (school owner) or **principal** — not IT staff, not the French department. This is a budget and operations decision, made at the top. All marketing and sales communication targets this person.

---

## 8. Competitive Landscape

| Competitor | Type | Gap They Leave |
|---|---|---|
| Duolingo / Babbel | Mobile, internet, individual | No classroom delivery, no offline, no Nigerian curriculum |
| Sanako Study | Windows, classroom | No gamification, clinical UX, expensive, no Nigeria-specific content |
| Oréll Language Lab | Windows/offline | English-focused, teacher-operated but not teacher-scripted, not Nigerian-curriculum-aligned |
| Virtual French tutors | Internet-dependent | Expensive, unreliable, no control |

**LinguaBoard's unoccupied position:** Offline + Android smartboard + classroom delivery + Nigerian curriculum + teacher-scripted UX + one-time payment.

No direct competitor occupies all five of these simultaneously.

---

## 9. Moat — What Makes This Hard to Copy Overnight

1. **Nigerian curriculum mapping** — JSS1–SS3 NERDC/WAEC French scheme of work, lesson by lesson. No foreign competitor will ever build this. It takes time, local knowledge, and deliberate effort.

2. **Teacher cue scripting system** — The UX innovation of scripting the non-specialist teacher is not patentable but is invisible to a competitor until they see it in use. By then you have installed relationships.

3. **School relationship lock-in** — Once a school trains its staff on LinguaBoard and builds French timetabling around it, switching cost is high. The first 10 schools are your fortress.

4. **Hardware-bound content encryption** — Technical barrier against redistribution. The installer shared on WhatsApp is still useless without a valid hardware-bound key.

5. **Origin story** — Built by a Nigerian founder for his mother's school. That story resonates in every school visit and cannot be replicated by a foreign product or a corporate edtech team.

---

## 10. Build Roadmap

### Phase 0 — Validation (Now)
- Prelaunch landing page live
- Video ad produced
- School visits begin — target 5 schools in Lagos
- Goal: 2 deposit commitments before writing a line of app code

### Phase 1 — MVP Build (Post-Validation Signal)
- Flutter Android app scaffold
- Lesson Player with 8 lessons, JSS1 French Term 1
- Audio recorded by founder
- License key activation on first launch
- Hardware ID binding
- Basic lesson summary screen
- Target: working APK installable on a smartboard

### Phase 2 — Pilot (Weeks 9–12 from build start)
- Install in 2 pilot schools (one free, one at ₦37,500 — 50% pilot)
- Observe real class usage
- Fix critical issues
- Collect video testimonial
- Complete Terms 2 and 3 content

### Phase 3 — Launch
- Full JSS1 French pack (3 terms, 24 lessons)
- Sales website with Paystack live
- Direct school sales: 5 visits per week in Lagos
- Target: 10 paying schools in Month 1 post-launch
- Revenue target: ₦750,000 from first 10 schools

### Phase 4 — Expansion
- JSS2 and JSS3 French packs
- Chinese JSS1 pack (hire Mandarin voice artist)
- Approach Lagos State Ministry of Education for bulk licensing conversation

---

## 11. Success Metrics

| Metric | Target |
|---|---|
| Waitlist signups (prelaunch) | 50 schools |
| Deposit commitments before build | 2 |
| Pilot schools | 2 |
| Paying schools at launch | 10 |
| Revenue — Month 1 post-launch | ₦750,000 |
| Revenue — Month 6 | ₦3,000,000+ |
| Net Promoter Score from pilot schools | 8/10 minimum |

---

## 12. What This Is Not

- Not a gamified student app
- Not a subscription platform
- Not built for mobile phones or tablets
- Not dependent on internet at any point after installation
- Not a general language learning tool — it is a classroom delivery system
- Not competing with Duolingo — it is solving a fundamentally different problem for a fundamentally different buyer

---

*This document is the single source of truth for the LinguaBoard product. All design, development, marketing, and sales decisions flow from this brief.*

*Last updated: August 2025*
