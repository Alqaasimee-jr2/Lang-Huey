# Lang Huey — Master Product Brief
**Version:** 1.0
**Date:** August 2025
**Founder:** Abdullah Qaasim
**Status:** Validation Phase → MVP Build

---

## 1. The Name

**Lang Huey.**

Short. Memorable. Carries "Lang" — language. "Huey" — a name, a character, something with personality. Not corporate. Not generic. Not forgettable. The kind of name a school proprietor says once and remembers.

---

## 2. The Origin

Lang Huey was not designed in a boardroom.

The founder's mother runs a private secondary school in Lagos. She had no French teacher. Virtual classes were expensive, internet-dependent, and impossible to control. The curriculum was falling behind. Students were losing WAEC preparation time.

Her son built the solution.

Offline. Structured. One-time payment. Runs on the smartboard already on the wall. Any staff member operates it. No French knowledge required.

That school was the first user. Every Nigerian school with the same problem is the market.

---

## 3. What Lang Huey Is

Lang Huey is an **offline language lesson delivery system** built exclusively for Nigerian secondary school smartboards.

It is not a mobile app.
It is not a web platform.
It is not built for individual learners.
It is not a subscription service.

It is a **classroom tool** — installed on the Android smartboard PC, operated by any supervising staff member, delivering complete structured language lessons to an entire class without requiring a specialist teacher in the room.

---

## 4. The Problem

### 4.1 The Teacher Gap
Qualified French teachers are scarce across Nigerian private secondary schools. Schools that list French on their timetable frequently cannot staff it. The consequence:
- Classes run irregularly or not at all
- Schools hire unqualified substitutes
- Schools pay ₦60,000–₦120,000/month for virtual classes that drop due to NEPA
- Students fall behind on a WAEC-examined subject
- Proprietors cannot justify French fees to parents

### 4.2 The Technology Gap
All existing edtech solutions targeting this problem are:
- Mobile or browser-based — require internet
- Built for individual learners, not classroom delivery
- Foreign-built, not aligned to Nigerian curriculum
- Subscription-based — unsustainable for Nigerian school cashflow
- Designed assuming a specialist teacher operates them

### 4.3 The Smartboard Problem
Millions of naira worth of Android smartboards sit in Nigerian private school classrooms. During language periods, these boards display YouTube videos at best and remain blank at worst. No software exists that turns them into a functioning language classroom.

Lang Huey fixes that.

---

## 5. The Solution

### One sentence:
**Lang Huey runs a complete, curriculum-aligned French lesson on your smartboard — any staff member operates it, no internet required, one-time payment.**

### How it works:
1. Staff member opens Lang Huey on the smartboard
2. Selects the term and lesson
3. The app runs the lesson — vocabulary, audio, images, class exercises
4. A teacher cue bar at the bottom of every screen tells the staff member exactly what to say and do next
5. The class participates with the board
6. Lesson ends with a summary of what was covered

The staff member does not need to speak French. The app speaks French for them.

---

## 6. The Core Innovation — Teacher Cue System

Every screen in Lang Huey contains a **Teacher Cue Bar** — a strip of text at the bottom of the display that scripts the supervising staff member in plain English.

Examples:
> *"Play the audio twice. Ask the class to repeat 'Bonjour' after each play."*
> *"Ask a student to come up and tap the correct answer on the board."*
> *"Tell the class we are moving to numbers. Ask if anyone already knows how to count in French."*

This is the product's core innovation. No competitor offers it. It is the single feature that makes Lang Huey operable by a non-specialist and it is the reason schools will pay for it over any alternative.

---

## 7. Product Architecture

### 7.1 Platform
**Android APK** — targeting Android-based smartboards.
Built in **Flutter / Dart** — offline-first, single codebase, path to Windows later.

### 7.2 Screens (MVP)
```
Splash Screen
      ↓
Intro / Onboarding (2 slides)
      ↓
Main Menu — Lesson Select
      ↓
Lesson Player — Vocabulary Items
      ↓
Lesson Player — Check Question
      ↓
Lesson Summary
```

