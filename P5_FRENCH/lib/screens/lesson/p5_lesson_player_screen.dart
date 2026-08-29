import 'package:flutter/material.dart';
import '../../models/p5_lesson_model.dart';
import '../../services/p5_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

// Term 1 Bespoke Pattern Widgets
import '../../widgets/patterns/term1/p5_alphabet_and_revision_widget.dart';
import '../../widgets/patterns/term1/p5_number_studio_21to30_widget.dart';
import '../../widgets/patterns/term1/p5_number_studio_31to50_widget.dart';
import '../../widgets/patterns/term1/p5_number_studio_51to60_widget.dart';
import '../../widgets/patterns/term1/p5_present_others_widget.dart';
import '../../widgets/patterns/term1/p5_present_others_descriptor_widget.dart';
import '../../widgets/patterns/term1/p5_head_and_face_explorer_widget.dart';
import '../../widgets/patterns/term1/p5_body_and_pain_clinic_widget.dart';
import '../../widgets/patterns/term1/p5_term1_revision_rally_widget.dart';
import '../../widgets/patterns/term1/p5_term1_vacation_widget.dart';

// Term 2 Bespoke Pattern Widgets
import '../../widgets/patterns/term2/p5_extended_family_widget.dart';
import '../../widgets/patterns/term2/p5_family_tree_advanced_widget.dart';
import '../../widgets/patterns/term2/p5_family_gathering_widget.dart';
import '../../widgets/patterns/term2/p5_neighbor_studio_widget.dart';
import '../../widgets/patterns/term2/p5_community_activity_widget.dart';
import '../../widgets/patterns/term2/p5_gratitude_studio_widget.dart';
import '../../widgets/patterns/term2/p5_thank_you_letter_widget.dart';
import '../../widgets/patterns/term2/p5_weekly_timetable_widget.dart';
import '../../widgets/patterns/term2/p5_term2_revision_rally_widget.dart';
import '../../widgets/patterns/term2/p5_term2_vacation_widget.dart';

// Term 3 Bespoke Pattern Widgets
import '../../widgets/patterns/term3/p5_daily_routine_morning_widget.dart';
import '../../widgets/patterns/term3/p5_daily_routine_evening_widget.dart';
import '../../widgets/patterns/term3/p5_sports_arena_widget.dart';
import '../../widgets/patterns/term3/p5_hobbies_lounge_widget.dart';
import '../../widgets/patterns/term3/p5_school_subjects_widget.dart';
import '../../widgets/patterns/term3/p5_classroom_borrowing_widget.dart';
import '../../widgets/patterns/term3/p5_professions_career_widget.dart';
import '../../widgets/patterns/term3/p5_food_buffet_widget.dart';
import '../../widgets/patterns/term3/p5_term3_revision_rally_widget.dart';
import '../../widgets/patterns/term3/p5_term3_graduation_widget.dart';

enum LessonPhase {
  objectives,
  interactivePattern,
  vocabLab,
  classwork,
  summary,
}

class P5LessonPlayerScreen extends StatefulWidget {
  final P5Lesson lesson;

  const P5LessonPlayerScreen({super.key, required this.lesson});

  @override
  State<P5LessonPlayerScreen> createState() => _P5LessonPlayerScreenState();
}

