import 'package:flutter/material.dart';
import '../../models/jss3_lesson_model.dart';
import '../../services/jss3_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../../widgets/drills/jss3_interactive_drill_engine_widget.dart';

// Term 1 Pattern Studios
import '../../widgets/patterns/term1/jss3_person_description_studio_widget.dart';
import '../../widgets/patterns/term1/jss3_landscapes_landmarks_studio_widget.dart';
import '../../widgets/patterns/term1/jss3_habits_and_routine_studio_widget.dart';
import '../../widgets/patterns/term1/jss3_past_memories_studio_widget.dart';
import '../../widgets/patterns/term1/jss3_object_description_studio_widget.dart';
import '../../widgets/patterns/term1/jss3_comparison_superlatives_studio_widget.dart';
import '../../widgets/patterns/term1/jss3_dating_time_measurement_studio_widget.dart';
import '../../widgets/patterns/term1/jss3_day_chronological_narrative_studio_widget.dart';
import '../../widgets/patterns/term1/jss3_term1_revision_rally_widget.dart';

// Term 2 Pattern Studios
import '../../widgets/patterns/term2/jss3_narrating_past_events_studio_widget.dart';
import '../../widgets/patterns/term2/jss3_recent_events_venir_de_studio_widget.dart';
import '../../widgets/patterns/term2/jss3_diary_and_narrative_studio_widget.dart';
import '../../widgets/patterns/term2/jss3_near_future_intentions_studio_widget.dart';
import '../../widgets/patterns/term2/jss3_future_plans_and_aspirations_studio_widget.dart';
import '../../widgets/patterns/term2/jss3_term2_consolidation_studio_widget.dart';
import '../../widgets/patterns/term2/jss3_bece_grammar_prep_studio_widget.dart';
import '../../widgets/patterns/term2/jss3_bece_vocab_essay_prep_studio_widget.dart';
import '../../widgets/patterns/term2/jss3_term2_revision_rally_widget.dart';

class JSS3LessonPlayerScreen extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3LessonPlayerScreen({super.key, required this.lesson});

  @override
  State<JSS3LessonPlayerScreen> createState() => _JSS3LessonPlayerScreenState();
}

class _JSS3LessonPlayerScreenState extends State<JSS3LessonPlayerScreen> {
  final JSS3AudioService _audio = JSS3AudioService();
  int _currentPhaseIndex = 0; // 0: Lab/Model, 1: Vocab, 2: Drills, 3: Summary
  bool _isSlowRate = false;

  final List<String> _phaseNames = [
    'Learning Lab',
    'Vocabulary',
    'Practice Drills',
    'Summary',
  ];

  final List<IconData> _phaseIcons = [
    Icons.lightbulb_rounded,
    Icons.record_voice_over_rounded,
    Icons.sports_esports_rounded,
    Icons.menu_book_rounded,
  ];

  void _switchPhase(int newIndex) {
    if (newIndex >= 0 && newIndex < 4) {
      _audio.playClick();
      setState(() => _currentPhaseIndex = newIndex);
    }
  }

