import 'package:flutter/material.dart';
import '../../data/jss2_term1_lessons.dart';
import '../../data/jss2_term2_lessons.dart';
import '../../data/jss2_term3_lessons.dart';
import '../../models/jss2_lesson_model.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../lesson/jss2_lesson_player_screen.dart';

class JSS2WeekRoadmapScreen extends StatefulWidget {
  final int term;

  const JSS2WeekRoadmapScreen({super.key, required this.term});

  @override
  State<JSS2WeekRoadmapScreen> createState() => _JSS2WeekRoadmapScreenState();
}

class _JSS2WeekRoadmapScreenState extends State<JSS2WeekRoadmapScreen> {
  List<JSS2LessonModel> get _lessons {
    switch (widget.term) {
      case 1:
        return JSS2Term1Lessons.weeks;
      case 2:
        return JSS2Term2Lessons.weeks;
      case 3:
        return JSS2Term3Lessons.weeks;
      default:
        return [];
    }
  }

  String get _termTitle {
    switch (widget.term) {
      case 1:
        return 'Term 1 — First Term';
      case 2:
        return 'Term 2 — Second Term';
      case 3:
        return 'Term 3 — Third Term';
      default:
        return '';
    }
  }

  String get _termSubtitle {
    switch (widget.term) {
      case 1:
        return 'Spatial Position, Wayfinding, Public Transit, Schedules & Troubleshooting';
      case 2:
        return 'Shopping, Bargaining, Needs & Utilities, Pharmacy, Clothing & Comparisons';
      case 3:
        return 'Math Operations, African & French Food, Recipes, Restaurant Etiquette & BECE Prep';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final lessons = _lessons;

    return Scaffold(
      backgroundColor: LangHueyColors.warmCream,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.black12)),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_rounded, color: LangHueyColors.deepTeal),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: LangHueyColors.amberGold,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'JSS 2 FRENCH',
                                style: TextStyle(color: LangHueyColors.charcoal, fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _termTitle,
                              style: LangHueyTextStyles.h2.copyWith(fontSize: 18, color: LangHueyColors.deepTeal),
                            ),
                          ],
                        ),
                        Text(
                          _termSubtitle,
                          style: LangHueyTextStyles.bodySmall.copyWith(color: LangHueyColors.textMuted),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: LangHueyColors.softTeal,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${lessons.length} Weeks',
                      style: const TextStyle(color: LangHueyColors.deepTeal, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),

            // Roadmap Weeks Grid
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Curriculum Roadmap (9 Learning Weeks)',
                      style: LangHueyTextStyles.h2.copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tap any week to launch the lesson on your classroom smartboard.',
                      style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.45,
                      ),
                      itemCount: lessons.length,
                      itemBuilder: (context, index) {
                        final lesson = lessons[index];
                        final isRevision = index == lessons.length - 1;

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JSS2LessonPlayerScreen(lesson: lesson),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isRevision ? LangHueyColors.softTeal : Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: isRevision ? LangHueyColors.amberGold : Colors.black12,
                                width: isRevision ? 2 : 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: isRevision ? LangHueyColors.amberGold : LangHueyColors.deepTeal,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'WEEK ${lesson.weekNumber}',
                                        style: TextStyle(
                                          color: isRevision ? LangHueyColors.charcoal : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      isRevision ? Icons.emoji_events_rounded : Icons.play_circle_fill_rounded,
                                      color: isRevision ? LangHueyColors.amberGold : LangHueyColors.deepTeal,
                                      size: 24,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      lesson.frenchTitle,
                                      style: LangHueyTextStyles.h3.copyWith(fontSize: 14),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      lesson.englishSubtitle,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey.shade600,
                                        height: 1.2,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${lesson.exercises.length} Drills',
                                      style: const TextStyle(color: LangHueyColors.deepTeal, fontSize: 11, fontWeight: FontWeight.bold),
                                    ),
                                    const Icon(Icons.arrow_forward_rounded, color: LangHueyColors.deepTeal, size: 14),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
