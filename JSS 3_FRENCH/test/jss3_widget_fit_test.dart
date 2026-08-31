import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jss3_french/data/jss3_term1_lessons.dart';
import 'package:jss3_french/data/jss3_term2_lessons.dart';
import 'package:jss3_french/screens/term/jss3_term_select_screen.dart';
import 'package:jss3_french/screens/roadmap/jss3_week_roadmap_screen.dart';
import 'package:jss3_french/screens/lesson/jss3_lesson_player_screen.dart';

// Term 1 Pattern Studios
import 'package:jss3_french/widgets/patterns/term1/jss3_person_description_studio_widget.dart';
import 'package:jss3_french/widgets/patterns/term1/jss3_term1_revision_rally_widget.dart';

// Term 2 Pattern Studios
import 'package:jss3_french/widgets/patterns/term2/jss3_narrating_past_events_studio_widget.dart';
import 'package:jss3_french/widgets/patterns/term2/jss3_recent_events_venir_de_studio_widget.dart';
import 'package:jss3_french/widgets/patterns/term2/jss3_diary_and_narrative_studio_widget.dart';
import 'package:jss3_french/widgets/patterns/term2/jss3_near_future_intentions_studio_widget.dart';
import 'package:jss3_french/widgets/patterns/term2/jss3_future_plans_and_aspirations_studio_widget.dart';
import 'package:jss3_french/widgets/patterns/term2/jss3_term2_consolidation_studio_widget.dart';
import 'package:jss3_french/widgets/patterns/term2/jss3_bece_grammar_prep_studio_widget.dart';
import 'package:jss3_french/widgets/patterns/term2/jss3_bece_vocab_essay_prep_studio_widget.dart';
import 'package:jss3_french/widgets/patterns/term2/jss3_term2_revision_rally_widget.dart';

