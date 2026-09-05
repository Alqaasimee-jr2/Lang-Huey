import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash/animated_splash_screen.dart';
import 'screens/term/jss1_term_select_screen.dart';
import 'theme/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const JSS1FrenchApp());
}

class JSS1FrenchApp extends StatelessWidget {
  const JSS1FrenchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lang Huey - JSS1 French',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: JSS1Colors.cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: JSS1Colors.teal,
          primary: JSS1Colors.teal,
          secondary: JSS1Colors.turquoise,
          surface: JSS1Colors.cream,
        ),
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      home: const AnimatedSplashScreen(),
    );
  }
}
