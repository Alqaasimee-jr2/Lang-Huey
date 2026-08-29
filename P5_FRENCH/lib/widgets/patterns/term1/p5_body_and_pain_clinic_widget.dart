import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5BodyAndPainClinicWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5BodyAndPainClinicWidget({super.key, required this.onComplete});

  @override
  State<P5BodyAndPainClinicWidget> createState() => _P5BodyAndPainClinicWidgetState();
}

class _P5BodyAndPainClinicWidgetState extends State<P5BodyAndPainClinicWidget> {
  final P5AudioService _audioService = P5AudioService();
  int _activeView = 0; // 0: Full Body Explorer, 1: Doctor Pain Clinic

  final List<Map<String, dynamic>> _bodyParts = [
    {'name': 'Le bras', 'en': 'The arm', 'phonetic': 'luh brah', 'icon': Icons.fitness_center_rounded, 'audio': 'le_bras'},
    {'name': 'La main', 'en': 'The hand', 'phonetic': 'lah man', 'icon': Icons.pan_tool_rounded, 'audio': 'la_main'},
    {'name': 'Le ventre', 'en': 'The stomach / Belly', 'phonetic': 'luh vahn-truh', 'icon': Icons.accessibility_new_rounded, 'audio': 'le_ventre'},
    {'name': 'Le dos', 'en': 'The back', 'phonetic': 'luh doh', 'icon': Icons.airline_seat_recline_normal_rounded, 'audio': 'le_dos'},
    {'name': 'La jambe', 'en': 'The leg', 'phonetic': 'lah zhahnb', 'icon': Icons.directions_walk_rounded, 'audio': 'la_jambe'},
    {'name': 'Le pied', 'en': 'The foot', 'phonetic': 'luh pyay', 'icon': Icons.do_not_step_rounded, 'audio': 'le_pied'},
  ];

  final List<Map<String, dynamic>> _painCases = [
    {
      'title': 'J\'ai mal à la tête',
      'sub': 'I have a headache',
      'prep': 'à la (feminine)',
      'icon': Icons.sick_rounded,
      'audio': 'jai_mal_a_la_tete',
    },
    {
      'title': 'J\'ai mal au ventre',
      'sub': 'I have a stomach ache',
      'prep': 'au (à + le = au)',
      'icon': Icons.healing_rounded,
      'audio': 'jai_mal_au_ventre',
    },
    {
      'title': 'J\'ai mal au dos',
      'sub': 'I have a backache',
      'prep': 'au (à + le = au)',
      'icon': Icons.airline_seat_flat_rounded,
      'audio': 'jai_mal_au_dos',
    },
    {
      'title': 'J\'ai mal aux dents',
      'sub': 'I have a toothache',
      'prep': 'aux (à + les = aux)',
      'icon': Icons.medical_services_rounded,
      'audio': 'jai_mal_aux_dents',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildTab(0, '1. Body Anatomy Nodes', Icons.accessibility_new_rounded),
                  const SizedBox(width: 12),
                  _buildTab(1, '2. Clinique Médicale ("J\'ai mal à...")', Icons.local_hospital_rounded),
                ],
              ),
              ElevatedButton.icon(
                onPressed: widget.onComplete,
                icon: const Icon(Icons.check_circle_rounded, color: P5Colors.white),
                label: const Text('Complete Clinic Station', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: P5Colors.green,
                  foregroundColor: P5Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ],
          ),
          const Divider(height: 24),

          Expanded(
            child: _activeView == 0 ? _buildBodyNodesView() : _buildClinicView(),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(int index, String label, IconData icon) {
    final isSelected = _activeView == index;
    return InkWell(
      onTap: () {
        setState(() => _activeView = index);
        _audioService.playSfx(P5SfxType.click);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? P5Colors.teal : P5Colors.cream,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: isSelected ? P5Colors.white : P5Colors.teal),
            const SizedBox(width: 8),
            Text(
              label,
              style: P5Text.body(isSelected ? P5Colors.white : P5Colors.charcoal).copyWith(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyNodesView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1.9,
      ),
      itemCount: _bodyParts.length,
      itemBuilder: (context, index) {
        final b = _bodyParts[index];
        return Material(
          color: P5Colors.cream,
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () => _audioService.playPhrase(b['audio'] as String, term: 1),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: P5Colors.teal,
                    child: Icon(b['icon'] as IconData, color: P5Colors.white, size: 26),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(b['name'] as String, style: P5Text.frenchPhrase(P5Colors.charcoal)),
                        Text('"${b['phonetic']}"', style: P5Text.caption(P5Colors.gold)),
                        Text(b['en'] as String, style: P5Text.caption(P5Colors.charcoal)),
                      ],
                    ),
                  ),
                  const Icon(Icons.volume_up_rounded, color: P5Colors.teal, size: 22),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildClinicView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: P5Colors.teal.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              const Icon(Icons.medical_services_rounded, color: P5Colors.teal, size: 28),
              const SizedBox(width: 12),
              Text(
                'Le Médecin demande : "Où avez-vous mal ?" (Touch a symptom below to reply):',
                style: P5Text.subheading(P5Colors.teal).copyWith(fontSize: 16, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 2.3,
            ),
            itemCount: _painCases.length,
            itemBuilder: (context, index) {
              final c = _painCases[index];
              return Material(
                color: P5Colors.cream,
                borderRadius: BorderRadius.circular(18),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () => _audioService.playPhrase(c['audio'] as String, term: 1),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: P5Colors.red,
                          child: Icon(c['icon'] as IconData, color: P5Colors.white, size: 28),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(c['title'] as String, style: P5Text.frenchPhrase(P5Colors.charcoal).copyWith(fontSize: 18)),
                              Text(c['sub'] as String, style: P5Text.caption(P5Colors.charcoal)),
                              const SizedBox(height: 4),
                              Text('Règle: ${c['prep']}', style: P5Text.caption(P5Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const Icon(Icons.volume_up_rounded, color: P5Colors.teal, size: 24),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
