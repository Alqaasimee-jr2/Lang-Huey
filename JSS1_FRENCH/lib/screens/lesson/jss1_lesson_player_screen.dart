import 'package:flutter/material.dart';
import '../../models/jss1_lesson_model.dart';
import '../../services/jss1_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../../widgets/drills/jss1_interactive_drill_engine_widget.dart';

// Term 1 Bespoke Teaching & Revision Pattern Widgets
import '../../widgets/patterns/term1/jss1_classroom_commands_widget.dart';
import '../../widgets/patterns/term1/jss1_greeting_studio_widget.dart';
import '../../widgets/patterns/term1/jss1_self_intro_studio_widget.dart';
import '../../widgets/patterns/term1/jss1_spelling_and_dictation_widget.dart';
import '../../widgets/patterns/term1/jss1_present_others_studio_widget.dart';
import '../../widgets/patterns/term1/jss1_character_portrait_studio_widget.dart';
import '../../widgets/patterns/term1/jss1_hobbies_and_leisure_widget.dart';
import '../../widgets/patterns/term1/jss1_tastes_and_preferences_widget.dart';
import '../../widgets/patterns/term1/jss1_term1_revision_rally_widget.dart';

// Term 2 Bespoke Teaching & Revision Pattern Widgets
import '../../widgets/patterns/term2/jss1_object_properties_studio_widget.dart';
import '../../widgets/patterns/term2/jss1_polite_requests_studio_widget.dart';
import '../../widgets/patterns/term2/jss1_professions_studio_widget.dart';
import '../../widgets/patterns/term2/jss1_clock_time_studio_widget.dart';
import '../../widgets/patterns/term2/jss1_daily_schedule_studio_widget.dart';
import '../../widgets/patterns/term2/jss1_calendar_dates_studio_widget.dart';
import '../../widgets/patterns/term2/jss1_event_sequencer_studio_widget.dart';
import '../../widgets/patterns/term2/jss1_weekly_routine_studio_widget.dart';
import '../../widgets/patterns/term2/jss1_term2_revision_rally_widget.dart';

// Term 3 Bespoke Teaching & Revision Pattern Widgets
import '../../widgets/patterns/term3/jss1_weather_and_seasons_studio_widget.dart';
import '../../widgets/patterns/term3/jss1_frequency_adverbs_studio_widget.dart';
import '../../widgets/patterns/term3/jss1_invitations_studio_widget.dart';
import '../../widgets/patterns/term3/jss1_commands_and_prohibitions_studio_widget.dart';
import '../../widgets/patterns/term3/jss1_permission_and_advice_studio_widget.dart';
import '../../widgets/patterns/term3/jss1_directions_and_procedures_studio_widget.dart';
import '../../widgets/patterns/term3/jss1_communicative_roleplay_studio_widget.dart';
import '../../widgets/patterns/term3/jss1_written_oral_workshop_studio_widget.dart';
import '../../widgets/patterns/term3/jss1_term3_annual_grand_rally_widget.dart';

enum JSS1LessonPhase {
  interactivePattern, // Phase 1: Topic Learning Model / Interactive Lab
  vocabLab,           // Phase 2: Target Vocabulary & Phonetics
  drills,             // Phase 3: Interactive Practice Drills (6+)
  summary,            // Phase 4: Lesson Summary & Homework
}

class JSS1LessonPlayerScreen extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1LessonPlayerScreen({super.key, required this.lesson});

  @override
  State<JSS1LessonPlayerScreen> createState() => _JSS1LessonPlayerScreenState();
}

class _JSS1LessonPlayerScreenState extends State<JSS1LessonPlayerScreen> {
  final JSS1AudioService _audioService = JSS1AudioService();
  JSS1LessonPhase _phase = JSS1LessonPhase.interactivePattern;

  void _goToNextPhase() => _nextPhase();

