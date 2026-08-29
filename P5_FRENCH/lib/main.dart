import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/term/p5_term_select_screen.dart';
import 'theme/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const P5FrenchApp());
}

class P5FrenchApp extends StatelessWidget {
  const P5FrenchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lang Huey - Primary 5 French',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: P5Colors.cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: P5Colors.teal,
          primary: P5Colors.teal,
          secondary: P5Colors.turquoise,
          surface: P5Colors.cream,
        ),
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      home: const P5TermSelectScreen(),
    );
  }
}
