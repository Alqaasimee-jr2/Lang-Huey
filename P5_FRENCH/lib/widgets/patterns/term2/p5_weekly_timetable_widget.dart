import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5WeeklyTimetableWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5WeeklyTimetableWidget({super.key, required this.onComplete});

  @override
  State<P5WeeklyTimetableWidget> createState() => _P5WeeklyTimetableWidgetState();
}

class _P5WeeklyTimetableWidgetState extends State<P5WeeklyTimetableWidget> {
  final P5AudioService _audioService = P5AudioService();
  int _selectedDayIndex = 0;

  final List<Map<String, dynamic>> _days = [
    {'french': 'Lundi', 'english': 'Monday', 'type': 'École', 'isWeekend': false, 'color': P5Colors.teal},
    {'french': 'Mardi', 'english': 'Tuesday', 'type': 'École', 'isWeekend': false, 'color': P5Colors.teal},
    {'french': 'Mercredi', 'english': 'Wednesday', 'type': 'École', 'isWeekend': false, 'color': P5Colors.teal},
    {'french': 'Jeudi', 'english': 'Thursday', 'type': 'École', 'isWeekend': false, 'color': P5Colors.teal},
    {'french': 'Vendredi', 'english': 'Friday', 'type': 'École (Dernier jour)', 'isWeekend': false, 'color': P5Colors.teal},
    {'french': 'Samedi', 'english': 'Saturday', 'type': 'Le Week-end !', 'isWeekend': true, 'color': P5Colors.gold},
    {'french': 'Dimanche', 'english': 'Sunday', 'type': 'Le Week-end & Repos', 'isWeekend': true, 'color': P5Colors.gold},
  ];

  @override
  Widget build(BuildContext context) {
    final currentDay = _days[_selectedDayIndex];
    final yesterdayIndex = (_selectedDayIndex - 1 + 7) % 7;
    final tomorrowIndex = (_selectedDayIndex + 1) % 7;

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
          // Header Question
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Les 7 Jours de la Semaine :', style: P5Text.subheading(P5Colors.charcoal)),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                onPressed: () {
                  _audioService.playPhrase('quel_jour_sommes_nous', term: 2);
                },
                icon: const Icon(Icons.help_outline_rounded),
                label: const Text('Quel jour sommes-nous ?'),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 7-Day Interactive Row
          Row(
            children: List.generate(_days.length, (index) {
              final d = _days[index];
              final isSel = index == _selectedDayIndex;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedDayIndex = index;
                      });
                      if (index < 3) {
                        _audioService.playPhrase('lundi_mardi_mercredi', term: 2);
                      } else if (index < 5) {
                        _audioService.playPhrase('jeudi_vendredi', term: 2);
                      } else {
                        _audioService.playPhrase('samedi_dimanche', term: 2);
                      }
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isSel ? d['color'] as Color : P5Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSel ? P5Colors.charcoal : (d['color'] as Color).withValues(alpha: 0.4),
                          width: isSel ? 3 : 1.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            d['french'].substring(0, 3).toUpperCase(),
                            style: P5Text.caption(isSel ? P5Colors.white : P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            d['french'] as String,
                            style: P5Text.body(isSel ? P5Colors.white : P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            d['english'] as String,
                            style: P5Text.caption(isSel ? P5Colors.cream : P5Colors.charcoal).copyWith(fontSize: 11),
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

          const SizedBox(height: 20),

          // Temporal Analysis Card (Hier, Aujourd'hui, Demain)
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: P5Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: P5Colors.teal, width: 2),
              ),
              child: Row(
                children: [
                  // Hier
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: P5Colors.cream,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Hier (Yesterday)', style: P5Text.caption(P5Colors.charcoal)),
                          const SizedBox(height: 6),
                          Text(
                            _days[yesterdayIndex]['french'] as String,
                            style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Aujourd'hui
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: P5Colors.teal,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: P5Colors.gold, width: 2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Aujourd\'hui (Today)', style: P5Text.body(P5Colors.gold).copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text(
                            'Aujourd\'hui, c\'est ${currentDay['french']} !',
                            style: P5Text.heading(P5Colors.white).copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            currentDay['type'] as String,
                            style: P5Text.caption(P5Colors.cream),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Demain
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: P5Colors.cream,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Demain (Tomorrow)', style: P5Text.caption(P5Colors.charcoal)),
                          const SizedBox(height: 6),
                          Text(
                            _days[tomorrowIndex]['french'] as String,
                            style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: P5Colors.teal,
                  foregroundColor: P5Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  _audioService.playClick();
                  widget.onComplete();
                },
                icon: const Icon(Icons.check_circle_rounded),
                label: const Text('Valider l\'Emploi du Temps'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
