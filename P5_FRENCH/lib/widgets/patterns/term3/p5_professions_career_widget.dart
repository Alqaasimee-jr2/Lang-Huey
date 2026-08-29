import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5ProfessionsCareerWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5ProfessionsCareerWidget({super.key, required this.onComplete});

  @override
  State<P5ProfessionsCareerWidget> createState() => _P5ProfessionsCareerWidgetState();
}

class _P5ProfessionsCareerWidgetState extends State<P5ProfessionsCareerWidget> {
  final P5AudioService _audioService = P5AudioService();
  String _selectedProfession = 'médecin';
  bool _isMale = true;

  final List<Map<String, dynamic>> _careers = [
    {
      'title': 'Le Médecin',
      'job': 'médecin',
      'english': 'Doctor / Physician',
      'audio': 'le_medecin',
      'icon': Icons.medical_services_rounded,
      'desc': 'Soigner les malades à l\'hôpital',
    },
    {
      'title': 'L\'Enseignant(e)',
      'job': 'enseignant',
      'jobFem': 'enseignante',
      'english': 'Teacher',
      'audio': 'lenseignant',
      'icon': Icons.school_rounded,
      'desc': 'Enseigner aux élèves à l\'école',
    },
    {
      'title': 'L\'Infirmier/ère',
      'job': 'infirmier',
      'jobFem': 'infirmière',
      'english': 'Nurse',
      'audio': 'linfirmier',
      'icon': Icons.local_hospital_rounded,
      'desc': 'Prendre soin des patients avec douceur',
    },
    {
      'title': 'Le Pilote',
      'job': 'pilote',
      'english': 'Airplane Pilot',
      'audio': 'le_pilote',
      'icon': Icons.flight_rounded,
      'desc': 'Piloter des avions dans le ciel',
    },
    {
      'title': 'L\'Ingénieur',
      'job': 'ingénieur',
      'english': 'Engineer',
      'audio': 'lingenieur',
      'icon': Icons.engineering_rounded,
      'desc': 'Construire des ponts, routes et technologies',
    },
    {
      'title': 'Le Policier',
      'job': 'policier',
      'jobFem': 'policière',
      'english': 'Police Officer',
      'audio': 'le_policier',
      'icon': Icons.local_police_rounded,
      'desc': 'Protéger la population et faire respecter la loi',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final cur = _careers.firstWhere((c) => c['job'] == _selectedProfession || c['jobFem'] == _selectedProfession);
    final jobText = _isMale ? (cur['job'] as String) : (cur['jobFem'] ?? cur['job'] as String);
    final genderSuffix = _isMale ? 'grand' : 'grande';
    final sentence = 'Quand je serai $genderSuffix, je veux être $jobText !';

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.cream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.teal, width: 3),
      ),
      child: Row(
        children: [
          // Left: Career Cards Grid
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1. Choisir une Profession :', style: P5Text.subheading(P5Colors.charcoal)),
                    Row(
                      children: [
                        ChoiceChip(
                          selected: _isMale,
                          label: const Text('Garçon (Grand)'),
                          onSelected: (val) {
                            if (val) setState(() => _isMale = true);
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          selected: !_isMale,
                          label: const Text('Fille (Grande)'),
                          onSelected: (val) {
                            if (val) setState(() => _isMale = false);
                          },
                        ),
                      ],
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
                    itemCount: _careers.length,
                    itemBuilder: (context, index) {
                      final c = _careers[index];
                      final isSel = c['job'] == _selectedProfession || c['jobFem'] == _selectedProfession;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedProfession = _isMale ? c['job'] : (c['jobFem'] ?? c['job']);
                          });
                          _audioService.playPhrase(c['audio'], term: 3);
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
                              Icon(c['icon'] as IconData, size: 32, color: isSel ? P5Colors.gold : P5Colors.teal),
                              const SizedBox(height: 6),
                              Text(
                                c['title'] as String,
                                style: P5Text.body(isSel ? P5Colors.white : P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                c['english'] as String,
                                style: P5Text.caption(isSel ? P5Colors.cream : P5Colors.charcoal).copyWith(fontSize: 10),
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
              ],
            ),
          ),

          const SizedBox(width: 20),

          // Right: Dream Showcase Card
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
                  Text('Rêve d\'Avenir', style: P5Text.subheading(P5Colors.teal), textAlign: TextAlign.center),
                  const Divider(height: 18),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: P5Colors.teal,
                          child: Icon(cur['icon'] as IconData, size: 44, color: P5Colors.gold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          sentence,
                          style: P5Text.heading(P5Colors.charcoal).copyWith(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          cur['desc'] as String,
                          style: P5Text.caption(P5Colors.teal).copyWith(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: P5Colors.teal,
                      foregroundColor: P5Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      _audioService.playPhrase('je_veux_etre', term: 3);
                    },
                    icon: const Icon(Icons.volume_up_rounded),
                    label: const Text('Prononcer le Rêve'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                    onPressed: () {
                      _audioService.playClick();
                      widget.onComplete();
                    },
                    icon: const Icon(Icons.check_circle_rounded),
                    label: const Text('Valider le Métier'),
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
