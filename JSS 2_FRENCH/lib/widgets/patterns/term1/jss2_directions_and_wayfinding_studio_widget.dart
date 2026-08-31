import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2DirectionsAndWayfindingStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2DirectionsAndWayfindingStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2DirectionsAndWayfindingStudioWidget> createState() => _JSS2DirectionsAndWayfindingStudioWidgetState();
}

class _JSS2DirectionsAndWayfindingStudioWidgetState extends State<JSS2DirectionsAndWayfindingStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();

  final List<String> _directionSteps = [];
  final List<Map<String, dynamic>> _actions = [
    {'action': 'Allez tout droit', 'icon': Icons.arrow_upward_rounded, 'audio': 'allez_tout_droit'},
    {'action': 'Tournez à droite', 'icon': Icons.turn_right_rounded, 'audio': 'tournez_a_droite'},
    {'action': 'Tournez à gauche', 'icon': Icons.turn_left_rounded, 'audio': 'tournez_a_gauche'},
    {'action': 'Traversez le carrefour', 'icon': Icons.alt_route_rounded, 'audio': 'traversez_le_carrefour'},
    {'action': 'Prenez la deuxième rue à droite', 'icon': Icons.fork_right_rounded, 'audio': 'prenez_la_deuxieme_rue_a_droite'},
    {'action': 'Jusqu\'au rond-point', 'icon': Icons.rotate_right_rounded, 'audio': 'jusquau_rond_point'},
  ];

  @override
  void initState() {
    super.initState();
    _directionSteps.addAll(['Allez tout droit', 'Tournez à droite', 'Jusqu\'au rond-point']);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F766E), Color(0xFF0D7377)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.navigation_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Simulateur d\'Itinéraire & Guidage Urbain (GPS)',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Assemblez les consignes de direction (Allez tout droit, tournez à gauche/droite, traversez le carrefour).',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Main Layout
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Panel: Action Buttons
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Actions de Navigation Disponibles :', style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _actions.map((act) {
                          return ActionChip(
                            avatar: Icon(act['icon'] as IconData, size: 18, color: LangHueyColors.deepTeal),
                            label: Text(act['action'] as String),
                            onPressed: () {
                              setState(() {
                                if (_directionSteps.length < 5) {
                                  _directionSteps.add(act['action'] as String);
                                }
                              });
                              _audioService.playPhrase(act['audio'] as String, term: 1);
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() => _directionSteps.clear());
                              _audioService.playClick();
                            },
                            icon: const Icon(Icons.clear_all_rounded, size: 18),
                            label: const Text('Réinitialiser l\'itinéraire'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                              foregroundColor: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Right Panel: Assembled Route
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Itinéraire Pas-à-Pas (GPS)', style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                      const SizedBox(height: 12),
                      if (_directionSteps.isEmpty)
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Appuyez sur les actions à gauche pour composer l\'itinéraire.', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
                        )
                      else
                        ...List.generate(_directionSteps.length, (idx) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: LangHueyColors.softTeal,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: LangHueyColors.deepTeal,
                                  child: Text('${idx + 1}', style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    _directionSteps[idx],
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () {
                          _audioService.playPhrase('allez_tout_droit', term: 1);
                        },
                        icon: const Icon(Icons.volume_up_rounded, size: 20),
                        label: const Text('Prononcer l\'Itinéraire'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LangHueyColors.deepTeal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
