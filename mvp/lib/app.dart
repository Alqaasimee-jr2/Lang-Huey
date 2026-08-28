import 'package:flutter/material.dart';
import 'models/p4_lesson_model.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/term/p4_term_select_screen.dart';
import 'screens/roadmap/p4_week_roadmap_screen.dart';
import 'screens/lesson/p4_lesson_player_screen.dart';
import 'theme/colors.dart';

class LangHueyApp extends StatelessWidget {
  const LangHueyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lang Huey — Primary 4 French',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: LHColors.cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: LHColors.teal,
          primary: LHColors.teal,
          secondary: LHColors.turquoise,
          surface: LHColors.cream,
        ),
      ),
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/splash':
            return MaterialPageRoute(builder: (_) => const SplashScreen());
          case '/p4_terms':
            return MaterialPageRoute(builder: (_) => const P4TermSelectScreen());
          case '/p4_roadmap':
            final termNumber = settings.arguments as int? ?? 1;
            return MaterialPageRoute(
              builder: (_) => P4WeekRoadmapScreen(termNumber: termNumber),
            );
          case '/p4_player':
            final lesson = settings.arguments as P4Lesson;
            return MaterialPageRoute(
              builder: (_) => P4LessonPlayerScreen(lesson: lesson),
            );
          default:
            return MaterialPageRoute(builder: (_) => const P4TermSelectScreen());
        }
      },
    );
  }
}
