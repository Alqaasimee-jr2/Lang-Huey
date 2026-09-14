import 'package:flutter_test/flutter_test.dart';
import 'package:jss1_french/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('JSS1 French App Smoke Test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'lang_huey_onboarding_completed': true});
    await tester.pumpWidget(const JSS1FrenchApp());
    expect(find.byType(JSS1FrenchApp), findsOneWidget);
  });
}
