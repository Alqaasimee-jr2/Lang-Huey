import 'package:flutter/material.dart';
import '../../models/lesson.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class LessonSummaryScreen extends StatefulWidget {
  final Lesson lesson;
  final int correctCount;

  const LessonSummaryScreen({
    super.key,
    required this.lesson,
    required this.correctCount,
  });

  @override
  State<LessonSummaryScreen> createState() => _LessonSummaryScreenState();
}

class _LessonSummaryScreenState extends State<LessonSummaryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int vocabCount = widget.lesson.items.length;
    final int questionCount = widget.lesson.checkQuestions.length;
    final int percentage = questionCount > 0
        ? ((widget.correctCount / questionCount) * 100).round()
        : 100;

    return Scaffold(
      backgroundColor: LHColors.teal,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Gold Checkmark Icon
                ScaleTransition(
                  scale: CurvedAnimation(
                    parent: _scaleController,
                    curve: Curves.elasticOut,
                  ),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: LHColors.gold,
                      shape: BoxShape.circle,
                      shadows: [
                        BoxShadow(
                          color: Color(0x40F4A832),
                          blurRadius: 24,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      size: 80,
                      color: LHColors.charcoal,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                Text(
                  'Lesson Complete!',
                  style: LHText.display(LHColors.white),
                ),

                const SizedBox(height: 8),

                Text(
                  widget.lesson.title,
                  style: LHText.subheading(LHColors.turquoise),
                ),

                const SizedBox(height: 48),

                // Stat Cards Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatCard(
                      label: 'WORDS COVERED',
                      value: '$vocabCount',
                      icon: Icons.translate_rounded,
                    ),
                    const SizedBox(width: 24),
                    _buildStatCard(
                      label: 'CHECK QUESTIONS',
                      value: '$questionCount',
                      icon: Icons.quiz_rounded,
                    ),
                    const SizedBox(width: 24),
                    _buildStatCard(
                      label: 'CLASS ACCURACY',
                      value: '$percentage%',
                      icon: Icons.stars_rounded,
                    ),
                  ],
                ),

                const SizedBox(height: 60),

                // Return to Lessons Gold Pill Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/menu',
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LHColors.gold,
                    foregroundColor: LHColors.charcoal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 22,
                    ),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  icon: const Icon(Icons.menu_book_rounded,
                      color: LHColors.charcoal, size: 28),
                  label: Text(
                    'RETURN TO LESSONS',
                    style: LHText.label(LHColors.charcoal).copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Container(
      width: 280,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: LHColors.teal, size: 36),
          const SizedBox(height: 12),
          Text(
            value,
            style: LHText.display(LHColors.teal).copyWith(
              fontSize: 52,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: LHText.label(LHColors.grey).copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
