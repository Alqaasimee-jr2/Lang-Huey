import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5PresentOthersDescriptorWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5PresentOthersDescriptorWidget({super.key, required this.onComplete});

  @override
  State<P5PresentOthersDescriptorWidget> createState() => _P5PresentOthersDescriptorWidgetState();
}

class _P5PresentOthersDescriptorWidgetState extends State<P5PresentOthersDescriptorWidget> {
  final P5AudioService _audioService = P5AudioService();
  bool _isBoy = true;
  String _name = 'Kofi';
  int _age = 10;
  String _height = 'grand'; // 'grand' or 'petit'
  String _strength = 'fort'; // 'fort' or 'gentil'

  @override
  Widget build(BuildContext context) {
    final pronoun = _isBoy ? 'Il' : 'Elle';
    final ageSentence = '$pronoun a $_age ans.';
    final natSentence = _isBoy ? '$pronoun est nigérian.' : '$pronoun est nigériane.';
    final heightWord = _isBoy ? _height : '${_height}e';
    final traitSentence = '$pronoun est $heightWord et ${_isBoy ? _strength : (_strength == 'fort' ? 'forte' : 'gentille')}.';

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
                  const Icon(Icons.badge_rounded, color: P5Colors.teal, size: 28),
                  const SizedBox(width: 10),
                  Text(
                    'Classmate Passport & Description Studio',
                    style: P5Text.heading(P5Colors.teal).copyWith(fontSize: 22),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: widget.onComplete,
                icon: const Icon(Icons.check_circle_rounded, color: P5Colors.white),
                label: const Text('Complete Passport', style: TextStyle(fontWeight: FontWeight.bold)),
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
                // Config Controls
                Expanded(
                  flex: 3,
                  child: ListView(
                    children: [
                      Text('1. Gender:', style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          ChoiceChip(
                            label: const Text('Garçon (Boy)'),
                            selected: _isBoy,
                            onSelected: (s) {
                              if (s) setState(() { _isBoy = true; _name = 'Kofi'; });
                            },
                          ),
                          const SizedBox(width: 10),
                          ChoiceChip(
                            label: const Text('Fille (Girl)'),
                            selected: !_isBoy,
                            onSelected: (s) {
                              if (s) setState(() { _isBoy = false; _name = 'Amaka'; });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      Text('2. Age: $_age ans', style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16)),
                      Slider(
                        value: _age.toDouble(),
                        min: 8,
                        max: 13,
                        divisions: 5,
                        label: '$_age ans',
                        activeColor: P5Colors.teal,
                        onChanged: (v) {
                          setState(() => _age = v.toInt());
                        },
                      ),
                      const SizedBox(height: 10),

                      Text('3. Physical Height:', style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          ChoiceChip(
                            label: Text(_isBoy ? 'Grand (Tall)' : 'Grande (Tall)'),
                            selected: _height == 'grand',
                            onSelected: (s) => setState(() => _height = 'grand'),
                          ),
                          const SizedBox(width: 10),
                          ChoiceChip(
                            label: Text(_isBoy ? 'Petit (Short)' : 'Petite (Short)'),
                            selected: _height == 'petit',
                            onSelected: (s) => setState(() => _height = 'petit'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),

                // Passport Card Output
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: P5Colors.cream,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: P5Colors.turquoise, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.account_box_rounded, color: P5Colors.teal, size: 36),
                            const SizedBox(width: 10),
                            Text('Passeport Scolaire Français', style: P5Text.heading(P5Colors.teal).copyWith(fontSize: 18)),
                          ],
                        ),
                        const Divider(height: 16),
                        Text('• Nom: Voici $_name.', style: P5Text.frenchPhrase(P5Colors.charcoal).copyWith(fontSize: 18)),
                        const SizedBox(height: 6),
                        Text('• Âge: $ageSentence', style: P5Text.frenchPhrase(P5Colors.teal).copyWith(fontSize: 18)),
                        const SizedBox(height: 6),
                        Text('• Nationalité: $natSentence', style: P5Text.frenchPhrase(P5Colors.indigo).copyWith(fontSize: 18)),
                        const SizedBox(height: 6),
                        Text('• Description: $traitSentence', style: P5Text.frenchPhrase(P5Colors.charcoal).copyWith(fontSize: 18)),
                        const SizedBox(height: 16),
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (_isBoy) {
                                _audioService.playPhrase('il_est_nigerian', term: 1);
                              } else {
                                _audioService.playPhrase('elle_est_nigeriane', term: 1);
                              }
                            },
                            icon: const Icon(Icons.volume_up_rounded),
                            label: const Text('Listen to Passport Profile'),
                          ),
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
