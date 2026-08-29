import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5NeighborStudioWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5NeighborStudioWidget({super.key, required this.onComplete});

  @override
  State<P5NeighborStudioWidget> createState() => _P5NeighborStudioWidgetState();
}

class _P5NeighborStudioWidgetState extends State<P5NeighborStudioWidget> {
  final P5AudioService _audioService = P5AudioService();
  bool _isMale = true;
  String _neighborName = 'M. Adebayo';
  String _selectedTrait = 'sympathique';

  final List<String> _maleNames = ['M. Adebayo', 'M. Musa', 'M. Okafor', 'M. Ibrahim'];
  final List<String> _femaleNames = ['Mme Adeleke', 'Mme Bello', 'Mme Nwachukwu', 'Mme Fatima'];

  @override
  Widget build(BuildContext context) {
    final title = _isMale ? 'mon voisin' : 'ma voisine';
    final pronoun = _isMale ? 'Il' : 'Elle';
    final sentence = 'Voici $title, $_neighborName. $pronoun habite dans la maison voisine. $pronoun est $_selectedTrait !';

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.cream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.teal, width: 3),
      ),
      child: Row(
        children: [
          // Left: Neighbor Builder Controls
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Présenter ses Voisins (Le Quartier) :', style: P5Text.subheading(P5Colors.charcoal)),
                const SizedBox(height: 14),

                // Gender Switcher
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isMale ? P5Colors.teal : P5Colors.white,
                          foregroundColor: _isMale ? P5Colors.white : P5Colors.charcoal,
                        ),
                        onPressed: () {
                          setState(() {
                            _isMale = true;
                            _neighborName = _maleNames.first;
                          });
                          _audioService.playPhrase('le_voisin', term: 2);
                        },
                        icon: const Icon(Icons.man_rounded),
                        label: const Text('Le Voisin (Homme)'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: !_isMale ? P5Colors.teal : P5Colors.white,
                          foregroundColor: !_isMale ? P5Colors.white : P5Colors.charcoal,
                        ),
                        onPressed: () {
                          setState(() {
                            _isMale = false;
                            _neighborName = _femaleNames.first;
                          });
                          _audioService.playPhrase('la_voisine', term: 2);
                        },
                        icon: const Icon(Icons.woman_rounded),
                        label: const Text('La Voisine (Femme)'),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Name Selector
                Text('Sélectionner le Nom du Voisin :', style: P5Text.body(P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  children: (_isMale ? _maleNames : _femaleNames).map((name) {
                    final isSel = name == _neighborName;
                    return ChoiceChip(
                      selected: isSel,
                      label: Text(name),
                      onSelected: (val) {
                        if (val) {
                          setState(() {
                            _neighborName = name;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 16),

                // Trait Selector
                Text('Caractère du Voisin :', style: P5Text.body(P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: _selectedTrait == 'sympathique' ? P5Colors.gold : P5Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedTrait = 'sympathique';
                          });
                          _audioService.playPhrase('sympathique_aimable', term: 2);
                        },
                        child: const Text('Sympathique (Nice)'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: _selectedTrait == 'aimable' ? P5Colors.gold : P5Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedTrait = 'aimable';
                          });
                          _audioService.playPhrase('sympathique_aimable', term: 2);
                        },
                        child: const Text('Aimable (Friendly)'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 24),

          // Right: Smartboard Neighborhood Card
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
                  Text('Carte de Voisinage', style: P5Text.subheading(P5Colors.teal), textAlign: TextAlign.center),
                  const Divider(height: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: P5Colors.teal,
                          child: Icon(_isMale ? Icons.person_pin_rounded : Icons.person_pin_circle_rounded, size: 44, color: P5Colors.gold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          sentence,
                          style: P5Text.heading(P5Colors.charcoal).copyWith(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: P5Colors.cream,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'La maison voisine dans le quartier',
                            style: P5Text.caption(P5Colors.teal).copyWith(fontWeight: FontWeight.bold),
                          ),
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
                            _audioService.playPhrase(_isMale ? 'le_voisin' : 'la_voisine', term: 2);
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
