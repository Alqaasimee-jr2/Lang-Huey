import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2PublicTransitRouteStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2PublicTransitRouteStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2PublicTransitRouteStudioWidget> createState() => _JSS2PublicTransitRouteStudioWidgetState();
}

class _JSS2PublicTransitRouteStudioWidgetState extends State<JSS2PublicTransitRouteStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();

  int _selectedStepIndex = 0;

  final List<Map<String, dynamic>> _steps = [
    {
      'title': '1. Embarquement / Point de départ',
      'instruction': 'Prenez la ligne 2 à la station Centrale.',
      'audio': 'prenez_la_ligne_deux',
      'icon': Icons.directions_subway_rounded,
    },
    {
      'title': '2. Trajet & Nombre d\'arrêts',
      'instruction': 'Roulez pendant cinq arrêts.',
      'audio': 'roulez_pendant_cinq_arrets',
      'icon': Icons.more_horiz_rounded,
    },
    {
      'title': '3. Correspondance / Changement',
      'instruction': 'Changez à la station République.',
      'audio': 'changez_a_la_station_republique',
      'icon': Icons.transfer_within_a_station_rounded,
    },
    {
      'title': '4. Arrivée / Débarquement',
      'instruction': 'Descendez au terminus Grand Marché.',
      'audio': 'descendez_au_terminus',
      'icon': Icons.flag_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final step = _steps[_selectedStepIndex];

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
                const Icon(Icons.alt_route_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Simulateur de Trajet en Transport Public (BRT & Métro)',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Expliquez un itinéraire en bus ou train (Prendre la ligne, changer de correspondance, descendre au terminus).',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Steps Timeline
          Row(
            children: List.generate(_steps.length, (idx) {
              final s = _steps[idx];
              final isSel = _selectedStepIndex == idx;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: idx == 0 ? 0 : 4, right: idx == _steps.length - 1 ? 0 : 4),
                  child: InkWell(
                    onTap: () {
                      setState(() => _selectedStepIndex = idx);
                      _audioService.playPhrase(s['audio'] as String, term: 1);
                    },
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSel ? LangHueyColors.deepTeal : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSel ? LangHueyColors.deepTeal : Colors.black12,
                          width: isSel ? 2 : 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            s['icon'] as IconData,
                            color: isSel ? Colors.white : LangHueyColors.deepTeal,
                            size: 24,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            s['title'] as String,
                            style: TextStyle(
                              color: isSel ? Colors.white : LangHueyColors.charcoal,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 18),

          // Detail Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black12),
            ),
            child: Row(
              children: [
                const Icon(Icons.record_voice_over_rounded, color: LangHueyColors.deepTeal, size: 32),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(step['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: LangHueyColors.deepTeal)),
                      const SizedBox(height: 4),
                      Text(
                        '« ${step['instruction']} »',
                        style: LangHueyTextStyles.frenchHighlight.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up_rounded, color: LangHueyColors.deepTeal, size: 28),
                  onPressed: () => _audioService.playPhrase(step['audio'] as String, term: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
