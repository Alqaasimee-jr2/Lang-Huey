import 'package:flutter/material.dart';
import '../../data/french_lessons.dart';
import '../../models/lesson.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class LessonSelectScreen extends StatelessWidget {
  const LessonSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LHColors.teal,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Container(
          color: LHColors.teal,
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Lang Huey',
                      style: LHText.subheading(LHColors.white).copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: LHColors.turquoise.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'SMARTBOARD EDITION',
                        style: LHText.label(LHColors.turquoise),
                      ),
                    ),
                  ],
                ),
                Text(
                  'JSS1 French — Term 1',
                  style: LHText.body(LHColors.turquoise).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Lesson to Begin',
              style: LHText.heading(LHColors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'NERDC Nigerian Secondary School Curriculum (Weeks 1 to 12)',
              style: LHText.body(LHColors.turquoise),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.separated(
                itemCount: frenchLessons.length,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final lesson = frenchLessons[index];
                  return _buildLessonCard(context, lesson, index + 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonCard(BuildContext context, Lesson lesson, int number) {
    final String formattedNum = number < 10 ? '0$number' : '$number';

    return Material(
      color: LHColors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/player',
            arguments: lesson,
          );
        },
        child: Container(
          padding: const EdgeInsets.all(28),
          child: Row(
            children: [
              // Lesson Number Badge
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: LHColors.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    formattedNum,
                    style: LHText.subheading(LHColors.teal).copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 24),

              // Title and details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: LHText.subheading(LHColors.charcoal),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.collections_bookmark_rounded,
                            size: 20, color: LHColors.turquoise),
                        const SizedBox(width: 6),
                        Text(
                          '${lesson.items.length} Vocabulary Items · ${lesson.checkQuestions.length} Check Questions',
                          style: LHText.body(LHColors.grey).copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Gold Play Button
              Container(
                width: 68,
                height: 68,
                decoration: const BoxDecoration(
                  color: LHColors.gold,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x33F4A832),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 40,
                  color: LHColors.charcoal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
