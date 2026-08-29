import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5Term2RevisionRallyWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5Term2RevisionRallyWidget({super.key, required this.onComplete});

  @override
  State<P5Term2RevisionRallyWidget> createState() => _P5Term2RevisionRallyWidgetState();
}

class _P5Term2RevisionRallyWidgetState extends State<P5Term2RevisionRallyWidget> {
  final P5AudioService _audioService = P5AudioService();
  int _activeStation = 0;
  int _teamAScore = 0;
  int _teamBScore = 0;

  final List<Map<String, dynamic>> _stations = [
    {
      'title': 'Station 1 : La Grande Famille',
      'icon': Icons.diversity_1_rounded,
      'prompt': 'Quel est le titre français pour "The aunt" et "The grandfather" ?',
      'answer': 'La tante et le grand-père',
      'audio': 'la_famille_et_les_voisins',
    },
    {
      'title': 'Station 2 : Les Bons Voisins',
      'icon': Icons.location_city_rounded,
      'prompt': 'Traduisez : "My neighbor helps me carry the heavy bags."',
      'answer': 'Mon voisin m\'aide à porter les sacs.',
      'audio': 'les_bons_voisins',
    },
    {
      'title': 'Station 3 : Les Mots Magiques de Politesse',
      'icon': Icons.favorite_rounded,
      'prompt': 'Donnez 2 réponses polies à "Merci beaucoup !"',
      'answer': 'De rien / Je vous en prie / Pas de quoi',
      'audio': 'la_politesse_et_les_jours',
    },
    {
      'title': 'Station 4 : Les 7 Jours de la Semaine',
      'icon': Icons.calendar_month_rounded,
      'prompt': 'Quels sont les jours de classe (lundi à vendredi) ?',
      'answer': 'Lundi, mardi, mercredi, jeudi, vendredi.',
      'audio': 'lundi_mardi_mercredi',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final current = _stations[_activeStation];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.cream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.teal, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Scoreboard Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: P5Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: P5Colors.gold, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.emoji_events_rounded, color: P5Colors.gold, size: 28),
                    const SizedBox(width: 8),
                    Text('GRAND RALLYE DU 2e TRIMESTRE', style: P5Text.subheading(P5Colors.charcoal)),
                  ],
                ),
                Row(
                  children: [
                    Text('Équipe A : $_teamAScore pts', style: P5Text.body(P5Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 16),
                    Text('Équipe B : $_teamBScore pts', style: P5Text.body(P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Station Tabs
          Row(
            children: List.generate(_stations.length, (index) {
              final isSel = index == _activeStation;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSel ? P5Colors.teal : P5Colors.white,
                      foregroundColor: isSel ? P5Colors.white : P5Colors.charcoal,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      setState(() {
                        _activeStation = index;
                      });
                      _audioService.playClick();
                    },
                    child: Text('Station ${index + 1}'),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 16),

          // Station Challenge Card
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: P5Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: P5Colors.teal, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(current['icon'] as IconData, size: 48, color: P5Colors.teal),
                  const SizedBox(height: 12),
                  Text(current['title'] as String, style: P5Text.heading(P5Colors.charcoal).copyWith(fontSize: 22)),
                  const SizedBox(height: 12),
                  Text(
                    current['prompt'] as String,
                    style: P5Text.body(P5Colors.charcoal).copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: P5Colors.cream,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: P5Colors.gold),
                    ),
                    child: Text(
                      'Réponse : ${current['answer']}',
                      style: P5Text.subheading(P5Colors.teal).copyWith(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),

          // Bottom Action Bar: Buzzer Points
          Row(
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: P5Colors.teal, foregroundColor: P5Colors.white),
                onPressed: () {
                  setState(() {
                    _teamAScore += 10;
                  });
                  _audioService.playCorrect();
                },
                icon: const Icon(Icons.add_rounded),
                label: const Text('+10 Équipe A'),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: P5Colors.charcoal, foregroundColor: P5Colors.white),
                onPressed: () {
                  setState(() {
                    _teamBScore += 10;
                  });
                  _audioService.playCorrect();
                },
                icon: const Icon(Icons.add_rounded),
                label: const Text('+10 Équipe B'),
              ),
              const Spacer(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: P5Colors.gold,
                  foregroundColor: P5Colors.charcoal,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                onPressed: () {
                  _audioService.playCelebrate();
                  widget.onComplete();
                },
                icon: const Icon(Icons.check_circle_rounded),
                label: const Text('Valider le Rallye'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
