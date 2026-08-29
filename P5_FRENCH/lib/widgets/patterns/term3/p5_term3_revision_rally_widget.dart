import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5Term3RevisionRallyWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5Term3RevisionRallyWidget({super.key, required this.onComplete});

  @override
  State<P5Term3RevisionRallyWidget> createState() => _P5Term3RevisionRallyWidgetState();
}

class _P5Term3RevisionRallyWidgetState extends State<P5Term3RevisionRallyWidget> {
  final P5AudioService _audioService = P5AudioService();
  int _scoreTeamA = 0;
  int _scoreTeamB = 0;
  int _currentStation = 0;

  final List<Map<String, dynamic>> _stations = [
    {
      'title': 'Station 1: Routine & Heure',
      'prompt': 'Que veut dire : "Je me réveille à six heures et je m\'habille" ?',
      'answer': 'I wake up at 6:00 AM and I get dressed.',
      'audio': 'la_routine_et_les_loisirs',
      'icon': Icons.alarm_rounded,
    },
    {
      'title': 'Station 2: Sports & Loisirs',
      'prompt': 'Invitez un ami à jouer et répondez affirmativement.',
      'answer': '"Veux-tu jouer avec moi ?" -> "Oui, avec plaisir !"',
      'audio': 'veux_tu_jouer_avec_moi',
      'icon': Icons.sports_soccer_rounded,
    },
    {
      'title': 'Station 3: Matières & Objets',
      'prompt': 'Demandez poliment à emprunter une règle en classe.',
      'answer': '"Prête-moi ta règle, s\'il te plaît !"',
      'audio': 'prete_moi_ton_stylo',
      'icon': Icons.school_rounded,
    },
    {
      'title': 'Station 4: Rêves de Métier & Table',
      'prompt': 'Dites quelle profession vous voulez faire et bénissez le repas.',
      'answer': '"Quand je serai grand, je veux être médecin !" & "Bon appétit !"',
      'audio': 'je_veux_etre',
      'icon': Icons.stars_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final st = _stations[_currentStation];

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
          // Header & Scoreboard
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Grand Rallye Annuel de Révision :', style: P5Text.subheading(P5Colors.charcoal)),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: P5Colors.teal,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('Équipe A: $_scoreTeamA pts', style: P5Text.caption(P5Colors.gold).copyWith(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: P5Colors.charcoal,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('Équipe B: $_scoreTeamB pts', style: P5Text.caption(P5Colors.cream).copyWith(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Station Tabs
          Row(
            children: List.generate(_stations.length, (idx) {
              final isSel = idx == _currentStation;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSel ? P5Colors.teal : P5Colors.white,
                      foregroundColor: isSel ? P5Colors.gold : P5Colors.charcoal,
                      elevation: isSel ? 2 : 0,
                    ),
                    onPressed: () {
                      setState(() => _currentStation = idx);
                      _audioService.playClick();
                    },
                    child: Text('Station ${idx + 1}', maxLines: 1),
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
                border: Border.all(color: P5Colors.gold, width: 2.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(st['icon'] as IconData, size: 48, color: P5Colors.teal),
                  const SizedBox(height: 10),
                  Text(st['title'] as String, style: P5Text.subheading(P5Colors.teal)),
                  const SizedBox(height: 8),
                  Text(st['prompt'] as String, style: P5Text.heading(P5Colors.charcoal).copyWith(fontSize: 18), textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: P5Colors.cream,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Réponse attendue : ${st['answer']}', style: P5Text.caption(P5Colors.charcoal)),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(backgroundColor: P5Colors.teal, foregroundColor: P5Colors.gold),
                        onPressed: () {
                          _audioService.playPhrase(st['audio'], term: 3);
                        },
                        icon: const Icon(Icons.volume_up_rounded),
                        label: const Text('Écouter l\'Audio'),
                      ),
                      const SizedBox(width: 14),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                        onPressed: () {
                          setState(() => _scoreTeamA += 10);
                          _audioService.playCorrect();
                        },
                        child: const Text('+10 Équipe A'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: P5Colors.charcoal, foregroundColor: P5Colors.white),
                        onPressed: () {
                          setState(() => _scoreTeamB += 10);
                          _audioService.playCorrect();
                        },
                        child: const Text('+10 Équipe B'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                onPressed: () {
                  _audioService.playPhrase('le_grand_champion_5e_annee', term: 3);
                },
                icon: const Icon(Icons.emoji_events_rounded),
                label: const Text('Couronner le Champion'),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: P5Colors.teal, foregroundColor: P5Colors.white),
                onPressed: () {
                  _audioService.playCelebrate();
                  widget.onComplete();
                },
                icon: const Icon(Icons.check_circle_rounded),
                label: const Text('Terminer le Rallye'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
