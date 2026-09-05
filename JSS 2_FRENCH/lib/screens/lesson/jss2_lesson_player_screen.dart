import 'package:flutter/material.dart';
import '../../models/jss2_lesson_model.dart';
import '../../services/jss2_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../../widgets/drills/jss2_interactive_drill_engine_widget.dart';

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

// Term 3 Widgets
import '../../widgets/patterns/term3/jss2_math_calculations_studio_widget.dart';
import '../../widgets/patterns/term3/jss2_food_and_drinks_studio_widget.dart';
import '../../widgets/patterns/term3/jss2_cooking_recipes_studio_widget.dart';
import '../../widgets/patterns/term3/jss2_restaurant_cafe_studio_widget.dart';
import '../../widgets/patterns/term3/jss2_integrated_role_play_studio_widget.dart';
import '../../widgets/patterns/term3/jss2_consolidation_exercises_studio_widget.dart';
import '../../widgets/patterns/term3/jss2_guided_conversations_studio_widget.dart';
import '../../widgets/patterns/term3/jss2_exam_prep_studio_widget.dart';
import '../../widgets/patterns/term3/jss2_grand_rally_studio_widget.dart';

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
  int _currentPhase = 0; // 0: Lab, 1: Vocab, 2: Drills, 3: Summary
  bool _isSlowAudio = false;

  void _switchPhase(int newPhase) {
    setState(() => _currentPhase = newPhase);
    _audioService.playClick();
  }

  void _nextPhase() {
    if (_currentPhase < 3) {
      _switchPhase(_currentPhase + 1);
    } else {
      Navigator.pop(context, true);
    }
  }

  void _prevPhase() {
    if (_currentPhase > 0) {
      _switchPhase(_currentPhase - 1);
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
            color: Colors.white,
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
                            'For Teacher Reference Only • Not Displayed on Student Smartboard',
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
              const Divider(height: 24),

              Text(
                'Official NERDC Curriculum Objectives:',
                style: LangHueyTextStyles.h3.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 8),
              ...widget.lesson.objectives.map((obj) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ', style: TextStyle(fontWeight: FontWeight.bold, color: LangHueyColors.deepTeal, fontSize: 16)),
                        Expanded(
                          child: Text(obj, style: LangHueyTextStyles.bodyLarge.copyWith(fontSize: 13, height: 1.3)),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 14),

              // Teacher Facilitator Prompt
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: LangHueyColors.amberGold.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: LangHueyColors.amberGold, width: 1.5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lightbulb_rounded, color: LangHueyColors.amberGold, size: 24),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Facilitator Teaching Prompt:',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: LangHueyColors.charcoal),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.lesson.teacherFacilitatorPrompt,
                            style: LangHueyTextStyles.bodySmall.copyWith(color: LangHueyColors.charcoal, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Cultural Insight
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: LangHueyColors.warmCream,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Text(
                  'Cultural Insight: ${widget.lesson.culturalInsight}',
                  style: LangHueyTextStyles.bodySmall.copyWith(fontSize: 11, fontStyle: FontStyle.italic),
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
      backgroundColor: LangHueyColors.warmCream,
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation Header
            _buildTopHeader(),

            // 4-Phase Navigation Tabs
            _buildPhaseTabs(),

            // Main Lesson Body
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: _buildPhaseContent(),
              ),
            ),

            // Bottom Action Bar
            _buildBottomActionBar(),
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
                tooltip: 'Back to Roadmap',
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
                          'TERM ${widget.lesson.termNumber} • WEEK ${widget.lesson.weekNumber}',
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
              // Teacher Guide Trigger
              InkWell(
                onTap: _showTeacherGuideModal,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: LangHueyColors.amberGold,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.school_rounded, color: LangHueyColors.charcoal, size: 18),
                      SizedBox(width: 6),
                      Text('Teacher Guide', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12, color: LangHueyColors.charcoal)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),

              // Audio Speed Toggle
              ActionChip(
                avatar: Icon(
                  _isSlowAudio ? Icons.slow_motion_video_rounded : Icons.speed_rounded,
                  color: _isSlowAudio ? Colors.white : LangHueyColors.deepTeal,
                  size: 18,
                ),
                label: Text(
                  _isSlowAudio ? 'Speed: 0.8x' : 'Speed: 1.0x',
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
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseTabs() {
    final phases = [
      {'title': '1. Learning Lab', 'icon': Icons.touch_app_rounded},
      {'title': '2. Vocabulary & Audio', 'icon': Icons.volume_up_rounded},
      {'title': '3. Practice Drills', 'icon': Icons.quiz_rounded},
      {'title': '4. Summary & Homework', 'icon': Icons.menu_book_rounded},
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
        return _buildInteractiveLabView();
      case 1:
        return _buildVocabView();
      case 2:
        return _buildDrillsView();
      case 3:
        return _buildSummaryView();
      default:
        return _buildInteractiveLabView();
    }
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

      // Term 3 Patterns
      case JSS2PatternType.mathCalculationsStudio:
        return JSS2MathCalculationsStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.foodAndDrinksStudio:
        return JSS2FoodAndDrinksStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.cookingRecipesStudio:
        return JSS2CookingRecipesStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.restaurantCafeStudio:
        return JSS2RestaurantCafeStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.integratedRolePlayStudio:
        return JSS2IntegratedRolePlayStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.consolidationExercisesStudio:
        return JSS2ConsolidationExercisesStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.guidedConversationsStudio:
        return JSS2GuidedConversationsStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.examPrepStudio:
        return JSS2ExamPrepStudioWidget(lesson: widget.lesson);
      case JSS2PatternType.term3RevisionRally:
        return JSS2GrandRallyStudioWidget(lesson: widget.lesson);
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
              Text('Vocabulary Station & Audio Pronunciation:', style: LangHueyTextStyles.h2.copyWith(fontSize: 18)),
              Text('${widget.lesson.vocabulary.length} Authentic Expressions', style: LangHueyTextStyles.bodySmall),
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
                      tooltip: 'Listen',
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

  Widget _buildDrillsView() {
    return Padding(
      key: const ValueKey('drills_view'),
      padding: const EdgeInsets.all(20),
      child: JSS2InteractiveDrillEngineWidget(
        drills: widget.lesson.exercises,
        term: widget.lesson.termNumber,
        onComplete: _nextPhase,
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
                    Expanded(child: Text('Grammar Sheet: ${g.title}', style: LangHueyTextStyles.h3)),
                  ],
                ),
                const Divider(height: 24),
                Text(g.explanation, style: LangHueyTextStyles.bodyLarge.copyWith(height: 1.5, fontSize: 13)),
                const SizedBox(height: 14),
                Text('Examples:', style: TextStyle(fontWeight: FontWeight.bold, color: LangHueyColors.deepTeal, fontSize: 13)),
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
                    Text('Take-Home Assignments & Practice:', style: LangHueyTextStyles.h3),
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

  Widget _buildBottomActionBar() {
    final isFirst = _currentPhase == 0;
    final isLast = _currentPhase == 3;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: isFirst ? null : _prevPhase,
            style: ElevatedButton.styleFrom(
              backgroundColor: LangHueyColors.warmCream,
              foregroundColor: LangHueyColors.charcoal,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            icon: const Icon(Icons.arrow_back_rounded, size: 18),
            label: const Text('Previous Phase'),
          ),
          ElevatedButton.icon(
            onPressed: _nextPhase,
            style: ElevatedButton.styleFrom(
              backgroundColor: isLast ? LangHueyColors.green : LangHueyColors.deepTeal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            icon: Icon(isLast ? Icons.check_circle_rounded : Icons.arrow_forward_rounded, size: 18),
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
