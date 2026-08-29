import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5HobbiesLoungeWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5HobbiesLoungeWidget({super.key, required this.onComplete});

  @override
  State<P5HobbiesLoungeWidget> createState() => _P5HobbiesLoungeWidgetState();
}

class _P5HobbiesLoungeWidgetState extends State<P5HobbiesLoungeWidget> {
  final P5AudioService _audioService = P5AudioService();
  String _selectedHobby = 'Lire un livre';

  final List<Map<String, dynamic>> _hobbies = [
    {
      'title': 'Lire un livre',
      'sub': 'Reading stories & comics',
      'audio': 'lire_un_livre',
      'icon': Icons.auto_stories_rounded,
    },
    {
      'title': 'Dessiner et peindre',
      'sub': 'Drawing & coloring art',
      'audio': 'dessiner_et_peindre',
      'icon': Icons.palette_rounded,
    },
    {
      'title': 'Chanter et danser',
      'sub': 'Singing & dancing to songs',
      'audio': 'chanter_et_danser',
      'icon': Icons.music_note_rounded,
    },
    {
      'title': 'Écouter de la musique',
      'sub': 'Listening to nice melodies',
      'audio': 'ecouter_de_la_musique',
      'icon': Icons.headphones_rounded,
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
      child: Row(
        children: [
          // Left: Hobbies List
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1. Les Loisirs et Passe-temps :', style: P5Text.subheading(P5Colors.charcoal)),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 1.8,
                    ),
                    itemCount: _hobbies.length,
                    itemBuilder: (context, index) {
                      final h = _hobbies[index];
                      final isSel = h['title'] == _selectedHobby;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedHobby = h['title'];
                          });
                          _audioService.playPhrase(h['audio'], term: 3);
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
                          child: Row(
                            children: [
                              Icon(h['icon'] as IconData, size: 36, color: isSel ? P5Colors.gold : P5Colors.teal),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      h['title'] as String,
                                      style: P5Text.body(isSel ? P5Colors.white : P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      h['sub'] as String,
                                      style: P5Text.caption(isSel ? P5Colors.cream : P5Colors.charcoal),
                                    ),
                                  ],
                                ),
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

          // Right: Social Invitation Station
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
                  Text('L\'Invitation à Jouer', style: P5Text.subheading(P5Colors.teal), textAlign: TextAlign.center),
                  const Divider(height: 18),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: P5Colors.teal,
                      foregroundColor: P5Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      _audioService.playPhrase('veux_tu_jouer_avec_moi', term: 3);
                    },
                    icon: const Icon(Icons.help_outline_rounded),
                    label: const Text('Veux-tu jouer avec moi ?'),
                  ),
                  const SizedBox(height: 12),
                  Text('Réponses Possibles :', style: P5Text.caption(P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: P5Colors.gold,
                      foregroundColor: P5Colors.charcoal,
                    ),
                    onPressed: () {
                      _audioService.playPhrase('oui_avec_plaisir', term: 3);
                    },
                    icon: const Icon(Icons.check_rounded),
                    label: const Text('Oui, avec plaisir ! (Yes!)'),
                  ),
                  const SizedBox(height: 6),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: P5Colors.cream,
                      foregroundColor: P5Colors.charcoal,
                    ),
                    onPressed: () {
                      _audioService.playPhrase('non_je_ne_peux_pas', term: 3);
                    },
                    icon: const Icon(Icons.close_rounded),
                    label: const Text('Non, je ne peux pas (Polite)'),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: P5Colors.teal,
                      foregroundColor: P5Colors.white,
                    ),
                    onPressed: () {
                      _audioService.playClick();
                      widget.onComplete();
                    },
                    icon: const Icon(Icons.check_circle_rounded),
                    label: const Text('Valider l\'Atelier Loisirs'),
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
