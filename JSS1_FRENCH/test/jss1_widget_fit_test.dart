import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jss1_french/data/jss1_term3_lessons.dart';
import 'package:jss1_french/screens/lesson/jss1_lesson_player_screen.dart';
import 'package:jss1_french/screens/roadmap/jss1_week_roadmap_screen.dart';
import 'package:jss1_french/screens/term/jss1_term_select_screen.dart';

// Term 3 Widgets
import 'package:jss1_french/widgets/patterns/term3/jss1_weather_and_seasons_studio_widget.dart';
import 'package:jss1_french/widgets/patterns/term3/jss1_frequency_adverbs_studio_widget.dart';
import 'package:jss1_french/widgets/patterns/term3/jss1_invitations_studio_widget.dart';
import 'package:jss1_french/widgets/patterns/term3/jss1_commands_and_prohibitions_studio_widget.dart';
import 'package:jss1_french/widgets/patterns/term3/jss1_permission_and_advice_studio_widget.dart';
import 'package:jss1_french/widgets/patterns/term3/jss1_directions_and_procedures_studio_widget.dart';
import 'package:jss1_french/widgets/patterns/term3/jss1_communicative_roleplay_studio_widget.dart';
import 'package:jss1_french/widgets/patterns/term3/jss1_written_oral_workshop_studio_widget.dart';
import 'package:jss1_french/widgets/patterns/term3/jss1_term3_annual_grand_rally_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget wrapTestable(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('JSS1 French UI Widget & Interactive Fit Tests (Terms 1, 2, and 3)', () {
    testWidgets('1. JSS1TermSelectScreen mounts and displays all 3 unlocked term cards', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(wrapTestable(const JSS1TermSelectScreen()));
      await tester.pumpAndSettle();

      expect(find.text('LANG HUEY'), findsOneWidget);
      expect(find.text('JSS 1 FRENCH'), findsOneWidget);
      expect(find.text('Premier Trimestre'), findsOneWidget);
      expect(find.text('Deuxième Trimestre'), findsOneWidget);
      expect(find.text('Troisième Trimestre'), findsOneWidget);
    });

    testWidgets('2. JSS1WeekRoadmapScreen renders all 9 weeks for Term 1, Term 2, and Term 3', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      // Term 1
      await tester.pumpWidget(wrapTestable(const JSS1WeekRoadmapScreen(term: 1)));
      await tester.pumpAndSettle();
      expect(find.text('SEMAINE 1'), findsOneWidget);
      expect(find.text('SEMAINE 9'), findsOneWidget);

      // Term 2
      await tester.pumpWidget(wrapTestable(const JSS1WeekRoadmapScreen(term: 2)));
      await tester.pumpAndSettle();
      expect(find.text('SEMAINE 1'), findsOneWidget);
      expect(find.text('SEMAINE 9'), findsOneWidget);

      // Term 3
      await tester.pumpWidget(wrapTestable(const JSS1WeekRoadmapScreen(term: 3)));
      await tester.pumpAndSettle();
      expect(find.text('SEMAINE 1'), findsOneWidget);
      expect(find.text('SEMAINE 9'), findsOneWidget);
      expect(find.textContaining('Demander et indiquer'), findsOneWidget);
    });

    testWidgets('3. JSS1LessonPlayerScreen mounts Term 3 Week 1 and cycles 5 phases cleanly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final week1Term3 = JSS1Term3Lessons.weeks[0];
      await tester.pumpWidget(wrapTestable(JSS1LessonPlayerScreen(lesson: week1Term3)));
      await tester.pumpAndSettle();

      // Phase 1: Objectives
      expect(find.text('Fiche Pédagogique du Cours'), findsOneWidget);
      expect(find.text('Objectifs d\'Apprentissage :'), findsOneWidget);

      // Advance to Phase 2: Interactive Lab via Stepper
      final toLabStepper = find.text('2. Lab Interactif');
      expect(toLabStepper, findsOneWidget);
      await tester.tap(toLabStepper);
      await tester.pumpAndSettle();

      // Verify Pattern Widget mounted
      expect(find.text('Baromètre Météo Interactif'), findsOneWidget);

      // Advance to Phase 3: Vocab Lab
      final toVocab = find.text('3. Vocabulaire & Phonétique');
      expect(toVocab, findsOneWidget);
      await tester.tap(toVocab);
      await tester.pumpAndSettle();
      expect(find.textContaining('Banque Vocabulaire'), findsOneWidget);

      // Advance to Phase 4: Classwork
      final toClasswork = find.text('4. Exercices & Évaluation');
      expect(toClasswork, findsOneWidget);
      await tester.tap(toClasswork);
      await tester.pumpAndSettle();
      expect(find.textContaining('Drills Interactifs'), findsOneWidget);

      // Advance to Phase 5: Summary
      final toSummary = find.text('5. Résumé & Devoirs');
      expect(toSummary, findsOneWidget);
      await tester.tap(toSummary);
      await tester.pumpAndSettle();
      expect(find.textContaining('Résumé de la Leçon & Devoirs'), findsOneWidget);
    });

    testWidgets('4. All 9 Term 3 bespoke pattern widgets mount without rendering overflow', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final widgets = [
        JSS1WeatherAndSeasonsStudioWidget(lesson: JSS1Term3Lessons.weeks[0]),
        JSS1FrequencyAdverbsStudioWidget(lesson: JSS1Term3Lessons.weeks[1]),
        JSS1InvitationsStudioWidget(lesson: JSS1Term3Lessons.weeks[2]),
        JSS1CommandsAndProhibitionsStudioWidget(lesson: JSS1Term3Lessons.weeks[3]),
        JSS1PermissionAndAdviceStudioWidget(lesson: JSS1Term3Lessons.weeks[4]),
        JSS1DirectionsAndProceduresStudioWidget(lesson: JSS1Term3Lessons.weeks[5]),
        JSS1CommunicativeRoleplayStudioWidget(lesson: JSS1Term3Lessons.weeks[6]),
        JSS1WrittenOralWorkshopStudioWidget(lesson: JSS1Term3Lessons.weeks[7]),
        JSS1Term3AnnualGrandRallyWidget(lesson: JSS1Term3Lessons.weeks[8]),
      ];

      for (int i = 0; i < widgets.length; i++) {
        await tester.pumpWidget(
          wrapTestable(
            SizedBox(
              width: 1700,
              height: 700,
              child: widgets[i],
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      }
    });
  });
}
