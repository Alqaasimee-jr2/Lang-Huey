import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2TransportTroubleshootingStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2TransportTroubleshootingStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2TransportTroubleshootingStudioWidget> createState() => _JSS2TransportTroubleshootingStudioWidgetState();
}

class _JSS2TransportTroubleshootingStudioWidgetState extends State<JSS2TransportTroubleshootingStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();

  int _selectedProblemIndex = 0;

  final List<Map<String, dynamic>> _problems = [
    {
      'issue': 'Panne de moteur',
      'phrase': 'Le bus est tombé en panne de moteur.',
      'reaction': 'Appelez un mécanicien ou prenez un taxi de secours.',
      'icon': Icons.car_crash_rounded,
      'audio': 'le_bus_est_tombe_en_panne',
    },
    {
      'issue': 'Vol / Train manqué',
      'phrase': 'J\'ai raté mon vol de dix heures.',
      'reaction': 'Adressez-vous au guichet pour réserver le vol suivant.',
      'icon': Icons.schedule_rounded,
      'audio': 'jai_rate_mon_train',
    },
    {
      'issue': 'Billet / Bagage perdu',
      'phrase': 'J\'ai perdu mon billet et ma valise.',
      'reaction': 'Déclarez la perte au bureau des objets trouvés.',
      'icon': Icons.luggage_rounded,
      'audio': 'jai_perdu_mon_billet_de_transport',
    },
    {
      'issue': 'Embouteillage monstre',
      'phrase': 'Il y a un grand embouteillage sur le pont.',
      'reaction': 'Prévenez l\'école de votre retard.',
      'icon': Icons.traffic_rounded,
      'audio': 'il_y_a_un_grand_embouteillage',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final prob = _problems[_selectedProblemIndex];

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
                const Icon(Icons.report_problem_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Résolution des Imprévus & Pannes de Transport',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Réagissez calmement aux pépins (tomber en panne, rater le bus, perdre son billet, embouteillages).',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Problem Cards Grid
          Row(
            children: List.generate(_problems.length, (idx) {
              final item = _problems[idx];
              final isSel = _selectedProblemIndex == idx;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: idx == 0 ? 0 : 4, right: idx == _problems.length - 1 ? 0 : 4),
                  child: InkWell(
                    onTap: () {
                      setState(() => _selectedProblemIndex = idx);
                      _audioService.playPhrase(item['audio'] as String, term: 1);
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
                            item['icon'] as IconData,
                            color: isSel ? Colors.white : LangHueyColors.deepTeal,
                            size: 24,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item['issue'] as String,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text('Exclamation du Problème :', style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: LangHueyColors.deepTeal, size: 24),
                      onPressed: () => _audioService.playPhrase(prob['audio'] as String, term: 1),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange.shade200),
                  ),
                  child: Text(
                    '« ${prob['phrase']} »',
                    style: LangHueyTextStyles.frenchHighlight.copyWith(fontSize: 15, color: Colors.brown.shade900),
                  ),
                ),
                const SizedBox(height: 14),
                Text('Conduite à tenir / Solution recommandée :', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: LangHueyColors.deepTeal)),
                const SizedBox(height: 4),
                Text(prob['reaction'] as String, style: const TextStyle(fontSize: 13, color: LangHueyColors.charcoal)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
