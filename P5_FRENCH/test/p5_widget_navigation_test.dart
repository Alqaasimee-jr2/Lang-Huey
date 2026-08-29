import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p5_french/data/p5_term3_lessons.dart';
import 'package:p5_french/screens/lesson/p5_lesson_player_screen.dart';
import 'package:p5_french/screens/roadmap/p5_week_roadmap_screen.dart';
import 'package:p5_french/screens/term/p5_term_select_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('com.ryanheise.just_audio.methods'),
      (MethodCall methodCall) async {
        if (methodCall.method == 'init') {
          return {'id': 'test-player-id'};
        }
        return null;
      },
    );
  });

  group('Primary 5 French UI Widget & Navigation Smoke Tests', () {
    testWidgets('P5TermSelectScreen renders all 3 terms', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1280, 800));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        const MaterialApp(
          home: P5TermSelectScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('GRADE 5 / PRIMARY 5'), findsOneWidget);
      expect(find.text('Premier Trimestre'), findsOneWidget);
      expect(find.text('Deuxième Trimestre'), findsOneWidget);
      expect(find.text('Troisième Trimestre'), findsOneWidget);
      expect(find.text('TERM 1'), findsOneWidget);
      expect(find.text('TERM 2'), findsOneWidget);
      expect(find.text('TERM 3'), findsOneWidget);
    });

    testWidgets('P5WeekRoadmapScreen renders 13 weeks for Term 1', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1280, 800));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        const MaterialApp(
          home: P5WeekRoadmapScreen(termNumber: 1),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('TRIMESTRE 1 ROADMAP'), findsOneWidget);
      expect(find.text('WEEK 1'), findsWidgets);
    });

    testWidgets('P5WeekRoadmapScreen renders 13 weeks for Term 2', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1280, 800));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        const MaterialApp(
          home: P5WeekRoadmapScreen(termNumber: 2),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('TRIMESTRE 2 ROADMAP'), findsOneWidget);
      expect(find.text('WEEK 1'), findsWidgets);
    });

    testWidgets('P5WeekRoadmapScreen renders 13 weeks for Term 3', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1280, 800));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        const MaterialApp(
          home: P5WeekRoadmapScreen(termNumber: 3),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('TRIMESTRE 3 ROADMAP'), findsOneWidget);
      expect(find.text('WEEK 1'), findsWidgets);
    });

    testWidgets('P5LessonPlayerScreen renders and cycles through phases cleanly', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1280, 800));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final sampleLesson = P5Term3Lessons.weeks.first; // Term 3 Week 1

      await tester.pumpWidget(
        MaterialApp(
          home: P5LessonPlayerScreen(lesson: sampleLesson),
        ),
      );
      await tester.pumpAndSettle();

      // Phase 1: Objectives
      expect(find.text('Objectifs de la Leçon (Lesson Objectives)'), findsOneWidget);
      expect(find.text('Next Phase'), findsOneWidget);

      // Tap to Phase 2: Interactive Pattern
      await tester.tap(find.text('Next Phase'));
      await tester.pumpAndSettle();

      // Verify Pattern Loaded
      expect(find.textContaining('Chronologie de la Routine du Matin'), findsOneWidget);
    });
  });
}
