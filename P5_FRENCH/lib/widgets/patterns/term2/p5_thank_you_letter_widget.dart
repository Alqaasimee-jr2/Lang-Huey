import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5ThankYouLetterWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5ThankYouLetterWidget({super.key, required this.onComplete});

  @override
  State<P5ThankYouLetterWidget> createState() => _P5ThankYouLetterWidgetState();
}

class _P5ThankYouLetterWidgetState extends State<P5ThankYouLetterWidget> {
  final P5AudioService _audioService = P5AudioService();
  String _recipient = 'Mon cher ami';
  String _reason = 'pour le beau cadeau';
  String _compliment = 'C\'est très gentil !';

  final List<String> _recipients = [
    'Mon cher ami',
    'Ma chère maîtresse',
    'Chers grands-parents',
    'Mon bon voisin'
  ];

  final List<Map<String, String>> _reasons = [
    {'label': 'Pour le cadeau (For the gift)', 'text': 'pour le cadeau', 'audio': 'merci_pour_le_cadeau'},
    {'label': 'Pour l\'aide (For the help)', 'text': 'pour l\'aide', 'audio': 'merci_pour_laide'},
  ];

  final List<Map<String, String>> _compliments = [
    {'label': 'C\'est gentil ! (That\'s kind!)', 'text': 'C\'est gentil !', 'audio': 'cest_gentil'},
    {'label': 'C\'est très aimable ! (Very polite/amiable)', 'text': 'C\'est très aimable !', 'audio': 'cest_tres_aimable'},
    {'label': 'Tu es super ! (You are great!)', 'text': 'Tu es super !', 'audio': 'tu_es_super'},
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
          // Left: Letter Construction Studio
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Atelier : Écrire un Mot de Remerciement', style: P5Text.subheading(P5Colors.charcoal)),
                const SizedBox(height: 12),

                // Step 1: Recipient
                Text('1. Destinataire (Recipient) :', style: P5Text.body(P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  children: _recipients.map((r) {
                    final isSel = r == _recipient;
                    return ChoiceChip(
                      selected: isSel,
                      label: Text(r),
                      onSelected: (val) {
                        if (val) {
                          setState(() {
                            _recipient = r;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 12),

                // Step 2: Reason
                Text('2. Motif de Gratitude (Reason) :', style: P5Text.body(P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Row(
                  children: _reasons.map((re) {
                    final isSel = re['text'] == _reason;
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: isSel ? P5Colors.teal : P5Colors.white,
                            foregroundColor: isSel ? P5Colors.white : P5Colors.charcoal,
                          ),
                          onPressed: () {
                            setState(() {
                              _reason = re['text']!;
                            });
                            _audioService.playPhrase(re['audio']!, term: 2);
                          },
                          child: Text(re['label']!),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 12),

                // Step 3: Compliment
                Text('3. Formule Aimable (Appreciation Phrase) :', style: P5Text.body(P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Column(
                  children: _compliments.map((co) {
                    final isSel = co['text'] == _compliment;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _compliment = co['text']!;
                          });
                          _audioService.playPhrase(co['audio']!, term: 2);
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSel ? P5Colors.gold : P5Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: P5Colors.teal.withValues(alpha: 0.3)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(co['label']!, style: P5Text.body(P5Colors.charcoal).copyWith(fontSize: 14)),
                              const Icon(Icons.volume_up_rounded, size: 20, color: P5Colors.teal),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(width: 24),

          // Right: Generated Postcard
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: P5Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: P5Colors.gold, width: 3),
                boxShadow: [
                  BoxShadow(color: P5Colors.charcoal.withValues(alpha: 0.08), blurRadius: 12, offset: const Offset(0, 4))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.mark_email_read_rounded, color: P5Colors.teal, size: 30),
                      Text('CARTE DE REMERCIEMENT', style: P5Text.subheading(P5Colors.teal).copyWith(fontSize: 15)),
                    ],
                  ),
                  const Divider(height: 20),
                  Expanded(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: P5Colors.cream,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: P5Colors.gold.withValues(alpha: 0.5)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('$_recipient,', style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16)),
                            const SizedBox(height: 10),
                            Text(
                              'Merci beaucoup $_reason !',
                              style: P5Text.heading(P5Colors.teal).copyWith(fontSize: 18),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _compliment,
                              style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16, fontStyle: FontStyle.italic),
                            ),
                            const SizedBox(height: 14),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text('Avec toute mon amitié,', style: P5Text.caption(P5Colors.charcoal)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: P5Colors.teal,
                      foregroundColor: P5Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      _audioService.playPhrase('merci_beaucoup', term: 2);
                      widget.onComplete();
                    },
                    icon: const Icon(Icons.send_rounded),
                    label: const Text('Envoyer le Mot de Remerciement'),
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