  void _showTeacherGuideModal() {
    _audio.playClick();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(20),
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
                          color: LangHueyColors.deepTeal,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.school_rounded, color: LangHueyColors.amberGold, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Teacher Facilitator Guide',
                            style: LangHueyTextStyles.h2.copyWith(fontSize: 18, color: LangHueyColors.deepTeal),
                          ),
                          Text(
                            'For Teacher Reference Only • Not Displayed to Students',
                            style: LangHueyTextStyles.bodySmall.copyWith(fontSize: 11),
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
              Text('TEACHER FACILITATOR PROMPT', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: LangHueyColors.deepTeal, letterSpacing: 1)),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: LangHueyColors.softTeal.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.2)),
                ),
                child: Text(
                  widget.lesson.teacherFacilitatorPrompt,
                  style: const TextStyle(fontSize: 13, height: 1.4, color: LangHueyColors.charcoal),
                ),
              ),
              const SizedBox(height: 18),
              Text('CURRICULUM OBJECTIVES', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: LangHueyColors.deepTeal, letterSpacing: 1)),
              const SizedBox(height: 8),
              ...widget.lesson.objectives.map((obj) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle_outline_rounded, color: LangHueyColors.deepTeal, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(obj, style: const TextStyle(fontSize: 13, color: LangHueyColors.charcoal)),
                    ),
                  ],
                ),
              )),
              const SizedBox(height: 14),
              Text('CULTURAL INSIGHT', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: LangHueyColors.amberGold, letterSpacing: 1)),
              const SizedBox(height: 6),
              Text(
                widget.lesson.culturalInsight,
                style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: LangHueyColors.charcoal),
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
      backgroundColor: LangHueyColors.warmCream,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: LangHueyColors.charcoal),
          onPressed: () {
            _audio.playClick();
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Week ${widget.lesson.weekNumber} • ${widget.lesson.frenchTitle}',
              style: LangHueyTextStyles.h3.copyWith(fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              widget.lesson.englishSubtitle,
              style: LangHueyTextStyles.bodySmall.copyWith(fontSize: 11),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: [
          // Audio Speed Toggle
          ActionChip(
            avatar: Icon(
              _isSlowRate ? Icons.slow_motion_video_rounded : Icons.speed_rounded,
              size: 16,
              color: _isSlowRate ? Colors.white : LangHueyColors.deepTeal,
            ),
            label: Text(
              _isSlowRate ? '0.8x Slow' : '1.0x Normal',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: _isSlowRate ? Colors.white : LangHueyColors.deepTeal,
              ),
            ),
            backgroundColor: _isSlowRate ? LangHueyColors.deepTeal : LangHueyColors.softTeal,
            onPressed: () {
              setState(() {
                _isSlowRate = !_isSlowRate;
                _audio.setSlowRate(_isSlowRate);
              });
              _audio.playClick();
            },
          ),
          const SizedBox(width: 8),
          // Teacher Guide Action Button
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ActionChip(
              avatar: const Icon(Icons.school_rounded, size: 16, color: Colors.white),
              label: const Text(
                'Teacher Guide',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              backgroundColor: LangHueyColors.deepTeal,
              onPressed: _showTeacherGuideModal,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildPhaseTabBar(),
          Expanded(
            child: _buildCurrentPhaseView(),
          ),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildPhaseTabBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: List.generate(4, (index) {
          final isSelected = _currentPhaseIndex == index;
          return Expanded(
            child: InkWell(
              onTap: () => _switchPhase(index),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? LangHueyColors.softTeal : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? LangHueyColors.deepTeal : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _phaseIcons[index],
                      size: 20,
                      color: isSelected ? LangHueyColors.deepTeal : LangHueyColors.textMuted,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _phaseNames[index],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                        color: isSelected ? LangHueyColors.deepTeal : LangHueyColors.textMuted,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_currentPhaseIndex > 0)
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: LangHueyColors.deepTeal,
                side: const BorderSide(color: LangHueyColors.deepTeal),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              icon: const Icon(Icons.arrow_back_rounded, size: 18),
              label: const Text('Previous', style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () => _switchPhase(_currentPhaseIndex - 1),
            )
          else
            const SizedBox(width: 100),
          Row(
            children: List.generate(4, (index) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPhaseIndex == index
                      ? LangHueyColors.deepTeal
                      : LangHueyColors.softTeal,
                ),
              );
            }),
          ),
          if (_currentPhaseIndex < 3)
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: LangHueyColors.deepTeal,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              ),
              label: const Text('Next', style: TextStyle(fontWeight: FontWeight.bold)),
              icon: const Icon(Icons.arrow_forward_rounded, size: 18),
              onPressed: () => _switchPhase(_currentPhaseIndex + 1),
            )
          else
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: LangHueyColors.amberGold,
                foregroundColor: Colors.brown.shade900,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              ),
              icon: const Icon(Icons.check_circle_rounded, size: 18),
              label: const Text('Finish Lesson', style: TextStyle(fontWeight: FontWeight.w900)),
              onPressed: () {
                _audio.playCelebration();
                Navigator.pop(context, true);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildCurrentPhaseView() {
    switch (_currentPhaseIndex) {
      case 0:
        return _buildInteractiveLabView();
      case 1:
        return _buildVocabularyView();
      case 2:
        return _buildInteractiveDrillsView();
      case 3:
        return _buildSummaryAndHomeworkView();
      default:
        return const SizedBox();
    }
  }

  // Phase 1: Lab Interactif / Learning Model
  Widget _buildInteractiveLabView() {
    switch (widget.lesson.patternType) {
      // Term 1 Patterns
      case JSS3PatternType.personDescriptionStudio:
        return JSS3PersonDescriptionStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.landscapesLandmarksStudio:
        return JSS3LandscapesLandmarksStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.habitsAndRoutineStudio:
        return JSS3HabitsAndRoutineStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.pastMemoriesStudio:
        return JSS3PastMemoriesStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.objectDescriptionStudio:
        return JSS3ObjectDescriptionStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.comparisonSuperlativesStudio:
        return JSS3ComparisonSuperlativesStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.datingTimeMeasurementStudio:
        return JSS3DatingTimeMeasurementStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.dayChronologicalNarrativeStudio:
        return JSS3DayChronologicalNarrativeStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.term1RevisionRally:
        return JSS3Term1RevisionRallyWidget(lesson: widget.lesson);

      // Term 2 Patterns
      case JSS3PatternType.narratingPastEventsStudio:
        return JSS3NarratingPastEventsStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.recentEventsVenirDeStudio:
        return JSS3RecentEventsVenirDeStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.diaryAndNarrativeStudio:
        return JSS3DiaryAndNarrativeStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.nearFutureIntentionsStudio:
        return JSS3NearFutureIntentionsStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.futurePlansAndAspirationsStudio:
        return JSS3FuturePlansAndAspirationsStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.term2ConsolidationStudio:
        return JSS3Term2ConsolidationStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.beceGrammarPrepStudio:
        return JSS3BECEGrammarPrepStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.beceVocabEssayPrepStudio:
        return JSS3BECEVocabEssayPrepStudioWidget(lesson: widget.lesson);
      case JSS3PatternType.term2RevisionRally:
        return JSS3Term2RevisionRallyWidget(lesson: widget.lesson);
    }
  }

  // Phase 2: Vocabulaire & Phonétique Soundboard
  Widget _buildVocabularyView() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: widget.lesson.vocabulary.length,
      itemBuilder: (context, index) {
        final item = widget.lesson.vocabulary[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black12),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 2)),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.volume_up_rounded, color: LangHueyColors.deepTeal, size: 28),
                onPressed: () {
                  _audio.playPhrase(item.audioKey, term: widget.lesson.termNumber);
                },
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.french,
                            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: LangHueyColors.charcoal),
                          ),
                        ),
                        Text(
                          item.phonetics,
                          style: TextStyle(fontFamily: 'monospace', color: Colors.blueGrey.shade600, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.english,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: LangHueyColors.deepTeal),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Text(
                        'Ex : ${item.usageNote}',
                        style: TextStyle(color: Colors.grey.shade800, fontSize: 12, fontStyle: FontStyle.italic),
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

  // Phase 3: Interactive Practice Drills Engine
  Widget _buildInteractiveDrillsView() {
    return JSS3InteractiveDrillEngineWidget(
      drills: widget.lesson.exercises,
      term: widget.lesson.termNumber,
      onComplete: () {
        _switchPhase(3); // Advance to Summary phase
      },
    );
  }

  // Phase 4: Résumé de Cours & Devoirs
  Widget _buildSummaryAndHomeworkView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Grammar Note Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.bookmark_added_rounded, color: LangHueyColors.deepTeal, size: 24),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Point de Grammaire : ${widget.lesson.grammarNote.title}',
                        style: LangHueyTextStyles.h3.copyWith(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  widget.lesson.grammarNote.explanation,
                  style: const TextStyle(fontSize: 13, height: 1.5, color: LangHueyColors.charcoal),
                ),
                const SizedBox(height: 16),
                const Text('Exemples Pratiques :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: LangHueyColors.deepTeal)),
                const SizedBox(height: 8),
                ...widget.lesson.grammarNote.examples.map((ex) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ', style: TextStyle(fontWeight: FontWeight.bold, color: LangHueyColors.deepTeal)),
                        Expanded(
                          child: Text(ex, style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: LangHueyColors.charcoal)),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Homework & Tasks Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.black12),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.assignment_turned_in_rounded, color: LangHueyColors.amberGold, size: 24),
                    const SizedBox(width: 10),
                    Text('Devoirs & Travaux Pratiques (Homework) :', style: LangHueyTextStyles.h3.copyWith(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 14),
                ...widget.lesson.homework.map((hw) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: LangHueyColors.softTeal.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: LangHueyColors.deepTeal,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                hw.category,
                                style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(hw.instruction, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: LangHueyColors.charcoal)),
                        if (hw.exampleResponse != null) ...[
                          const SizedBox(height: 6),
                          Text(
                            'Exemple : ${hw.exampleResponse}',
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
