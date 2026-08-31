# Lang Huey - Project Changelog & Decision Log

All notable decisions, architectural thoughts, rationale, and project actions are recorded in this log.

---

### JSS 3 French Term 1 (Premier Trimestre) Full Build & Delivery (`JSS 3_FRENCH`)
- **Scope & Strict Policy Alignment (Instructional Classes & Revision Only)**:
  - Harmonized the Nigerian NERDC JSS3 Term 1 curriculum into **9 High-Impact Instructional & Revision Weeks** (omitting Week 5 Midterm Exam and Week 7 Midterm Break in accordance with project directive):
    1. **Week 1 (Unité 1)**: *Décrire plus précisément une personne* (Physical & moral personality descriptions, advanced qualifying adjectives, agreements, and BANGS position rule: Beauty, Age, Goodness, Size before noun vs others after).
    2. **Week 2 (Unité 2)**: *Décrire un paysage et des lieux touristiques* (Natural landscapes & landmarks in Nigeria [Zuma Rock, Obudu, Yankari] and Francophone lands [Tour Eiffel, Yamoussoukro, Pendjari], landscape adjectives *verdoyant, montagneux, aride, majestueux*, and *visiter* [places] vs *rendre visite à* [people] rule).
    3. **Week 3 (Unité 3)**: *Expliquer ses habitudes et sa routine* (24h daily habit clock, reflexive verbs *se réveiller, se laver, s'habiller, se coucher*, frequency adverbs gauge: *toujours 100%, souvent 75%, d'habitude 60%, parfois 40%, rarement 15%, ne... jamais 0%*).
    4. **Week 4 (Unité 4)**: *Raconter un souvenir et un événement passé* (Passé Composé vs Imparfait master dual lab, memory triggers *quand j'étais petit, l'année dernière*, and 16 verbs of the Maison d'ÊTRE [DR & MRS VANDERTRAMP] with subject agreement).
    5. **Week 5 (Unité 5)**: *Décrire un objet* (Geometric shapes, colors, materials with preposition *EN* [en bois, en cuir, en fer, en plastique, en verre], utility and purpose formulas *ça sert à + infinitif*).
    6. **Week 6 (Unité 6)**: *Comparer* (Comparative duel arena: superiority *plus... que*, inferiority *moins... que*, equality *aussi... que / autant de... que*, superlatives *le plus / la plus*, and irregular forms *bon ➔ meilleur, bien ➔ mieux*).
    7. **Week 7 (Unité 7)**: *Dater, mesurer le temps et situer dans la durée* (Dates, centuries, historical milestones [1960 African Independence, ECOWAS 1975], and core temporal prepositions: *DEPUIS* [present/ongoing], *PENDANT* [completed duration], *IL Y A* [ago], *DANS* [future]).
    8. **Week 8 (Unité 8)**: *Raconter sa journée : récit chronologique* (Storyline workbench, narrative sequencing, discourse connectors: *d'abord, ensuite, soudain, pendant ce temps, par conséquent, enfin*, and BECE model essay teleprompter).
    9. **Week 9 (Grand Rallye)**: *Grand Bilan & Rallye de Révision du 1er Trimestre* (4-Team live championship quiz arena across all 8 units with scoreboards, buzzer SFX, 12 BECE-style drills, and gold trophy celebration).
- **Curriculum Dataset & Data Models**:
  - Authored `JSS 3_FRENCH/lib/data/jss3_term1_lessons.dart` with all 9 complete weekly lessons (pedagogical objectives, cultural insight notes, rich vocabulary with phonetics & audio keys, multiple-choice classwork exercises with explanations, evaluation questions with hints/answers, structured homework assignments, and comprehensive grammar notes).
  - Defined all 9 Term 1 pattern types in `JSS3PatternType` within `lib/models/jss3_lesson_model.dart`.
- **9 Bespoke Smartboard Interactive Pattern Widgets** (`JSS 3_FRENCH/lib/widgets/patterns/term1/`):
  1. `JSS3PersonDescriptionStudioWidget` (Avatar character studio, physical & moral traits, BANGS rule coach, "Qui est-ce ?" mystery detective game).
  2. `JSS3LandscapesLandmarksStudioWidget` (Dual-world tourist showcase, landscape adjectives lab, interactive postcard generator).
  3. `JSS3HabitsAndRoutineStudioWidget` (24h habit timeline, reflexive verbs conjugation lab, frequency gauge).
  4. `JSS3PastMemoriesStudioWidget` (Time machine memory vault, Passé Composé vs Imparfait battle, Maison d'ÊTRE explorer).
  5. `JSS3ObjectDescriptionStudioWidget` (3D object inspector, preposition EN for materials, utility formula builder, "Objet Mystère" riddle quiz).
  6. `JSS3ComparisonSuperlativesStudioWidget` (Side-by-side comparative duel cards, irregular forms lab, comparison quiz).
  7. `JSS3DatingTimeMeasurementStudioWidget` (Historical timeline, duration prepositions *depuis/pendant/il y a/dans*, temporal drill quiz).
  8. `JSS3DayChronologicalNarrativeStudioWidget` (Chronological narrative steps, discourse connectors toolkit, BECE model essay teleprompter).
  9. `JSS3Term1RevisionRallyWidget` (4-Team championship quiz arena, buzzer SFX, team scoreboards, trophy celebration).
- **Extensive Multimedia Suite**:
  - Synthesized all **72 authentic 44.1kHz MP3 neural audio files** in `JSS 3_FRENCH/assets/audio/jss3_term1/` using **`fr-FR-DeniseNeural`** (-4% classroom rate, 100% strict UTF-8 accent handling).
  - Integrated 5 studio sound effects (`sfx_correct`, `sfx_incorrect`, `sfx_click`, `sfx_celebrate`, `sfx_whoosh`).
- **Screens & Navigation Integration**:
  - `JSS3TermSelectScreen`: Unlocked Term 1 card with 9 weeks count and syllabus topic subtitle.
  - `JSS3WeekRoadmapScreen`: Connected `JSS3Term1Lessons.weeks` for Term 1.
  - `JSS3LessonPlayerScreen`: 5-Phase smartboard lesson player with Teacher Facilitator Cue Bar, audio speed toggle (0.8x/1.0x), and pattern dispatches.
- **Automated Verification & Zero-Defect Testing**:
  - `flutter test test/jss3_french_test.dart`: 10/10 curriculum integrity unit tests passing (100% pass rate).
  - `flutter test test/jss3_widget_fit_test.dart`: 12/12 smartboard 1080p/4K widget fit tests passing (100% pass rate).
  - `flutter analyze`: 0 compilation errors. Total tests passing: **22/22 (100%)**.

---

### JSS 2 French Term 3 (Troisième Trimestre) Full Build & Delivery (`JSS 2_FRENCH`)
- **Scope & Strict Policy Alignment (Instructional Classes & Revision Only)**:
  - Harmonized the Nigerian NERDC JSS2 Term 3 curriculum into **9 High-Impact Instructional & Revision Weeks** (omitting Week 5 Midterm Exam and Week 7 Midterm Break in accordance with project directive):
    1. **Week 1 (Unité 17)**: *Les Opérations de Calcul Simple* (Arithmetic operations: *l'addition, la soustraction, la multiplication, la division, font / égalent*, numbers 1–1000, market calculations).
    2. **Week 2 (Unité 18)**: *La Nourriture et les Boissons* (Daily meals: *petit-déjeuner, déjeuner, dîner*, African & French dishes, *manger/boire* present tense conjugation, expressing preferences).
    3. **Week 3 (Unité 19)**: *Les Recettes de Cuisine* (Culinary imperative commands *épluchez, coupez, faites frire, mélangez*, step sequencing *d'abord, ensuite, enfin*, cooking utensils).
    4. **Week 4 (Unité 20)**: *Au Restaurant / Café* (Reserving a table, interactive menu ordering, requesting the bill *l'addition, s'il vous plaît*, polite conditional *je voudrais*).
    5. **Week 5 (Projet Oral & Écrit)**: *Jeux de Rôle Intégrés* (Multi-turn communicative simulations across 4 real-life scenarios: Transport, Market, Pharmacy, and Restaurant with dual speech bubbles and audio playback).
    6. **Week 6 (Révision Générale Unités 17–20)**: *Exercices de Consolidation* (4-Station review arena: Math Station, Food Flashcard Station, Recipe Sequencing Station, and Restaurant Bill Station).
    7. **Week 7 (Évaluation Orale & Pratique)**: *Conversations Guidées* (Guided speaking dialogues, phonetics liaison clinic, conversational markers, and real-time response branching).
    8. **Week 8 (Préparation aux Examens)**: *Atelier d'Expression Écrite et Orale (BECE Prep)* (Standard WAEC/BECE format: QCM comprehension, error spotting & correction, guided writing, and rapid speed sprint drills).
    9. **Week 9 (Grand Rallye Annuel)**: *Grand Bilan & Championnat JSS 2 de l'Année Complète* (4-Team live championship quiz arena across all 3 terms + interactive JSS 2 French Graduation Ceremony).
- **Curriculum Dataset & Data Models**:
  - Authored `JSS 2_FRENCH/lib/data/jss2_term3_lessons.dart` with all 9 complete weekly lessons (pedagogical objectives, cultural context notes, rich vocabulary with phonetics & audio keys, multiple-choice classwork exercises with explanations, evaluation questions with hints/answers, structured homework assignments, and comprehensive grammar notes).
  - Defined all 9 Term 3 patterns in `JSS2PatternType` within `lib/models/jss2_lesson_model.dart`.
- **9 Bespoke Smartboard Interactive Pattern Widgets** (`JSS 2_FRENCH/lib/widgets/patterns/term3/`):
  1. `JSS2MathCalculationsStudioWidget` (4-Operation kinetic calculator, number sentence speaker, market transaction simulator, arithmetic quiz).
  2. `JSS2FoodAndDrinksStudioWidget` (3-Meal builder, food/drink preference selector, present tense Manger/Boire conjugation drill).
  3. `JSS2CookingRecipesStudioWidget` (Nigerian plantain/jollof vs French omelette/crêpes recipe sequencer, imperative verb lab, utensil organizer).
  4. `JSS2RestaurantCafeStudioWidget` (Table reservation desk, interactive carte & order basket, bill calculator, dialogue builder).
  5. `JSS2IntegratedRolePlayStudioWidget` (4-Scenario roleplay stage: Transport, Market, Pharmacy, Restaurant with dual speaker dialogues).
  6. `JSS2ConsolidationExercisesStudioWidget` (4-Station consolidation workbench covering arithmetic, meals, recipes, and dining).
  7. `JSS2GuidedConversationsStudioWidget` (Oral dialogue prompts, liaison phonetics player, conversational markers coach).
  8. `JSS2ExamPrepStudioWidget` (BECE/WAEC exam studio: QCM test, grammar error spotting, composition writer, speed sprint).
  9. `JSS2GrandRallyStudioWidget` (3-Term 20-unit championship quiz arena with live scoreboards, trophy unlocks, and graduation certificate generator).
- **Extensive Multimedia Suite**:
  - Synthesized all **72 authentic 44.1kHz MP3 neural audio files** in `JSS 2_FRENCH/assets/audio/jss2_term3/` using **`fr-FR-DeniseNeural`** (-4% classroom rate, 100% strict UTF-8 accent handling).
  - Updated `generate_term3_audio.py` pipeline to robustly extract and synthesize complex French strings with quotes and accents.
- **Screens & Navigation Integration**:
  - `JSS2TermSelectScreen`: Unlocked Term 3 card with 9 weeks count and exact syllabus topic subtitle.
  - `JSS2WeekRoadmapScreen`: Connected `JSS2Term3Lessons.weeks` for Term 3.
  - `JSS2LessonPlayerScreen`: Connected all 9 Term 3 interactive widgets into Phase 2.
- **Automated Verification & Zero-Defect Testing**:
  - `flutter test test/jss2_french_test.dart`: 16/16 curriculum integrity unit tests passing (100% pass rate).
  - `flutter test test/jss2_widget_fit_test.dart`: 24/24 smartboard 1080p/4K widget fit tests passing (100% pass rate).
  - `flutter analyze`: 0 errors, 0 compilation blockers.

---

### JSS 2 French Term 2 (Deuxième Trimestre) Full Build & Delivery (`JSS 2_FRENCH`)
- **Scope & Strict Policy Alignment (Instructional Classes & Revision Only)**:
  - Harmonized the Nigerian NERDC JSS2 Term 2 curriculum into **9 High-Impact Instructional & Revision Weeks** (omitting Week 5 Midterm Exam and Week 7 Midterm Break in accordance with project directive):
    1. **Week 1 (Unité 9)**: *Établir des listes/inventaires* (School supply inventories, grocery lists, stock counts, status badges, and quantifiers).
    2. **Week 2 (Unité 10)**: *Les commerçants et marchandises* (Naming shopkeepers: *le boulanger, le boucher, l'épicier, le poissonnier, le libraire*, merchandise packaging formats: *en boîte, en bouteille, en sachet, en vrac*).
    3. **Week 3 (Unité 11)**: *Acheter et marchander* (Market bargaining simulator: asking price *combien coûte / c'est combien*, negotiating discounts *faites-moi un bon prix*, payment methods *en espèces / par carte*).
    4. **Week 4 (Unité 12)**: *Exprimer un besoin et son utilité* (Need and utility studio: *avoir besoin de + nom/verbe, servir à + infinitif, être utile pour*).
    5. **Week 5 (Unité 13)**: *À la pharmacie* (Pharmacy counter: symptoms & ailments *j'ai mal à la tête/gorge/au ventre, j'ai de la fièvre*, remedies & posology *sirop, comprimés, pansements*).
    6. **Week 6 (Unité 14)**: *Les vêtements, chaussures et accessoires* (Wardrobe & styling studio: clothing items, fabric materials with *EN*, motifs & patterns with *À*, sizes *taille / pointure*).
    7. **Week 7 (Unité 15)**: *Apprécier, comparer, choisir* (Side-by-side comparison arena: *plus... que, moins... que, aussi... que*, expressing hesitation and personal choice *je préfère celui-ci / je prends celle-là*).
    8. **Week 8 (Unité 16)**: *Quantité et qualité des produits* (Metric measurement & quality lab: digital scale with kg, g, L, dozens + mandatory *DE / D'* rule after quantity nouns).
    9. **Week 9 (Grand Rallye)**: *Grand Bilan & Rallye de Révision du Deuxième Trimestre* (4-Team live championship quiz arena across all 8 units with scoreboards, buzzer SFX, and trophy podium).
- **Curriculum Dataset & Models**:
  - Authored `JSS 2_FRENCH/lib/data/jss2_term2_lessons.dart` with all 9 complete weekly lessons.
  - Defined all Term 2 pattern types in `JSS2PatternType` within `lib/models/jss2_lesson_model.dart`.
- **9 Bespoke Smartboard Interactive Pattern Widgets** (`JSS 2_FRENCH/lib/widgets/patterns/term2/`):
  1. `JSS2ListAndInventoryStudioWidget` (Interactive checklist, stock counter, supply category filter).
  2. `JSS2MerchantsAndGoodsStudioWidget` (Shopkeeper storefronts, packaging format selector, live phrase generator).
  3. `JSS2ShoppingAndBargainingStudioWidget` (Live market price counter-offer simulator, merchant reaction engine, checkout wallet).
  4. `JSS2NeedsAndUtilityStudioWidget` (Interactive school/home tool selector, purpose sentence synthesizer, utility rules).
  5. `JSS2PharmacyAndHealthStudioWidget` (Doctor/pharmacist consultation desk, symptom selector, medicine dosage posology cards).
  6. `JSS2WardrobeAndStyleStudioWidget` (Virtual mannequin styling station, material *EN* vs motif *À* chips, size pickers).
  7. `JSS2ComparisonAndChoiceStudioWidget` (Side-by-side comparative product cards with VS badge, comparative synthesis box).
  8. `JSS2ProductQuantityQualityStudioWidget` (Digital electronic scale simulation, metric weights, *DE/D'* grammar rule box).
  9. `JSS2Term2RevisionRallyWidget` (4-Team live championship quiz arena with live scoreboards, question reveals, and podium celebration).
- **Extensive Multimedia Suite**:
  - Synthesized all **85 authentic 44.1kHz MP3 neural audio files** in `JSS 2_FRENCH/assets/audio/jss2_term2/` using **`fr-FR-DeniseNeural`** (-4% classroom rate).
  - Generated educational visual artwork for market & commerce in `JSS 2_FRENCH/assets/images/jss2_term2/`.
- **Screens & Navigation Integration**:
  - `JSS2TermSelectScreen`: Unlocked Term 2 card with 9 weeks count and exact syllabus topic subtitle.
  - `JSS2WeekRoadmapScreen`: Connected `JSS2Term2Lessons.weeks` for Term 2.
  - `JSS2LessonPlayerScreen`: Connected all 9 Term 2 interactive widgets into Phase 2.
- **Automated Verification**:
  - `flutter test`: 25/25 unit and smartboard fit tests passing (100% pass rate).
  - `flutter analyze`: 0 errors, 0 warnings.

### JSS2 French Term 1 (Premier Trimestre) Full Build & Delivery (`JSS 2_FRENCH`)
- **Scope & Strict Policy Alignment (Instructional Classes & Revision Only)**:
  - Harmonized the Nigerian NERDC JSS2 Term 1 curriculum into **9 High-Impact Instructional & Revision Weeks** (omitting Week 5 Midterm Exam and Week 7 Midterm Break in accordance with project directive):
    1. **Week 1 (Unité 1)**: *Demander et expliquer la position* (Spatial prepositions *sur, sous, devant, derrière, dans, entre, à côté de, à gauche/droite*, asking location *Où est / Où se trouve*).
    2. **Week 2 (Unité 2)**: *Situer les lieux* (Neighborhood & public buildings *la poste, la banque, l'hôpital, l'école, le marché, la pharmacie, le commissariat, la gare*, distance & proximity gauge *près de, loin de, en face de*, contraction rules *de + le = du*).
    3. **Week 3 (Unité 3)**: *Accueillir et guider quelqu'un* (Indoor reception, multi-floor building floorplan *RDC, 1er, 2e étage*, welcoming visitors *Bienvenue ! Entrez, je vous en prie. Suivez-moi*, room locator *au bout du couloir à droite, première porte à gauche*).
    4. **Week 4 (Unité 4)**: *Demander et indiquer le chemin* (Outdoor wayfinding & city street navigation *Continuez tout droit, tournez à gauche au carrefour, prenez la 2e rue, traversez le pont, au rond-point prenez la sortie*, time estimation *à 5 minutes à pied*).
    5. **Week 5 (Unité 5)**: *Les moyens de transport* (Land, air, water, and active transit modes + interactive EN vs À grammar rule lab: *EN* for closed vehicles vs *À* for open/active transit).
    6. **Week 6 (Unité 6)**: *Expliquer un trajet* (Public transit routes, Metro / BRT lines, transfers *changer à la station*, stop counts, journey timing, ticket validator simulation).
    7. **Week 7 (Unité 7)**: *Demander et indiquer des horaires* (Electronic departures & arrivals monitor, 24-hour vs spoken time decoding, platform gates *quai / porte*, transit frequency).
    8. **Week 8 (Unité 8)**: *Réagir à un problème de transport* (Transit trouble desk & assistance clinic: delays, missed connections, cancelled flights, lost luggage, customer service claim dialogs).
    9. **Week 9 (Grand Rallye)**: *Grand Bilan & Rallye de Révision du Premier Trimestre* (4-Team live championship quiz arena across all 8 units with scoreboards, buzzer SFX, and trophy podium).
- **Curriculum Dataset & Data Models**:
  - Authored `JSS 2_FRENCH/lib/data/jss2_term1_lessons.dart` with all 9 complete weekly lessons (objectives, cultural insights, vocabulary with phonetic transcriptions & audio keys, classwork exercises, evaluation Q&A, homework, and in-depth grammar notes).
  - Defined `JSS2PatternType` enum and lesson data models in `lib/models/jss2_lesson_model.dart`.
- **9 Bespoke Smartboard Interactive Pattern Widgets** (`JSS 2_FRENCH/lib/widgets/patterns/term1/`):
  1. `JSS2SpatialPositionStudioWidget` (3D moveable object positioning stage, spatial prepositions, sentence generator, position quiz).
  2. `JSS2LocatingPlacesStudioWidget` (Interactive town map, landmark node locator, distance calculator, contraction coach).
  3. `JSS2IndoorWelcomingGuidingStudioWidget` (Multi-floor school floorplan navigator, floor selector RDC/1er/2e, receptionist welcome simulator).
  4. `JSS2DirectionsAndWayfindingStudioWidget` (Turn-by-turn wayfinding simulator, compass rose, GPS route builder, distance & time estimator).
  5. `JSS2TransportModesStudioWidget` (4-Category vehicle garage + EN vs À sorting lab with instant validation).
  6. `JSS2PublicTransitRouteStudioWidget` (3-Line transit network planner, line transfer calculator, ticket turnstile validator).
  7. `JSS2SchedulesAndTimetablesStudioWidget` (Electronic departures board, 24h & spoken time decoder, platform gate indicator, frequency calculator).
  8. `JSS2TransportTroubleshootingStudioWidget` (4 Crisis scenarios: delayed train, cancelled flight, missed bus, lost baggage + claim dialogs).
  9. `JSS2Term1RevisionRallyWidget` (4-Team live buzzer championship quiz arena with live scoreboards, question reveals, and podium celebration).
- **Extensive Multimedia Suite (Audio & Gemini Visuals)**:
  - Synthesized all **84 authentic 44.1kHz MP3 neural audio files** in `JSS 2_FRENCH/assets/audio/jss2_term1/` using **`fr-FR-DeniseNeural`** (-4% classroom rate, 100% strict UTF-8 accent handling).
  - Integrated 5 studio sound effects (`sfx_correct`, `sfx_incorrect`, `sfx_click`, `sfx_celebrate`, `sfx_whoosh`).
  - Generated educational visual artwork for spatial positions in `JSS 2_FRENCH/assets/images/jss2_term1/`.
- **Screens & Navigation Integration**:
  - `JSS2TermSelectScreen`: Unlocked Term 1 card with 9 weeks count and exact syllabus topic subtitle.
  - `JSS2WeekRoadmapScreen`: Connected `JSS2Term1Lessons.weeks` for Term 1.
  - `JSS2LessonPlayerScreen`: 5-Phase lesson player (Objectives & Facilitator Cue Bar, Interactive Pattern Lab, Vocab Lab with 0.8x/1.0x speed toggle, Classwork & Evaluation, Summary & Homework).
- **Comprehensive Walkthrough & Pedagogical Flow**:
  - **Phase 1: Objectifs & Repères**: Step-by-step Teacher Facilitator Cue Bar in Standard English, 4 pedagogical goals, Nigerian & Francophone cultural insights.
  - **Phase 2: Lab Interactif**: Dispatches one of the 9 custom kinetic pattern widgets with responsive tactile touch mechanics.
  - **Phase 3: Vocabulaire & Phonétique**: Interactive 2-column vocabulary grid with phonetic guides, usage notes, and one-touch neural audio playback.
  - **Phase 4: Exercices & Évaluation**: Dual sub-tab interface featuring interactive multiple-choice drills with instant validation + 3 evaluation Q&A with revealable hints and answers.
  - **Phase 5: Résumé & Devoirs**: Comprehensive grammar note with contraction rules (*de + le = du*) and structured homework assignment with model responses.
- **Verification Procedures & Test Protocol**:
  - *Automated Schema Tests*: `flutter test test/jss2_french_test.dart` (validating 9 lessons, 4+ objectives, vocabulary audio keys, and grammar notes).
  - *Smartboard 1080p/4K UI Tests*: `flutter test test/jss2_widget_fit_test.dart` (simulating 1920x1080 smartboard canvas, phase transitions, and interactive touch controls).
  - *Static Analysis*: `flutter analyze` (verifying 0 errors and zero warnings).
- **Verified Automated Test Results (18/18 Tests Passed — 100% Pass Rate)**:
  1. `jss2_french_test.dart`: Term 1 contains exactly 9 lessons (8 instructional + 1 revision rally) — **PASSED** ✅
  2. `jss2_french_test.dart`: Every lesson has $\ge 4$ objectives and cultural insight — **PASSED** ✅
  3. `jss2_french_test.dart`: Every lesson has rich vocabulary with phonetics and valid audioKey — **PASSED** ✅
  4. `jss2_french_test.dart`: Every lesson has interactive exercises with valid correctOptionIndex — **PASSED** ✅
  5. `jss2_french_test.dart`: Every lesson has evaluation questions and comprehensive grammar note — **PASSED** ✅
  6. `jss2_french_test.dart`: Pattern types are properly mapped across all 9 weeks — **PASSED** ✅
  7. `jss2_widget_fit_test.dart`: `JSS2TermSelectScreen` renders term cards and header branding — **PASSED** ✅
  8. `jss2_widget_fit_test.dart`: `JSS2WeekRoadmapScreen` renders all 9 week cards for Term 1 — **PASSED** ✅
  9. `jss2_widget_fit_test.dart`: Week 1 `JSS2SpatialPositionStudioWidget` renders correctly — **PASSED** ✅
  10. `jss2_widget_fit_test.dart`: Week 2 `JSS2LocatingPlacesStudioWidget` renders correctly — **PASSED** ✅
  11. `jss2_widget_fit_test.dart`: Week 3 `JSS2IndoorWelcomingGuidingStudioWidget` renders correctly — **PASSED** ✅
  12. `jss2_widget_fit_test.dart`: Week 4 `JSS2DirectionsAndWayfindingStudioWidget` renders correctly — **PASSED** ✅
  13. `jss2_widget_fit_test.dart`: Week 5 `JSS2TransportModesStudioWidget` renders correctly — **PASSED** ✅
  14. `jss2_widget_fit_test.dart`: Week 6 `JSS2PublicTransitRouteStudioWidget` renders correctly — **PASSED** ✅
  15. `jss2_widget_fit_test.dart`: Week 7 `JSS2SchedulesAndTimetablesStudioWidget` renders correctly — **PASSED** ✅
  16. `jss2_widget_fit_test.dart`: Week 8 `JSS2TransportTroubleshootingStudioWidget` renders correctly — **PASSED** ✅
  17. `jss2_widget_fit_test.dart`: Week 9 `JSS2Term1RevisionRallyWidget` renders correctly — **PASSED** ✅
  18. `jss2_widget_fit_test.dart`: `JSS2LessonPlayerScreen` loads and switches phases smoothly — **PASSED** ✅

---

### JSS1 French Term 3 (Troisième Trimestre) Full Build & Delivery
- **Scope & Strict Policy Alignment (Instructional Classes & Revision Only)**:
  - Harmonized the Nigerian NERDC JSS1 Term 3 curriculum into **9 High-Impact Instructional & Revision Weeks** (omitting Week 5 Midterm Exam and Week 7 Midterm Break in accordance with project directive):
    1. **Week 1**: *Demander et indiquer le temps qu’il fait* (Weather expressions, seasons in Nigeria & France, barometer & thermometer studio).
    2. **Week 2**: *Exprimer la fréquence d’une activité* (5-tier frequency gauge: *toujours 100%, souvent 75%, parfois 50%, rarement 20%, ne... jamais 0%*, syntax placement rules).
    3. **Week 3**: *Inviter quelqu’un* (Inviting formulas *Tu veux + infinitif / Ça te dit de...*, accepting *Volontiers / Avec grand plaisir*, polite declining with excuses).
    4. **Week 4**: *Donner un ordre, interdire, autoriser* (Imperative commands, prohibitions *Ne... pas / Il est interdit de / Défense de*, authorizations *Vous pouvez / C'est permis*, campus signage).
    5. **Week 5**: *Demander la permission, conseiller* (Polite permission formulas *Puis-je... ? / Est-ce que je peux... ?*, advice clinic *Tu devrais... / Il faut...*).
    6. **Week 6**: *Expliquer une démarche / donner un itinéraire* (City navigation *Allez tout droit, tournez à droite/gauche, prenez la 2e rue*, landmarks *en face de / à côté de*, procedure sequencing *D'abord, ensuite, puis, enfin*).
    7. **Week 7**: *Révision des fonctions communicatives & jeux de rôles* (4 interactive scenario roleplays: At the market, At the clinic, School reception, Weekend invitation with dual speech bubbles).
    8. **Week 8**: *Atelier d'expression écrite et orale (BECE Prep)* (Guided composition workbench, phonetics & accent dictation clinic, BECE / Junior WAEC exam drills).
    9. **Week 9**: *Grand Bilan Annuel & Remise des Diplômes JSS1* (4-Team All-Year Championship Quiz Rally covering Terms 1, 2, and 3 + Interactive JSS1 French Graduation Diploma Certificate Generator).
- **Curriculum Dataset & Data Models**:
  - Authored `JSS1_FRENCH/lib/data/jss1_term3_lessons.dart` with all 9 complete weekly lessons (objectives, cultural insights, vocabulary with phonetic transcriptions & audio keys, classwork exercises, evaluation Q&A, homework, and in-depth grammar notes).
  - Extended `JSS1PatternType` enum in `lib/models/jss1_lesson_model.dart` with all 9 Term 3 patterns.
- **9 Bespoke Smartboard Interactive Pattern Widgets** (`JSS1_FRENCH/lib/widgets/patterns/term3/`):
  1. `JSS1WeatherAndSeasonsStudioWidget` (Weather barometer, Nigeria vs France seasons explorer, thermometer slider, spoken forecast studio).
  2. `JSS1FrequencyAdverbsStudioWidget` (5-Tier frequency gauge, interactive sentence builder, syntax lab).
  3. `JSS1InvitationsStudioWidget` (3-Way invitation studio: Inviter, Accepter, Refuser poliment, invitation card builder).
  4. `JSS1CommandsAndProhibitionsStudioWidget` (3-Way mode: Ordres, Interdictions, Autorisations, official school signage simulator).
  5. `JSS1PermissionAndAdviceStudioWidget` (Permission & study advice clinic, modal verbs & conditional formulas).
  6. `JSS1DirectionsAndProceduresStudioWidget` (Compass navigator, city landmarks, procedure sequencers).
  7. `JSS1CommunicativeRoleplayStudioWidget` (4 Real-life communicative roleplay sketches with dual speech bubbles & simultaneous audio).
  8. `JSS1WrittenOralWorkshopStudioWidget` (BECE prep station: guided writing workbench, dictation player, QCM test simulator).
  9. `JSS1Term3AnnualGrandRallyWidget` (4-Team live championship rally arena + official JSS1 French Graduation Diploma Certificate Generator).
- **Extensive Multimedia Suite (Audio & Gemini Visuals)**:
  - Synthesized all **72 authentic 44.1kHz MP3 neural audio files** in `JSS1_FRENCH/assets/audio/jss1_term3/` using **`fr-FR-DeniseNeural`** (-4% classroom rate, 100% strict UTF-8 accent handling).
  - Generated **6 rich educational illustrations & smartboard diagrams** via Gemini AI image generation:
    1. `jss1_weather_and_seasons.jpg`: Split smartboard illustration of sunny tropical Nigerian weather vs rainy afternoon.
    2. `jss1_invitations_social.jpg`: Cheerful Nigerian secondary school students exchanging birthday invitation in courtyard.
    3. `jss1_rules_signage.jpg`: School regulations & campus discipline symbols poster.
    4. `jss1_directions_city_map.jpg`: 3D isometric town map with school, hospital, library, post office, crossings, and directional signs.
    5. `jss1_communicative_theatre.jpg`: French drama club sketch stage with students performing dialogue with speech bubbles.
    6. `jss1_graduation_diploma_celebration.jpg`: Grand celebratory graduation podium with students holding golden JSS1 French diplomas.
- **Screens & Navigation Integration**:
  - `JSS1TermSelectScreen`: Unlocked Term 3 card with 9 weeks count and exact syllabus topic subtitle.
  - `JSS1WeekRoadmapScreen`: Connected `JSS1Term3Lessons.weeks` for Term 3 and added `didUpdateWidget` lifecycle handler.
  - `JSS1LessonPlayerScreen`: Dispatched all 9 Term 3 interactive widgets in `_buildPatternView()`.
- **Verification & Zero-Defect Testing**:
  - `flutter analyze`: **0 issues found** across all files.
  - `flutter test`: **15/15 unit and widget fit tests passed with 100% success rate**.

---
- **Scope & Strict Policy Alignment (Instructional Classes & Revision Only)**:
  - Harmonized the Nigerian NERDC JSS1 Term 2 curriculum into **9 High-Impact Instructional & Revision Weeks** (omitting Week 5 Midterm Exam and Week 7 Midterm Break in accordance with project directive):
    1. **Week 1**: *Exprimer les propriétés des objets* (Object properties: size, color, shape, texture/weight, live adjective agreement rules).
    2. **Week 2**: *Demander quelque chose à quelqu’un* (Polite classroom borrowing with tutoiement, school office requests with vouvoiement).
    3. **Week 3**: *Décrire les professions* (Jobs, duties, workplace contexts, feminine/masculine profession forms).
    4. **Week 4**: *Demander et donner l’heure* (Telling time, hour/minute hands, pile/et quart/et demie/moins le quart, midi/minuit).
    5. **Week 5**: *Ce que l'on fait à certaines heures de la journée* (Hourly daily routine timeline from 6h to 21h).
    6. **Week 6**: *Dire les dates* (7 days of week, 12 months, asking dates, Nigeria Independence Day 1er octobre).
    7. **Week 7**: *Situer un événement par rapport à un autre* (Temporal prepositions: *avant, pendant, après*, and sequencing connectors: *d'abord, ensuite/puis, enfin*).
    8. **Week 8**: *Activités de tous les jours de la semaine* (7-day routine planner, habit rule *Le + jour*).
    9. **Week 9**: *Révision Générale du Deuxième Trimestre* (4-Team buzzer speed rally with 4 challenge stations covering all Term 2 topics).
- **Curriculum Dataset & Data Models**:
  - Authored `JSS1_FRENCH/lib/data/jss1_term2_lessons.dart` with all 9 complete weekly lessons (objectives, cultural insights, vocabulary with phonetic transcriptions & audio keys, classwork exercises, evaluation Q&A, homework, and in-depth grammar notes).
  - Extended `JSS1PatternType` enum in `lib/models/jss1_lesson_model.dart` with all 9 Term 2 patterns.
- **9 Bespoke Smartboard Interactive Pattern Widgets** (`JSS1_FRENCH/lib/widgets/patterns/term2/`):
  1. `JSS1ObjectPropertiesStudioWidget` (Adjective agreement studio, 6 3D objects, size/color/shape/texture selectors).
  2. `JSS1PoliteRequestsStudioWidget` (Classroom borrowing & School administration reception dialogue simulators).
  3. `JSS1ProfessionsStudioWidget` (Interactive career gallery, gender concordances, duty matcher, oral studio).
  4. `JSS1ClockTimeStudioWidget` (Dual analog/digital smartboard clock, interactive time sliders, quick presets).
  5. `JSS1DailyScheduleStudioWidget` (6h–21h routine timeline with morning, afternoon, evening phases).
  6. `JSS1CalendarDatesStudioWidget` (Interactive calendar date constructor, school milestone badges).
  7. `JSS1EventSequencerStudioWidget` (Chronology lab, temporal prepositions & narrative story connectors).
  8. `JSS1WeeklyRoutineStudioWidget` (7-day routine schedule board with *Le + jour* habit rule).
  9. `JSS1Term2RevisionRallyWidget` (4-Team live buzzer quiz arena with point tracking and celebration podium).
- **Extensive Multimedia Suite (Audio & Gemini Visuals)**:
  - Synthesized all **80 authentic 44.1kHz MP3 neural audio files** in `JSS1_FRENCH/assets/audio/jss1_term2/` using **`fr-FR-DeniseNeural`** (-4% classroom rate, 100% strict UTF-8 accent handling).
  - Generated **6 rich educational illustrations & smartboard diagrams** via Gemini AI image generation:
    1. `jss1_object_properties_stage.jpg`: Demonstration table with shapes, sizes, colors, and textures in a modern classroom.
    2. `jss1_polite_requests_reception.jpg`: Secondary school administration reception desk with student and administrator.
    3. `jss1_professions_careers.jpg`: Inspiring career pathway poster showcasing 6 modern professions.
    4. `jss1_clock_time_school.jpg`: Large analog & digital school smartboard clock at 8:00 AM.
    5. `jss1_weekly_calendar_nigeria.jpg`: 7-Day adventure calendar and habit tracker featuring Nigerian Independence Day.
    6. `jss1_term2_rally_trophy.jpg`: Grand Revision Rally buzzer stage with 4 team buzzers and trophy.
- **Screens & Navigation Integration**:
  - `JSS1TermSelectScreen`: Unlocked Term 2 card with 9 weeks count and exact syllabus topic subtitle.
  - `JSS1WeekRoadmapScreen`: Connected `JSS1Term2Lessons.weeks` for Term 2.
  - `JSS1LessonPlayerScreen`: Dispatched all 9 Term 2 interactive widgets in `_buildPatternView()`.
- **Verification & Zero-Defect Testing**:
  - `flutter analyze`: **0 issues found** across all files.
  - `flutter test`: **15/15 unit and widget fit tests passed with 100% success rate**.

---

## [Unreleased] - 2026-08-30

### JSS1 French Standalone App Architecture (`JSS1_FRENCH`)
- **Standalone App Infrastructure Scaffolding**:
  - Initialized dedicated standalone build directory in `JSS1_FRENCH/`.
  - Configured `pubspec.yaml` with `just_audio`, `provider`, `shared_preferences`, `google_fonts`, and asset directories for audio and diagrams.
  - Created brand color system (`JSS1Colors`) and Nunito typography design tokens (`JSS1Text`).
  - Implemented `JSS1AudioService` with native `0.8x / 1.0x` pitch-preserving speed toggle, multi-path audio asset fallback resolver, and SFX players (`sfx_correct`, `sfx_incorrect`, `sfx_click`, `sfx_celebrate`, `sfx_whoosh`).
- **Term 1 (Premier Trimestre) Curriculum Scope Refactoring (Instructional Classes & Revision Only)**:
  - In strict alignment with user directive (*"no vacation shi, the only parts of the curri we are concerned with is the classes, and revision. tests, holiday, etc are off limits"*), pruned all non-instructional break/exam modules.
  - Refactored Term 1 into **9 High-Impact Instructional & Revision Weeks**:
    1. **Week 1**: *Les Mots Utilisés en Classe* (Classroom Instructions: *Levez-vous, Asseyez-vous, Ouvrez vos livres, Fermez vos cahiers, Écoutez attentivement, Répétez après moi, Regardez le tableau, Silence s'il vous plaît, Puis-je sortir ?*)
    2. **Week 2**: *Saluer et Prendre Congé* (Greetings & Politeness: *Bonjour Monsieur/Madame, Bonsoir, Salut, Comment allez-vous ?, Comment vas-tu ?, Très bien merci, Enchanté/e, S'il vous plaît, De rien, Au revoir et à demain*)
    3. **Week 3**: *Se Présenter* (Introducing Oneself: *Je m'appelle..., J'ai 12 ans, Je suis nigérian/nigériane, Je viens de Lagos, J'habite à Abuja, Je suis élève en JSS1*)
    4. **Week 4**: *Épeler un mot et l'Orthographe* (Spelling & Accents: Alphabet A–Z phonetics, *Accent aigu é, Accent grave è/à, Accent circonflexe ê/ô, Cédille ç, Tréma ï, Comment ça s'écrit ? Ça s'épèle...*)
    5. **Week 5**: *Présenter Quelqu’un* (Introducing Others: *Voici mon ami/amie, Il/Elle s'appelle..., Il a 13 ans, Il est nigérian/Elle est nigériane, C'est mon camarade de classe, Je vous présente...*)
    6. **Week 6**: *Décrire Quelqu’un* (Physical & Character Traits: *Grand/Grande, Petit/Petite, Mince, Gros/Grosse, Beau/Belle, Teint clair/Teint noir, Intelligent/e, Gentil/Gentille, Travailleur/Travailleuse*)
    7. **Week 7**: *Parler de ses Loisirs* (Hobbies & Leisure: *Jouer au football, Écouter de la musique, Lire des livres, Regarder la télévision, Faire du vélo, Nager, Dessiner, Chanter et danser*)
    8. **Week 8**: *Exprimer ses Goûts et Préférences* (Likes & Dislikes: *J'adore, J'aime beaucoup, Je préfère... à..., Je n'aime pas, Je déteste, Pourquoi ? Parce que c'est...*)
    9. **Week 9**: *Révision Générale du Premier Trimestre* (Comprehensive Term 1 Grand Revision Rally covering all 8 topics)
  - **9 Bespoke Smartboard Pattern Widgets** (`JSS1_FRENCH/lib/widgets/patterns/term1/`):
    1. `JSS1ClassroomCommandsWidget` (Classroom simulator & "Le Maître Dit" action game)
    2. `JSS1GreetingStudioWidget` (Formal vs. Informal registers, Time-of-day slider, roleplay simulator)
    3. `JSS1SelfIntroStudioWidget` (Interactive Student ID Card & Passport generator)
    4. `JSS1SpellingAndDictationWidget` (Full A–Z soundboard, accent guide & dictation tester)
    5. `JSS1PresentOthersStudioWidget` (3rd-person profile presenter & gender concordance)
    6. `JSS1CharacterPortraitStudioWidget` (Physical & moral traits avatar builder with live adjective agreement)
    7. `JSS1HobbiesAndLeisureWidget` (Leisure grid, sports/instruments rule, weekly activity planner)
    8. `JSS1TastesAndPreferencesWidget` (Preference scale *J'adore ➔ Je déteste*, comparison arena, interactive poll)
    9. `JSS1Term1RevisionRallyWidget` (4-Team speed buzzer rally with station challenges)
  - **Automated Verification & Zero-Defect Fit Suite**:
    - `flutter analyze`: 0 issues found across all Dart source files.
    - `flutter test`: 10/10 tests passed across data schema, theme tokens, and interactive UI widget fit suite.
  - **Full Multimedia Audio & Visual Package**:
    - Re-synthesized all **89 universal 44.1kHz MP3 audio files** in `JSS1_FRENCH/assets/audio/jss1_term1/` using high-fidelity **Neural French Voice (`fr-FR-DeniseNeural`)** with 100% strict UTF-8 accent handling, natural classroom pacing (-4% rate), and exact phrase-to-model alignment (eliminating any character encoding corruption or phonetic misalignments).
    - **Re-Engineered UI & Classroom Sound Effects (SFX)**:
      - Identified root cause of prior SFX playback failure: previous build saved raw PCM WAV chunks with a `.mp3` extension, which caused decoders to fail.
      - Built fresh, studio-grade sound effects from scratch using **NumPy physical acoustic modeling** and encoded to **genuine MPEG-1 Layer 3 (`0xFFFB`) MP3s** via `lameenc` (192 kbps, 44.1 kHz stereo):
        1. `sfx_celebrate.mp3`: Triumphant multi-harmonic orchestral fanfare with arpeggiated bells and glitter shimmer trail.
        2. `sfx_correct.mp3`: Crystal-clear ascending F5–C6 acoustic bell chime.
        3. `sfx_incorrect.mp3`: Gentle lowpass wooden marimba encouraging retry.
        4. `sfx_click.mp3`: Crisp tactile button transient.
        5. `sfx_whoosh.mp3`: Dynamic stereo smartboard page transition swoosh.
      - Deployed and verified across all 6 asset directories in `mvp`, `P5_FRENCH`, and `JSS1_FRENCH`.
    - Generated **4 high-fidelity Gemini AI smartboard educational illustrations & diagrams** embedded across interactive widgets:
      1. `jss1_classroom_hero.jpg`: Modern Nigerian secondary classroom with smartboard & teacher.
      2. `jss1_greetings_dialogue.jpg`: JSS1 students greeting in school courtyard (*Bonjour ! Comment vas-tu ?*).
      3. `jss1_francophone_neighbors.jpg`: Illustrated West/Central Africa map with Nigeria's 4 Francophone neighbors (Benin, Niger, Chad, Cameroon).
      4. `jss1_hobbies_lifestyle.jpg`: Visual student collage for football, reading, music, cycling, and art.
    - Integrated sound effects (`sfx_correct`, `sfx_incorrect`, `sfx_click`, `sfx_celebrate`, `sfx_whoosh`).
  - **Automated Verification & Unit Test Suite**:
    - Authored `test/jss1_french_test.dart` covering 13-week curriculum schemas, pattern dispatches, audio keys, speed clamp logic, and brand tokens.
    - Verified all 5/5 unit tests passed with 100% success.

### Phase 0 Next.js Transition, Lead Routing & Full SEO Overhaul
- **Next.js App Router Architecture**:
  - Successfully migrated `website/` from Vite to **Next.js App Router** with Turbopack, automated sitemaps (`sitemap.js`), crawlers config (`robots.js`), and server-rendered SEO tags.
- **Call-To-Action (CTA) Routing Standardization**:
  - Strictly harmonized all CTAs across the entire platform:
    - **"JOIN THE COMMUNITY"**: Always routes directly to the Official WhatsApp Community Channel (`https://whatsapp.com/channel/0029Vb8YQkw96H4b8tpk0H0h`).
    - **"CHAT ON WHATSAPP" / "BOOK A SLOT"**: Always routes directly to the direct WhatsApp phone number (`+234 707 076 3135` via `wa.me/2347070763135`).
- **Direct WhatsApp Lead Dispatch to +234 707 076 3135**:
  - Implemented automatic WhatsApp pre-filled message dispatch routing leads directly to `+234 707 076 3135` upon form submission with school name, role, email, and smartboard availability.
  - Retained `localStorage` backup and added floating WhatsApp action button for instant mobile inquiries.
- **Social Media Open Graph & Meta Preview**:
  - Added full Open Graph, Twitter Cards, and JSON-LD structured data (`EducationalOrganization`, `SoftwareApplication`) with 1200x630 teaser artwork preview.
- **Dedicated Executive Brief Route (`/executive-brief`)**:
  - Created standalone printable and shareable Next.js Executive Brief page with direct PDF generation styling.
- **Official WhatsApp Channel & Welcome Message**:
  - Integrated official channel (`https://whatsapp.com/channel/0029Vb8YQkw96H4b8tpk0H0h`) and authored pinned orientation message.

### Grade 5 / Primary 5 French Standalone App Architecture (`P5_FRENCH`)
- **Standalone App Infrastructure Scaffolding**:
  - Initialized dedicated standalone application directory in `P5_FRENCH/`.
  - Configured `pubspec.yaml` manifest with `just_audio`, `provider`, `shared_preferences`, and `google_fonts`.
  - Created high-contrast smartboard design system tokens (`P5Colors`, `P5Text`), comprehensive data models (`P5Lesson`, `P5VocabItem`, `P5InteractiveExercise`, `P5EvaluationQuestion`, `P5AssignmentTask`, `P5GrammarNote`), and `P5AudioService` with native `0.8x / 1.0x` pitch-preserving speed toggle.
- **Term 1 (Premier Trimestre) Full Build Completed**:
  - **13 Complete Weeks of Curriculum** (`p5_term1_lessons.dart`): Ingested and curated official NERDC Primary 5 scheme covering Alphabet Sounds & 1–20 Review, Counting 21–30 & Math Equations (*plus, moins, font*), Numbers 31–50, Store Prices in Naira & Telephone Numbers (*Combien ça coûte ?*), Numbers 51–60 & Base Tens Mastery (10 to 60), Mid-Term Speed Rally & Break, Presenting Others (*Voici / C'est / Il s'appelle / Elle s'appelle, gentil/gentille*), Classmate Passports (*Nigérian/e, Grand/e, Petit/e, Fort/e*), Head Anatomy (*la tête, les cheveux, les yeux, les dents*), Body Anatomy & Clinic (*le dos, le ventre*, *J'ai mal au dos / à la tête / aux dents*), Grand Speed Oral Rally, and Term 1 Certificate Celebration.
  - **10 Bespoke Smartboard Pattern Widgets** (`P5_FRENCH/lib/widgets/patterns/term1/`):
    1. `P5AlphabetAndRevisionWidget` (Interactive Alphabet Soundboard & Time Dial)
    2. `P5NumberStudio21to30Widget` (21–30 Counting Board, Math Builder & *Combien ?* Quiz)
    3. `P5NumberStudio31to50Widget` (Classroom Market Store Kiosk & Phone Keypad)
    4. `P5NumberStudio51to60Widget` (Master Tens 10–60 & Mental Subtraction Lab)
    5. `P5PresentOthersWidget` (3rd-Person Friend Introduction Studio)
    6. `P5PresentOthersDescriptorWidget` (Student Passport & Physical Trait Builder)
    7. `P5HeadAndFaceExplorerWidget` (Interactive Anatomical Head & Face Explorer)
    8. `P5BodyAndPainClinicWidget` (Body Nodes & Doctor Prescription Clinic)
    9. `P5Term1RevisionRallyWidget` (4-Station Team Buzzer Speed Rally)
    10. `P5Term1VacationWidget` (Holiday Celebration & Term 2 Roadmap Preview)
  - **Screen Wiring**:
    - `P5TermSelectScreen`: High-contrast smartboard term navigation cards.
    - `P5WeekRoadmapScreen`: 13-week grid roadmap with week cards, drill badges, and phrase counts.
- **Term 2 (Deuxième Trimestre) Full Build Completed**:
  - **13 Complete Weeks of Curriculum** (`p5_term2_lessons.dart`): Ingested and curated official NERDC Primary 5 scheme covering Extended Family (*Les grands-parents, l'oncle, la tante, le cousin, la cousine*), Nephews & Nieces (*le neveu, la nièce, le petit-fils, la petite-fille, âgé/jeune, grande/petite famille*), Family Reunions & Village Trips (*Nous visitons nos grands-parents, au village, respecter les aînés*), Neighbors & Community (*Le voisin, la voisine, le quartier, la maison voisine, sympathique, aimable*), Mid-Term Speed Rally & Break, Neighborly Actions (*Aider son voisin, partager, saluer poliment, calme/bruyant/propre*), Expressing Gratitude (*Merci, Merci beaucoup, Je vous remercie, De rien, Je vous en prie, Pas de quoi*), Thank-You Letters & Appreciation (*C'est gentil, C'est très aimable, Tu es super*), 7 Days of the Week & Weekly Timetable (*Lundi to Dimanche, Quel jour sommes-nous ? Hier, Aujourd'hui, Demain*), Grand Term 2 Speed Rally, Speaking Portfolio Evaluation, and Second Term Certificate Celebration.
  - **10 Bespoke Smartboard Pattern Widgets** (`P5_FRENCH/lib/widgets/patterns/term2/`):
    1. `P5ExtendedFamilyWidget` (3-Generation Family Grid, Relationship Cards & Possessive Rules)
    2. `P5FamilyTreeAdvancedWidget` (Nephews, Nieces & Age/Family Size Descriptors)
    3. `P5FamilyGatheringWidget` (Family Reunion, Shared Meals & Village Trips)
    4. `P5NeighborStudioWidget` (Neighbor Profile Generator & Street Card)
    5. `P5CommunityActivityWidget` (Neighbor Mutual Assistance & Neighborhood Atmosphere)
    6. `P5GratitudeStudioWidget` (Gratitude Expressions & Formal vs Casual Replies)
    7. `P5ThankYouLetterWidget` (Interactive Thank-You Card & Compliment Builder)
    8. `P5WeeklyTimetableWidget` (7-Day Calendar & Temporal Timeline: Hier, Aujourd'hui, Demain)
    9. `P5Term2RevisionRallyWidget` (4-Station Team Buzzer Speed Rally & Scoreboard)
    10. `P5Term2VacationWidget` (Second Term Certificate Celebration & Term 3 Preview)
  - **Screen Routing & Navigation Integration**:
    - Updated `P5WeekRoadmapScreen` to load and display Term 2 lessons with phrase badges.
    - Updated `P5LessonPlayerScreen` to dynamically dispatch all 10 Term 2 pattern widgets.
  - **Term 2 Dedicated Multimedia Sprint Completed**:
    - **66 Universal 44.1kHz MP3 Audio Files**: Synthesized in `P5_FRENCH/assets/audio/p5_term2/` using `gTTS(lang='fr')`.
    - **5 Visual Educational Diagrams**: Generated high-contrast diagrams (`family_tree_diagram.png`, `neighborhood_community_diagram.png`, `gratitude_postcard_board.png`, `weekly_timetable_board.png`, `term2_vacation_celebration.png`) in `P5_FRENCH/assets/images/p5_term2/`.
    - **Verification**: Verified 100% audio key coverage with `verify_p5_term2_multimedia.py` and confirmed `flutter analyze` with 0 errors.
- **Term 3 (Troisième Trimestre) Full Build Completed**:
  - **13 Complete Weeks of Curriculum** (`p5_term3_lessons.dart`): Ingested and curated official NERDC Primary 5 scheme covering Morning Daily Routine (*Se réveiller, se lever, se laver, s'habiller, prendre le petit-déjeuner, aller à l'école, à 6h00*), Afternoon & Night Routine (*Étudier, déjeuner, rentrer à la maison, faire les devoirs, dîner en famille, se coucher et dormir*), Sports (*Le football, le basketball, la natation, la course, le tennis, Je joue au...*), Hobbies & Social Invitations (*Lire, dessiner, chanter, danser, Veux-tu jouer avec moi ? Oui, avec plaisir / Non, je ne peux pas*), Mid-Term Speed Rally & Break, Core School Subjects (*Le français, l'anglais, les mathématiques, les sciences, l'histoire, ma matière préférée*), Classroom Stationery & Polite Borrowing (*Le stylo, le crayon, la règle, la gomme, le cahier, Prête-moi ton stylo / ta règle, s'il te plaît*), Future Career Dreams (*Le médecin, l'enseignant/e, l'infirmier/ière, le pilote, l'ingénieur, le policier, Quand je serai grand/e, je veux être...*), Foods, 3 Daily Meals & Dining Etiquette (*Le riz, le pain, le poulet, le poisson, les fruits, l'eau, le jus, J'ai faim, J'ai soif, Bon appétit !*), Grand Annual Speed Revision Rally, Annual Speaking Portfolio Evaluation, and Primary 5 Graduation & Promotion into Primary 6 (*Bienvenue en 6e année !*).
  - **10 Bespoke Smartboard Pattern Widgets** (`P5_FRENCH/lib/widgets/patterns/term3/`):
    1. `P5DailyRoutineMorningWidget` (6h00–7h30 Morning Timeline, Wake Up, Wash, Dress & Breakfast)
    2. `P5DailyRoutineEveningWidget` (Afternoon Study, Homework, Dinner & Sleep Grid)
    3. `P5SportsArenaWidget` (Sports Stadium, "Je joue au..." Selector & Preference Card)
    4. `P5HobbiesLoungeWidget` (Creative Hobbies, Reading, Music & Interactive Play Invitation Station)
    5. `P5SchoolSubjectsWidget` (5 Core Subjects Carousel & "Ma matière préférée" Builder)
    6. `P5ClassroomBorrowingWidget` (Stationery Drawer, Masc/Fem Possessives: ton/ta & Polite Borrowing)
    7. `P5ProfessionsCareerWidget` (6 Dream Careers, Gender Switch: grand/grande & Ambition Showcase)
    8. `P5FoodBuffetWidget` (Jollof Rice, Agege Bread, Fruit Buffet & "Bon appétit !" Station)
    9. `P5Term3RevisionRallyWidget` (4-Station Team Speed Buzzer Rally with Live Scoreboard)
    10. `P5Term3GraduationWidget` (Primary 5 Certificate of Excellence & Promotion to Primary 6)
    - **Full Academic Year Verification**: Executed `verify_p5_full_app.py` confirming 100% audio coverage across all 3 terms (268 MP3 files, 14 diagrams, 30 bespoke widgets, 39 curriculum weeks, 0 compilation errors).
- **Automated Unit & Widget Test Suite Verification (`P5_FRENCH/test/`)**:
  - **14 Automated Tests Executed & Passed (100% Success)**:
    1. `P5AudioService` singleton pattern enforcement.
    2. `P5AudioService` playback speed boundaries and clamping (`[0.5, 1.5]`).
    3. Curriculum dataset completeness across all 3 terms (13 + 13 + 13 = 39 weeks).
    4. Metadata, objectives, exercise pairs, and grammar notes validation for Term 1.
    5. Metadata, objectives, exercise pairs, and grammar notes validation for Term 2.
    6. Metadata, objectives, exercise pairs, and grammar notes validation for Term 3.
    7. Bespoke interactive pattern assignment uniqueness (30 distinct patterns).
    8. Disk presence verification for all 268 audio keys referenced across all 39 weeks.
    9. `P5TermSelectScreen` smoke test verifying 3 unlocked terms and grade badges.
    10. `P5WeekRoadmapScreen` smoke test verifying Term 1 week cards.
    11. `P5WeekRoadmapScreen` smoke test verifying Term 2 week cards.
    12. `P5WeekRoadmapScreen` smoke test verifying Term 3 week cards.
    13. `P5LessonPlayerScreen` phase cycling & interactive pattern loading smoke test.
  - **Zero Overflow Layout Enhancements**: Wrapped header bars, roadmap titles, and step headers in `Expanded`/`Flexible`/`SingleChildScrollView` to guarantee 100% responsive display across all smartboard resolutions and test viewports.

### Grade 4 / Primary 4 French Standalone App Architecture (`P4_FRENCH` / `mvp`)
- **Web & Smartboard Execution Verification**:
  - Resolved model constructor variance in `P4EvaluationQuestion` and `P4AssignmentTask` to natively support all legacy & modern parameter variations (`questionText`, `expectedAnswer`, `homeworkTasks`, `instructions`, `topic`, `taskNumber`).
  - Fixed deprecated icon reference in `classroom_explorer_widget.dart` and `p4_term2_lessons.dart`.
  - Successfully verified static analysis with **0 compilation errors**.
  - Launched live interactive session via `flutter run -d edge` on Microsoft Edge.
- **First Production Target**: Selected **Grade 4 / Primary 4 French Language** as the first complete standalone classroom smartboard application.
- **Platform Stack**: **Flutter / Dart** targeting **Android APK** (optimized for Android Interactive Flat Panels / Smartboards with landscape orientation, high touch ergonomics, and 100% offline runtime).
- **Term 3 (Troisième Trimestre) Architectural Direction & Pedagogical Curation**:
  - **Comprehensive Foundation Completion**: Term 3 serves as the capstone of Primary 4 French, transitioning pupils from basic naming and labeling to expressive language (time, daily habits, food preferences, bodily health, clothing, and weather).
  - **Topic-by-Topic Bespoke Curation**:
    - *Week 1 (Telling Time / L'heure)*: Analog/digital smartboard clock mechanics with *Quelle heure est-il ? Il est ... heure(s)*, *midi*, and *minuit*.
    - *Week 2 (Daily Routine / La routine quotidienne)*: Reflexive daily routine actions (*Je me réveille, Je me lave, Je prends le petit déjeuner, Je vais à l'école, Je dors*) tied to chronological time stamps.
    - *Week 3 (Food & Meals / Les repas et la nourriture)*: 3-meal buffet system (*Le petit déjeuner, Le déjeuner, Le dîner*) and staple food items with gender articles (*Le riz, Le pain, Le poulet, Le poisson, Le lait, L'eau*).
    - *Week 4 (Hunger, Thirst & Preferences / Faim, Soif et Préférences)*: Physical states and preference verbs (*J'ai faim, J'ai soif, Je veux manger..., Je veux boire..., J'aime / Je n'aime pas*).
    - *Week 5 (Mid-Term Oral Speed Rally)*: Rapid 4-category oral review of Weeks 1–4.
    - *Week 6 (Mid-Term Cultural Break & Dining Etiquette)*: Dining expressions (*Bon appétit ! Merci pour le repas*) and French culinary etiquette.
    - *Week 7 (Parts of the Body / Les parties du corps)*: 9 anatomical nodes (*La tête, Les yeux, Le nez, La bouche, Les oreilles, Les bras, Les mains, Les jambes, Les pieds*) with singular and plural article agreements.
    - *Week 8 (Health, Pain & Hygiene / La santé et l'hygiène)*: Expressing pain (*J'ai mal à la tête / aux dents / au ventre*) and daily hygiene imperatives (*Se laver les mains, Se brosser les dents*).
    - *Week 9 (Clothes & Dressing / Les vêtements)*: Clothing items and color adjective gender agreement (*Une chemise blanche, Un pantalon noir, Une robe rouge, Des chaussures marron*).
    - *Week 10 (Weather & Climate / Le temps qu'il fait)*: Weather conditions (*Il fait beau, Il fait chaud, Il fait froid, Il pleut*) and Nigerian seasons (*La saison des pluies vs La saison sèche*).
    - *Week 11 (Grand Annual Speed Revision Rally)*: Comprehensive recap across all 3 terms of Primary 4 French.
    - *Week 12 (Teacher Oral Evaluation & Review)*: Oral assessment checklist and student achievement portfolio.
    - *Week 13 (Graduation & Holiday Celebration)*: Year-end promotion celebration (*Félicitations pour la 4e année ! Bonnes vacances et bienvenue en 5e année !*).
  - **Two-Phase Delivery Pipeline**:
    - **Phase 1 (Core Engine & Logic First)**: Complete curriculum data, 10 bespoke pattern widgets, screen navigation, and static analysis verification.
    - **Phase 2 (Dedicated Multimedia Sprint)**: Generate all 44.1kHz MP3 audio files and vector illustrations.
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
  - **Term 2 Multimedia Sprint & Universal Audio Engine Complete**:
    - **183 Standard 44.1kHz MP3 Audio Files**: Synthesized and verified across all 13 weeks of Term 2 in `mvp/assets/audio/p4_term2/` for 100% offline smartboard playback.
    - **Visual Illustration Suite**: Generated 8 bespoke pedagogical diagrams and cards (`family_portrait.png`, `family_tree.png`, `classroom_map.png`, `campus_map.png`, `timetable_calendar.png`, `preposition_stage.png`, `color_wheel.png`, `vacation_celebration.png`) in `mvp/assets/images/p4_term2/`.
    - **Multi-Term Audio Resolver**: Enhanced [P4AudioService](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/services/p4_audio_service.dart) to seamlessly resolve Term 1, Term 2, and shared fallback audio assets automatically.
- **Audio Engine & Facilitation Enhancements (Improvement Pass A)**:
  - **Slower Speech Speed Control (0.8x vs 1.0x)**: Added native playback speed state and pitch-preserving speed controls to [P4AudioService](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/services/p4_audio_service.dart) (`setPlaybackSpeed`).
  - **Dual Smartboard Speed Toggles**: Added interactive speed controls in both the [P4LessonPlayerScreen](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/screens/lesson/p4_lesson_player_screen.dart) top header bar and the Vocabulary & Phonetics Station chip bar (`Speed: 0.8x Slower` / `1.0x Normal`) so teachers can easily assist beginners with challenging French phonetics and liaisons.
  - **13-Week Term 1 Symmetry (39 Weeks Total)**: Harmonized [p4_term1_lessons.dart](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/data/p4_term1_lessons.dart) into 13 distinct weeks (Week 12 Oral Evaluation Portfolio + Week 13 Vacation Celebration & Term 2 Preview), establishing perfect 13-week symmetry across all 3 academic terms.
- **Term 3 (Troisième Trimestre) Full Build & Dedicated Multimedia Sprint Complete**:
  - **13 Complete Weeks of Curriculum** (`p4_term3_lessons.dart`): Added exhaustive NERDC curriculum content covering Time (*Quelle heure est-il ? Il est ... heure(s), midi, minuit*), Daily Routine (*Je me réveille, Je me lave, Je m'habille, Je prends le petit déjeuner, Je vais à l'école, Je me couche*), 3 Meals & Food Items (*Le petit déjeuner, Le déjeuner, Le dîner, Le pain, Le riz, Le poulet, Le poisson*), Hunger, Thirst & Preferences (*J'ai faim, J'ai soif, J'aime, Je préfère, Je déteste*), Body Anatomy (*La tête, Le visage, Les yeux, Le nez, La bouche, Les oreilles, Le bras, La main, Le ventre, La jambe, Le pied, Les dents*), Doctor Clinic & Hygiene (*J'ai mal à la tête / aux dents, Je me lave les mains, Je me brosse les dents*), Clothes & Color Agreement (*Une chemise blanche, Un pantalon noir, Une robe rouge, Des chaussures marron*), Weather & Seasons (*Il fait beau, Il fait chaud, Il fait froid, Il pleut, Il fait du vent, La saison des pluies, La saison sèche, L'harmattan*), Grand Annual Revision Rally, Oral Evaluation, and Year-End Graduation Diploma Celebration.
  - **10 Bespoke Smartboard Pattern Widgets**:
    1. [ClockTimeExplorerWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term3/clock_time_explorer_widget.dart) (Week 1: Telling time & hourly dials).
    2. [DailyRoutineSequencerWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term3/daily_routine_sequencer_widget.dart) (Week 2: Timeline daily schedule).
    3. [FoodAndMealsWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term3/food_and_meals_widget.dart) (Week 3: 3-meal buffet organizer & food items).
    4. [HungerThirstDialWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term3/hunger_thirst_dial_widget.dart) (Week 4: Hunger/thirst states & preference constructor).
    5. [BodyAnatomyExplorerWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term3/body_anatomy_explorer_widget.dart) (Week 7: 9 anatomical nodes & singular/plural gender agreements).
    6. [HealthAndHygieneWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term3/health_and_hygiene_widget.dart) (Week 8: Doctor clinic symptoms diagnosis & daily hygiene habits).
    7. [WardrobeStylistWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term3/wardrobe_stylist_widget.dart) (Week 9: Clothes rack & color adjective agreement lab).
    8. [WeatherStudioWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term3/weather_studio_widget.dart) (Week 10: Weather broadcast & seasons comparison).
    9. [Term3RevisionRallyWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term3/term3_revision_rally_widget.dart) (Weeks 5, 11 & 12: 4-category speed oral revision rally).
    10. [Term3GraduationCelebrationWidget](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/widgets/patterns/term3/term3_graduation_celebration_widget.dart) (Weeks 6 & 13: Mid-term dining etiquette and Year-End Primary 4 French Diploma of Excellence).
  - **Full Navigation & Multi-Term Routing**:
    - Unlocked Term 3 card in [P4TermSelectScreen](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/screens/term/p4_term_select_screen.dart).
    - Added Term 3 dataset loading in [P4WeekRoadmapScreen](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/screens/roadmap/p4_week_roadmap_screen.dart).
    - Wired all 10 Term 3 interactive widgets in [P4LessonPlayerScreen](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/screens/lesson/p4_lesson_player_screen.dart).
    - Enhanced [P4AudioService](file:///c:/Users/DELL/Desktop/Lang%20Huey/mvp/lib/services/p4_audio_service.dart) to prioritize `assets/audio/p4_term3/` when playing Term 3 lessons.
  - **Term 3 Multimedia Sprint & Universal Audio Engine Complete**:
    - **168 Standard 44.1kHz MP3 Audio Files**: Synthesized and verified across all 13 weeks in `mvp/assets/audio/p4_term3/` using standard French speech synthesis.
    - **8 Visual Educational Diagrams & Cards**: Generated high-contrast PNG diagram assets in `mvp/assets/images/p4_term3/` (`term3_banner.png`, `clock_diagram.png`, `daily_routine_timeline.png`, `three_meals_pyramid.png`, `body_anatomy_chart.png`, `health_hygiene_card.png`, `weather_seasons_map.png`, `graduation_certificate_template.png`).
    - **100% Automated Asset Verification**: Ran `verify_term3_multimedia.py` confirming 100% audio key coverage (112/112 in lessons, 67/67 in pattern widgets, 8/8 diagrams).
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
