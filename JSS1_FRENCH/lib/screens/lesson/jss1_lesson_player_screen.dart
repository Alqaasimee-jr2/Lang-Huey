import 'package:flutter/material.dart';
import '../../models/jss1_lesson_model.dart';
import '../../services/jss1_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

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

enum JSS1LessonPhase {
  objectives,
  interactivePattern,
  vocabLab,
  classwork,
  summary,
}

class JSS1LessonPlayerScreen extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1LessonPlayerScreen({super.key, required this.lesson});

  @override
  State<JSS1LessonPlayerScreen> createState() => _JSS1LessonPlayerScreenState();
}

class _JSS1LessonPlayerScreenState extends State<JSS1LessonPlayerScreen> {
  final JSS1AudioService _audioService = JSS1AudioService();
  JSS1LessonPhase _phase = JSS1LessonPhase.objectives;
  int _revealedQuestionIndex = -1;

  // Classwork Interactive Drill state
  int _classworkSubTab = 0; // 0: Interactive Drills, 1: Scheme Evaluation Q&A
  int _activeExerciseIndex = 0;
  int? _selectedOptionIndex;
  bool _hasCheckedAnswer = false;

  final List<Map<String, dynamic>> _phaseSteps = [
    {'phase': JSS1LessonPhase.objectives, 'title': '1. Objectifs & Repères', 'icon': Icons.flag_rounded},
    {'phase': JSS1LessonPhase.interactivePattern, 'title': '2. Lab Interactif', 'icon': Icons.touch_app_rounded},
    {'phase': JSS1LessonPhase.vocabLab, 'title': '3. Vocabulaire & Phonétique', 'icon': Icons.record_voice_over_rounded},
    {'phase': JSS1LessonPhase.classwork, 'title': '4. Exercices & Évaluation', 'icon': Icons.quiz_rounded},
    {'phase': JSS1LessonPhase.summary, 'title': '5. Résumé & Devoirs', 'icon': Icons.assignment_turned_in_rounded},
  ];