  final List<Map<String, dynamic>> _phaseSteps = [
    {'phase': JSS1LessonPhase.interactivePattern, 'title': '1. Learning Lab', 'icon': Icons.touch_app_rounded},
    {'phase': JSS1LessonPhase.vocabLab, 'title': '2. Vocabulary & Audio', 'icon': Icons.record_voice_over_rounded},
    {'phase': JSS1LessonPhase.drills, 'title': '3. Practice Drills', 'icon': Icons.quiz_rounded},
    {'phase': JSS1LessonPhase.summary, 'title': '4. Summary & Homework', 'icon': Icons.assignment_turned_in_rounded},
  ];

  void _nextPhase() {
    final currentIndex = _phaseSteps.indexWhere((s) => s['phase'] == _phase);
    if (currentIndex < _phaseSteps.length - 1) {
      setState(() {
        _phase = _phaseSteps[currentIndex + 1]['phase'] as JSS1LessonPhase;
      });
    } else {
      Navigator.pop(context, true);
    }
  }

  void _prevPhase() {
    final currentIndex = _phaseSteps.indexWhere((s) => s['phase'] == _phase);
    if (currentIndex > 0) {
      setState(() {
        _phase = _phaseSteps[currentIndex - 1]['phase'] as JSS1LessonPhase;
      });
    }
  }

