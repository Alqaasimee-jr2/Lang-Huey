import 'package:flutter/material.dart';
import '../../../services/p4_audio_service.dart';

/// Bespoke Smartboard Pattern Widget for Week 3: Food & Meals Buffet Explorer
class FoodAndMealsWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const FoodAndMealsWidget({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<FoodAndMealsWidget> createState() => _FoodAndMealsWidgetState();
}

class _FoodAndMealsWidgetState extends State<FoodAndMealsWidget> {
  final P4AudioService _audioService = P4AudioService();
  int _activeMealIndex = 0;

  final List<Map<String, dynamic>> _meals = [
    {
      'mealName': 'Le petit déjeuner',
      'time': 'Le matin (Morning)',
      'english': 'Breakfast',
      'audioKey': 'le_petit_dejeuner',
      'color': const Color(0xFFD97706),
      'icon': Icons.free_breakfast_rounded,
      'items': [
        {'french': 'Le pain', 'english': 'The bread', 'audioKey': 'le_pain', 'icon': Icons.breakfast_dining_rounded},
        {'french': 'Le lait', 'english': 'The milk', 'audioKey': 'le_lait', 'icon': Icons.local_cafe_rounded},
        {'french': 'L\'eau', 'english': 'The water', 'audioKey': 'leau', 'icon': Icons.water_drop_rounded},
        {'french': 'Les fruits', 'english': 'The fruits', 'audioKey': 'les_fruits', 'icon': Icons.apple_rounded},
      ],
    },
    {
      'mealName': 'Le déjeuner',
      'time': 'L\'après-midi (Afternoon)',
      'english': 'Lunch',
      'audioKey': 'le_dejeuner',
      'color': const Color(0xFF0D7377),
      'icon': Icons.lunch_dining_rounded,
      'items': [
        {'french': 'Le riz', 'english': 'The rice', 'audioKey': 'le_riz', 'icon': Icons.rice_bowl_rounded},
        {'french': 'Le poulet', 'english': 'The chicken', 'audioKey': 'le_poulet', 'icon': Icons.kebab_dining_rounded},
        {'french': 'Le poisson', 'english': 'The fish', 'audioKey': 'le_poisson', 'icon': Icons.set_meal_rounded},
        {'french': 'La viande', 'english': 'The meat', 'audioKey': 'la_viande', 'icon': Icons.outdoor_grill_rounded},
      ],
    },
    {
      'mealName': 'Le dîner',
      'time': 'Le soir (Evening)',
      'english': 'Dinner',
      'audioKey': 'le_diner',
      'color': const Color(0xFF6366F1),
      'icon': Icons.ramen_dining_rounded,
      'items': [
        {'french': 'Le repas', 'english': 'The meal', 'audioKey': 'le_repas', 'icon': Icons.dinner_dining_rounded},
        {'french': 'Le poisson', 'english': 'The fish', 'audioKey': 'le_poisson', 'icon': Icons.set_meal_rounded},
        {'french': 'Le riz', 'english': 'The rice', 'audioKey': 'le_riz', 'icon': Icons.rice_bowl_rounded},
        {'french': 'L\'eau', 'english': 'The water', 'audioKey': 'leau', 'icon': Icons.water_drop_rounded},
      ],
    },
  ];

  void _playAudio(String key) {
    _audioService.playPhrase(key, term: 3);
  }

  @override
  Widget build(BuildContext context) {
    final activeMeal = _meals[_activeMealIndex];
    final items = activeMeal['items'] as List<Map<String, dynamic>>;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0D7377), Color(0xFF14BDCC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.restaurant_rounded, color: Colors.white, size: 36),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "LES REPAS ET LA NOURRITURE · 3 DAILY MEALS & FOOD ITEMS",
                        style: TextStyle(
                          color: Color(0xFFF4A832),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Le Buffet de Français",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Select a meal period and tap each food dish to listen to its French pronunciation!",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Meal Tabs
          Row(
            children: List.generate(_meals.length, (index) {
              final meal = _meals[index];
              final isSelected = index == _activeMealIndex;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: index < _meals.length - 1 ? 12 : 0),
                  child: InkWell(
                    onTap: () {
                      setState(() => _activeMealIndex = index);
                      _playAudio(meal['audioKey'] as String);
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isSelected ? (meal['color'] as Color) : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected ? (meal['color'] as Color) : const Color(0xFFE2E8F0),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            meal['icon'] as IconData,
                            color: isSelected ? Colors.white : (meal['color'] as Color),
                            size: 22,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  meal['mealName'] as String,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : const Color(0xFF1E293B),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  meal['english'] as String,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white.withValues(alpha: 0.9) : const Color(0xFF64748B),
                                    fontSize: 11,
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
              );
            }),
          ),
          const SizedBox(height: 20),

          // Food Grid for Selected Meal
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.3,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
            ),
            itemBuilder: (context, index) {
              final food = items[index];
              return Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: (activeMeal['color'] as Color).withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(food['icon'] as IconData, color: activeMeal['color'] as Color, size: 28),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            food['french'] as String,
                            style: const TextStyle(
                              color: Color(0xFF1E293B),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            food['english'] as String,
                            style: const TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => _playAudio(food['audioKey'] as String),
                      icon: Icon(Icons.volume_up_rounded, color: activeMeal['color'] as Color),
                      tooltip: "Listen Pronunciation",
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          // Completion Button
          ElevatedButton.icon(
            onPressed: () {
              _audioService.playSfx(P4SfxType.correct);
              widget.onComplete();
            },
            icon: const Icon(Icons.check_circle_rounded, size: 22),
            label: const Text("Proceed to Food Preference Studio", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0D7377),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }
}
