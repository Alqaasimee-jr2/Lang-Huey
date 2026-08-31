import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1DirectionsAndProceduresStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1DirectionsAndProceduresStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1DirectionsAndProceduresStudioWidget> createState() => _JSS1DirectionsAndProceduresStudioWidgetState();
}

class _JSS1DirectionsAndProceduresStudioWidgetState extends State<JSS1DirectionsAndProceduresStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedDirectionIndex = 0;

  final List<Map<String, dynamic>> _directions = [
    {
      'instruction': 'Allez tout droit',
      'meaning': 'Go straight ahead (Vers l\'avant)',
      'phrase': 'Allez tout droit sur deux cents mètres.',
      'icon': Icons.arrow_upward_rounded,
      'audio': 'allez_tout_droit',
      'note': 'Attention : Ne confondez pas "tout droit" (straight) avec "à droite" (to the right) !',
    },
    {
      'instruction': 'Tournez à droite',
      'meaning': 'Turn right (Vers la droite)',
      'phrase': 'Au prochain carrefour, tournez à droite.',
      'icon': Icons.turn_right_rounded,
      'audio': 'tournez_a_droite_a_gauche',
      'note': 'Indique un virage vers le côté droit.',
    },
    {
      'instruction': 'Tournez à gauche',
      'meaning': 'Turn left (Vers la gauche)',
      'phrase': 'Après le feu tricolore, tournez à gauche.',
      'icon': Icons.turn_left_rounded,
      'audio': 'tournez_a_droite_a_gauche',
      'note': 'Indique un virage vers le côté gauche.',
    },
    {
      'instruction': 'Prenez la deuxième rue',
      'meaning': 'Take the second street on the right',
      'phrase': 'Prenez la deuxième rue à droite après la banque.',
      'icon': Icons.alt_route_rounded,
      'audio': 'prenez_la_deuxieme_rue_a_droite',
      'note': 'Utilise les adjectifs ordinaux (première, deuxième, troisième).',
    },
    {
      'instruction': 'Traversez le carrefour',
      'meaning': 'Cross the junction / intersection',
      'phrase': 'Traversez prudemment le grand carrefour.',
      'icon': Icons.traffic_rounded,
      'audio': 'traversez_le_carrefour',
      'note': 'Franchir un carrefour pour continuer son trajet.',
    },
    {
      'instruction': 'Repères Spatiaux (En face / À côté)',
      'meaning': 'Opposite / Next to the landmark',
      'phrase': 'C\'est en face de l\'hôpital et à côté de la poste.',
      'icon': Icons.pin_drop_rounded,
      'audio': 'c_est_en_face_de_l_hopital',
      'note': 'Position relative par rapport aux bâtiments publics.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final active = _directions[_selectedDirectionIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Navigation Directions Menu
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.charcoal.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('Guide d\'Itinéraire en Ville', style: JSS1Text.subheading(JSS1Colors.teal), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal),
                      onPressed: () => _audioService.playPhrase('pardon_monsieur_ou_se_trouve', term: 3),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    itemCount: _directions.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, idx) {
                      final d = _directions[idx];
                      final isSelected = _selectedDirectionIndex == idx;

                      return InkWell(
                        onTap: () {
                          setState(() => _selectedDirectionIndex = idx);
                          _audioService.playPhrase(d['audio'] as String, term: 3);
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(d['icon'] as IconData, color: isSelected ? JSS1Colors.gold : JSS1Colors.teal, size: 24),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      d['instruction'] as String,
                                      style: TextStyle(
                                        color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      d['meaning'] as String,
                                      style: TextStyle(
                                        color: isSelected ? JSS1Colors.gold : JSS1Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.volume_up_rounded, color: isSelected ? JSS1Colors.white : JSS1Colors.grey, size: 18),
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

        // Right Column: Interactive Map Landmark Stage
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: JSS1Colors.teal,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.teal.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('BOUSSOLE & NAVIGATION SPATIALE', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1.2), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.white, size: 28),
                      onPressed: () => _audioService.playPhrase(active['audio'] as String, term: 3),
                    ),
                  ],
                ),

                // Center Compass Visual
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: JSS1Colors.white.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(active['icon'] as IconData, size: 68, color: JSS1Colors.gold),
                  ),
                ),

                // Spoken Direction Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Phrase de Guidage :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(
                        active['phrase'] as String,
                        style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: JSS1Colors.cream,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          active['note'] as String,
                          style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontSize: 11, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),

                // Ask for directions prompt
                InkWell(
                  onTap: () => _audioService.playPhrase('pardon_monsieur_ou_se_trouve', term: 3),
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: JSS1Colors.gold,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_pin_circle_rounded, color: JSS1Colors.charcoal, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Demander : "Pardon Monsieur, où se trouve la bibliothèque ?"',
                          style: TextStyle(color: JSS1Colors.charcoal, fontWeight: FontWeight.w900, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
