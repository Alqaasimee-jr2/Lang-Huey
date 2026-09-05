import 'package:flutter/material.dart';
import '../../models/p4_lesson_model.dart';
import '../../services/p4_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../../widgets/drills/p4_interactive_drill_engine_widget.dart';

// Term 1 Patterns
import '../../widgets/patterns/map_explorer_widget.dart';
import '../../widgets/patterns/greeting_dial_widget.dart';
import '../../widgets/patterns/magic_words_widget.dart';
import '../../widgets/patterns/identity_sentence_builder_widget.dart';
import '../../widgets/patterns/number_and_age_widget.dart';
import '../../widgets/patterns/farewell_matcher_widget.dart';
import '../../widgets/patterns/dialogue_sequencer_widget.dart';
import '../../widgets/patterns/id_card_workshop_widget.dart';
import '../../widgets/patterns/revision_rally_widget.dart';
import '../../widgets/patterns/vacation_celebration_widget.dart';

// Term 2 Patterns
import '../../widgets/patterns/term2/family_portrait_widget.dart';
import '../../widgets/patterns/term2/family_tree_builder_widget.dart';
import '../../widgets/patterns/term2/family_descriptor_widget.dart';
import '../../widgets/patterns/term2/classroom_explorer_widget.dart';
import '../../widgets/patterns/term2/campus_and_subjects_widget.dart';
import '../../widgets/patterns/term2/school_timetable_widget.dart';
import '../../widgets/patterns/term2/preposition_playground_widget.dart';
import '../../widgets/patterns/term2/color_studio_widget.dart';
import '../../widgets/patterns/term2/term2_revision_rally_widget.dart';
import '../../widgets/patterns/term2/term2_vacation_celebration_widget.dart';

// Term 3 Patterns
import '../../widgets/patterns/term3/clock_time_explorer_widget.dart';
import '../../widgets/patterns/term3/daily_routine_sequencer_widget.dart';
import '../../widgets/patterns/term3/food_and_meals_widget.dart';
import '../../widgets/patterns/term3/hunger_thirst_dial_widget.dart';
import '../../widgets/patterns/term3/body_anatomy_explorer_widget.dart';
import '../../widgets/patterns/term3/health_and_hygiene_widget.dart';
import '../../widgets/patterns/term3/wardrobe_stylist_widget.dart';
import '../../widgets/patterns/term3/weather_studio_widget.dart';
import '../../widgets/patterns/term3/term3_revision_rally_widget.dart';
import '../../widgets/patterns/term3/term3_graduation_celebration_widget.dart';

enum LessonPhase {
  interactivePattern,
  vocabLab,
  classwork,
  summary,
}

class P4LessonPlayerScreen extends StatefulWidget {
  final P4Lesson lesson;

  const P4LessonPlayerScreen({super.key, required this.lesson});

  @override
  State<P4LessonPlayerScreen> createState() => _P4LessonPlayerScreenState();
}

class _P4LessonPlayerScreenState extends State<P4LessonPlayerScreen> {
  final P4AudioService _audioService = P4AudioService();
  LessonPhase _phase = LessonPhase.interactivePattern;

  void _goToNextPhase() => _nextPhase();

  final List<Map<String, dynamic>> _phaseSteps = [
    {'phase': LessonPhase.interactivePattern, 'title': '1. Learning Lab', 'icon': Icons.lightbulb_rounded},
    {'phase': LessonPhase.vocabLab, 'title': '2. Vocabulary', 'icon': Icons.record_voice_over_rounded},
    {'phase': LessonPhase.classwork, 'title': '3. Practice Drills', 'icon': Icons.sports_esports_rounded},
    {'phase': LessonPhase.summary, 'title': '4. Summary', 'icon': Icons.menu_book_rounded},
  ];

  void _nextPhase() {
    final currentIndex = _phaseSteps.indexWhere((s) => s['phase'] == _phase);
    if (currentIndex < _phaseSteps.length - 1) {
      _audioService.playSfx(P4SfxType.click);
      setState(() {
        _phase = _phaseSteps[currentIndex + 1]['phase'] as LessonPhase;
      });
    } else {
      _audioService.playSfx(P4SfxType.celebrate);
      Navigator.pop(context, true);
    }
  }

  void _prevPhase() {
    final currentIndex = _phaseSteps.indexWhere((s) => s['phase'] == _phase);
    if (currentIndex > 0) {
      _audioService.playSfx(P4SfxType.click);
      setState(() {
        _phase = _phaseSteps[currentIndex - 1]['phase'] as LessonPhase;
      });
    } else {
      _audioService.playSfx(P4SfxType.click);
      Navigator.pop(context);
    }
  }

