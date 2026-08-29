import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5FoodBuffetWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5FoodBuffetWidget({super.key, required this.onComplete});

  @override
  State<P5FoodBuffetWidget> createState() => _P5FoodBuffetWidgetState();
}

class _P5FoodBuffetWidgetState extends State<P5FoodBuffetWidget> {
  final P5AudioService _audioService = P5AudioService();
  String _selectedFood = 'Le riz';

  final List<Map<String, dynamic>> _foods = [
    {'name': 'Le riz', 'english': 'Rice (Jollof/White)', 'audio': 'le_riz', 'icon': Icons.rice_bowl_rounded},
    {'name': 'Le pain', 'english': 'Bread / Agege loaf', 'audio': 'le_pain', 'icon': Icons.bakery_dining_rounded},
    {'name': 'Le poulet', 'english': 'Chicken & Fish', 'audio': 'le_poulet_et_le_poisson', 'icon': Icons.set_meal_rounded},
    {'name': 'Les fruits', 'english': 'Fruits & Vegetables', 'audio': 'les_fruits_et_les_legumes', 'icon': Icons.apple_rounded},
    {'name': 'L\'eau et le jus', 'english': 'Water & Juice', 'audio': 'leau_et_le_jus', 'icon': Icons.local_drink_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.cream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.teal, width: 3),
      ),
      child: Row(
        children: [
          // Left: Food Menu
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1. Le Buffet des Délices :', style: P5Text.subheading(P5Colors.charcoal)),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                      onPressed: () {
                        _audioService.playPhrase('jai_faim_jai_soif', term: 3);
                      },
                      icon: const Icon(Icons.restaurant_rounded),
                      label: const Text('J\'ai faim / J\'ai soif'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.25,
                    ),
                    itemCount: _foods.length,
                    itemBuilder: (context, index) {
                      final f = _foods[index];
                      final isSel = f['name'] == _selectedFood;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedFood = f['name'];
                          });
                          _audioService.playPhrase(f['audio'], term: 3);
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isSel ? P5Colors.teal : P5Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSel ? P5Colors.gold : P5Colors.teal.withValues(alpha: 0.3),
                              width: isSel ? 2.5 : 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(f['icon'] as IconData, size: 32, color: isSel ? P5Colors.gold : P5Colors.teal),
                              const SizedBox(height: 6),
                              Text(
                                f['name'] as String,
                                style: P5Text.body(isSel ? P5Colors.white : P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                f['english'] as String,
                                style: P5Text.caption(isSel ? P5Colors.cream : P5Colors.charcoal).copyWith(fontSize: 10),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
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

          const SizedBox(width: 20),

          // Right: Dining Table Card
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: P5Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: P5Colors.gold, width: 2.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Table à Manger', style: P5Text.subheading(P5Colors.teal), textAlign: TextAlign.center),
                  const Divider(height: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.celebration_rounded, size: 48, color: P5Colors.gold),
                        const SizedBox(height: 12),
                        Text(
                          'Bon appétit !',
                          style: P5Text.heading(P5Colors.charcoal).copyWith(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'J\'aime manger $_selectedFood avec ma famille !',
                          style: P5Text.body(P5Colors.teal),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: P5Colors.teal,
                      foregroundColor: P5Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      _audioService.playPhrase('bon_appetit', term: 3);
                    },
                    icon: const Icon(Icons.volume_up_rounded),
                    label: const Text('Bon appétit !'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                    onPressed: () {
                      _audioService.playClick();
                      widget.onComplete();
                    },
                    icon: const Icon(Icons.check_circle_rounded),
                    label: const Text('Valider le Repas'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
