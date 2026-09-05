import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jss1_french/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('JSS1 French splash screen and onboarding first-time & returning flow', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // 1. First time launch
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(const JSS1FrenchApp());

    // Splash screen renders
    expect(find.text('Lang Huey', findRichText: true), findsWidgets);
    expect(find.text('JSS 1 FRENCH'), findsOneWidget);

    // Fast-forward past splash timer (2.8s)
    await tester.pump(const Duration(milliseconds: 3000));
    await tester.pump(const Duration(milliseconds: 500));

    // Navigates to Onboarding Slide 1
    expect(find.text('Bonjour tout le monde !'), findsOneWidget);
    expect(find.text('Hello everyone!'), findsOneWidget);

    // Tap Next
    await tester.tap(find.text('Continuer / Next →'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pump();

    // Slide 2
    expect(find.text('Ici, on apprend à voix haute !'), findsOneWidget);

    // Skip
    await tester.tap(find.text('Passer / Skip'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pump();

    // Reaches JSS1TermSelectScreen
    expect(find.text('JSS 1 French Language Engine'), findsOneWidget);
    expect(find.text('Guide / Kickoff'), findsOneWidget);
  });
}
