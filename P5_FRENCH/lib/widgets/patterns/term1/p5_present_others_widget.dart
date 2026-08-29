import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5PresentOthersWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5PresentOthersWidget({super.key, required this.onComplete});

  @override
  State<P5PresentOthersWidget> createState() => _P5PresentOthersWidgetState();
}

class _P5PresentOthersWidgetState extends State<P5PresentOthersWidget> {
  final P5AudioService _audioService = P5AudioService();
  bool _isMale = true;
  String _selectedName = 'Paul';
  String _selectedRelation = 'mon ami';

  final List<String> _boyNames = ['Paul', 'Tunde', 'Ibrahim', 'Chinedu'];
  final List<String> _girlNames = ['Fatima', 'Amina', 'Mary', 'Ngozi'];

  @override
  Widget build(BuildContext context) {
    final pronoun = _isMale ? 'Il' : 'Elle';
    final callVerb = _isMale ? 's\'appelle' : 's\'appelle';
    final relation = _isMale
        ? (_selectedRelation.contains('sœur') ? 'mon frère' : 'mon ami')
        : (_selectedRelation.contains('frère') ? 'ma sœur' : 'mon amie');
    final adjective = _isMale ? 'gentil' : 'gentille';

    final fullSentence = 'Voici $relation. $pronoun $callVerb $_selectedName. $pronoun est $adjective !';

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
                  const Icon(Icons.people_alt_rounded, color: P5Colors.teal, size: 28),
                  const SizedBox(width: 10),
                  Text(
                    'Interactive Friend Presentation Studio',
                    style: P5Text.heading(P5Colors.teal).copyWith(fontSize: 22),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: widget.onComplete,
                icon: const Icon(Icons.check_circle_rounded, color: P5Colors.white),
                label: const Text('Complete Studio', style: TextStyle(fontWeight: FontWeight.bold)),
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
            child: Row(
              children: [
                // Controls Column
                Expanded(
                  flex: 3,
                  child: ListView(
                    children: [
                      // Gender Switcher
                      Text('1. Choose Gender (Il / Elle):', style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _isMale ? P5Colors.teal : P5Colors.cream,
                                foregroundColor: _isMale ? P5Colors.white : P5Colors.charcoal,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isMale = true;
                                  _selectedName = _boyNames.first;
                                  _selectedRelation = 'mon ami';
                                });
                                _audioService.playPhrase('il_sappelle', term: 1);
                              },
                              icon: const Icon(Icons.man_rounded),
                              label: const Text('Garçon (Il / Mon ami)'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: !_isMale ? P5Colors.teal : P5Colors.cream,
                                foregroundColor: !_isMale ? P5Colors.white : P5Colors.charcoal,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isMale = false;
                                  _selectedName = _girlNames.first;
                                  _selectedRelation = 'mon amie';
                                });
                                _audioService.playPhrase('elle_sappelle', term: 1);
                              },
                              icon: const Icon(Icons.woman_rounded),
                              label: const Text('Fille (Elle / Mon amie)'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),

                      // Name Selector
                      Text('2. Select Name:', style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16)),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: (_isMale ? _boyNames : _girlNames).map((name) {
                          final isSelected = _selectedName == name;
                          return ChoiceChip(
                            label: Text(name),
                            selected: isSelected,
                            selectedColor: P5Colors.turquoise,
                            onSelected: (selected) {
                              if (selected) setState(() => _selectedName = name);
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 18),

                      // Relationship Selector
                      Text('3. Select Relationship:', style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          ChoiceChip(
                            label: Text(_isMale ? 'Mon ami (Friend)' : 'Mon amie (Friend)'),
                            selected: _selectedRelation.contains('ami'),
                            onSelected: (s) {
                              setState(() => _selectedRelation = _isMale ? 'mon ami' : 'mon amie');
                            },
                          ),
                          const SizedBox(width: 10),
                          ChoiceChip(
                            label: Text(_isMale ? 'Mon frère (Brother)' : 'Ma sœur (Sister)'),
                            selected: _selectedRelation.contains('frère') || _selectedRelation.contains('sœur'),
                            onSelected: (s) {
                              setState(() => _selectedRelation = _isMale ? 'mon frère' : 'ma sœur');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),

                // Live Presentation Card Preview
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: P5Colors.cream,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: P5Colors.gold, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: _isMale ? P5Colors.teal : P5Colors.purple,
                          child: Icon(
                            _isMale ? Icons.face_rounded : Icons.face_3_rounded,
                            size: 48,
                            color: P5Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Carte d\'Introduction (Presentation Card):',
                          style: P5Text.caption(P5Colors.charcoal),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          fullSentence,
                          style: P5Text.frenchPhrase(P5Colors.teal).copyWith(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Translation: "Here is $relation. $pronoun is named $_selectedName. $pronoun is $adjective!"',
                          style: P5Text.body(P5Colors.charcoal).copyWith(fontSize: 14, fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: P5Colors.teal,
                            foregroundColor: P5Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          onPressed: () {
                            if (_isMale) {
                              _audioService.playPhrase('il_est_gentil', term: 1);
                            } else {
                              _audioService.playPhrase('elle_est_gentille', term: 1);
                            }
                          },
                          icon: const Icon(Icons.volume_up_rounded),
                          label: const Text('Listen to Presentation'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
