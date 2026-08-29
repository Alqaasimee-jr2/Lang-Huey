import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5SportsArenaWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5SportsArenaWidget({super.key, required this.onComplete});

  @override
  State<P5SportsArenaWidget> createState() => _P5SportsArenaWidgetState();
}

class _P5SportsArenaWidgetState extends State<P5SportsArenaWidget> {
  final P5AudioService _audioService = P5AudioService();
  String _selectedSport = 'Le football';
  bool _likesSport = true;

  final List<Map<String, dynamic>> _sports = [
    {'name': 'Le football', 'english': 'Football / Soccer', 'audio': 'le_football', 'icon': Icons.sports_soccer_rounded},
    {'name': 'Le basketball', 'english': 'Basketball', 'audio': 'le_basketball', 'icon': Icons.sports_basketball_rounded},
    {'name': 'La natation', 'english': 'Swimming', 'audio': 'la_natation', 'icon': Icons.pool_rounded},
    {'name': 'La course', 'english': 'Running / Track', 'audio': 'la_course', 'icon': Icons.directions_run_rounded},
    {'name': 'Le tennis', 'english': 'Tennis', 'audio': 'le_tennis', 'icon': Icons.sports_tennis_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    final current = _sports.firstWhere((s) => s['name'] == _selectedSport);
    final isBallSport = _selectedSport.contains('ball') || _selectedSport.contains('tennis') || _selectedSport.contains('foot');
    final phrase = isBallSport
        ? 'Je joue ${_selectedSport.toLowerCase().replaceAll('le ', 'au ')} !'
        : 'Je fais de ${_selectedSport.toLowerCase().replaceAll('la ', 'la ')} !';

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.cream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.teal, width: 3),
      ),
      child: Row(
        children: [
          // Left: Sports Grid
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1. Choisir un Sport :', style: P5Text.subheading(P5Colors.charcoal)),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                      onPressed: () {
                        _audioService.playPhrase('jaime_le_sport', term: 3);
                      },
                      icon: const Icon(Icons.favorite_rounded),
                      label: const Text('J\'aime le sport'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.25,
                    ),
                    itemCount: _sports.length,
                    itemBuilder: (context, index) {
                      final item = _sports[index];
                      final isSel = item['name'] == _selectedSport;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedSport = item['name'];
                          });
                          _audioService.playPhrase(item['audio'], term: 3);
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(10),
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
                              Icon(item['icon'] as IconData, size: 36, color: isSel ? P5Colors.gold : P5Colors.teal),
                              const SizedBox(height: 6),
                              Text(
                                item['name'] as String,
                                style: P5Text.caption(isSel ? P5Colors.white : P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                item['english'] as String,
                                style: P5Text.caption(isSel ? P5Colors.cream : P5Colors.charcoal).copyWith(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
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

          const SizedBox(width: 20),

          // Right: Stadium Card
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: P5Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: P5Colors.gold, width: 2.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Stade des Champions', style: P5Text.subheading(P5Colors.teal), textAlign: TextAlign.center),
                  const Divider(height: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: P5Colors.teal,
                          child: Icon(current['icon'] as IconData, size: 44, color: P5Colors.gold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          phrase,
                          style: P5Text.heading(P5Colors.charcoal).copyWith(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _likesSport ? 'J\'aime ce sport !' : 'Je préfère un autre sport.',
                          style: P5Text.body(P5Colors.teal),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: P5Colors.teal,
                            foregroundColor: P5Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {
                            if (_selectedSport == 'Le football') {
                              _audioService.playPhrase('je_joue_au_football', term: 3);
                            } else {
                              _audioService.playPhrase(current['audio'], term: 3);
                            }
                          },
                          icon: const Icon(Icons.volume_up_rounded),
                          label: const Text('Prononcer'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton.filled(
                        style: IconButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                        onPressed: () {
                          _audioService.playClick();
                          widget.onComplete();
                        },
                        icon: const Icon(Icons.check_circle_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
