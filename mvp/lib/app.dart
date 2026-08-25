import 'package:flutter/material.dart';
import 'models/lesson.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/intro/intro_screen.dart';
import 'screens/menu/lesson_select_screen.dart';
import 'screens/player/lesson_player_screen.dart';
import 'screens/summary/lesson_summary_screen.dart';
import 'theme/colors.dart';

class LangHueyApp extends StatelessWidget {
  const LangHueyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lang Huey',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
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
          case '/intro':
            return MaterialPageRoute(builder: (_) => const IntroScreen());
          case '/menu':
            return MaterialPageRoute(builder: (_) => const LessonSelectScreen());
          case '/player':
            final lesson = settings.arguments as Lesson;
            return MaterialPageRoute(
              builder: (_) => LessonPlayerScreen(lesson: lesson),
            );
          case '/summary':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => LessonSummaryScreen(
                lesson: args['lesson'] as Lesson,
                correctCount: args['correctCount'] as int,
              ),
            );
          default:
            return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
      },
    );
  }
}
