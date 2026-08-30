import 'package:flutter/material.dart';
import '../../models/jss1_lesson_model.dart';
import '../../data/jss1_term1_lessons.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../lesson/jss1_lesson_player_screen.dart';

class JSS1WeekRoadmapScreen extends StatefulWidget {
  final int term;

  const JSS1WeekRoadmapScreen({super.key, required this.term});

  @override
  State<JSS1WeekRoadmapScreen> createState() => _JSS1WeekRoadmapScreenState();
}

class _JSS1WeekRoadmapScreenState extends State<JSS1WeekRoadmapScreen> {
  late List<JSS1Lesson> _lessons;

  @override
  void initState() {
    super.initState();
    _loadLessons();
  }

  void _loadLessons() {
    if (widget.term == 1) {
      _lessons = JSS1Term1Lessons.weeks;
    } else {
      _lessons = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final termName = widget.term == 1
        ? 'PREMIER TRIMESTRE (Term 1)'
        : widget.term == 2
            ? 'DEUXIÈME TRIMESTRE (Term 2)'
            : 'TROISIÈME TRIMESTRE (Term 3)';

    return Scaffold(
      backgroundColor: JSS1Colors.cream,
      appBar: AppBar(
        backgroundColor: JSS1Colors.teal,
        foregroundColor: JSS1Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('JSS1 FRENCH • $termName', style: JSS1Text.subheading(JSS1Colors.white).copyWith(fontSize: 18)),
            Text('Programme Officiel NERDC • 9 Semaines de Cours & Révision', style: JSS1Text.caption(JSS1Colors.gold)),
          ],
        ),
      ),
      body: _lessons.isEmpty
          ? Center(
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: JSS1Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.lock_clock_rounded, color: JSS1Colors.gold, size: 64),
                    const SizedBox(height: 16),
                    Text('Trimestre ${widget.term} en cours de finalisation', style: JSS1Text.heading(JSS1Colors.teal)),
                    const SizedBox(height: 8),
                    Text('Les modules de ce trimestre seront débloqués pour le sprint suivant.', style: JSS1Text.body(JSS1Colors.grey)),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(24),
              child: GridView.builder(
                itemCount: _lessons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.45,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final lesson = _lessons[index];
                  final isRevision = lesson.patternType == JSS1PatternType.term1RevisionRally;
                  final Color headerBg = isRevision ? const Color(0xFFC77700) : JSS1Colors.teal;

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JSS1LessonPlayerScreen(lesson: lesson),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: JSS1Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: JSS1Colors.charcoal.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(color: JSS1Colors.lightGrey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Card Top Header
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: headerBg,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(19),
                                topRight: Radius.circular(19),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SEMAINE ${lesson.week}',
                                  style: JSS1Text.caption(JSS1Colors.white).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: JSS1Colors.white.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    '${lesson.vocabItems.length} mots',
                                    style: const TextStyle(color: JSS1Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Card Body
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        lesson.topic,
                                        style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 15, fontWeight: FontWeight.w800),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        lesson.subtitle,
                                        style: JSS1Text.caption(JSS1Colors.grey).copyWith(fontSize: 12),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.touch_app_rounded, size: 16, color: JSS1Colors.teal),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Lab Interactif',
                                            style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: JSS1Colors.gold),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
