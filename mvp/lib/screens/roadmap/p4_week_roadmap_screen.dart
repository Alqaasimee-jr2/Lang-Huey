import 'package:flutter/material.dart';
import '../../data/p4_term1_lessons.dart';
import '../../data/p4_term2_lessons.dart';
import '../../data/p4_term3_lessons.dart';
import '../../models/p4_lesson_model.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class P4WeekRoadmapScreen extends StatelessWidget {
  final int termNumber;

  const P4WeekRoadmapScreen({super.key, required this.termNumber});

  @override
  Widget build(BuildContext context) {
    final List<P4Lesson> lessons = termNumber == 3
        ? P4Term3Lessons.weeks
        : termNumber == 2
            ? P4Term2Lessons.weeks
            : p4Term1Lessons;
    final termTheme = termNumber == 3
        ? 'Term 3: Telling Time, Daily Routine, Meals, Body Anatomy, Clothes & Weather (Weeks 1 to 13)'
        : termNumber == 2
            ? 'Term 2: Family Members, School Environment, Objects, Prepositions & Colors (Weeks 1 to 13)'
            : 'Term 1: Identity, Greetings, Numbers 1–20 & African Francophone Geography (Weeks 1 to 13)';

    return Scaffold(
      backgroundColor: LHColors.teal,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(88),
        child: Container(
          color: LHColors.teal,
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(
                      color: LHColors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => Navigator.pop(context),
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.arrow_back_rounded, color: LHColors.white, size: 24),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Lang Huey · Smartboard Edition',
                          style: LHText.label(LHColors.turquoise).copyWith(fontSize: 12),
                        ),
                        Text(
                          'Grade 4 / Primary 4 French — Term $termNumber',
                          style: LHText.subheading(LHColors.white).copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: LHColors.turquoise.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: LHColors.turquoise.withOpacity(0.4)),
                  ),
                  child: Text(
                    'NERDC NIGERIAN CURRICULUM',
                    style: LHText.label(LHColors.turquoise).copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Week to Launch Smartboard Lesson',
              style: LHText.heading(LHColors.white).copyWith(fontSize: 28),
            ),
            const SizedBox(height: 4),
            Text(
              termTheme,
              style: LHText.body(LHColors.turquoise).copyWith(fontSize: 16),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.separated(
                itemCount: lessons.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final lesson = lessons[index];
                  return _buildWeekCard(context, lesson);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekCard(BuildContext context, P4Lesson lesson) {
    final weekNum = lesson.week < 10 ? '0${lesson.week}' : '${lesson.week}';
    final isSpecial = lesson.week == 5 || lesson.week == 6 || lesson.week == 11 || lesson.week == 12 || lesson.week == 13;

    return Material(
      color: LHColors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/p4_player',
            arguments: lesson,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Row(
            children: [
              // Week Badge
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: isSpecial ? LHColors.gold.withOpacity(0.2) : LHColors.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSpecial ? LHColors.gold : LHColors.teal.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    weekNum,
                    style: LHText.subheading(isSpecial ? LHColors.charcoal : LHColors.teal).copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 20),

              // Title and details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lesson.theme,
                      style: LHText.body(LHColors.grey).copyWith(fontSize: 15),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // Action Arrow / Launch Button
              Container(
                width: 54,
                height: 54,
                decoration: const BoxDecoration(
                  color: LHColors.gold,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x33F4A832),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 34,
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
