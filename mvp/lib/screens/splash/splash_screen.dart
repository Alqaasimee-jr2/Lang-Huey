import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..forward();

    _timer = Timer(const Duration(milliseconds: 2600), _checkIntroAndNavigate);
  }

  Future<void> _checkIntroAndNavigate() async {
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/p4_terms');
  }

  @override
  void dispose() {
    _timer?.cancel();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LHColors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lang Huey',
              style: LHText.display(LHColors.white),
            ),
            const SizedBox(height: 12),
            Text(
              'Grade 4 / Primary 4 French Edition',
              style: LHText.subheading(LHColors.turquoise),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: 480,
              height: 8,
              child: AnimatedBuilder(
                animation: _progressController,
                builder: (context, child) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: _progressController.value,
                      backgroundColor: LHColors.teal.withOpacity(0.4),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        LHColors.gold,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'OFFLINE LESSON DELIVERY SYSTEM',
              style: LHText.label(LHColors.white.withOpacity(0.7)),
            ),
          ],
        ),
      ),
    );
  }
}
