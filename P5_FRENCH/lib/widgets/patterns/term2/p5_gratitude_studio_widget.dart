import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5GratitudeStudioWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5GratitudeStudioWidget({super.key, required this.onComplete});

  @override
  State<P5GratitudeStudioWidget> createState() => _P5GratitudeStudioWidgetState();
}

class _P5GratitudeStudioWidgetState extends State<P5GratitudeStudioWidget> {
  final P5AudioService _audioService = P5AudioService();
  String _selectedThanks = 'Merci beaucoup !';
  String _selectedReply = 'Je vous en prie';

  final List<Map<String, dynamic>> _thanksList = [
    {
      'french': 'Merci',
      'sub': 'Thank you (Standard)',
      'audio': 'merci',
      'icon': Icons.favorite_border_rounded,
    },
    {
      'french': 'Merci beaucoup !',
      'sub': 'Thank you very much! (Strong)',
      'audio': 'merci_beaucoup',
      'icon': Icons.favorite_rounded,
    },
    {
      'french': 'Merci bien !',
      'sub': 'Thanks a lot / Thank you kindly',
      'audio': 'merci_bien',
      'icon': Icons.thumb_up_alt_rounded,
    },
    {
      'french': 'Je vous remercie',
      'sub': 'I thank you (Formal / To Adults)',
      'audio': 'je_vous_remercie',
      'icon': Icons.verified_user_rounded,
    },
  ];

  final List<Map<String, dynamic>> _repliesList = [
    {
      'french': 'De rien',
      'sub': 'You\'re welcome / It\'s nothing (Casual)',
      'audio': 'de_rien',
      'icon': Icons.sentiment_satisfied_alt_rounded,
    },
    {
      'french': 'Je vous en prie',
      'sub': 'You are very welcome (Polite & Formal)',
      'audio': 'je_vous_en_prie',
      'icon': Icons.star_rounded,
    },
    {
      'french': 'Pas de quoi',
      'sub': 'Don\'t mention it / No trouble',
      'audio': 'pas_de_quoi',
      'icon': Icons.tag_faces_rounded,
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
          // Left Column: Saying Thank You
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.favorite_rounded, color: P5Colors.teal),
                    const SizedBox(width: 8),
                    Text('1. Dire Merci (Expressing Thanks) :', style: P5Text.subheading(P5Colors.charcoal)),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    itemCount: _thanksList.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = _thanksList[index];
                      final isSel = item['french'] == _selectedThanks;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedThanks = item['french'];
                          });
                          _audioService.playPhrase(item['audio'], term: 2);
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isSel ? P5Colors.teal : P5Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSel ? P5Colors.gold : P5Colors.teal.withValues(alpha: 0.3),
                              width: isSel ? 2.5 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(item['icon'] as IconData, color: isSel ? P5Colors.gold : P5Colors.teal),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['french'] as String,
                                      style: P5Text.subheading(isSel ? P5Colors.white : P5Colors.charcoal).copyWith(fontSize: 16),
                                    ),
                                    Text(
                                      item['sub'] as String,
                                      style: P5Text.caption(isSel ? P5Colors.cream : P5Colors.charcoal),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.volume_up_rounded, color: isSel ? P5Colors.white : P5Colors.teal),
                                onPressed: () {
                                  _audioService.playPhrase(item['audio'], term: 2);
                                },
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

          // Right Column: Responding to Thank You
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.handshake_rounded, color: P5Colors.gold),
                    const SizedBox(width: 8),
                    Text('2. Répondre à Merci (Replies) :', style: P5Text.subheading(P5Colors.charcoal)),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    itemCount: _repliesList.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = _repliesList[index];
                      final isSel = item['french'] == _selectedReply;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedReply = item['french'];
                          });
                          _audioService.playPhrase(item['audio'], term: 2);
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isSel ? P5Colors.gold : P5Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSel ? P5Colors.teal : P5Colors.gold.withValues(alpha: 0.4),
                              width: isSel ? 2.5 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(item['icon'] as IconData, color: isSel ? P5Colors.charcoal : P5Colors.gold),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['french'] as String,
                                      style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16),
                                    ),
                                    Text(
                                      item['sub'] as String,
                                      style: P5Text.caption(P5Colors.charcoal),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.volume_up_rounded, color: P5Colors.teal),
                                onPressed: () {
                                  _audioService.playPhrase(item['audio'], term: 2);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: P5Colors.teal,
                    foregroundColor: P5Colors.white,
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: () {
                    _audioService.playClick();
                    widget.onComplete();
                  },
                  icon: const Icon(Icons.check_circle_rounded),
                  label: const Text('Valider la Politesse'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
