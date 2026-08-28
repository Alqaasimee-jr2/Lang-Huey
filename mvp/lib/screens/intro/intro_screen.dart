import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Future<void> _completeIntro() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('intro_seen', true);
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/menu');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildPage1(),
              _buildPage2(),
            ],
          ),

          // Skip Button Top Right
          Positioned(
            top: 48,
            right: 48,
            child: TextButton(
              onPressed: _completeIntro,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                backgroundColor: Colors.black.withOpacity(0.08),
                shape: const StampPillShape(),
              ),
              child: Text(
                'SKIP',
                style: LHText.label(
                  _currentPage == 0 ? LHColors.charcoal : LHColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage1() {
    return Container(
      color: LHColors.cream,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Row(
        children: [
          // Left Content
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: LHColors.teal.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'STEP 1 OF 2 · TEACHER MANUAL GUIDE',
                    style: LHText.label(LHColors.teal),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Any staff member can run a French class.',
                  style: LHText.heading(LHColors.charcoal),
                ),
                const SizedBox(height: 20),
                Text(
                  'Teachers follow along with the step-by-step printed lesson manual. Every pronunciation, translation, and classroom activity is clearly guided with zero French experience needed.',
                  style: LHText.body(LHColors.charcoal.withOpacity(0.85)),
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    _buildDot(true),
                    const SizedBox(width: 8),
                    _buildDot(false),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LHColors.teal,
                        foregroundColor: LHColors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text('NEXT', style: LHText.label(LHColors.white)),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 60),

          // Right Graphic Illustration Placeholder
          Expanded(
            flex: 5,
            child: Container(
              height: 440,
              decoration: BoxDecoration(
                color: LHColors.teal.withOpacity(0.08),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: LHColors.teal.withOpacity(0.2)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.menu_book_rounded,
                      size: 100, color: LHColors.teal),
                  const SizedBox(height: 24),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: LHColors.teal,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'TEACHER\'S COMPANION MANUAL',
                          style: LHText.label(LHColors.gold).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Full lesson plans, pronunciation guides & classroom prompts in your hands.',
                          textAlign: TextAlign.center,
                          style: LHText.body(LHColors.white).copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage2() {
    return Container(
      color: LHColors.teal,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Row(
        children: [
          // Left Content
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: LHColors.turquoise.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'STEP 2 OF 2 · 100% OFFLINE',
                    style: LHText.label(LHColors.turquoise),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Fully offline. Always ready.',
                  style: LHText.heading(LHColors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  'No internet. No dropped virtual calls. No monthly subscriptions. Lang Huey runs directly on your smartboard whether the WiFi works or not.',
                  style: LHText.body(LHColors.white.withOpacity(0.9)),
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    _buildDot(false, light: true),
                    const SizedBox(width: 8),
                    _buildDot(true, light: true),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: _completeIntro,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LHColors.gold,
                        foregroundColor: LHColors.charcoal,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 22,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        elevation: 4,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'GET STARTED',
                            style: LHText.label(LHColors.charcoal).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.check_circle_rounded,
                              color: LHColors.charcoal),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 60),

          // Right Graphic Illustration Placeholder
          Expanded(
            flex: 5,
            child: Container(
              height: 440,
              decoration: BoxDecoration(
                color: LHColors.turquoise.withOpacity(0.15),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: LHColors.turquoise.withOpacity(0.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off_rounded,
                      size: 100, color: LHColors.turquoise),
                  const SizedBox(height: 24),
                  Text(
                    'Zero Internet Required',
                    style: LHText.subheading(LHColors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'All audio & curriculum bundled inside',
                    style: LHText.body(LHColors.turquoise),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool active, {bool light = false}) {
    return Container(
      width: active ? 32 : 12,
      height: 12,
      decoration: BoxDecoration(
        color: active
            ? (light ? LHColors.gold : LHColors.teal)
            : (light
                ? LHColors.white.withOpacity(0.3)
                : LHColors.charcoal.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

class StampPillShape extends OutlinedBorder {
  const StampPillShape();
  @override
  OutlinedBorder copyWith({BorderSide? side}) => const StampPillShape();
  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(20)));
  }
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}
  @override
  ShapeBorder scale(double t) => const StampPillShape();
}
