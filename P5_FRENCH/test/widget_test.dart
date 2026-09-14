import 'package:flutter_test/flutter_test.dart';
import 'package:p5_french/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('P5 French App Smoke Test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'lang_huey_onboarding_completed': true});
    await tester.pumpWidget(const P5FrenchApp());
    expect(find.byType(P5FrenchApp), findsOneWidget);
  });
}
