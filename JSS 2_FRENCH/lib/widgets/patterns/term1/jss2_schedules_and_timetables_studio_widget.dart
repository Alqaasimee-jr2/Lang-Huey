import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2SchedulesAndTimetablesStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2SchedulesAndTimetablesStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2SchedulesAndTimetablesStudioWidget> createState() => _JSS2SchedulesAndTimetablesStudioWidgetState();
}

class _JSS2SchedulesAndTimetablesStudioWidgetState extends State<JSS2SchedulesAndTimetablesStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();

  int _selectedTrainIndex = 0;

  final List<Map<String, dynamic>> _schedules = [
    {
      'destination': 'Abidjan',
      'departure': '07h30',
      'arrival': '11h45',
      'track': 'Voie 2',
      'status': 'À l\'heure',
      'phrase': 'Le train pour Abidjan part à sept heures et demie.',
      'audio': 'a_quelle_heure_part_le_train',
    },
    {
      'destination': 'Lomé',
      'departure': '09h15',
      'arrival': '12h30',
      'track': 'Voie 1',
      'status': 'À l\'heure',
      'phrase': 'Le bus pour Lomé part à neuf heures et quart.',
      'audio': 'le_premier_vol_decolle_a_six_heures',
    },
    {
      'destination': 'Cotonou',
      'departure': '14h45',
      'arrival': '17h00',
      'track': 'Voie 4',
      'status': 'Retardé de 15 min',
      'phrase': 'Le départ pour Cotonou est à quinze heures moins le quart.',
      'audio': 'le_train_arrive_a_quinze_heures_trente',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final sch = _schedules[_selectedTrainIndex];

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
                const Icon(Icons.access_time_filled_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Panneau d\'Affichage Numérique des Horaires',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Consultez et énoncez les départs, arrivées, voies et durées en français (pile, et demie, et quart, moins le quart).',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Digital Timetable Board
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LangHueyColors.amberGold, width: 2),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('DESTINATION', style: TextStyle(color: LangHueyColors.amberGold, fontWeight: FontWeight.bold, fontSize: 12)),
                    Text('DÉPART', style: TextStyle(color: LangHueyColors.amberGold, fontWeight: FontWeight.bold, fontSize: 12)),
                    Text('ARRIVÉE', style: TextStyle(color: LangHueyColors.amberGold, fontWeight: FontWeight.bold, fontSize: 12)),
                    Text('VOIE', style: TextStyle(color: LangHueyColors.amberGold, fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
                const Divider(color: Colors.white24, height: 16),
                ...List.generate(_schedules.length, (idx) {
                  final item = _schedules[idx];
                  final isSel = _selectedTrainIndex == idx;

                  return InkWell(
                    onTap: () {
                      setState(() => _selectedTrainIndex = idx);
                      _audioService.playPhrase(item['audio'] as String, term: 1);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                      decoration: BoxDecoration(
                        color: isSel ? Colors.white12 : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item['destination'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                          Text(item['departure'] as String, style: const TextStyle(color: Colors.lightGreenAccent, fontWeight: FontWeight.bold, fontSize: 13)),
                          Text(item['arrival'] as String, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                          Text(item['track'] as String, style: const TextStyle(color: LangHueyColors.amberGold, fontWeight: FontWeight.bold, fontSize: 13)),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Detail Live Sentence Card
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black12),
            ),
            child: Row(
              children: [
                const Icon(Icons.volume_up_rounded, color: LangHueyColors.deepTeal, size: 30),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Annonce Vocale en Gare (${sch['destination']}) :', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(
                        '« ${sch['phrase']} »',
                        style: LangHueyTextStyles.frenchHighlight.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.play_circle_fill_rounded, color: LangHueyColors.deepTeal, size: 32),
                  onPressed: () => _audioService.playPhrase(sch['audio'] as String, term: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
