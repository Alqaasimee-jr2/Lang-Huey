import 'package:flutter/material.dart';
import '../../data/jss3_term1_lessons.dart';
import '../../data/jss3_term2_lessons.dart';
import '../../models/jss3_lesson_model.dart';
import '../../services/jss3_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../lesson/jss3_lesson_player_screen.dart';

class JSS3WeekRoadmapScreen extends StatelessWidget {
  final int termNumber;
  const JSS3WeekRoadmapScreen({super.key, required this.termNumber});

  @override
  Widget build(BuildContext context) {
    final audio = JSS3AudioService();
    final List<JSS3LessonModel> lessons = termNumber == 1
        ? JSS3Term1Lessons.weeks
        : (termNumber == 2 ? JSS3Term2Lessons.weeks : []);

    final termTitle = termNumber == 1
        ? 'Term 1 • JSS 3'
        : 'Term 2 (Terminal Term • BECE)';

    return Scaffold(
      backgroundColor: LangHueyColors.warmCream,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: LangHueyColors.charcoal),
          onPressed: () {
            audio.playClick();
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(termTitle, style: LangHueyTextStyles.h3.copyWith(fontSize: 16)),
            Text('Learning Roadmap (9 Interactive Weeks)', style: LangHueyTextStyles.bodySmall),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            final lesson = lessons[index];
            final isRevision = lesson.patternType == JSS3PatternType.term1RevisionRally;

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: InkWell(
                onTap: () {
                  audio.playClick();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => JSS3LessonPlayerScreen(lesson: lesson),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: isRevision
                          ? LangHueyColors.amberGold
                          : LangHueyColors.deepTeal.withOpacity(0.2),
                      width: isRevision ? 2 : 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 12,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: isRevision
                              ? LangHueyColors.amberGold.withOpacity(0.2)
                              : LangHueyColors.softTeal,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Text(
                            'W${lesson.weekNumber}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: isRevision
                                  ? Colors.brown.shade900
                                  : LangHueyColors.deepTeal,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  lesson.theme,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: isRevision
                                        ? Colors.brown.shade800
                                        : LangHueyColors.deepTeal,
                                  ),
                                ),
                                if (isRevision) ...[
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: LangHueyColors.amberGold,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Text(
                                      'GRAND RALLY',
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w900,
                                        color: LangHueyColors.charcoal,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              lesson.frenchTitle,
                              style: LangHueyTextStyles.h3.copyWith(fontSize: 15),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              lesson.englishSubtitle,
                              style: LangHueyTextStyles.bodySmall.copyWith(fontSize: 12),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.record_voice_over_rounded, size: 14, color: Colors.grey.shade600),
                                const SizedBox(width: 4),
                                Text(
                                  '${lesson.vocabulary.length} Vocab',
                                  style: TextStyle(fontSize: 11, color: Colors.grey.shade700, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(width: 14),
                                Icon(Icons.sports_esports_rounded, size: 14, color: Colors.grey.shade600),
                                const SizedBox(width: 4),
                                Text(
                                  '${lesson.exercises.length} Drills',
                                  style: TextStyle(fontSize: 11, color: Colors.grey.shade700, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.play_circle_fill_rounded,
                        color: isRevision ? LangHueyColors.amberGold : LangHueyColors.deepTeal,
                        size: 32,
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
