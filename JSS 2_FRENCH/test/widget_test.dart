import 'package:flutter_test/flutter_test.dart';
import 'package:jss2_french/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('JSS2 French App Smoke Test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'lang_huey_onboarding_completed': true});
    await tester.pumpWidget(const JSS2FrenchApp());
    expect(find.byType(JSS2FrenchApp), findsOneWidget);
  });
}