### 7.3 Content Structure
```
Lang Huey App
    └── JSS1 French Pack
            ├── Term 1 (8 lessons — MVP)
            ├── Term 2 (8 lessons — post-pilot)
            └── Term 3 (8 lessons — post-pilot)
```

### 7.4 Content Per Lesson
- 8–12 vocabulary items (word + translation + image + audio + teacher cue)
- 1–2 check questions (multiple choice, touch-to-answer on board)
- Teacher intro cue (what to say before the lesson starts)
- Lesson summary data (words covered, questions answered)

---

## 8. Language Packs — Roadmap

| Pack | Status | Timeline |
|---|---|---|
| JSS1 French — Term 1 | MVP | Now |
| JSS1 French — Terms 2 & 3 | Post-pilot | Month 3 |
| JSS2 French | Post-validation | Month 6 |
| JSS3 French | Growth | Month 9 |
| JSS1 Chinese (Mandarin) | Growth | Month 12 |
| SS1–SS3 French | Scale | Year 2 |

Same app shell. New content per pack. Zero rebuild per language.

---

## 9. Licensing & Pricing

### Model
One-time payment per class level. Hardware-bound license. No subscriptions. No renewals unless the school wants updated content.

### Pricing (Pilot)
| Product | Pilot Price | Standard |
|---|---|---|
| JSS1 French — Full Session | ₦75,000 | ₦120,000 |
| Additional class level | ₦60,000 | ₦100,000 |
| Annual content update | ₦25,000 | ₦40,000 |

### Distribution
School pays via Paystack on lang-huey.com.ng → receives APK download link + license key → installs on smartboard → activates.

---

## 10. Target Market

### Primary Buyer
Private secondary school proprietors and principals in Lagos, Nigeria — specifically those with Android smartboards and no qualified French teacher.

### Decision Maker
The **proprietor** (school owner). Budget authority sits here. All marketing speaks to this person.

### Market Size Signal
- 15,000+ private secondary schools in Nigeria
- Lagos alone: 3,000+ private secondary schools
- Conservative estimate: 30% have smartboards = 900 schools in Lagos
- Conservative conversion: 5% in Year 1 = 45 schools
- 45 × ₦75,000 = ₦3,375,000 Year 1 from Lagos alone

---

## 11. Competitive Position

| | Duolingo/Babbel | Sanako/Oréll | Lang Huey |
|---|---|---|---|
| Offline | ✗ | ✓ | ✓ |
| Android smartboard | ✗ | ✗ | ✓ |
| Classroom delivery | ✗ | ✓ | ✓ |
| Teacher cue system | ✗ | ✗ | ✓ |
| Nigerian curriculum | ✗ | ✗ | ✓ |
| One-time payment | ✗ | ✗ | ✓ |
| Nigeria pricing | ✗ | ✗ | ✓ |

**Lang Huey occupies an uncontested position.** No competitor checks all six boxes.

---

## 12. Moat

1. **Nigerian curriculum mapping** — NERDC/WAEC JSS1–SS3 French, lesson by lesson. No foreign competitor builds this.
2. **Teacher cue system** — invisible to competitors until they see it deployed. By then, schools are locked in.
3. **School relationship depth** — once installed and timetabled, switching cost is high.
4. **Hardware-bound licensing** — technical barrier against redistribution.
5. **Origin story** — built by a Nigerian, for a Nigerian school. Cannot be replicated by a foreign company.

---

## 13. Success Metrics

| Metric | Target |
|---|---|
| Waitlist signups (prelaunch) | 50 schools |
| Deposit commitments pre-build | 2 |
| Pilot schools | 2 |
| Paying schools at launch | 10 |
| Revenue Month 1 post-launch | ₦750,000 |
| Revenue Month 6 | ₦3,000,000+ |

---

*This is the master source of truth for Lang Huey. All decisions flow from this document.*
*Last updated: August 2025*
