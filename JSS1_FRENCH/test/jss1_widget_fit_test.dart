import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jss1_french/data/jss1_term1_lessons.dart';
import 'package:jss1_french/screens/lesson/jss1_lesson_player_screen.dart';
import 'package:jss1_french/screens/roadmap/jss1_week_roadmap_screen.dart';
import 'package:jss1_french/screens/term/jss1_term_select_screen.dart';
import 'package:jss1_french/widgets/patterns/term1/jss1_character_portrait_studio_widget.dart';
import 'package:jss1_french/widgets/patterns/term1/jss1_classroom_commands_widget.dart';
import 'package:jss1_french/widgets/patterns/term1/jss1_greeting_studio_widget.dart';
import 'package:jss1_french/widgets/patterns/term1/jss1_hobbies_and_leisure_widget.dart';
import 'package:jss1_french/widgets/patterns/term1/jss1_present_others_studio_widget.dart';
import 'package:jss1_french/widgets/patterns/term1/jss1_self_intro_studio_widget.dart';
import 'package:jss1_french/widgets/patterns/term1/jss1_spelling_and_dictation_widget.dart';
import 'package:jss1_french/widgets/patterns/term1/jss1_tastes_and_preferences_widget.dart';
import 'package:jss1_french/widgets/patterns/term1/jss1_term1_revision_rally_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget wrapTestable(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('JSS1 French UI Widget & Interactive Fit Tests (Classes & Revision Only)', () {
    testWidgets('1. JSS1TermSelectScreen mounts and renders 3 terms with JSS1 badge', (tester) async {
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

    testWidgets('2. JSS1WeekRoadmapScreen renders all 9 weeks for Term 1', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(wrapTestable(const JSS1WeekRoadmapScreen(term: 1)));
      await tester.pumpAndSettle();

      expect(find.text('SEMAINE 1'), findsOneWidget);
      expect(find.text('SEMAINE 9'), findsOneWidget);
    });

    testWidgets('3. JSS1LessonPlayerScreen mounts Week 1 and cycles 5 phases cleanly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final week1 = JSS1Term1Lessons.weeks[0];
      await tester.pumpWidget(wrapTestable(JSS1LessonPlayerScreen(lesson: week1)));
      await tester.pumpAndSettle();

      // Phase 1: Objectives
      expect(find.text('Fiche Pédagogique du Cours'), findsOneWidget);
      expect(find.text('Objectifs d\'Apprentissage :'), findsOneWidget);

      // Advance to Phase 2: Interactive Lab via Stepper
      final toLabStepper = find.text('2. Lab Interactif');
      expect(toLabStepper, findsOneWidget);
      await tester.tap(toLabStepper);
      await tester.pumpAndSettle();

      expect(find.byType(JSS1ClassroomCommandsWidget), findsOneWidget);

      // Advance to Phase 3: Vocab Bank via Stepper
      final toVocabStepper = find.text('3. Vocabulaire & Phonétique');
      expect(toVocabStepper, findsOneWidget);
      await tester.tap(toVocabStepper);
      await tester.pumpAndSettle();

      expect(find.text('Cliquez pour écouter'), findsOneWidget);

      // Advance to Phase 4: Classwork via Stepper
      final toClassworkStepper = find.text('4. Exercices & Évaluation');
      expect(toClassworkStepper, findsOneWidget);
      await tester.tap(toClassworkStepper);
      await tester.pumpAndSettle();

      expect(find.textContaining('Drills Interactifs en Classe'), findsOneWidget);

      // Advance to Phase 5: Summary via Stepper
      final toSummaryStepper = find.text('5. Résumé & Devoirs');
      expect(toSummaryStepper, findsOneWidget);
      await tester.tap(toSummaryStepper);
      await tester.pumpAndSettle();

      expect(find.text('Résumé de la Leçon & Devoirs à Domicile'), findsOneWidget);
      expect(find.text('Devoir Écrit'), findsOneWidget);
    });

    testWidgets('4. All 9 Bespoke Teaching & Revision Pattern Widgets mount & render without layout errors', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final List<Widget> patternWidgets = [
        JSS1ClassroomCommandsWidget(lesson: JSS1Term1Lessons.weeks[0]),
        JSS1GreetingStudioWidget(lesson: JSS1Term1Lessons.weeks[1]),
        JSS1SelfIntroStudioWidget(lesson: JSS1Term1Lessons.weeks[2]),
        JSS1SpellingAndDictationWidget(lesson: JSS1Term1Lessons.weeks[3]),
        JSS1PresentOthersStudioWidget(lesson: JSS1Term1Lessons.weeks[4]),
        JSS1CharacterPortraitStudioWidget(lesson: JSS1Term1Lessons.weeks[5]),
        JSS1HobbiesAndLeisureWidget(lesson: JSS1Term1Lessons.weeks[6]),
        JSS1TastesAndPreferencesWidget(lesson: JSS1Term1Lessons.weeks[7]),
        JSS1Term1RevisionRallyWidget(lesson: JSS1Term1Lessons.weeks[8]),
      ];

      for (int i = 0; i < patternWidgets.length; i++) {
        await tester.pumpWidget(wrapTestable(patternWidgets[i]));
        await tester.pumpAndSettle();

        expect(find.byWidget(patternWidgets[i]), findsOneWidget);
      }
    });

    testWidgets('5. Interactive Pattern Widget actions (Selection & Game Mode) respond cleanly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      // Test Week 1 Classroom Command Action Game toggle
      final w1Widget = JSS1ClassroomCommandsWidget(lesson: JSS1Term1Lessons.weeks[0]);
      await tester.pumpWidget(wrapTestable(w1Widget));
      await tester.pumpAndSettle();

      final gameBtn = find.text('Lancer le Jeu');
      expect(gameBtn, findsOneWidget);
      await tester.tap(gameBtn);
      await tester.pumpAndSettle();

      expect(find.text('Mode Tableau'), findsOneWidget);

      // Test Week 2 Greeting Studio
      final w2Widget = JSS1GreetingStudioWidget(lesson: JSS1Term1Lessons.weeks[1]);
      await tester.pumpWidget(wrapTestable(w2Widget));
      await tester.pumpAndSettle();

      expect(find.text('Studio de Salutations & Politesse'), findsOneWidget);
    });
  });
}