  void _nextPhase() {
    final currentIndex = _phaseSteps.indexWhere((s) => s['phase'] == _phase);
    if (currentIndex < _phaseSteps.length - 1) {
      setState(() {
        _phase = _phaseSteps[currentIndex + 1]['phase'] as JSS1LessonPhase;
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
        _phase = _phaseSteps[currentIndex - 1]['phase'] as JSS1LessonPhase;
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
            color: JSS1Colors.charcoal.withValues(alpha: 0.1),
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
            tooltip: 'Retour au programme',
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: JSS1Colors.gold,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'JSS1 • SEMAINE ${widget.lesson.week}',
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
        color: JSS1Colors.white.withValues(alpha: 0.15),
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
                  _revealedQuestionIndex = -1;
                  _activeExerciseIndex = 0;
                  _selectedOptionIndex = null;
                  _hasCheckedAnswer = false;
                });
                _audioService.playClick();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: isCurrent
                      ? JSS1Colors.teal.withValues(alpha: 0.1)
                      : (isPast ? JSS1Colors.green.withValues(alpha: 0.08) : Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isCurrent
                        ? JSS1Colors.teal
                        : (isPast ? JSS1Colors.green.withValues(alpha: 0.3) : Colors.transparent),
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
      case JSS1LessonPhase.objectives:
        return _buildObjectivesView();
      case JSS1LessonPhase.interactivePattern:
        return _buildPatternView();
      case JSS1LessonPhase.vocabLab:
        return _buildVocabLabView();
      case JSS1LessonPhase.classwork:
        return _buildClassworkView();
      case JSS1LessonPhase.summary:
        return _buildSummaryView();
    }
  }

  Widget _buildObjectivesView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
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
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: JSS1Colors.teal.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.school_rounded, color: JSS1Colors.teal, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Fiche Pédagogique du Cours', style: JSS1Text.heading(JSS1Colors.teal)),
                          Text('Objectifs NERDC & Aperçu de la Semaine', style: JSS1Text.caption(JSS1Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text('Objectifs d\'Apprentissage :', style: JSS1Text.subheading(JSS1Colors.charcoal)),
                const SizedBox(height: 12),
                ...widget.lesson.objectives.map((obj) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.check_circle_rounded, color: JSS1Colors.teal, size: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(obj, style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontSize: 15)),
                          ),
                        ],
                      ),
                    )),
                const Divider(height: 32),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: JSS1Colors.gold.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: JSS1Colors.gold.withValues(alpha: 0.4)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.lightbulb_rounded, color: JSS1Colors.gold, size: 24),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Repère Culturel Francophone',
                              style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.lesson.culturalInsight,
                              style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontSize: 14),
                            ),
                          ],
                        ),
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

  Widget _buildPatternView() {
    switch (widget.lesson.patternType) {
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
                    Text('Banque Vocabulaire (${widget.lesson.vocabItems.length} Mots Clés)', style: JSS1Text.subheading(JSS1Colors.charcoal)),
                    Text('Cliquez pour écouter', style: JSS1Text.caption(JSS1Colors.teal)),
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
                border: Border.all(color: JSS1Colors.teal.withValues(alpha: 0.3)),
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
                  Text('Exemples :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.w900)),
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

  Widget _buildClassworkView() {
    return Column(
      children: [
        // Sub-Tab Switcher
        Container(
          decoration: BoxDecoration(
            color: JSS1Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() => _classworkSubTab = 0);
                    _audioService.playClick();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: _classworkSubTab == 0 ? JSS1Colors.teal : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Drills Interactifs en Classe (${widget.lesson.classworkExercises.length})',
                      style: JSS1Text.caption(_classworkSubTab == 0 ? JSS1Colors.white : JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() => _classworkSubTab = 1);
                    _audioService.playClick();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: _classworkSubTab == 1 ? JSS1Colors.teal : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Questions d\'Évaluation du Curriculum (${widget.lesson.evaluationQuestions.length})',
                      style: JSS1Text.caption(_classworkSubTab == 1 ? JSS1Colors.white : JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Expanded(
          child: _classworkSubTab == 0 ? _buildInteractiveDrillSubTab() : _buildEvaluationQASubTab(),
        ),
      ],
    );
  }

  Widget _buildInteractiveDrillSubTab() {
    if (widget.lesson.classworkExercises.isEmpty) {
      return const Center(child: Text('Aucun drill pour cette semaine.'));
    }

    final exercise = widget.lesson.classworkExercises[_activeExerciseIndex];

    return Container(
      padding: const EdgeInsets.all(24),
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
              Text('Drill ${_activeExerciseIndex + 1} / ${widget.lesson.classworkExercises.length}', style: JSS1Text.subheading(JSS1Colors.teal)),
              if (_hasCheckedAnswer)
                Icon(
                  _selectedOptionIndex == exercise.correctOptionIndex ? Icons.check_circle_rounded : Icons.cancel_rounded,
                  color: _selectedOptionIndex == exercise.correctOptionIndex ? JSS1Colors.green : JSS1Colors.red,
                  size: 28,
                ),
            ],
          ),
          const SizedBox(height: 14),
          Text(exercise.prompt, style: JSS1Text.heading(JSS1Colors.charcoal).copyWith(fontSize: 18)),
          const SizedBox(height: 18),
          Expanded(
            child: GridView.builder(
              itemCount: exercise.options.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, optIdx) {
                final isSel = _selectedOptionIndex == optIdx;
                Color bg = JSS1Colors.cream;
                Color tc = JSS1Colors.charcoal;

                if (_hasCheckedAnswer) {
                  if (optIdx == exercise.correctOptionIndex) {
                    bg = JSS1Colors.green;
                    tc = JSS1Colors.white;
                  } else if (isSel) {
                    bg = JSS1Colors.red;
                    tc = JSS1Colors.white;
                  }
                } else if (isSel) {
                  bg = JSS1Colors.teal;
                  tc = JSS1Colors.white;
                }

                return ElevatedButton(
                  onPressed: _hasCheckedAnswer ? null : () => setState(() => _selectedOptionIndex = optIdx),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bg,
                    foregroundColor: tc,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: Text(exercise.options[optIdx], style: JSS1Text.body(tc).copyWith(fontWeight: FontWeight.w700, fontSize: 14)),
                );
              },
            ),
          ),
          if (_hasCheckedAnswer)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: JSS1Colors.cream,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(exercise.explanation, style: JSS1Text.caption(JSS1Colors.charcoal)),
            ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (!_hasCheckedAnswer)
                ElevatedButton(
                  onPressed: _selectedOptionIndex == null
                      ? null
                      : () {
                          setState(() => _hasCheckedAnswer = true);
                          if (_selectedOptionIndex == exercise.correctOptionIndex) {
                            _audioService.playCorrect();
                          } else {
                            _audioService.playIncorrect();
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: JSS1Colors.teal,
                    foregroundColor: JSS1Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('Vérifier Réponse'),
                ),
              if (_hasCheckedAnswer && _activeExerciseIndex < widget.lesson.classworkExercises.length - 1)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _activeExerciseIndex++;
                      _selectedOptionIndex = null;
                      _hasCheckedAnswer = false;
                    });
                    _audioService.playClick();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: JSS1Colors.gold,
                    foregroundColor: JSS1Colors.charcoal,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('Exercice Suivant', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEvaluationQASubTab() {
    return ListView.separated(
      itemCount: widget.lesson.evaluationQuestions.length,
      separatorBuilder: (c, i) => const SizedBox(height: 12),
      itemBuilder: (context, idx) {
        final q = widget.lesson.evaluationQuestions[idx];
        final isRevealed = _revealedQuestionIndex == idx;

        return Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: JSS1Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: JSS1Colors.lightGrey),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text('Q${idx + 1} : ${q.question}', style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 16)),
                  ),
                  IconButton(
                    icon: Icon(isRevealed ? Icons.visibility_off_rounded : Icons.visibility_rounded, color: JSS1Colors.teal),
                    onPressed: () {
                      setState(() {
                        _revealedQuestionIndex = isRevealed ? -1 : idx;
                      });
                      _audioService.playClick();
                    },
                    tooltip: isRevealed ? 'Masquer la réponse' : 'Afficher le modèle de réponse',
                  ),
                ],
              ),
              if (isRevealed) ...[
                const Divider(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: JSS1Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Réponse modèle :', style: JSS1Text.caption(JSS1Colors.green).copyWith(fontWeight: FontWeight.w900)),
                      const SizedBox(height: 2),
                      Text(q.answer, style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      Text('Indice : ${q.hint}', style: JSS1Text.caption(JSS1Colors.grey).copyWith(fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
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
                    Text('Résumé de la Leçon & Devoirs à Domicile', style: JSS1Text.heading(JSS1Colors.teal)),
                  ],
                ),
                const SizedBox(height: 16),
                Text('Félicitations pour cette session ! Voici les tâches à consigner dans votre cahier :', style: JSS1Text.body(JSS1Colors.charcoal)),
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
      decoration: BoxDecoration(
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
            label: const Text('Phase Précédente'),
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
              isLast ? 'Terminer la Leçon' : 'Phase Suivante',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
