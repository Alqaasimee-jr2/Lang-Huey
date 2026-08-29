import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5CommunityActivityWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5CommunityActivityWidget({super.key, required this.onComplete});

  @override
  State<P5CommunityActivityWidget> createState() => _P5CommunityActivityWidgetState();
}

class _P5CommunityActivityWidgetState extends State<P5CommunityActivityWidget> {
  final P5AudioService _audioService = P5AudioService();
  String _selectedAction = 'Aider son voisin';

  final List<Map<String, dynamic>> _actions = [
    {
      'title': 'Aider son voisin',
      'english': 'To help one\'s neighbor (porter les sacs)',
      'audio': 'aider_son_voisin',
      'icon': Icons.volunteer_activism_rounded,
    },
    {
      'title': 'Partager avec les voisins',
      'english': 'To share food or tools with neighbors',
      'audio': 'partager_avec_les_voisins',
      'icon': Icons.share_rounded,
    },
    {
      'title': 'Saluer poliment',
      'english': 'To greet politely every morning',
      'audio': 'saluer_poliment',
      'icon': Icons.waving_hand_rounded,
    },
  ];

  final List<Map<String, dynamic>> _environments = [
    {
      'desc': 'Mon quartier est calme',
      'english': 'My neighborhood is quiet & peaceful',
      'audio': 'mon_quartier_est_calme',
      'icon': Icons.nature_people_rounded,
    },
    {
      'desc': 'Mon quartier est bruyant',
      'english': 'My neighborhood is bustling & noisy',
      'audio': 'mon_quartier_est_bruyant',
      'icon': Icons.volume_up_rounded,
    },
    {
      'desc': 'Mon quartier est propre',
      'english': 'My neighborhood is clean & tidy',
      'audio': 'mon_quartier_est_propre',
      'icon': Icons.cleaning_services_rounded,
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
          // Section 1: Neighbor Actions
          Text('1. Les Actions d\'Entraide entre Voisins :', style: P5Text.subheading(P5Colors.charcoal)),
          const SizedBox(height: 12),
          Row(
            children: _actions.map((act) {
              final isSel = act['title'] == _selectedAction;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedAction = act['title'];
                      });
                      _audioService.playPhrase(act['audio'], term: 2);
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isSel ? P5Colors.teal : P5Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSel ? P5Colors.gold : P5Colors.teal.withValues(alpha: 0.3),
                          width: isSel ? 2.5 : 1.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(act['icon'] as IconData, size: 36, color: isSel ? P5Colors.gold : P5Colors.teal),
                          const SizedBox(height: 8),
                          Text(
                            act['title'] as String,
                            style: P5Text.body(isSel ? P5Colors.white : P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            act['english'] as String,
                            style: P5Text.caption(isSel ? P5Colors.cream : P5Colors.charcoal),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Section 2: Neighborhood Description
          Text('2. Décrire son Quartier :', style: P5Text.subheading(P5Colors.charcoal)),
          const SizedBox(height: 12),
          Expanded(
            child: Row(
              children: _environments.map((env) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: P5Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: P5Colors.gold, width: 2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(env['icon'] as IconData, size: 40, color: P5Colors.teal),
                          const SizedBox(height: 10),
                          Text(
                            env['desc'] as String,
                            style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            env['english'] as String,
                            style: P5Text.caption(P5Colors.charcoal),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          IconButton.filled(
                            style: IconButton.styleFrom(backgroundColor: P5Colors.teal, foregroundColor: P5Colors.white),
                            onPressed: () {
                              _audioService.playPhrase(env['audio'], term: 2);
                            },
                            icon: const Icon(Icons.volume_up_rounded),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                onPressed: () {
                  _audioService.playClick();
                  widget.onComplete();
                },
                icon: const Icon(Icons.check_circle_rounded),
                label: const Text('Valider l\'Entraide'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
