import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5DailyRoutineEveningWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5DailyRoutineEveningWidget({super.key, required this.onComplete});

  @override
  State<P5DailyRoutineEveningWidget> createState() => _P5DailyRoutineEveningWidgetState();
}

class _P5DailyRoutineEveningWidgetState extends State<P5DailyRoutineEveningWidget> {
  final P5AudioService _audioService = P5AudioService();
  String _selectedAction = 'J\'étudie à l\'école';

  final List<Map<String, dynamic>> _activities = [
    {
      'title': 'J\'étudie à l\'école',
      'sub': 'I study in class with my teachers',
      'audio': 'jetudie_a_lecole',
      'icon': Icons.menu_book_rounded,
      'time': '8h00 - 12h00',
    },
    {
      'title': 'Je déjeune à midi',
      'sub': 'I eat my lunch at 12:00 PM',
      'audio': 'je_dejeune_a_midi',
      'icon': Icons.lunch_dining_rounded,
      'time': '12h00',
    },
    {
      'title': 'Je rentre à la maison',
      'sub': 'I return home after school',
      'audio': 'je_rentre_a_la_maison',
      'icon': Icons.home_rounded,
      'time': '15h00',
    },
    {
      'title': 'Je fais mes devoirs',
      'sub': 'I do my homework carefully',
      'audio': 'je_fais_mes_devoirs',
      'icon': Icons.edit_note_rounded,
      'time': '17h00',
    },
    {
      'title': 'Je dîne en famille',
      'sub': 'I have dinner with my family',
      'audio': 'je_dine_en_famille',
      'icon': Icons.restaurant_rounded,
      'time': '19h30',
    },
    {
      'title': 'Je me couche et je dors',
      'sub': 'I go to bed and sleep peacefully',
      'audio': 'je_me_couche_et_je_dors',
      'icon': Icons.bedtime_rounded,
      'time': '21h00',
    },
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('La Routine de l\'Après-midi et de la Soirée :', style: P5Text.subheading(P5Colors.charcoal)),
          const SizedBox(height: 14),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.4,
              ),
              itemCount: _activities.length,
              itemBuilder: (context, index) {
                final act = _activities[index];
                final isSel = act['title'] == _selectedAction;
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedAction = act['title'];
                    });
                    _audioService.playPhrase(act['audio'], term: 3);
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(12),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              act['time'] as String,
                              style: P5Text.caption(isSel ? P5Colors.gold : P5Colors.teal).copyWith(fontWeight: FontWeight.bold),
                            ),
                            Icon(act['icon'] as IconData, color: isSel ? P5Colors.gold : P5Colors.teal, size: 24),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          act['title'] as String,
                          style: P5Text.body(isSel ? P5Colors.white : P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          act['sub'] as String,
                          style: P5Text.caption(isSel ? P5Colors.cream : P5Colors.charcoal).copyWith(fontSize: 11),
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
                label: const Text('Valider la Soirée'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