  void _showTeacherGuideModal() {
    _audioService.playSfx(P4SfxType.click);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 24, offset: Offset(0, -4)),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: LHColors.teal,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.school_rounded, color: LHColors.gold, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Teacher Facilitator Guide',
                            style: LHText.heading(LHColors.teal).copyWith(fontSize: 18),
                          ),
                          Text(
                            'For Teacher Reference Only • Not Displayed on Student Smartboard',
                            style: LHText.caption(LHColors.grey).copyWith(fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Divider(height: 28),
              const Text('CURRICULUM LEARNING OBJECTIVES', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: LHColors.teal, letterSpacing: 1)),
              const SizedBox(height: 8),
              ...widget.lesson.objectives.map((obj) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle_outline_rounded, color: LHColors.teal, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(obj, style: const TextStyle(fontSize: 13, color: LHColors.charcoal)),
                    ),
                  ],
                ),
              )),
              const SizedBox(height: 16),
              const Text('CULTURAL INSIGHT HOOK', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: LHColors.gold, letterSpacing: 1)),
              const SizedBox(height: 6),
              Text(
                widget.lesson.culturalInsight,
                style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: LHColors.charcoal),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LHColors.cream,
      body: SafeArea(
        child: Column(
          children: [
            // Top Smartboard Header Bar
            _buildHeaderBar(),

            // Main Stage
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                child: _buildPhaseContent(),
              ),
            ),

            // Bottom Navigation Control Bar
            _buildBottomControlBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderBar() {
    return Container(
      color: LHColors.teal,
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  color: LHColors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.arrow_back_rounded, color: LHColors.white, size: 28),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: LHColors.turquoise.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'P4 FRENCH · TERM ${widget.lesson.term} · WEEK ${widget.lesson.week}',
                          style: LHText.label(LHColors.white).copyWith(fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.lesson.topic,
                        style: LHText.subheading(LHColors.white).copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 20),

          // Speed Control Button (1.0x / 0.8x)
          Material(
            color: _audioService.playbackSpeed < 1.0 ? LHColors.gold : LHColors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                final newSpeed = _audioService.playbackSpeed == 1.0 ? 0.8 : 1.0;
                setState(() {
                  _audioService.setPlaybackSpeed(newSpeed);
                });
                _audioService.playSfx(P4SfxType.click);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      _audioService.playbackSpeed < 1.0 ? Icons.slow_motion_video_rounded : Icons.speed_rounded,
                      size: 18,
                      color: _audioService.playbackSpeed < 1.0 ? LHColors.charcoal : LHColors.white,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _audioService.playbackSpeed < 1.0 ? '0.8x Slower' : '1.0x Normal',
                      style: LHText.body(_audioService.playbackSpeed < 1.0 ? LHColors.charcoal : LHColors.white).copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Teacher Guide Button
          Material(
            color: LHColors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: _showTeacherGuideModal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    const Icon(Icons.school_rounded, size: 18, color: LHColors.gold),
                    const SizedBox(width: 6),
                    Text(
                      'Teacher Guide',
                      style: LHText.body(LHColors.white).copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: _phaseSteps.map((step) {
              final isCurrent = step['phase'] == _phase;
              return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: InkWell(
                  onTap: () {
                    _audioService.playSfx(P4SfxType.click);
                    setState(() => _phase = step['phase'] as LessonPhase);
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: isCurrent ? LHColors.turquoise : LHColors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          step['icon'] as IconData,
                          size: 18,
                          color: isCurrent ? LHColors.charcoal : LHColors.white,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          step['title'] as String,
                          style: LHText.body(isCurrent ? LHColors.charcoal : LHColors.white).copyWith(
                            fontSize: 13,
                            fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseContent() {
    switch (_phase) {
      case LessonPhase.interactivePattern:
        return _buildPatternView();
      case LessonPhase.vocabLab:
        return _buildVocabLabView();
      case LessonPhase.classwork:
        return _buildClassworkView();
      case LessonPhase.summary:
        return _buildSummaryView();
    }
  }

  Widget _buildPatternView() {
    // Architectural Note on Routing Strategy (Audit Issue H-7):
    // Term 1 routes via `widget.lesson.patternType` (explicit enum mapping).
    // Terms 2 and 3 route via `widget.lesson.week` (curriculum week index 1..13),
    // which directly maps pedagogical lab widgets to the syllabus progression.
    // Both strategies are intentional and well-tested; an assert guards the valid week range.
    assert(
      widget.lesson.week >= 1 && widget.lesson.week <= 13,
      'Lesson week must be between 1 and 13. Found: ${widget.lesson.week}',
    );

    if (widget.lesson.term == 2) {
      switch (widget.lesson.week) {
        case 1:
          return FamilyPortraitWidget(lesson: widget.lesson);
        case 2:
          return FamilyTreeBuilderWidget(lesson: widget.lesson);
        case 3:
          return FamilyDescriptorWidget(lesson: widget.lesson);
        case 4:
          return ClassroomExplorerWidget(lesson: widget.lesson);
        case 5:
          return Term2RevisionRallyWidget(lesson: widget.lesson);
        case 6:
          return Term2VacationCelebrationWidget(lesson: widget.lesson);
        case 7:
          return CampusAndSubjectsWidget(lesson: widget.lesson);
        case 8:
          return SchoolTimetableWidget(lesson: widget.lesson);
        case 9:
          return PrepositionPlaygroundWidget(lesson: widget.lesson);
        case 10:
          return ColorStudioWidget(lesson: widget.lesson);
        case 11:
        case 12:
          return Term2RevisionRallyWidget(lesson: widget.lesson);
        case 13:
        default:
          return Term2VacationCelebrationWidget(lesson: widget.lesson);
      }
    }

    if (widget.lesson.term == 3) {
      switch (widget.lesson.week) {
        case 1:
          return ClockTimeExplorerWidget(onComplete: _goToNextPhase);
        case 2:
          return DailyRoutineSequencerWidget(onComplete: _goToNextPhase);
        case 3:
          return FoodAndMealsWidget(onComplete: _goToNextPhase);
        case 4:
          return HungerThirstDialWidget(onComplete: _goToNextPhase);
        case 5:
          return Term3RevisionRallyWidget(weekNumber: 5, onComplete: _goToNextPhase);
        case 6:
          return Term3GraduationCelebrationWidget(weekNumber: 6, onComplete: _goToNextPhase);
        case 7:
          return BodyAnatomyExplorerWidget(onComplete: _goToNextPhase);
        case 8:
          return HealthAndHygieneWidget(onComplete: _goToNextPhase);
        case 9:
          return WardrobeStylistWidget(onComplete: _goToNextPhase);
        case 10:
          return WeatherStudioWidget(onComplete: _goToNextPhase);
        case 11:
          return Term3RevisionRallyWidget(weekNumber: 11, onComplete: _goToNextPhase);
        case 12:
          return Term3RevisionRallyWidget(weekNumber: 12, onComplete: _goToNextPhase);
        case 13:
        default:
          return Term3GraduationCelebrationWidget(weekNumber: 13, onComplete: _goToNextPhase);
      }
    }

    switch (widget.lesson.patternType) {
      case P4PatternType.borderMapAndAlphabet:
        return MapExplorerWidget(lesson: widget.lesson);
      case P4PatternType.greetingTimeDial:
        return GreetingDialWidget(lesson: widget.lesson);
      case P4PatternType.magicWordsCourtesy:
        return MagicWordsWidget(lesson: widget.lesson);
      case P4PatternType.identitySentenceLab:
        return IdentitySentenceBuilderWidget(lesson: widget.lesson);
      case P4PatternType.numberAndAgeStudio:
        return NumberAndAgeWidget(lesson: widget.lesson);
      case P4PatternType.farewellTimeMatcher:
        return FarewellMatcherWidget(lesson: widget.lesson);
      case P4PatternType.dialogueSequencer:
        return DialogueSequencerWidget(lesson: widget.lesson);
      case P4PatternType.idCardWorkshop:
        return IdCardWorkshopWidget(lesson: widget.lesson);
      case P4PatternType.midTermReview:
      case P4PatternType.termRevisionRally:
        return RevisionRallyWidget(lesson: widget.lesson);
      case P4PatternType.midTermBreak:
      case P4PatternType.vacationCelebration:
        return VacationCelebrationWidget(lesson: widget.lesson);
    }
  }

  Widget _buildVocabLabView() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.record_voice_over_rounded, color: LHColors.teal, size: 30),
                  const SizedBox(width: 12),
                  Text(
                    'Classroom Vocabulary & Phonetics Station',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                  ),
                ],
              ),
              Row(
                children: [
                  ActionChip(
                    avatar: Icon(
                      _audioService.playbackSpeed < 1.0 ? Icons.slow_motion_video_rounded : Icons.speed_rounded,
                      size: 18,
                      color: LHColors.teal,
                    ),
                    label: Text(
                      _audioService.playbackSpeed < 1.0 ? 'Speed: 0.8x (Slower)' : 'Speed: 1.0x (Normal)',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    backgroundColor: _audioService.playbackSpeed < 1.0 ? LHColors.gold.withValues(alpha: 0.35) : LHColors.cream,
                    onPressed: () {
                      final newSpeed = _audioService.playbackSpeed == 1.0 ? 0.8 : 1.0;
                      setState(() {
                        _audioService.setPlaybackSpeed(newSpeed);
                      });
                      _audioService.playSfx(P4SfxType.click);
                    },
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: LHColors.cream,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${widget.lesson.vocabItems.length} PHRASES TO PRACTICE',
                      style: LHText.body(LHColors.charcoal).copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(height: 20),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 2.1,
              ),
              itemCount: widget.lesson.vocabItems.length,
              itemBuilder: (context, index) {
                final item = widget.lesson.vocabItems[index];
                return Material(
                  color: LHColors.cream.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(18),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      if (item.audioKey != null) {
                        P4AudioService().playPhrase(item.audioKey!, term: widget.lesson.term);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: LHColors.teal.withValues(alpha: 0.2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(item.icon ?? Icons.translate_rounded, color: LHColors.teal, size: 22),
                                  const SizedBox(width: 8),
                                  if (item.audioKey != null)
                                    const Icon(Icons.volume_up_rounded, color: LHColors.gold, size: 20),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: LHColors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '[ ${item.phonetics} ]',
                                  style: LHText.body(LHColors.teal).copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            item.french,
                            style: LHText.subheading(LHColors.charcoal).copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            item.english,
                            style: LHText.body(LHColors.teal).copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClassworkView() {
    return P4InteractiveDrillEngineWidget(
      drills: widget.lesson.classworkExercises,
      term: widget.lesson.term,
      onComplete: _goToNextPhase,
    );
  }

  Widget _buildSummaryView() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3), width: 2),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.check_circle_outline_rounded, color: LHColors.teal, size: 30),
                    const SizedBox(width: 12),
                    Text(
                      'Lesson Key Summary',
                      style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                    ),
                  ],
                ),
                const Divider(),
                Expanded(
                  child: ListView.separated(
                    itemCount: widget.lesson.objectives.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, idx) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.done_all_rounded, color: LHColors.teal, size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              widget.lesson.objectives[idx],
                              style: LHText.body(LHColors.charcoal).copyWith(fontSize: 16),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 32),

          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: LHColors.cream,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: LHColors.gold.withValues(alpha: 0.5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.menu_book_rounded, color: LHColors.charcoal, size: 28),
                      const SizedBox(width: 10),
                      Text(
                        'Notebook Assignment',
                        style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 22),
                      ),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.separated(
                      itemCount: widget.lesson.assignmentTasks.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, i) {
                        final task = widget.lesson.assignmentTasks[i];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: LHColors.teal,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                task.category.toUpperCase(),
                                style: LHText.label(LHColors.white).copyWith(fontSize: 11),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              task.instruction,
                              style: LHText.body(LHColors.charcoal).copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        );
                      },
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

  Widget _buildBottomControlBar() {
    final currentIndex = _phaseSteps.indexWhere((s) => s['phase'] == _phase);
    final isLastPhase = currentIndex == _phaseSteps.length - 1;

    return Container(
      color: LHColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: LHColors.cream,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: _prevPhase,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_rounded, color: LHColors.charcoal, size: 22),
                    const SizedBox(width: 8),
                    Text(
                      currentIndex == 0 ? 'Exit to Roadmap' : 'Previous Step',
                      style: LHText.body(LHColors.charcoal).copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Material(
            color: LHColors.gold,
            borderRadius: BorderRadius.circular(16),
            elevation: 4,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: _nextPhase,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                child: Row(
                  children: [
                    Text(
                      isLastPhase ? 'Complete Lesson & Return' : 'Next: ${_phaseSteps[currentIndex + 1]['title']}',
                      style: LHText.subheading(LHColors.charcoal).copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      isLastPhase ? Icons.check_circle_rounded : Icons.arrow_forward_rounded,
                      color: LHColors.charcoal,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
