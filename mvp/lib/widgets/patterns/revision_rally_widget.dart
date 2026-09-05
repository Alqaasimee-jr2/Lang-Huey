import 'package:flutter/material.dart';
import '../../models/p4_lesson_model.dart';
import '../../services/p4_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

/// Weeks 5 & 11 Pattern: Interactive Term Revision Rally & Oral Speed Check
class RevisionRallyWidget extends StatefulWidget {
  final P4Lesson lesson;

  const RevisionRallyWidget({super.key, required this.lesson});

  @override
  State<RevisionRallyWidget> createState() => _RevisionRallyWidgetState();
}

class _RevisionRallyWidgetState extends State<RevisionRallyWidget> {
  int _activeTopicIndex = 0;

  final List<Map<String, dynamic>> _revisionTopics = [
    {
      'title': '1. Greetings & Times of Day',
      'icon': Icons.wb_sunny_rounded,
      'items': [
        {'prompt': 'Morning / Day:', 'french': 'Bonjour', 'detail': 'Until 6:00 PM', 'audio': 'bonjour'},
        {'prompt': 'Evening:', 'french': 'Bonsoir', 'detail': 'After 6:00 PM', 'audio': 'bonsoir'},
        {'prompt': 'Bedtime:', 'french': 'Bonne nuit', 'detail': 'Going to sleep only', 'audio': 'bonne_nuit'},
        {'prompt': 'Casual:', 'french': 'Salut', 'detail': 'Hi & Bye for friends', 'audio': 'salut'},
      ],
    },
    {
      'title': '2. French Numbers 1 to 20',
      'icon': Icons.numbers_rounded,
      'items': [
        {'prompt': '1 to 5:', 'french': 'Un, Deux, Trois, Quatre, Cinq', 'detail': 'Foundation numbers', 'audio': 'num_5'},
        {'prompt': '6 to 10:', 'french': 'Six, Sept, Huit, Neuf, Dix', 'detail': 'Single digits', 'audio': 'num_10'},
        {'prompt': '11 to 15:', 'french': 'Onze, Douze, Treize, Quatorze, Quinze', 'detail': 'Teens series', 'audio': 'num_15'},
        {'prompt': '16 to 20:', 'french': 'Seize, Dix-sept, Dix-huit, Dix-neuf, Vingt', 'detail': 'Ending at 20', 'audio': 'num_20'},
      ],
    },
    {
      'title': '3. Personal Identity & Gender',
      'icon': Icons.badge_rounded,
      'items': [
        {'prompt': 'My name is:', 'french': 'Je m\'appelle [Name]', 'detail': 'Literally: I call myself', 'audio': 'je_mappelle'},
        {'prompt': 'I am Nigerian (Boy):', 'french': 'Je suis Nigérian', 'detail': 'Masculine form', 'audio': 'je_suis_nigerian'},
        {'prompt': 'I am Nigerian (Girl):', 'french': 'Je suis Nigériane', 'detail': 'Feminine form (+e)', 'audio': 'je_suis_nigeriane'},
        {'prompt': 'I am 9/10 years old:', 'french': 'J\'ai neuf / dix ans', 'detail': 'Using verb avoir (to have)', 'audio': 'jai_neuf_ans'},
      ],
    },
    {
      'title': '4. Magic Words & Farewells',
      'icon': Icons.auto_awesome_rounded,
      'items': [
        {'prompt': 'Please (Formal):', 'french': 'S\'il vous plaît', 'detail': 'To teachers & adults', 'audio': 'sil_vous_plait'},
        {'prompt': 'Thank you very much:', 'french': 'Merci beaucoup', 'detail': 'Deep gratitude', 'audio': 'merci_beaucoup'},
        {'prompt': 'You are welcome:', 'french': 'De rien', 'detail': 'Polite response', 'audio': 'de_rien'},
        {'prompt': 'Have a good weekend:', 'french': 'Bon week-end !', 'detail': 'Friday departure', 'audio': 'bon_weekend'},
      ],
    },
  ];

  void _playPhrase(String? audioKey) {
    if (audioKey != null) {
      P4AudioService().playPhrase(audioKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final active = _revisionTopics[_activeTopicIndex];
    final items = active['items'] as List<Map<String, String>>;

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Speed Revision Rally & Knowledge Recall',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tap each topic to cycle through core Term 1 vocabulary and oral drills',
                    style: LHText.body(LHColors.grey).copyWith(fontSize: 15),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: LHColors.cream,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'TAP CARDS TO HEAR AUDIO',
                  style: LHText.label(LHColors.charcoal).copyWith(fontSize: 12),
                ),
              ),
            ],
          ),

          const Divider(height: 20),

          // Topic Selectors
          Row(
            children: List.generate(_revisionTopics.length, (idx) {
              final topic = _revisionTopics[idx];
              final isCurrent = idx == _activeTopicIndex;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: idx < _revisionTopics.length - 1 ? 12 : 0),
                  child: Material(
                    color: isCurrent ? LHColors.teal : LHColors.cream,
                    borderRadius: BorderRadius.circular(14),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        setState(() => _activeTopicIndex = idx);
                        P4AudioService().playSfx(P4SfxType.click);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              topic['icon'] as IconData,
                              color: isCurrent ? LHColors.gold : LHColors.teal,
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                topic['title'] as String,
                                style: LHText.body(isCurrent ? LHColors.white : LHColors.charcoal).copyWith(
                                  fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w600,
                                  fontSize: 13,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 20),

          // 4 Big Flash Cards for Active Topic
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.2,
              ),
              itemCount: items.length,
              itemBuilder: (context, idx) {
                final item = items[idx];
                return Material(
                  color: LHColors.cream.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(18),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () => _playPhrase(item['audio']),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: LHColors.teal.withValues(alpha: 0.25), width: 1.5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item['prompt']!,
                                  style: LHText.label(LHColors.teal).copyWith(fontSize: 12),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['french']!,
                                  style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 20),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['detail']!,
                                  style: LHText.body(LHColors.grey).copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: LHColors.gold,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
