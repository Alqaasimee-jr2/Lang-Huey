// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lang_huey/app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Lang Huey smoke test loads splash screen and navigates', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    SharedPreferences.setMockInitialValues({'intro_seen': true});

    // Build our app
    await tester.pumpWidget(const LangHueyApp());

    // Verify splash screen renders title
    expect(find.text('Lang Huey'), findsWidgets);

    // Fast-forward animation & timer
    await tester.pumpAndSettle(const Duration(seconds: 4));

    // Verify navigation reached lesson menu
    expect(find.text('Select a Lesson to Begin'), findsOneWidget);

    // Tap the first lesson to open player
    await tester.tap(find.text('Les expressions de salutation (Greetings)'));
    await tester.pumpAndSettle();

    // Verify player opens directly on first vocabulary item (Bonjour)
    expect(find.text('Bonjour'), findsOneWidget);
    expect(find.text('Good morning / Hello'), findsOneWidget);

    // Verify Teacher Cue bar is NOT present
    expect(find.text('TEACHER CUE'), findsNothing);

    // Tap Next
    await tester.tap(find.text('NEXT ▶'));
    await tester.pumpAndSettle();

    // Verify next vocab item (Bonsoir)
    expect(find.text('Bonsoir'), findsOneWidget);
  });
}
