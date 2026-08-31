import 'package:flutter/material.dart';
import '../../models/jss2_lesson_model.dart';
import '../../services/jss2_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

// Term 1 Widgets
import '../../widgets/patterns/term1/jss2_spatial_position_studio_widget.dart';
import '../../widgets/patterns/term1/jss2_locating_places_studio_widget.dart';
import '../../widgets/patterns/term1/jss2_indoor_welcoming_guiding_studio_widget.dart';
import '../../widgets/patterns/term1/jss2_directions_and_wayfinding_studio_widget.dart';
import '../../widgets/patterns/term1/jss2_transport_modes_studio_widget.dart';
import '../../widgets/patterns/term1/jss2_public_transit_route_studio_widget.dart';
import '../../widgets/patterns/term1/jss2_schedules_and_timetables_studio_widget.dart';
import '../../widgets/patterns/term1/jss2_transport_troubleshooting_studio_widget.dart';
import '../../widgets/patterns/term1/jss2_term1_revision_rally_widget.dart';

// Term 2 Widgets
import '../../widgets/patterns/term2/jss2_list_and_inventory_studio_widget.dart';
import '../../widgets/patterns/term2/jss2_merchants_and_goods_studio_widget.dart';
import '../../widgets/patterns/term2/jss2_shopping_and_bargaining_studio_widget.dart';
import '../../widgets/patterns/term2/jss2_needs_and_utility_studio_widget.dart';
import '../../widgets/patterns/term2/jss2_pharmacy_and_health_studio_widget.dart';
import '../../widgets/patterns/term2/jss2_wardrobe_and_style_studio_widget.dart';
import '../../widgets/patterns/term2/jss2_comparison_and_choice_studio_widget.dart';
import '../../widgets/patterns/term2/jss2_product_quantity_quality_studio_widget.dart';
import '../../widgets/patterns/term2/jss2_term2_revision_rally_widget.dart';

