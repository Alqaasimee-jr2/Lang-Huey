import 'package:flutter/material.dart';
import '../../data/p5_term1_lessons.dart';
import '../../data/p5_term2_lessons.dart';
import '../../data/p5_term3_lessons.dart';
import '../../models/p5_lesson_model.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../lesson/p5_lesson_player_screen.dart';

class P5WeekRoadmapScreen extends StatelessWidget {
  final int termNumber;

  const P5WeekRoadmapScreen({super.key, required this.termNumber});

  @override
  Widget build(BuildContext context) {
    final List<P5Lesson> lessons = termNumber == 1
        ? P5Term1Lessons.weeks
        : termNumber == 2
            ? P5Term2Lessons.weeks
            : P5Term3Lessons.weeks;
    final termTheme = termNumber == 1
        ? 'Term 1: Numbers 21–60, Presenting Others & Body Anatomy (Weeks 1 to 13)'
        : termNumber == 2
            ? 'Term 2: Extended Family, Neighbors & Weekly Timetable (Weeks 1 to 13)'
            : 'Term 3: Daily Routine, Sports, School Subjects & Careers (Weeks 1 to 13)';

    return Scaffold(
      backgroundColor: P5Colors.teal,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(88),
        child: Container(
          color: P5Colors.teal,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_rounded, color: P5Colors.white, size: 28),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PRIMARY 5 FRENCH • TERM $termNumber ROADMAP',
                              style: P5Text.caption(P5Colors.turquoise).copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.1,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              termTheme,
                              style: P5Text.heading(P5Colors.white).copyWith(fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: P5Colors.gold,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${lessons.length} WEEKS READY',
                    style: P5Text.body(P5Colors.charcoal).copyWith(fontWeight: FontWeight.w900, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: P5Colors.cream,
        child: GridView.builder(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            childAspectRatio: 1.65,
          ),
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            final lesson = lessons[index];
            final isExamOrBreak = lesson.week == 5 || lesson.week == 6 || lesson.week == 11 || lesson.week == 12 || lesson.week == 13;

            return Material(
              color: P5Colors.white,
              borderRadius: BorderRadius.circular(20),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => P5LessonPlayerScreen(lesson: lesson),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: isExamOrBreak ? P5Colors.gold.withOpacity(0.25) : P5Colors.teal.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'WEEK ${lesson.week}',
                              style: TextStyle(
                                color: isExamOrBreak ? P5Colors.orange : P5Colors.teal,
                                fontWeight: FontWeight.w900,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.record_voice_over_rounded, size: 16, color: P5Colors.teal.withOpacity(0.6)),
                              const SizedBox(width: 4),
                              Text(
                                '${lesson.vocabItems.length} words',
                                style: P5Text.caption(P5Colors.charcoal).copyWith(fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        lesson.topic,
                        style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w800),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: Text(
                          lesson.subtitle,
                          style: P5Text.caption(P5Colors.charcoal).copyWith(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Divider(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${lesson.classworkExercises.length} Practice Drills',
                            style: P5Text.caption(P5Colors.teal).copyWith(fontWeight: FontWeight.w700, fontSize: 11),
                          ),
                          const CircleAvatar(
                            radius: 12,
                            backgroundColor: P5Colors.teal,
                            child: Icon(Icons.arrow_forward_rounded, color: P5Colors.white, size: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
