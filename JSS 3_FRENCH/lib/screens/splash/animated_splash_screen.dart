import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/mascot/lang_huey_mascot_head_widget.dart';
import '../onboarding/onboarding_screen.dart';
import '../term/jss3_term_select_screen.dart';

class AnimatedSplashScreen extends StatefulWidget {
  final String editionLabel;

  const AnimatedSplashScreen({
    super.key,
    this.editionLabel = 'JSS 3 FRENCH',
  });

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _entranceController;
  late AnimationController _floatController;
  late AnimationController _dotsController;
  Timer? _navTimer;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();

    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000),
    )..repeat(reverse: true);

    _dotsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat();

    _navTimer = Timer(const Duration(milliseconds: 2800), _checkAndNavigate);
  }

  Future<void> _checkAndNavigate() async {
    if (!mounted || _hasNavigated) return;
    _hasNavigated = true;

    final prefs = await SharedPreferences.getInstance();
    final hasCompleted = (prefs.getBool('lang_huey_onboarding_completed') ?? false) ||
        (prefs.getBool('intro_seen') ?? false);

    if (!mounted) return;

    if (hasCompleted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const JSS3TermSelectScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const OnboardingScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    }
  }

  @override
  void dispose() {
    _navTimer?.cancel();
    _entranceController.dispose();
    _floatController.dispose();
    _dotsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _checkAndNavigate,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.0, -0.24),
              radius: 1.1,
              colors: [
                Color(0xFF0F8489),
                Color(0xFF0D7377),
                Color(0xFF0A5A5D),
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ..._buildFloatingCircles(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: CurvedAnimation(
                      parent: _entranceController,
                      curve: Curves.elasticOut,
                    ),
                    child: const LangHueyMascotHeadWidget(
                      size: 210,
                      isLightHead: true,
                      isTalking: false,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _entranceController,
                      curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
                    ),
                    child: Text.rich(
                      const TextSpan(
                        text: 'Lang ',
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFF5F0E8),
                          letterSpacing: -1.0,
                        ),
                        children: [
                          TextSpan(
                            text: 'Huey',
                            style: TextStyle(
                              fontSize: 52,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFF4A832),
                              letterSpacing: -1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _entranceController,
                      curve: const Interval(0.55, 1.0, curve: Curves.easeOut),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF14BDCC).withOpacity(0.18),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF14BDCC).withOpacity(0.45),
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        widget.editionLabel,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF14BDCC),
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  _buildLoadingDots(),
                ],
              ),
              Positioned(
                bottom: 24,
                child: Text(
                  'Tap anywhere to continue',
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFFF5F0E8).withOpacity(0.4),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFloatingCircles() {
    final circles = [
      {'size': 90.0, 'top': 0.12, 'left': 0.10, 'drift': 24.0},
      {'size': 50.0, 'top': 0.70, 'left': 0.14, 'drift': -20.0},
      {'size': 70.0, 'top': 0.18, 'left': 0.84, 'drift': -26.0},
      {'size': 42.0, 'top': 0.74, 'left': 0.80, 'drift': 18.0},
      {'size': 32.0, 'top': 0.45, 'left': 0.06, 'drift': 15.0},
      {'size': 26.0, 'top': 0.48, 'left': 0.92, 'drift': -16.0},
    ];

    return circles.map((c) {
      return AnimatedBuilder(
        animation: _floatController,
        builder: (context, child) {
          final drift = math.sin(_floatController.value * math.pi * 2) * (c['drift'] as double);
          return Positioned(
            top: MediaQuery.of(context).size.height * (c['top'] as double) + drift,
            left: MediaQuery.of(context).size.width * (c['left'] as double),
            child: Container(
              width: c['size'] as double,
              height: c['size'] as double,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF14BDCC).withOpacity(0.12),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  Widget _buildLoadingDots() {
    return AnimatedBuilder(
      animation: _dotsController,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            final delay = index * 0.2;
            final t = (_dotsController.value - delay) % 1.0;
            final bounceY = math.sin(t * math.pi) * -8.0;
            final opacity = 0.45 + (math.sin(t * math.pi).clamp(0.0, 1.0) * 0.55);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Transform.translate(
                offset: Offset(0, bounceY < 0 ? bounceY : 0),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF14BDCC).withOpacity(opacity.clamp(0.2, 1.0)),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
