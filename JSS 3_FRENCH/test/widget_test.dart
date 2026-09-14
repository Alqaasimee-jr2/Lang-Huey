import 'package:flutter_test/flutter_test.dart';
import 'package:jss3_french/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('JSS3 French App Smoke Test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'lang_huey_onboarding_completed': true});
    await tester.pumpWidget(const JSS3FrenchApp());
    expect(find.byType(JSS3FrenchApp), findsOneWidget);
  });
}
