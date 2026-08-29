import 'package:flutter/material.dart';
import '../../models/p4_lesson_model.dart';
import '../../services/p4_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
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
  objectives,
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
  LessonPhase _phase = LessonPhase.objectives;
  int _revealedQuestionIndex = -1;

  void _goToNextPhase() => _nextPhase();

  // Classwork Interactive Drill state
  int _classworkSubTab = 0; // 0: Interactive Drills, 1: Scheme Evaluation Q&A
  int _activeExerciseIndex = 0;
  int? _selectedOptionIndex;
  bool _hasCheckedAnswer = false;

  final List<Map<String, dynamic>> _phaseSteps = [
    {'phase': LessonPhase.objectives, 'title': '1. Objectives', 'icon': Icons.flag_rounded},
    {'phase': LessonPhase.interactivePattern, 'title': '2. Interactive Lab', 'icon': Icons.touch_app_rounded},
    {'phase': LessonPhase.vocabLab, 'title': '3. Vocabulary & Phonetics', 'icon': Icons.record_voice_over_rounded},
    {'phase': LessonPhase.classwork, 'title': '4. Classwork & Drills', 'icon': Icons.quiz_rounded},
    {'phase': LessonPhase.summary, 'title': '5. Summary & Homework', 'icon': Icons.assignment_turned_in_rounded},
  ];

  void _nextPhase() {
    final currentIndex = _phaseSteps.indexWhere((s) => s['phase'] == _phase);
    if (currentIndex < _phaseSteps.length - 1) {
      setState(() {
        _phase = _phaseSteps[currentIndex + 1]['phase'] as LessonPhase;
        _revealedQuestionIndex = -1;
        _activeExerciseIndex = 0;
        _selectedOptionIndex = null;
        _hasCheckedAnswer = false;
      });
    } else {
      Navigator.pop(context, true);
    }
  }

  void _prevPhase() {
    final currentIndex = _phaseSteps.indexWhere((s) => s['phase'] == _phase);
    if (currentIndex > 0) {
      setState(() {
        _phase = _phaseSteps[currentIndex - 1]['phase'] as LessonPhase;
        _revealedQuestionIndex = -1;
        _activeExerciseIndex = 0;
        _selectedOptionIndex = null;
        _hasCheckedAnswer = false;
      });
    } else {
      Navigator.pop(context);
    }
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
                  color: LHColors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
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
                          color: LHColors.turquoise.withOpacity(0.3),
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
            color: _audioService.playbackSpeed < 1.0 ? LHColors.gold : LHColors.white.withOpacity(0.15),
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

          const SizedBox(width: 12),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: _phaseSteps.map((step) {
              final isCurrent = step['phase'] == _phase;
              return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isCurrent ? LHColors.turquoise : LHColors.white.withOpacity(0.1),
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
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseContent() {
    switch (_phase) {
      case LessonPhase.objectives:
        return _buildObjectivesView();
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

  Widget _buildObjectivesView() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: LHColors.charcoal.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.track_changes_rounded, color: LHColors.teal, size: 32),
                        const SizedBox(width: 12),
                        Text(
                          'Lesson Learning Objectives',
                          style: LHText.heading(LHColors.teal).copyWith(fontSize: 26),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'By the end of this lesson, pupils should be able to:',
                      style: LHText.body(LHColors.grey).copyWith(fontSize: 16),
                    ),
                  ],
                ),
                const Divider(height: 20),
                Expanded(
                  child: ListView.separated(
                    itemCount: widget.lesson.objectives.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: LHColors.teal.withOpacity(0.12),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: LHText.subheading(LHColors.teal).copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              widget.lesson.objectives[index],
                              style: LHText.body(LHColors.charcoal).copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                              ),
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
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: LHColors.cream,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: LHColors.gold.withOpacity(0.5)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.lightbulb_rounded, color: LHColors.gold, size: 30),
                        const SizedBox(width: 10),
                        Text(
                          'Classroom Cultural Hook',
                          style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      widget.lesson.culturalInsight,
                      style: LHText.body(LHColors.charcoal).copyWith(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: LHColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.touch_app_rounded, color: LHColors.teal, size: 24),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Tap "Next: Interactive Lab" below to begin!',
                              style: LHText.body(LHColors.teal).copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildPatternView() {
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
        border: Border.all(color: LHColors.turquoise.withOpacity(0.3), width: 2),
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
                    backgroundColor: _audioService.playbackSpeed < 1.0 ? LHColors.gold.withOpacity(0.35) : LHColors.cream,
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
                  color: LHColors.cream.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(18),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      if (item.audioKey != null) {
                        P4AudioService().playPhrase(item.audioKey!);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: LHColors.teal.withOpacity(0.2)),
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
                            style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 17),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            item.english,
                            style: LHText.body(LHColors.grey).copyWith(fontSize: 13),
                            maxLines: 2,
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
    return Column(
      children: [
        // Sub-tab Switcher: Interactive Drill vs Scheme Q&A Check
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildClassworkSubTab(
              title: '🎯 1. Interactive Smartboard Drill (${widget.lesson.classworkExercises.length} Drills)',
              isActive: _classworkSubTab == 0,
              onTap: () => setState(() => _classworkSubTab = 0),
            ),
            const SizedBox(width: 16),
            _buildClassworkSubTab(
              title: '📋 2. Scheme Evaluation Q&A (${widget.lesson.evaluationQuestions.length} Questions)',
              isActive: _classworkSubTab == 1,
              onTap: () => setState(() => _classworkSubTab = 1),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Expanded(
          child: _classworkSubTab == 0 ? _buildInteractiveDrillStage() : _buildSchemeEvaluationList(),
        ),
      ],
    );
  }

  Widget _buildClassworkSubTab({required String title, required bool isActive, required VoidCallback onTap}) {
    return Material(
      color: isActive ? LHColors.teal : LHColors.white,
      borderRadius: BorderRadius.circular(14),
      elevation: isActive ? 3 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            title,
            style: LHText.subheading(isActive ? LHColors.white : LHColors.charcoal).copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInteractiveDrillStage() {
    if (widget.lesson.classworkExercises.isEmpty) {
      return _buildSchemeEvaluationList();
    }

    final exercise = widget.lesson.classworkExercises[_activeExerciseIndex];

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Exercise ${_activeExerciseIndex + 1} of ${widget.lesson.classworkExercises.length}',
                style: LHText.subheading(LHColors.teal).copyWith(fontSize: 18),
              ),
              Row(
                children: List.generate(widget.lesson.classworkExercises.length, (idx) {
                  final isCurrent = idx == _activeExerciseIndex;
                  return Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Container(
                      width: 24,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isCurrent ? LHColors.gold : LHColors.cream,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
          const Divider(),

          Text(
            exercise.prompt,
            style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 24),
          ),

          const SizedBox(height: 12),

          // Options Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.6,
              ),
              itemCount: exercise.options.length,
              itemBuilder: (context, optIdx) {
                final isSelected = _selectedOptionIndex == optIdx;
                final isCorrect = optIdx == exercise.correctOptionIndex;

                Color tileColor = LHColors.cream.withOpacity(0.6);
                Color textColor = LHColors.charcoal;
                Color borderColor = LHColors.teal.withOpacity(0.2);

                if (_hasCheckedAnswer) {
                  if (isCorrect) {
                    tileColor = const Color(0xFF4CAF82).withOpacity(0.15);
                    borderColor = const Color(0xFF4CAF82);
                    textColor = const Color(0xFF1E6B47);
                  } else if (isSelected && !isCorrect) {
                    tileColor = const Color(0xFFE24B4A).withOpacity(0.15);
                    borderColor = const Color(0xFFE24B4A);
                    textColor = const Color(0xFF9E2A2B);
                  }
                } else if (isSelected) {
                  tileColor = LHColors.teal;
                  textColor = LHColors.white;
                  borderColor = LHColors.teal;
                }

                return Material(
                  color: tileColor,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: _hasCheckedAnswer
                        ? null
                        : () {
                            setState(() => _selectedOptionIndex = optIdx);
                            P4AudioService().playSfx(P4SfxType.click);
                          },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: borderColor, width: 2),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: isSelected ? LHColors.gold : LHColors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                String.fromCharCode(65 + optIdx),
                                style: LHText.body(LHColors.charcoal).copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              exercise.options[optIdx],
                              style: LHText.subheading(textColor).copyWith(fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Feedback & Drill Next Action
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _hasCheckedAnswer
                    ? Text(
                        'Explanation: ${exercise.explanation}',
                        style: LHText.body(LHColors.teal).copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : Text(
                        'Tap the correct option on the board',
                        style: LHText.body(LHColors.grey).copyWith(fontSize: 15, fontStyle: FontStyle.italic),
                      ),
              ),
              Row(
                children: [
                  if (!_hasCheckedAnswer && _selectedOptionIndex != null)
                    Material(
                      color: LHColors.teal,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          final isCorrect = _selectedOptionIndex == exercise.correctOptionIndex;
                          setState(() => _hasCheckedAnswer = true);
                          P4AudioService().playSfx(isCorrect ? P4SfxType.correct : P4SfxType.incorrect);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          child: Text(
                            'Check Answer',
                            style: LHText.subheading(LHColors.white).copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  if (_hasCheckedAnswer && _activeExerciseIndex < widget.lesson.classworkExercises.length - 1)
                    Material(
                      color: LHColors.gold,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          setState(() {
                            _activeExerciseIndex++;
                            _selectedOptionIndex = null;
                            _hasCheckedAnswer = false;
                          });
                          P4AudioService().playSfx(P4SfxType.click);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          child: Row(
                            children: [
                              Text(
                                'Next Exercise',
                                style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward_rounded, color: LHColors.charcoal, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (_hasCheckedAnswer && _activeExerciseIndex == widget.lesson.classworkExercises.length - 1)
                    Material(
                      color: LHColors.gold,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          P4AudioService().playSfx(P4SfxType.celebrate);
                          _nextPhase();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          child: Row(
                            children: [
                              Text(
                                'Drills Complete 🎉',
                                style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.check_circle_rounded, color: LHColors.charcoal, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSchemeEvaluationList() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.checklist_rounded, color: LHColors.teal, size: 28),
                  const SizedBox(width: 10),
                  Text(
                    'Curriculum Evaluation Checklist (${widget.lesson.evaluationQuestions.length} Questions)',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 22),
                  ),
                ],
              ),
              Text(
                'Tap any question to reveal verified answers',
                style: LHText.body(LHColors.grey).copyWith(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const Divider(height: 16),

          Expanded(
            child: ListView.separated(
              itemCount: widget.lesson.evaluationQuestions.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final q = widget.lesson.evaluationQuestions[index];
                final isRevealed = _revealedQuestionIndex == index;

                return Material(
                  color: isRevealed ? LHColors.teal.withOpacity(0.08) : LHColors.cream.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setState(() {
                        _revealedQuestionIndex = isRevealed ? -1 : index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                decoration: const BoxDecoration(
                                  color: LHColors.teal,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: LHText.body(LHColors.white).copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Text(
                                  q.question,
                                  style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 18),
                                ),
                              ),
                              Icon(
                                isRevealed ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                                color: LHColors.teal,
                                size: 24,
                              ),
                            ],
                          ),
                          if (isRevealed) ...[
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: LHColors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: LHColors.teal.withOpacity(0.3)),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.check_circle_rounded, color: LHColors.teal, size: 20),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      'Answer: ${q.answer}',
                                      style: LHText.body(LHColors.teal).copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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

  Widget _buildSummaryView() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withOpacity(0.3), width: 2),
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
                border: Border.all(color: LHColors.gold.withOpacity(0.5)),
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
