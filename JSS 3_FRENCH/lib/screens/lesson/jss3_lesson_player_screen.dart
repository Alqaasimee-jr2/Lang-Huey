import 'package:flutter/material.dart';
import '../../models/jss3_lesson_model.dart';
import '../../services/jss3_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
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
  int _currentPhaseIndex = 0;
  bool _isSlowRate = false;

  // Exercise & Evaluation state
  final Map<int, int?> _selectedExerciseAnswers = {};
  final Map<int, bool> _revealedEvaluationAnswers = {};

  final List<String> _phaseNames = [
    'Objectifs & Contexte',
    'Lab Interactif',
    'Vocabulaire & Phonétique',
    'Exercices & Évaluation',
    'Résumé & Devoirs',
  ];

  final List<IconData> _phaseIcons = [
    Icons.flag_rounded,
    Icons.touch_app_rounded,
    Icons.record_voice_over_rounded,
    Icons.quiz_rounded,
    Icons.assignment_rounded,
  ];

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
              'Semaine ${widget.lesson.weekNumber} • ${widget.lesson.frenchTitle}',
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
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ActionChip(
              avatar: Icon(
                _isSlowRate ? Icons.slow_motion_video_rounded : Icons.speed_rounded,
                size: 16,
                color: _isSlowRate ? Colors.white : LangHueyColors.deepTeal,
              ),
              label: Text(
                _isSlowRate ? '0.8x Lent' : '1.0x Normal',
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
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTeacherCueBar(),
          _buildPhaseTabBar(),
          Expanded(
            child: _buildCurrentPhaseView(),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherCueBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: LangHueyColors.charcoal,
        border: Border(bottom: BorderSide(color: LangHueyColors.amberGold.withOpacity(0.5))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.school_rounded, color: LangHueyColors.amberGold, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 12, color: Colors.white70, height: 1.3),
                children: [
                  const TextSpan(
                    text: 'FACILITATEUR : ',
                    style: TextStyle(fontWeight: FontWeight.bold, color: LangHueyColors.amberGold),
                  ),
                  TextSpan(text: widget.lesson.teacherFacilitatorPrompt),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseTabBar() {
    return Container(
      color: Colors.white,
      height: 52,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _phaseNames.length,
        itemBuilder: (context, index) {
          final isSelected = _currentPhaseIndex == index;
          return InkWell(
            onTap: () {
              setState(() => _currentPhaseIndex = index);
              _audio.playClick();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? LangHueyColors.deepTeal : Colors.transparent,
                    width: 3,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _phaseIcons[index],
                    size: 16,
                    color: isSelected ? LangHueyColors.deepTeal : LangHueyColors.textMuted,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _phaseNames[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? LangHueyColors.deepTeal : LangHueyColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCurrentPhaseView() {
    switch (_currentPhaseIndex) {
      case 0:
        return _buildObjectivesView();
      case 1:
        return _buildInteractiveLabView();
      case 2:
        return _buildVocabularyView();
      case 3:
        return _buildExercisesView();
      case 4:
        return _buildSummaryAndHomeworkView();
      default:
        return const SizedBox();
    }
  }

  // Phase 1: Objectifs & Contexte
  Widget _buildObjectivesView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Objectives Card
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
                    const Icon(Icons.track_changes_rounded, color: LangHueyColors.deepTeal, size: 24),
                    const SizedBox(width: 10),
                    Text('Objectifs Pédagogiques du Cours :', style: LangHueyTextStyles.h3),
                  ],
                ),
                const SizedBox(height: 14),
                ...widget.lesson.objectives.map((obj) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check_circle_rounded, color: Color(0xFF27AE60), size: 18),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(obj, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: LangHueyColors.charcoal)),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Cultural Insight Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: LangHueyColors.softTeal,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: LangHueyColors.turquoise.withOpacity(0.4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.public_rounded, color: LangHueyColors.deepTeal, size: 22),
                    SizedBox(width: 10),
                    Text('Contexte Culturel & Diplomatique (Nigeria & Francophonie) :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: LangHueyColors.deepTeal)),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.lesson.culturalInsight,
                  style: TextStyle(fontSize: 13, height: 1.5, color: Colors.teal.shade900),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Phase 2: Lab Interactif
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

  // Phase 3: Vocabulaire & Phonétique
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

  // Phase 4: Exercices & Évaluation
  Widget _buildExercisesView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Exercices d\'Application Immédiate (QCM) :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 14),

          ...List.generate(widget.lesson.exercises.length, (exIdx) {
            final ex = widget.lesson.exercises[exIdx];
            final selectedOpt = _selectedExerciseAnswers[exIdx];

            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Q${exIdx + 1}. ${ex.prompt}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: LangHueyColors.charcoal),
                  ),
                  const SizedBox(height: 12),
                  ...List.generate(ex.options.length, (optIdx) {
                    final optText = ex.options[optIdx];
                    final isSelected = selectedOpt == optIdx;
                    final isCorrect = optIdx == ex.correctOptionIndex;

                    Color optBg = Colors.grey.shade50;
                    Color optBorder = Colors.black12;
                    Color optTextCol = LangHueyColors.charcoal;

                    if (selectedOpt != null) {
                      if (isCorrect) {
                        optBg = const Color(0xFFE8F8F5);
                        optBorder = const Color(0xFF2ECC71);
                        optTextCol = const Color(0xFF27AE60);
                      } else if (isSelected) {
                        optBg = const Color(0xFFFDEDEC);
                        optBorder = const Color(0xFFE74C3C);
                        optTextCol = const Color(0xFFC0392B);
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: selectedOpt == null
                            ? () {
                                setState(() {
                                  _selectedExerciseAnswers[exIdx] = optIdx;
                                });
                                if (optIdx == ex.correctOptionIndex) {
                                  _audio.playCorrect();
                                } else {
                                  _audio.playIncorrect();
                                }
                              }
                            : null,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: optBg,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: optBorder),
                          ),
                          child: Row(
                            children: [
                              Expanded(child: Text(optText, style: TextStyle(color: optTextCol, fontWeight: FontWeight.w600, fontSize: 13))),
                              if (selectedOpt != null && isCorrect)
                                const Icon(Icons.check_circle_rounded, color: Color(0xFF2ECC71), size: 18)
                              else if (selectedOpt != null && isSelected)
                                const Icon(Icons.cancel_rounded, color: Color(0xFFE74C3C), size: 18),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  if (selectedOpt != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('Explication : ${ex.explanation}', style: TextStyle(color: Colors.blueGrey.shade800, fontSize: 12)),
                    ),
                  ],
                ],
              ),
            );
          }),

          const SizedBox(height: 10),
          Text('Questions d\'Évaluation Orale & Pratique :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 14),

          ...List.generate(widget.lesson.evaluation.length, (evalIdx) {
            final eval = widget.lesson.evaluation[evalIdx];
            final isRevealed = _revealedEvaluationAnswers[evalIdx] ?? false;

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Évaluation #${evalIdx + 1} : ${eval.question}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 6),
                  Text('💡 Indice : ${eval.hint}', style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontStyle: FontStyle.italic)),
                  const SizedBox(height: 10),
                  if (isRevealed) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F8F5),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFF2ECC71)),
                      ),
                      child: Text('Réponse Modèle : ${eval.answer}', style: const TextStyle(color: Color(0xFF1E8449), fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                  ] else ...[
                    OutlinedButton.icon(
                      onPressed: () {
                        setState(() => _revealedEvaluationAnswers[evalIdx] = true);
                        _audio.playClick();
                      },
                      icon: const Icon(Icons.visibility_rounded, size: 16),
                      label: const Text('Révéler la réponse modèle'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: LangHueyColors.deepTeal,
                        side: const BorderSide(color: LangHueyColors.deepTeal),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // Phase 5: Résumé & Devoirs
  Widget _buildSummaryAndHomeworkView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Grammar Note
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.menu_book_rounded, color: LangHueyColors.deepTeal, size: 22),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Fiche de Grammaire : ${widget.lesson.grammarNote.title}',
                        style: LangHueyTextStyles.h3.copyWith(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  widget.lesson.grammarNote.explanation,
                  style: const TextStyle(fontSize: 13, height: 1.5, color: LangHueyColors.charcoal),
                ),
                const SizedBox(height: 14),
                const Text('Exemples Clés :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 6),
                ...widget.lesson.grammarNote.examples.map((ex) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.arrow_right_rounded, color: LangHueyColors.deepTeal, size: 20),
                        Expanded(child: Text(ex, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Homework Tasks
          Text('Devoirs & Tâches à Domicile :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 12),
          ...widget.lesson.homework.map((hw) {
            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: LangHueyColors.amberGold.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(hw.category, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.brown.shade900)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(hw.instruction, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  if (hw.exampleResponse != null) ...[
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Text('Exemple attendu : ${hw.exampleResponse}', style: TextStyle(color: Colors.grey.shade800, fontSize: 12, fontStyle: FontStyle.italic)),
                    ),
                  ],
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