class _P5LessonPlayerScreenState extends State<P5LessonPlayerScreen> {
  final P5AudioService _audioService = P5AudioService();
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: P5Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeaderBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: _buildPhaseContent(),
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: P5Colors.teal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_rounded, color: P5Colors.white, size: 26),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: P5Colors.gold,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'TERM ${widget.lesson.term} • WEEK ${widget.lesson.week}',
                  style: const TextStyle(
                    color: P5Colors.charcoal,
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 320,
                child: Text(
                  widget.lesson.topic,
                  style: P5Text.subheading(P5Colors.white).copyWith(fontSize: 17, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          Row(
            children: [
              // Speed Control Toggle
              Material(
                color: _audioService.playbackSpeed < 1.0 ? P5Colors.gold : P5Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    final newSpeed = _audioService.playbackSpeed == 1.0 ? 0.8 : 1.0;
                    setState(() => _audioService.setPlaybackSpeed(newSpeed));
                    _audioService.playSfx(P5SfxType.click);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Row(
                      children: [
                        Icon(
                          _audioService.playbackSpeed < 1.0 ? Icons.slow_motion_video_rounded : Icons.speed_rounded,
                          size: 18,
                          color: _audioService.playbackSpeed < 1.0 ? P5Colors.charcoal : P5Colors.white,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _audioService.playbackSpeed < 1.0 ? '0.8x Slower' : '1.0x Normal',
                          style: P5Text.body(_audioService.playbackSpeed < 1.0 ? P5Colors.charcoal : P5Colors.white).copyWith(
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

              // Phase Indicator Tabs
              Row(
                children: _phaseSteps.map((step) {
                  final isCurrent = step['phase'] == _phase;
                  return Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: isCurrent ? P5Colors.turquoise : P5Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            step['icon'] as IconData,
                            size: 16,
                            color: isCurrent ? P5Colors.charcoal : P5Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            step['title'] as String,
                            style: P5Text.body(isCurrent ? P5Colors.charcoal : P5Colors.white).copyWith(
                              fontSize: 12,
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
        ],
      ),
    );
  }

  Widget _buildPhaseContent() {
    switch (_phase) {
      case LessonPhase.objectives:
        return _buildObjectivesView();
      case LessonPhase.interactivePattern:
        return _buildInteractivePatternView();
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
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: P5Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.flag_rounded, color: P5Colors.teal, size: 28),
              const SizedBox(width: 10),
              Text(
                'Objectifs de la Leçon (Lesson Objectives)',
                style: P5Text.heading(P5Colors.teal).copyWith(fontSize: 22),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(widget.lesson.subtitle, style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16)),
          const Divider(height: 24),

          Expanded(
            child: ListView.builder(
              itemCount: widget.lesson.objectives.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: P5Colors.teal,
                        child: Text('${index + 1}', style: const TextStyle(color: P5Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.lesson.objectives[index],
                          style: P5Text.body(P5Colors.charcoal).copyWith(fontSize: 16, height: 1.3),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Cultural Insight Banner
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: P5Colors.gold.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: P5Colors.gold, width: 1.5),
            ),
            child: Row(
              children: [
                const Icon(Icons.lightbulb_rounded, color: P5Colors.gold, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aperçu Culturel (Cultural Insight):',
                        style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.lesson.culturalInsight,
                        style: P5Text.caption(P5Colors.charcoal).copyWith(fontSize: 13, height: 1.3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractivePatternView() {
    switch (widget.lesson.patternType) {
      // Term 1 Patterns
      case P5PatternType.alphabetAndRevision:
        return P5AlphabetAndRevisionWidget(onComplete: _goToNextPhase);
      case P5PatternType.numberStudio21to30:
        return P5NumberStudio21to30Widget(onComplete: _goToNextPhase);
      case P5PatternType.numberStudio31to50:
        return P5NumberStudio31to50Widget(onComplete: _goToNextPhase);
      case P5PatternType.numberStudio51to60:
        return P5NumberStudio51to60Widget(onComplete: _goToNextPhase);
      case P5PatternType.presentOthers:
        return P5PresentOthersWidget(onComplete: _goToNextPhase);
      case P5PatternType.presentOthersDescriptor:
        return P5PresentOthersDescriptorWidget(onComplete: _goToNextPhase);
      case P5PatternType.headAndFaceExplorer:
        return P5HeadAndFaceExplorerWidget(onComplete: _goToNextPhase);
      case P5PatternType.bodyAndPainClinic:
        return P5BodyAndPainClinicWidget(onComplete: _goToNextPhase);
      case P5PatternType.term1RevisionRally:
        return P5Term1RevisionRallyWidget(weekNumber: widget.lesson.week, onComplete: _goToNextPhase);
      case P5PatternType.term1Vacation:
        return P5Term1VacationWidget(weekNumber: widget.lesson.week, onComplete: _goToNextPhase);

      // Term 2 Patterns
      case P5PatternType.extendedFamily:
        return P5ExtendedFamilyWidget(onComplete: _goToNextPhase);
      case P5PatternType.familyTreeAdvanced:
        return P5FamilyTreeAdvancedWidget(onComplete: _goToNextPhase);
      case P5PatternType.familyGathering:
        return P5FamilyGatheringWidget(onComplete: _goToNextPhase);
      case P5PatternType.neighborStudio:
        return P5NeighborStudioWidget(onComplete: _goToNextPhase);
      case P5PatternType.communityActivity:
        return P5CommunityActivityWidget(onComplete: _goToNextPhase);
      case P5PatternType.gratitudeStudio:
        return P5GratitudeStudioWidget(onComplete: _goToNextPhase);
      case P5PatternType.thankYouLetter:
        return P5ThankYouLetterWidget(onComplete: _goToNextPhase);
      case P5PatternType.weeklyTimetable:
        return P5WeeklyTimetableWidget(onComplete: _goToNextPhase);
      case P5PatternType.term2RevisionRally:
        return P5Term2RevisionRallyWidget(onComplete: _goToNextPhase);
      case P5PatternType.term2Vacation:
        return P5Term2VacationWidget(onComplete: _goToNextPhase);

      // Term 3 Patterns
      case P5PatternType.dailyRoutineMorning:
        return P5DailyRoutineMorningWidget(onComplete: _goToNextPhase);
      case P5PatternType.dailyRoutineEvening:
        return P5DailyRoutineEveningWidget(onComplete: _goToNextPhase);
      case P5PatternType.sportsArena:
        return P5SportsArenaWidget(onComplete: _goToNextPhase);
      case P5PatternType.hobbiesLounge:
        return P5HobbiesLoungeWidget(onComplete: _goToNextPhase);
      case P5PatternType.schoolSubjects:
        return P5SchoolSubjectsWidget(onComplete: _goToNextPhase);
      case P5PatternType.classroomBorrowing:
        return P5ClassroomBorrowingWidget(onComplete: _goToNextPhase);
      case P5PatternType.professionsCareer:
        return P5ProfessionsCareerWidget(onComplete: _goToNextPhase);
      case P5PatternType.foodAndBuffet:
        return P5FoodBuffetWidget(onComplete: _goToNextPhase);
      case P5PatternType.term3RevisionRally:
        return P5Term3RevisionRallyWidget(onComplete: _goToNextPhase);
      case P5PatternType.term3Graduation:
        return P5Term3GraduationWidget(onComplete: _goToNextPhase);
    }
  }

  Widget _buildVocabLabView() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.record_voice_over_rounded, color: P5Colors.teal, size: 28),
                  const SizedBox(width: 10),
                  Text(
                    'Classroom Vocabulary & Phonetics Station',
                    style: P5Text.heading(P5Colors.teal).copyWith(fontSize: 22),
                  ),
                ],
              ),
              Row(
                children: [
                  ActionChip(
                    avatar: Icon(
                      _audioService.playbackSpeed < 1.0 ? Icons.slow_motion_video_rounded : Icons.speed_rounded,
                      size: 18,
                      color: P5Colors.teal,
                    ),
                    label: Text(
                      _audioService.playbackSpeed < 1.0 ? 'Speed: 0.8x (Slower)' : 'Speed: 1.0x (Normal)',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    backgroundColor: _audioService.playbackSpeed < 1.0 ? P5Colors.gold.withOpacity(0.3) : P5Colors.cream,
                    onPressed: () {
                      final newSpeed = _audioService.playbackSpeed == 1.0 ? 0.8 : 1.0;
                      setState(() => _audioService.setPlaybackSpeed(newSpeed));
                      _audioService.playSfx(P5SfxType.click);
                    },
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: P5Colors.cream,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${widget.lesson.vocabItems.length} PHRASES TO PRACTICE',
                      style: P5Text.body(P5Colors.charcoal).copyWith(fontSize: 13, fontWeight: FontWeight.w800),
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
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.1,
              ),
              itemCount: widget.lesson.vocabItems.length,
              itemBuilder: (context, index) {
                final item = widget.lesson.vocabItems[index];
                return Material(
                  color: P5Colors.cream,
                  borderRadius: BorderRadius.circular(18),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () => _audioService.playPhrase(item.audioKey, term: widget.lesson.term),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: P5Colors.teal,
                            child: Icon(item.icon, color: P5Colors.white, size: 24),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(item.french, style: P5Text.frenchPhrase(P5Colors.charcoal).copyWith(fontSize: 15), maxLines: 1, overflow: TextOverflow.ellipsis),
                                Text('"${item.phonetics}"', style: P5Text.caption(P5Colors.gold).copyWith(fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
                                Text(item.english, style: P5Text.caption(P5Colors.charcoal).copyWith(fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          const Icon(Icons.volume_up_rounded, color: P5Colors.teal, size: 20),
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
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ChoiceChip(
                    avatar: const Icon(Icons.touch_app_rounded, size: 18),
                    label: Text('1. Interactive Drills (${widget.lesson.classworkExercises.length})'),
                    selected: _classworkSubTab == 0,
                    onSelected: (s) => setState(() => _classworkSubTab = 0),
                  ),
                  const SizedBox(width: 12),
                  ChoiceChip(
                    avatar: const Icon(Icons.quiz_rounded, size: 18),
                    label: Text('2. Scheme Evaluation Q&A (${widget.lesson.evaluationQuestions.length})'),
                    selected: _classworkSubTab == 1,
                    onSelected: (s) => setState(() => _classworkSubTab = 1),
                  ),
                ],
              ),
            ],
          ),
          const Divider(height: 20),

          Expanded(
            child: _classworkSubTab == 0 ? _buildExercisesTab() : _buildEvaluationsTab(),
          ),
        ],
      ),
    );
  }

  Widget _buildExercisesTab() {
    if (widget.lesson.classworkExercises.isEmpty) {
      return const Center(child: Text('No interactive drills for this week.'));
    }
    final ex = widget.lesson.classworkExercises[_activeExerciseIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Exercise ${_activeExerciseIndex + 1} of ${widget.lesson.classworkExercises.length}:',
          style: P5Text.caption(P5Colors.teal).copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(ex.prompt, style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 18)),
        const SizedBox(height: 14),

        Expanded(
          child: ListView.builder(
            itemCount: ex.options.length,
            itemBuilder: (context, index) {
              final isSelected = _selectedOptionIndex == index;
              final isCorrect = index == ex.correctOptionIndex;
              Color bg = P5Colors.cream;
              if (_hasCheckedAnswer) {
                if (isCorrect) bg = P5Colors.green.withOpacity(0.2);
                else if (isSelected) bg = P5Colors.red.withOpacity(0.2);
              } else if (isSelected) {
                bg = P5Colors.turquoise.withOpacity(0.3);
              }

              return Card(
                color: bg,
                margin: const EdgeInsets.only(bottom: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  title: Text(ex.options[index], style: P5Text.body(P5Colors.charcoal)),
                  onTap: _hasCheckedAnswer ? null : () => setState(() => _selectedOptionIndex = index),
                ),
              );
            },
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!_hasCheckedAnswer)
              ElevatedButton(
                onPressed: _selectedOptionIndex == null ? null : () {
                  setState(() => _hasCheckedAnswer = true);
                  final isCorrect = _selectedOptionIndex == ex.correctOptionIndex;
                  _audioService.playSfx(isCorrect ? P5SfxType.correct : P5SfxType.incorrect);
                },
                child: const Text('Check Answer'),
              )
            else
              Text(
                _selectedOptionIndex == ex.correctOptionIndex ? 'Correct! ${ex.explanation}' : 'Incorrect. ${ex.explanation}',
                style: TextStyle(
                  color: _selectedOptionIndex == ex.correctOptionIndex ? P5Colors.green : P5Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

            if (_activeExerciseIndex < widget.lesson.classworkExercises.length - 1)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _activeExerciseIndex++;
                    _selectedOptionIndex = null;
                    _hasCheckedAnswer = false;
                  });
                },
                child: const Text('Next Drill'),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildEvaluationsTab() {
    return ListView.builder(
      itemCount: widget.lesson.evaluationQuestions.length,
      itemBuilder: (context, index) {
        final q = widget.lesson.evaluationQuestions[index];
        final isRevealed = _revealedQuestionIndex == index;
        return Card(
          color: P5Colors.cream,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: P5Colors.teal,
                      child: Text('${index + 1}', style: const TextStyle(color: P5Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(q.question, style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16)),
                    ),
                    TextButton.icon(
                      onPressed: () => setState(() => _revealedQuestionIndex = isRevealed ? -1 : index),
                      icon: Icon(isRevealed ? Icons.visibility_off_rounded : Icons.visibility_rounded),
                      label: Text(isRevealed ? 'Hide' : 'Reveal Answer'),
                    ),
                  ],
                ),
                if (isRevealed) ...[
                  const Divider(height: 16),
                  Text('Answer: ${q.answer}', style: P5Text.body(P5Colors.green).copyWith(fontWeight: FontWeight.bold)),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSummaryView() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: P5Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.assignment_turned_in_rounded, color: P5Colors.teal, size: 28),
              const SizedBox(width: 10),
              Text(
                'Summary & Homework Assignment',
                style: P5Text.heading(P5Colors.teal).copyWith(fontSize: 22),
              ),
            ],
          ),
          const Divider(height: 20),

          if (widget.lesson.grammarNote != null) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: P5Colors.teal.withOpacity(0.08),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.lesson.grammarNote!.title,
                    style: P5Text.subheading(P5Colors.teal).copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(widget.lesson.grammarNote!.explanation, style: P5Text.body(P5Colors.charcoal).copyWith(fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],

          Text('Take-Home Homework Tasks:', style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: widget.lesson.assignmentTasks.length,
              itemBuilder: (context, index) {
                final task = widget.lesson.assignmentTasks[index];
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: P5Colors.gold,
                    child: Icon(Icons.home_work_rounded, color: P5Colors.charcoal),
                  ),
                  title: Text(task.category, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(task.instruction),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    final currentIndex = _phaseSteps.indexWhere((s) => s['phase'] == _phase);
    final isFirst = currentIndex == 0;
    final isLast = currentIndex == _phaseSteps.length - 1;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: P5Colors.teal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: isFirst ? null : _prevPhase,
            icon: const Icon(Icons.arrow_back_rounded),
            label: const Text('Previous Phase'),
            style: ElevatedButton.styleFrom(
              backgroundColor: P5Colors.white.withOpacity(0.2),
              foregroundColor: P5Colors.white,
            ),
          ),
          ElevatedButton.icon(
            onPressed: _nextPhase,
            icon: Icon(isLast ? Icons.check_circle_rounded : Icons.arrow_forward_rounded),
            label: Text(isLast ? 'Complete Lesson' : 'Next Phase'),
            style: ElevatedButton.styleFrom(
              backgroundColor: P5Colors.gold,
              foregroundColor: P5Colors.charcoal,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