void main() {
  const smartboard1080p = Size(1920, 1080);

  Widget createSmartboardWrapper(Widget child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaQuery(
        data: const MediaQueryData(size: smartboard1080p),
        child: SizedBox(
          width: smartboard1080p.width,
          height: smartboard1080p.height,
          child: child,
        ),
      ),
    );
  }

  group('JSS 3 French Term 1 — 1080p Smartboard Widget Fit & Rendering Tests', () {
    testWidgets('Term Select Screen renders cleanly at 1080p without overflow', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createSmartboardWrapper(const JSS3TermSelectScreen()));
      await tester.pumpAndSettle();

      expect(find.text('LANG HUEY'), findsOneWidget);
      expect(find.text('Premier Trimestre'), findsOneWidget);
      expect(find.textContaining('Deuxième Trimestre'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Week Roadmap Screen renders cleanly at 1080p for Term 1', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createSmartboardWrapper(const JSS3WeekRoadmapScreen(termNumber: 1)));
      await tester.pumpAndSettle();

      expect(find.text('Premier Trimestre • JSS 3'), findsOneWidget);
      expect(find.text('W1'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Lesson Player Screen renders Term 1 Week 1 at 1080p', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS3Term1Lessons.weeks[0];
      await tester.pumpWidget(createSmartboardWrapper(JSS3LessonPlayerScreen(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Objectifs & Contexte'), findsOneWidget);
      expect(find.text('Lab Interactif'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Term 1 Week 1 Studio renders', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS3Term1Lessons.weeks[0];
      await tester.pumpWidget(createSmartboardWrapper(Scaffold(body: JSS3PersonDescriptionStudioWidget(lesson: lesson))));
      await tester.pumpAndSettle();

      expect(find.text('Studio de Description Physique & Morale'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Term 1 Week 9 Revision Rally renders', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS3Term1Lessons.weeks[8];
      await tester.pumpWidget(createSmartboardWrapper(Scaffold(body: JSS3Term1RevisionRallyWidget(lesson: lesson))));
      await tester.pumpAndSettle();

      expect(find.text('Grand Rallye & Championnat de Révision du 1er Trimestre'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });

  group('JSS 3 French Term 2 (Deuxième Trimestre) — 1080p Smartboard Widget Fit & Rendering Tests', () {
    testWidgets('Week Roadmap Screen renders cleanly for Term 2', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createSmartboardWrapper(const JSS3WeekRoadmapScreen(termNumber: 2)));
      await tester.pumpAndSettle();

      expect(find.text('Deuxième Trimestre (Trimestre Terminal • BECE)'), findsOneWidget);
      expect(find.text('W1'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Lesson Player Screen renders Term 2 Week 1 at 1080p', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS3Term2Lessons.weeks[0];
      await tester.pumpWidget(createSmartboardWrapper(JSS3LessonPlayerScreen(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Objectifs & Contexte'), findsOneWidget);
      expect(find.text('Lab Interactif'), findsOneWidget);
      expect(find.text('Vocabulaire & Phonétique'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Term 2 Week 1 Studio: JSS3NarratingPastEventsStudioWidget renders', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS3Term2Lessons.weeks[0];
      await tester.pumpWidget(createSmartboardWrapper(Scaffold(body: JSS3NarratingPastEventsStudioWidget(lesson: lesson))));
      await tester.pumpAndSettle();

      expect(find.text('Studio de Narration au Passé & Adverbes Temporels'), findsOneWidget);
      expect(find.text('Récits & Histoires'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Term 2 Week 2 Studio: JSS3RecentEventsVenirDeStudioWidget renders', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS3Term2Lessons.weeks[1];
      await tester.pumpWidget(createSmartboardWrapper(Scaffold(body: JSS3RecentEventsVenirDeStudioWidget(lesson: lesson))));
      await tester.pumpAndSettle();

      expect(find.text('Journal Télévisé : Le Passé Récent (Venir de + Infinitif)'), findsOneWidget);
      expect(find.text('Générateur Venir de'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Term 2 Week 3 Studio: JSS3DiaryAndNarrativeStudioWidget renders', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS3Term2Lessons.weeks[2];
      await tester.pumpWidget(createSmartboardWrapper(Scaffold(body: JSS3DiaryAndNarrativeStudioWidget(lesson: lesson))));
      await tester.pumpAndSettle();

      expect(find.text('Atelier : Comprendre un Récit & Mon Journal Intime'), findsOneWidget);
      expect(find.text('Feuilleter le Journal'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Term 2 Week 4 Studio: JSS3NearFutureIntentionsStudioWidget renders', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS3Term2Lessons.weeks[3];
      await tester.pumpWidget(createSmartboardWrapper(Scaffold(body: JSS3NearFutureIntentionsStudioWidget(lesson: lesson))));
      await tester.pumpAndSettle();

      expect(find.text('Studio : Le Futur Proche (ALLER + Infinitif) & Emploi du Temps'), findsOneWidget);
      expect(find.text('Constructeur de Phrases'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Term 2 Week 5 Studio: JSS3FuturePlansAndAspirationsStudioWidget renders', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS3Term2Lessons.weeks[4];
      await tester.pumpWidget(createSmartboardWrapper(Scaffold(body: JSS3FuturePlansAndAspirationsStudioWidget(lesson: lesson))));
      await tester.pumpAndSettle();

      expect(find.text('Machine des Rêves : Projets d\'Avenir & Le Futur Simple'), findsOneWidget);
      expect(find.text('Projets de Métiers'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Term 2 Week 6 Studio: JSS3Term2ConsolidationStudioWidget renders', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS3Term2Lessons.weeks[5];
      await tester.pumpWidget(createSmartboardWrapper(Scaffold(body: JSS3Term2ConsolidationStudioWidget(lesson: lesson))));
      await tester.pumpAndSettle();

      expect(find.text('Théâtre de Consolidation : Jeux de Rôles & Ateliers Pratiques'), findsOneWidget);
      expect(find.text('Jeux de Rôles'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Term 2 Week 7 Studio: JSS3BECEGrammarPrepStudioWidget renders', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS3Term2Lessons.weeks[6];
      await tester.pumpWidget(createSmartboardWrapper(Scaffold(body: JSS3BECEGrammarPrepStudioWidget(lesson: lesson))));
      await tester.pumpAndSettle();

      expect(find.text('Bootcamp BECE Partie I : Grammaire, Pronoms & Concordance des Temps'), findsOneWidget);
      expect(find.text('Drills BECE QCM'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Term 2 Week 8 Studio: JSS3BECEVocabEssayPrepStudioWidget renders', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS3Term2Lessons.weeks[7];
      await tester.pumpWidget(createSmartboardWrapper(Scaffold(body: JSS3BECEVocabEssayPrepStudioWidget(lesson: lesson))));
      await tester.pumpAndSettle();

      expect(find.text('Atelier BECE Partie II : Compréhension de Texte & Rédaction Guidée'), findsOneWidget);
      expect(find.text('Compréhension Écrite'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Term 2 Week 9 Studio: JSS3Term2RevisionRallyWidget renders', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS3Term2Lessons.weeks[8];
      await tester.pumpWidget(createSmartboardWrapper(Scaffold(body: JSS3Term2RevisionRallyWidget(lesson: lesson))));
      await tester.pumpAndSettle();

      expect(find.text('Grand Bilan & Simulation BECE — 2e Trimestre'), findsOneWidget);
      expect(find.text('Équipe Bleue 🔵'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
