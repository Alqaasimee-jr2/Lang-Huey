import 'package:flutter/material.dart';
import '../../models/p4_lesson_model.dart';
import '../../services/p4_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

/// Week 8 Pattern: Farewell Context Clock & Situation Matcher
class FarewellMatcherWidget extends StatefulWidget {
  final P4Lesson lesson;

  const FarewellMatcherWidget({super.key, required this.lesson});

  @override
  State<FarewellMatcherWidget> createState() => _FarewellMatcherWidgetState();
}

class _FarewellMatcherWidgetState extends State<FarewellMatcherWidget> {
  int _selectedSituationIndex = 0;

  final List<Map<String, dynamic>> _situations = [
    {
      'title': 'Friday Dismissal (Weekend Ahead)',
      'time': 'Friday 2:00 PM',
      'icon': Icons.weekend_rounded,
      'french': 'Bon week-end !',
      'phonetics': 'bohn weekend',
      'english': 'Have a good weekend !',
      'tip': 'Say this to classmates and teachers on Friday as you go home.',
      'audio': 'bon_weekend',
    },
    {
      'title': 'Morning Break (Meeting later today)',
      'time': '11:00 AM Break time',
      'icon': Icons.timer_rounded,
      'french': 'À tout à l\'heure !',
      'phonetics': 'ah toot ah luhr',
      'english': 'See you later today !',
      'tip': 'Use when you will see the person again later on the same day.',
      'audio': 'a_tout_a_lheure',
    },
    {
      'title': 'End of Regular School Day',
      'time': 'Monday-Thursday 2:30 PM',
      'icon': Icons.calendar_today_rounded,
      'french': 'Bonne journée !',
      'phonetics': 'bun zhoor-nay',
      'english': 'Have a good day !',
      'tip': 'When you will meet again in class the next morning.',
      'audio': 'bonne_journee',
    },
    {
      'title': 'Evening Meeting Plan',
      'time': 'Parting in the afternoon with evening plans',
      'icon': Icons.nights_stay_rounded,
      'french': 'À ce soir !',
      'phonetics': 'ah suh swahr',
      'english': 'See you tonight !',
      'tip': 'Use when you plan to meet your friend again in the evening.',
      'audio': 'a_ce_soir',
    },
  ];

  void _playAudio(String? key) {
    if (key != null && key.isNotEmpty) {
      P4AudioService().playPhrase(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selected = _situations[_selectedSituationIndex];

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withOpacity(0.3), width: 2),
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
                    'Farewell Context & Departure Clock',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Match each classroom situation with the correct time-specific French farewell',
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
                  'TAP SITUATION TO LISTEN',
                  style: LHText.label(LHColors.charcoal).copyWith(fontSize: 12),
                ),
              ),
            ],
          ),

          const Divider(height: 24),

          Expanded(
            child: Row(
              children: [
                // Left 4 Situation Cards
                Expanded(
                  flex: 5,
                  child: ListView.separated(
                    itemCount: _situations.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = _situations[index];
                      final isSelected = index == _selectedSituationIndex;

                      return Material(
                        color: isSelected ? LHColors.teal : LHColors.cream.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(18),
                        elevation: isSelected ? 4 : 0,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onTap: () {
                            setState(() => _selectedSituationIndex = index);
                            _playAudio(item['audio'] as String?);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                            child: Row(
                              children: [
                                Icon(
                                  item['icon'] as IconData,
                                  color: isSelected ? LHColors.gold : LHColors.teal,
                                  size: 28,
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['title'] as String,
                                        style: LHText.subheading(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        item['time'] as String,
                                        style: LHText.body(isSelected ? LHColors.white.withOpacity(0.85) : LHColors.grey).copyWith(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.volume_up_rounded,
                                  color: isSelected ? LHColors.gold : LHColors.teal,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 24),

                // Right Departure Phrase Spotlight
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: LHColors.cream,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: LHColors.gold.withOpacity(0.5), width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: LHColors.teal,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'CORRECT FAREWELL PHRASE',
                                style: LHText.label(LHColors.white).copyWith(fontSize: 12),
                              ),
                            ),
                            IconButton.filled(
                              style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                              icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                              onPressed: () => _playAudio(selected['audio'] as String?),
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selected['french'] as String,
                              style: LHText.heading(LHColors.teal).copyWith(fontSize: 30),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '[ ${selected['phonetics']} ]',
                              style: LHText.body(LHColors.teal).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              selected['english'] as String,
                              style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 20),
                            ),
                          ],
                        ),

                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: LHColors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: LHColors.turquoise.withOpacity(0.4)),
                          ),
                          child: Text(
                            'Classroom Context: ${selected['tip']}',
                            style: LHText.body(LHColors.charcoal).copyWith(fontSize: 15, height: 1.4),
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
