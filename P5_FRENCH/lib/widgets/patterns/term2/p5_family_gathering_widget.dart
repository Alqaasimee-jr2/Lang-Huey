import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5FamilyGatheringWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5FamilyGatheringWidget({super.key, required this.onComplete});

  @override
  State<P5FamilyGatheringWidget> createState() => _P5FamilyGatheringWidgetState();
}

class _P5FamilyGatheringWidgetState extends State<P5FamilyGatheringWidget> {
  final P5AudioService _audioService = P5AudioService();
  String _selectedActivity = 'Nous visitons nos grands-parents';

  final List<Map<String, dynamic>> _activities = [
    {
      'title': 'Nous visitons nos grands-parents',
      'sub': 'We visit our grandparents',
      'audio': 'nous_visitons_nos_grands_parents',
      'icon': Icons.directions_bus_rounded,
      'place': 'Au village (In the village)',
    },
    {
      'title': 'La réunion de famille',
      'sub': 'The family gathering / reunion',
      'audio': 'la_reunion_de_famille',
      'icon': Icons.celebration_rounded,
      'place': 'À la grande maison familiale',
    },
    {
      'title': 'Nous mangeons ensemble',
      'sub': 'We eat delicious meals together',
      'audio': 'nous_mangeons_ensemble',
      'icon': Icons.restaurant_rounded,
      'place': 'Le riz, le poisson et les fruits',
    },
    {
      'title': 'Nous fêtons',
      'sub': 'We celebrate special festivals',
      'audio': 'nous_fetons',
      'icon': Icons.cake_rounded,
      'place': 'Les anniversaires et les fêtes',
    },
    {
      'title': 'Respecter les aînés',
      'sub': 'Respecting elders & greeting with reverence',
      'audio': 'respecter_les_aines',
      'icon': Icons.volunteer_activism_rounded,
      'place': 'Saluer avec deux mains',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Les Activités en Famille (Visites & Réunions)', style: P5Text.subheading(P5Colors.charcoal)),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                onPressed: () {
                  _audioService.playPhrase('au_village', term: 2);
                },
                icon: const Icon(Icons.holiday_village_rounded),
                label: const Text('Au Village'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: _activities.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final act = _activities[index];
                final isSelected = act['title'] == _selectedActivity;
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedActivity = act['title'];
                    });
                    _audioService.playPhrase(act['audio'], term: 2);
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected ? P5Colors.teal : P5Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected ? P5Colors.gold : P5Colors.teal.withValues(alpha: 0.3),
                        width: isSelected ? 2.5 : 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: isSelected ? P5Colors.gold : P5Colors.cream,
                          child: Icon(act['icon'] as IconData, color: isSelected ? P5Colors.charcoal : P5Colors.teal),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                act['title'] as String,
                                style: P5Text.subheading(isSelected ? P5Colors.white : P5Colors.charcoal).copyWith(fontSize: 18),
                              ),
                              Text(
                                act['sub'] as String,
                                style: P5Text.body(isSelected ? P5Colors.cream : P5Colors.charcoal).copyWith(fontSize: 14),
                              ),
                              Text(
                                'Détails: ${act['place']}',
                                style: P5Text.caption(isSelected ? P5Colors.gold : P5Colors.teal).copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        IconButton.filled(
                          style: IconButton.styleFrom(
                            backgroundColor: isSelected ? P5Colors.gold : P5Colors.teal,
                            foregroundColor: isSelected ? P5Colors.charcoal : P5Colors.white,
                          ),
                          onPressed: () {
                            _audioService.playPhrase(act['audio'], term: 2);
                          },
                          icon: const Icon(Icons.volume_up_rounded),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                onPressed: () {
                  _audioService.playClick();
                  widget.onComplete();
                },
                icon: const Icon(Icons.check_circle_rounded),
                label: const Text('Valider l\'Atelier Famille'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