  void _showTeacherGuideModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: JSS1Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(color: Colors.black38, blurRadius: 24, offset: Offset(0, -4)),
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
                          color: JSS1Colors.teal,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.school_rounded, color: JSS1Colors.gold, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Teacher Facilitator Guide',
                            style: JSS1Text.heading(JSS1Colors.teal).copyWith(fontSize: 18),
                          ),
                          Text(
                            'For Teacher Reference Only • Not Displayed on Student Smartboard',
                            style: JSS1Text.caption(JSS1Colors.grey).copyWith(fontSize: 11),
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
              const Divider(height: 24),

              Text(
                'Official NERDC Curriculum Objectives:',
                style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...widget.lesson.objectives.map((obj) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ', style: TextStyle(fontWeight: FontWeight.bold, color: JSS1Colors.teal, fontSize: 16)),
                        Expanded(
                          child: Text(obj, style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontSize: 13, height: 1.3)),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 14),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: JSS1Colors.gold.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: JSS1Colors.gold, width: 1.5),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.lightbulb_rounded, color: JSS1Colors.gold, size: 24),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cultural Context & Teaching Strategy:',
                            style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.lesson.culturalInsight,
                            style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontSize: 12),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JSS1Colors.cream,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopNavBar(),
            _buildPhaseStepper(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: _buildPhaseContent(),
              ),
            ),
            _buildBottomActionBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: JSS1Colors.teal,
        boxShadow: [
          BoxShadow(
            color: JSS1Colors.charcoal.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: JSS1Colors.white),
            onPressed: () => Navigator.pop(context),
            tooltip: 'Back to Roadmap',
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: JSS1Colors.gold,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'JSS1 • WEEK ${widget.lesson.week}',
              style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.lesson.topic,
                  style: JSS1Text.subheading(JSS1Colors.white).copyWith(fontSize: 17),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.lesson.subtitle,
                  style: JSS1Text.caption(JSS1Colors.cream).copyWith(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // Teacher Guide Trigger
          InkWell(
            onTap: _showTeacherGuideModal,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: JSS1Colors.gold,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 4),
                ],
              ),
              child: const Row(
                children: [
                  Icon(Icons.school_rounded, color: JSS1Colors.charcoal, size: 18),
                  SizedBox(width: 6),
                  Text('Teacher Guide', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12, color: JSS1Colors.charcoal)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Audio Speed Toggle
          _buildSpeedToggle(),
        ],
      ),
    );
  }

  Widget _buildSpeedToggle() {
    final isSlow = _audioService.playbackSpeed < 0.95;
    return Container(
      decoration: BoxDecoration(
        color: JSS1Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          _speedButton('0.8x', isSlow, 0.8),
          _speedButton('1.0x', !isSlow, 1.0),
        ],
      ),
    );
  }

  Widget _speedButton(String label, bool isSelected, double speed) {
    return InkWell(
      onTap: () async {
        await _audioService.setPlaybackSpeed(speed);
        setState(() {});
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? JSS1Colors.gold : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: JSS1Text.caption(isSelected ? JSS1Colors.charcoal : JSS1Colors.white).copyWith(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _buildPhaseStepper() {
    return Container(
      color: JSS1Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        children: _phaseSteps.map((step) {
          final isCurrent = step['phase'] == _phase;
          final stepIndex = _phaseSteps.indexOf(step);
          final currentIndex = _phaseSteps.indexWhere((s) => s['phase'] == _phase);
          final isPast = stepIndex < currentIndex;

          return Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  _phase = step['phase'] as JSS1LessonPhase;
                });
                _audioService.playClick();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: isCurrent
                      ? JSS1Colors.teal.withOpacity(0.1)
                      : (isPast ? JSS1Colors.green.withOpacity(0.08) : Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isCurrent
                        ? JSS1Colors.teal
                        : (isPast ? JSS1Colors.green.withOpacity(0.3) : Colors.transparent),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isPast ? Icons.check_circle_rounded : step['icon'] as IconData,
                      size: 16,
                      color: isCurrent ? JSS1Colors.teal : (isPast ? JSS1Colors.green : JSS1Colors.grey),
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        step['title'] as String,
                        style: JSS1Text.caption(
                          isCurrent ? JSS1Colors.teal : (isPast ? JSS1Colors.charcoal : JSS1Colors.grey),
                        ).copyWith(
                          fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w600,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPhaseContent() {
    switch (_phase) {
      case JSS1LessonPhase.interactivePattern:
        return _buildPatternView();
      case JSS1LessonPhase.vocabLab:
        return _buildVocabLabView();
      case JSS1LessonPhase.drills:
        return _buildDrillsView();
      case JSS1LessonPhase.summary:
        return _buildSummaryView();
    }
  }

  Widget _buildPatternView() {
    switch (widget.lesson.patternType) {
      // Term 1 Patterns
      case JSS1PatternType.classroomCommands:
        return JSS1ClassroomCommandsWidget(lesson: widget.lesson);
      case JSS1PatternType.greetingStudio:
        return JSS1GreetingStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.selfIntroStudio:
        return JSS1SelfIntroStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.spellingAndDictation:
        return JSS1SpellingAndDictationWidget(lesson: widget.lesson);
      case JSS1PatternType.presentOthersStudio:
        return JSS1PresentOthersStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.characterPortraitStudio:
        return JSS1CharacterPortraitStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.hobbiesAndLeisure:
        return JSS1HobbiesAndLeisureWidget(lesson: widget.lesson);
      case JSS1PatternType.tastesAndPreferences:
        return JSS1TastesAndPreferencesWidget(lesson: widget.lesson);
      case JSS1PatternType.term1RevisionRally:
        return JSS1Term1RevisionRallyWidget(lesson: widget.lesson);

      // Term 2 Patterns
      case JSS1PatternType.objectPropertiesStudio:
        return JSS1ObjectPropertiesStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.politeRequestsStudio:
        return JSS1PoliteRequestsStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.professionsStudio:
        return JSS1ProfessionsStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.clockTimeStudio:
        return JSS1ClockTimeStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.dailyScheduleStudio:
        return JSS1DailyScheduleStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.calendarDatesStudio:
        return JSS1CalendarDatesStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.eventSequencerStudio:
        return JSS1EventSequencerStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.weeklyRoutineStudio:
        return JSS1WeeklyRoutineStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.term2RevisionRally:
        return JSS1Term2RevisionRallyWidget(lesson: widget.lesson);

      // Term 3 Patterns
      case JSS1PatternType.weatherAndSeasonsStudio:
        return JSS1WeatherAndSeasonsStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.frequencyAdverbsStudio:
        return JSS1FrequencyAdverbsStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.invitationsStudio:
        return JSS1InvitationsStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.commandsAndProhibitionsStudio:
        return JSS1CommandsAndProhibitionsStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.permissionAndAdviceStudio:
        return JSS1PermissionAndAdviceStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.directionsAndProceduresStudio:
        return JSS1DirectionsAndProceduresStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.communicativeRoleplayStudio:
        return JSS1CommunicativeRoleplayStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.writtenOralWorkshopStudio:
        return JSS1WrittenOralWorkshopStudioWidget(lesson: widget.lesson);
      case JSS1PatternType.term3AnnualGrandRally:
        return JSS1Term3AnnualGrandRallyWidget(lesson: widget.lesson);
    }
  }

  Widget _buildVocabLabView() {
    return Row(
      children: [
        // Left Column: Vocabulary Grid
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Vocabulary Station (${widget.lesson.vocabItems.length} Key Words)', style: JSS1Text.subheading(JSS1Colors.charcoal)),
                    Text('Tap card to listen', style: JSS1Text.caption(JSS1Colors.teal)),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    itemCount: widget.lesson.vocabItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, idx) {
                      final item = widget.lesson.vocabItems[idx];
                      return InkWell(
                        onTap: () => _audioService.playPhrase(item.audioKey, term: widget.lesson.term),
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: JSS1Colors.cream,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: JSS1Colors.lightGrey),
                          ),
                          child: Row(
                            children: [
                              Icon(item.icon, color: JSS1Colors.teal, size: 22),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(item.french, style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800, fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis),
                                    Text('/${item.phonetics}/', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontSize: 11, fontStyle: FontStyle.italic), maxLines: 1, overflow: TextOverflow.ellipsis),
                                    Text(item.english, style: JSS1Text.caption(JSS1Colors.grey).copyWith(fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal, size: 18),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 20),

        // Right Column: Grammar Notes & Usage Rules
        if (widget.lesson.grammarNote != null)
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: JSS1Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: JSS1Colors.teal.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.menu_book_rounded, color: JSS1Colors.teal, size: 22),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(widget.lesson.grammarNote!.title, style: JSS1Text.subheading(JSS1Colors.teal).copyWith(fontSize: 16)),
                      ),
                    ],
                  ),
                  const Divider(height: 20),
                  Text(
                    widget.lesson.grammarNote!.explanation,
                    style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 14),
                  Text('Examples:', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  ...widget.lesson.grammarNote!.examples.map((ex) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ', style: TextStyle(color: JSS1Colors.gold, fontWeight: FontWeight.bold)),
                            Expanded(child: Text(ex, style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontSize: 13))),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDrillsView() {
    return JSS1InteractiveDrillEngineWidget(
      drills: widget.lesson.classworkExercises,
      term: widget.lesson.term,
      onComplete: _goToNextPhase,
    );
  }

  Widget _buildSummaryView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.assignment_turned_in_rounded, color: JSS1Colors.teal, size: 28),
                    const SizedBox(width: 12),
                    Text('Lesson Summary & Take-Home Assignments', style: JSS1Text.heading(JSS1Colors.teal)),
                  ],
                ),
                const SizedBox(height: 16),
                Text('Bravo on completing this session! Record the following tasks in your French notebook:', style: JSS1Text.body(JSS1Colors.charcoal)),
                const SizedBox(height: 16),
                ...widget.lesson.assignmentTasks.map((task) => Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: JSS1Colors.cream,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: JSS1Colors.lightGrey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(task.category, style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.w900)),
                          const SizedBox(height: 4),
                          Text(task.instruction, style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontSize: 14)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionBar() {
    final currentIndex = _phaseSteps.indexWhere((s) => s['phase'] == _phase);
    final isFirst = currentIndex == 0;
    final isLast = currentIndex == _phaseSteps.length - 1;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        color: JSS1Colors.white,
        border: Border(top: BorderSide(color: JSS1Colors.lightGrey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: isFirst ? null : _prevPhase,
            style: ElevatedButton.styleFrom(
              backgroundColor: JSS1Colors.cream,
              foregroundColor: JSS1Colors.charcoal,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            icon: const Icon(Icons.arrow_back_rounded),
            label: const Text('Previous Phase'),
          ),
          ElevatedButton.icon(
            onPressed: _nextPhase,
            style: ElevatedButton.styleFrom(
              backgroundColor: isLast ? JSS1Colors.green : JSS1Colors.teal,
              foregroundColor: JSS1Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            icon: Icon(isLast ? Icons.check_circle_rounded : Icons.arrow_forward_rounded),
            label: Text(
              isLast ? 'Complete Lesson' : 'Next Phase',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
