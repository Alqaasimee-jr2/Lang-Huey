import 'package:flutter/material.dart';
import 'screens/splash/animated_splash_screen.dart';
import 'screens/term/jss3_term_select_screen.dart';
import 'theme/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const JSS3FrenchApp());
}

class JSS3FrenchApp extends StatelessWidget {
  const JSS3FrenchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lang Huey - JSS 3 French Engine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: LangHueyColors.warmCream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: LangHueyColors.deepTeal,
          primary: LangHueyColors.deepTeal,
          secondary: LangHueyColors.turquoise,
        ),
        useMaterial3: true,
      ),
      home: const AnimatedSplashScreen(),
    );
  }
}
