import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5DailyRoutineMorningWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5DailyRoutineMorningWidget({super.key, required this.onComplete});

  @override
  State<P5DailyRoutineMorningWidget> createState() => _P5DailyRoutineMorningWidgetState();
}

class _P5DailyRoutineMorningWidgetState extends State<P5DailyRoutineMorningWidget> {
  final P5AudioService _audioService = P5AudioService();
  int _selectedStepIndex = 0;

  final List<Map<String, dynamic>> _steps = [
    {
      'time': '6h00',
      'action': 'Je me réveille',
      'sub': 'I wake up at dawn',
      'icon': Icons.alarm_rounded,
      'audio': 'je_me_reveille',
      'desc': 'Le réveil sonne et j\'ouvre les yeux.',
    },
    {
      'time': '6h15',
      'action': 'Je me lève',
      'sub': 'I get out of bed',
      'icon': Icons.wb_sunny_rounded,
      'audio': 'je_me_leve',
      'desc': 'Je salue mes parents : "Bonjour maman, bonjour papa !"',
    },
    {
      'time': '6h30',
      'action': 'Je me lave',
      'sub': 'I wash / bathe',
      'icon': Icons.bathtub_rounded,
      'audio': 'je_me_lave',
      'desc': 'Je prends mon bain avec de l\'eau propre et du savon.',
    },
    {
      'time': '6h45',
      'action': 'Je m\'habille',
      'sub': 'I put on my uniform',
      'icon': Icons.checkroom_rounded,
      'audio': 'je_mhabille',
      'desc': 'Je porte mon bel uniforme scolaire bien repassé.',
    },
    {
      'time': '7h00',
      'action': 'Je prends le petit-déjeuner',
      'sub': 'I have my breakfast',
      'icon': Icons.free_breakfast_rounded,
      'audio': 'je_prends_le_petit_dejeuner',
      'desc': 'Je mange du pain, des œufs et je bois du thé chaud.',
    },
    {
      'time': '7h30',
      'action': 'Je vais à l\'école',
      'sub': 'I depart for school',
      'icon': Icons.directions_walk_rounded,
      'audio': 'je_vais_a_lecole',
      'desc': 'Je marche vers l\'école avec mon sac et mes cahiers.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final current = _steps[_selectedStepIndex];

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
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Chronologie de la Routine du Matin (6h00 à 7h30) :',
                  style: P5Text.subheading(P5Colors.charcoal),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                onPressed: () {
                  _audioService.playPhrase('a_six_heures', term: 3);
                },
                icon: const Icon(Icons.access_time_rounded),
                label: const Text('À six heures / À sept heures'),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Horizontal Step Buttons
          Row(
            children: List.generate(_steps.length, (index) {
              final step = _steps[index];
              final isSel = index == _selectedStepIndex;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedStepIndex = index;
                      });
                      _audioService.playPhrase(step['audio'], term: 3);
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                      decoration: BoxDecoration(
                        color: isSel ? P5Colors.teal : P5Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSel ? P5Colors.gold : P5Colors.teal.withValues(alpha: 0.3),
                          width: isSel ? 2.5 : 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            step['time'] as String,
                            style: P5Text.caption(isSel ? P5Colors.gold : P5Colors.teal).copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Icon(step['icon'] as IconData, size: 28, color: isSel ? P5Colors.white : P5Colors.charcoal),
                          const SizedBox(height: 4),
                          Text(
                            (step['action'] as String).replaceAll('Je ', ''),
                            style: P5Text.caption(isSel ? P5Colors.white : P5Colors.charcoal).copyWith(fontSize: 11, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 16),

          // Showcase Card
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: P5Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: P5Colors.gold, width: 2.5),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 44,
                    backgroundColor: P5Colors.teal,
                    child: Icon(current['icon'] as IconData, size: 48, color: P5Colors.gold),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: P5Colors.gold,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Étape ${_selectedStepIndex + 1} • ${current['time']}',
                            style: P5Text.caption(P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          current['action'] as String,
                          style: P5Text.heading(P5Colors.charcoal).copyWith(fontSize: 24),
                        ),
                        Text(
                          current['sub'] as String,
                          style: P5Text.body(P5Colors.teal).copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          current['desc'] as String,
                          style: P5Text.caption(P5Colors.charcoal),
                        ),
                      ],
                    ),
                  ),
                  IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor: P5Colors.teal,
                      foregroundColor: P5Colors.white,
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () {
                      _audioService.playPhrase(current['audio'], term: 3);
                    },
                    icon: const Icon(Icons.volume_up_rounded, size: 28),
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
                label: const Text('Valider la Routine du Matin'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