class JSS2LessonPlayerScreen extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2LessonPlayerScreen({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2LessonPlayerScreen> createState() => _JSS2LessonPlayerScreenState();
}

class _JSS2LessonPlayerScreenState extends State<JSS2LessonPlayerScreen> {
  final JSS2AudioService _audioService = JSS2AudioService();
  int _currentPhase = 0; // 0: Objectifs, 1: Lab, 2: Vocab, 3: Exercices, 4: Résumé

  // Classwork state
  late List<int?> _selectedExerciseAnswers;
  late List<bool> _showExplanations;

  // Evaluation hints
  late List<bool> _showEvaluationHints;
  late List<bool> _showEvaluationAnswers;

  bool _isSlowAudio = false;

  @override
  void initState() {
    super.initState();
    _selectedExerciseAnswers = List.filled(widget.lesson.exercises.length, null);
    _showExplanations = List.filled(widget.lesson.exercises.length, false);
    _showEvaluationHints = List.filled(widget.lesson.evaluation.length, false);
    _showEvaluationAnswers = List.filled(widget.lesson.evaluation.length, false);
  }

  void _switchPhase(int newPhase) {
    setState(() => _currentPhase = newPhase);
    _audioService.playClick();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LangHueyColors.warmCream,
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation & Smartboard Control Header
            _buildTopHeader(),

            // 5-Phase Navigation Tabs
            _buildPhaseTabs(),

            // Main Lesson Body
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: _buildPhaseContent(),
              ),
            ),

            // Persistent On-Screen Teacher Facilitator Prompt Cue Bar
            _buildTeacherCueBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_rounded, color: LangHueyColors.deepTeal),
                onPressed: () => Navigator.pop(context),
                tooltip: 'Retour à la feuille de route',
              ),
              const SizedBox(width: 8),
              Column(
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
                          'TRIMESTRE ${widget.lesson.termNumber} • SEMAINE ${widget.lesson.weekNumber}',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.lesson.theme,
                        style: LangHueyTextStyles.bodySmall.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.lesson.frenchTitle,
                    style: LangHueyTextStyles.h2.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              // Slow Audio Toggle
              ActionChip(
                avatar: Icon(
                  _isSlowAudio ? Icons.slow_motion_video_rounded : Icons.speed_rounded,
                  color: _isSlowAudio ? Colors.white : LangHueyColors.deepTeal,
                  size: 18,
                ),
                label: Text(
                  _isSlowAudio ? 'Vitesse : 0.8x (Lente)' : 'Vitesse : 1.0x (Normale)',
                  style: TextStyle(
                    color: _isSlowAudio ? Colors.white : LangHueyColors.charcoal,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: _isSlowAudio ? LangHueyColors.deepTeal : Colors.grey.shade100,
                onPressed: () {
                  setState(() => _isSlowAudio = !_isSlowAudio);
                  _audioService.setSlowRate(_isSlowAudio);
                },
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: LangHueyColors.softTeal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.cast_for_education_rounded, color: LangHueyColors.deepTeal, size: 16),
                    SizedBox(width: 6),
                    Text('JSS 2 French Engine', style: TextStyle(color: LangHueyColors.deepTeal, fontWeight: FontWeight.bold, fontSize: 11)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseTabs() {
    final phases = [
      {'title': '1. Objectifs', 'icon': Icons.stars_rounded},
      {'title': '2. Lab Interactif', 'icon': Icons.touch_app_rounded},
      {'title': '3. Vocabulaire', 'icon': Icons.volume_up_rounded},
      {'title': '4. Exercices', 'icon': Icons.quiz_rounded},
      {'title': '5. Résumé', 'icon': Icons.menu_book_rounded},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: List.generate(phases.length, (index) {
          final p = phases[index];
          final isSelected = _currentPhase == index;

          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 0 : 4,
                right: index == phases.length - 1 ? 0 : 4,
              ),
              child: InkWell(
                onTap: () => _switchPhase(index),
                borderRadius: BorderRadius.circular(10),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? LangHueyColors.deepTeal : Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected ? LangHueyColors.deepTeal : Colors.black12,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        p['icon'] as IconData,
                        color: isSelected ? Colors.white : LangHueyColors.deepTeal,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          p['title'] as String,
                          style: TextStyle(
                            color: isSelected ? Colors.white : LangHueyColors.charcoal,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildPhaseContent() {
    switch (_currentPhase) {
      case 0:
        return _buildObjectivesView();
      case 1:
        return _buildInteractiveLabView();
      case 2:
        return _buildVocabView();
      case 3:
        return _buildClassworkView();
      case 4:
        return _buildSummaryView();
      default:
        return _buildObjectivesView();
    }
  }

  Widget _buildObjectivesView() {
    return SingleChildScrollView(
      key: const ValueKey('objectives_view'),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0D7377), Color(0xFF14BDCC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.lesson.frenchTitle,
                  style: LangHueyTextStyles.h1.copyWith(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.lesson.englishSubtitle,
                  style: LangHueyTextStyles.bodyLarge.copyWith(color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Objectives Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.stars_rounded, color: LangHueyColors.deepTeal, size: 24),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text('Objectifs Pédagogiques de la Semaine :', style: LangHueyTextStyles.h3),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ...List.generate(widget.lesson.objectives.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 2),
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: LangHueyColors.softTeal,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: LangHueyColors.deepTeal,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            widget.lesson.objectives[index],
                            style: LangHueyTextStyles.bodyLarge.copyWith(fontSize: 14),
                          ),
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
              color: LangHueyColors.warmCream,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: LangHueyColors.amberGold.withOpacity(0.5)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.lightbulb_rounded, color: LangHueyColors.amberGold, size: 28),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Repères Culturels & Contexte Pédagogique :',
                        style: TextStyle(
                          color: Colors.brown.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.lesson.culturalInsight,
                        style: TextStyle(
                          color: LangHueyColors.charcoal,
                          fontSize: 13,
                          height: 1.4,
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

  Widget _buildInteractiveLabView() {
    switch (widget.lesson.patternType) {
      // Term 1 Patterns
      case JSS2PatternType.spatialPositionStudio:
        return JSS2SpatialPositionStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.locatingPlacesStudio:
        return JSS2LocatingPlacesStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.indoorWelcomingGuidingStudio:
        return JSS2IndoorWelcomingGuidingStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.directionsAndWayfindingStudio:
        return JSS2DirectionsAndWayfindingStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.transportModesStudio:
        return JSS2TransportModesStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.publicTransitRouteStudio:
        return JSS2PublicTransitRouteStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.schedulesAndTimetablesStudio:
        return JSS2SchedulesAndTimetablesStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.transportTroubleshootingStudio:
        return JSS2TransportTroubleshootingStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.term1RevisionRally:
        return JSS2Term1RevisionRallyWidget(lesson: widget.lesson);

      // Term 2 Patterns
      case JSS2PatternType.listAndInventoryStudio:
        return JSS2ListAndInventoryStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.merchantsAndGoodsStudio:
        return JSS2MerchantsAndGoodsStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.shoppingAndBargainingStudio:
        return JSS2ShoppingAndBargainingStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.needsAndUtilityStudio:
        return JSS2NeedsAndUtilityStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.pharmacyAndHealthStudio:
        return JSS2PharmacyAndHealthStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.wardrobeAndStyleStudio:
        return JSS2WardrobeAndStyleStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.comparisonAndChoiceStudio:
        return JSS2ComparisonAndChoiceStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.productQuantityQualityStudio:
        return JSS2ProductQuantityQualityStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.term2RevisionRally:
        return JSS2Term2RevisionRallyWidget(lesson: widget.lesson);
    }
  }

  Widget _buildVocabView() {
    return SingleChildScrollView(
      key: const ValueKey('vocab_view'),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Vocabulaire & Phonétique Clés :', style: LangHueyTextStyles.h2.copyWith(fontSize: 18)),
              Text('${widget.lesson.vocabulary.length} expressions authentiques', style: LangHueyTextStyles.bodySmall),
            ],
          ),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 2.6,
            ),
            itemCount: widget.lesson.vocabulary.length,
            itemBuilder: (context, index) {
              final v = widget.lesson.vocabulary[index];

              return Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.black12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: LangHueyColors.softTeal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(v.icon, color: LangHueyColors.deepTeal, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            v.french,
                            style: LangHueyTextStyles.h3.copyWith(fontSize: 14, color: LangHueyColors.deepTeal),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            v.phonetics,
                            style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: Colors.grey.shade600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            v.english,
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: LangHueyColors.charcoal),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: LangHueyColors.deepTeal, size: 22),
                      onPressed: () {
                        _audioService.playPhrase(v.audioKey, term: widget.lesson.termNumber);
                      },
                      tooltip: 'Écouter',
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildClassworkView() {
    return SingleChildScrollView(
      key: const ValueKey('classwork_view'),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Sub-Section 1: Interactive Exercises
          Text('1. Exercices Pratiques en Classe :', style: LangHueyTextStyles.h2.copyWith(fontSize: 18)),
          const SizedBox(height: 12),
          ...List.generate(widget.lesson.exercises.length, (exIndex) {
            final ex = widget.lesson.exercises[exIndex];
            final selected = _selectedExerciseAnswers[exIndex];
            final showExp = _showExplanations[exIndex];

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
                  Text(
                    'Question ${exIndex + 1} : ${ex.prompt}',
                    style: LangHueyTextStyles.h3.copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: 12),
                  ...List.generate(ex.options.length, (optIndex) {
                    final isOptionSelected = selected == optIndex;
                    final isCorrect = optIndex == ex.correctOptionIndex;

                    Color tileColor = Colors.grey.shade50;
                    Color borderColor = Colors.black12;

                    if (selected != null) {
                      if (isOptionSelected) {
                        tileColor = isCorrect ? Colors.green.shade50 : Colors.red.shade50;
                        borderColor = isCorrect ? Colors.green : Colors.red;
                      } else if (isCorrect) {
                        tileColor = Colors.green.shade50;
                        borderColor = Colors.green;
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedExerciseAnswers[exIndex] = optIndex;
                            _showExplanations[exIndex] = true;
                          });
                          if (isCorrect) {
                            _audioService.playCorrect();
                          } else {
                            _audioService.playIncorrect();
                          }
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: tileColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: borderColor),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: isOptionSelected
                                    ? (isCorrect ? Colors.green : Colors.red)
                                    : LangHueyColors.softTeal,
                                child: Text(
                                  String.fromCharCode(65 + optIndex),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: isOptionSelected ? Colors.white : LangHueyColors.deepTeal,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  ex.options[optIndex],
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: isOptionSelected ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ),
                              if (selected != null && isOptionSelected)
                                Icon(
                                  isCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
                                  color: isCorrect ? Colors.green : Colors.red,
                                  size: 20,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  if (showExp)
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: LangHueyColors.softTeal.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.info_outline_rounded, color: LangHueyColors.deepTeal, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              ex.explanation,
                              style: const TextStyle(color: LangHueyColors.deepTeal, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          }),

          const SizedBox(height: 16),

          // Sub-Section 2: Evaluation Q&A
          Text('2. Questions d\'Évaluation & Auto-Contrôle :', style: LangHueyTextStyles.h2.copyWith(fontSize: 18)),
          const SizedBox(height: 12),
          ...List.generate(widget.lesson.evaluation.length, (qIndex) {
            final q = widget.lesson.evaluation[qIndex];
            final showHint = _showEvaluationHints[qIndex];
            final showAns = _showEvaluationAnswers[qIndex];

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
                  Text('Q${qIndex + 1} : ${q.question}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {
                          setState(() => _showEvaluationHints[qIndex] = !_showEvaluationHints[qIndex]);
                          _audioService.playClick();
                        },
                        icon: const Icon(Icons.lightbulb_outline_rounded, size: 16),
                        label: Text(showHint ? 'Masquer l\'indice' : 'Voir l\'indice'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() => _showEvaluationAnswers[qIndex] = !_showEvaluationAnswers[qIndex]);
                          if (!showAns) _audioService.playCorrect();
                        },
                        icon: Icon(showAns ? Icons.visibility_off_rounded : Icons.visibility_rounded, size: 16),
                        label: Text(showAns ? 'Masquer la réponse' : 'Afficher la réponse'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LangHueyColors.deepTeal,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  if (showHint)
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: LangHueyColors.warmCream,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('💡 Indice : ${q.hint}', style: TextStyle(fontSize: 12, color: Colors.brown.shade800)),
                    ),
                  if (showAns)
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: Text('✅ Réponse : ${q.answer}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.green)),
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSummaryView() {
    final g = widget.lesson.grammarNote;

    return SingleChildScrollView(
      key: const ValueKey('summary_view'),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Grammar Note Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.bookmark_rounded, color: LangHueyColors.deepTeal, size: 24),
                    const SizedBox(width: 8),
                    Expanded(child: Text('Fiche Grammaticale : ${g.title}', style: LangHueyTextStyles.h3)),
                  ],
                ),
                const Divider(height: 24),
                Text(g.explanation, style: LangHueyTextStyles.bodyLarge.copyWith(height: 1.5, fontSize: 13)),
                const SizedBox(height: 14),
                Text('Exemples types :', style: TextStyle(fontWeight: FontWeight.bold, color: LangHueyColors.deepTeal, fontSize: 13)),
                const SizedBox(height: 6),
                ...g.examples.map((ex) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_right_rounded, color: LangHueyColors.deepTeal, size: 20),
                          Expanded(child: Text(ex, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                        ],
                      ),
                    )),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Homework / Devoirs Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: LangHueyColors.softTeal.withOpacity(0.4),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.assignment_rounded, color: LangHueyColors.deepTeal, size: 24),
                    const SizedBox(width: 8),
                    Text('Travail à Domicile (Devoirs) :', style: LangHueyTextStyles.h3),
                  ],
                ),
                const SizedBox(height: 12),
                ...widget.lesson.homework.map((hw) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• [${hw.category}] : ${hw.instruction}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          if (hw.exampleResponse != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 14),
                              child: Text(hw.exampleResponse!, style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey.shade800)),
                            ),
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

  Widget _buildTeacherCueBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: LangHueyColors.charcoal,
        border: const Border(top: BorderSide(color: Colors.black26)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: LangHueyColors.amberGold,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.lightbulb_rounded, color: LangHueyColors.charcoal, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '💡 TEACHER FACILITATOR GUIDANCE CUE BAR (STANDARD ENGLISH)',
                  style: TextStyle(
                    color: LangHueyColors.amberGold,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.1,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.lesson.teacherFacilitatorPrompt,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
