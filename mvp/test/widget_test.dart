import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lang_huey/app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Splash screen loads and navigates to Onboarding on first launch', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // First time launch: onboarding not completed
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(const LangHueyApp());

    // Verify splash screen renders title and edition badge
    expect(find.text('Lang Huey', findRichText: true), findsWidgets);
    expect(find.text('PRIMARY 4 FRENCH'), findsOneWidget);

    // Fast-forward past splash timer (2.8s)
    await tester.pump(const Duration(milliseconds: 3000));
    await tester.pump(const Duration(milliseconds: 500)); // route transition

    // Should navigate to Onboarding screen (Slide 1)
    expect(find.text('Bonjour tout le monde !'), findsOneWidget);
    expect(find.text('Hello everyone!'), findsOneWidget);

    // Tap Next to go to Slide 2
    await tester.tap(find.text('Continuer / Next →'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pump();

    // Verify Slide 2 content
    expect(find.text('Ici, on apprend à voix haute !'), findsOneWidget);
    expect(find.text('Here, we learn out loud!'), findsOneWidget);

    // Tap Skip button
    await tester.tap(find.text('Passer / Skip'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pump();

    // Should arrive at P4TermSelectScreen
    expect(find.text('Premier Trimestre'), findsOneWidget);
    expect(find.text('Deuxième Trimestre'), findsOneWidget);
    expect(find.text('Troisième Trimestre'), findsOneWidget);
  });

  testWidgets('Splash screen fast-tracks returning user directly to Term Select', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Returning user
    SharedPreferences.setMockInitialValues({'lang_huey_onboarding_completed': true});

    await tester.pumpWidget(const LangHueyApp());

    // Verify splash screen
    expect(find.text('Lang Huey', findRichText: true), findsWidgets);

    // Fast-forward past splash timer (2.8s)
    await tester.pump(const Duration(milliseconds: 3000));
    await tester.pump(const Duration(milliseconds: 500)); // route transition

    // Navigates directly to Term Select screen
    expect(find.text('Premier Trimestre'), findsOneWidget);
    expect(find.text('Deuxième Trimestre'), findsOneWidget);
    expect(find.text('Guide / Kickoff'), findsOneWidget);

    // Tap Guide / Kickoff to reopen onboarding
    await tester.tap(find.text('Guide / Kickoff'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pump();

    // Verify onboarding opens in replay mode
    expect(find.text('Bonjour tout le monde !'), findsOneWidget);
    expect(find.text('Fermer / Close'), findsOneWidget);

    // Tap Fermer / Close to return
    await tester.tap(find.text('Fermer / Close'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pump();

    // Back at Term Select screen
    expect(find.text('Premier Trimestre'), findsOneWidget);
  });
}
