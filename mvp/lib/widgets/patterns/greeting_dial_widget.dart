import 'package:flutter/material.dart';
import '../../models/p4_lesson_model.dart';
import '../../services/p4_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

/// Week 2 Pattern: Time-of-Day Context Dial & Formal/Informal Greeting Switch
class GreetingDialWidget extends StatefulWidget {
  final P4Lesson lesson;

  const GreetingDialWidget({super.key, required this.lesson});

  @override
  State<GreetingDialWidget> createState() => _GreetingDialWidgetState();
}

class _GreetingDialWidgetState extends State<GreetingDialWidget> {
  int _selectedDialIndex = 0;
  bool _isFormal = true;

  final List<Map<String, dynamic>> _dialStates = [
    {
      'timeLabel': 'Morning / Daytime (8:00 AM)',
      'period': 'Matin',
      'icon': Icons.wb_sunny_rounded,
      'image': 'assets/images/p4_term1/matin_sun.png',
      'color': const Color(0xFFF4A832),
      'formalGreeting': 'Bonjour, Madame / Monsieur !',
      'formalMeaning': 'Good day / Hello (Respectful greeting for teachers & elders)',
      'formalQuestion': 'Comment allez-vous ?',
      'formalResponse': 'Je vais très bien, merci. Et vous ?',
      'formalAudio': 'bonjour_madame',
      'informalGreeting': 'Salut, mon ami !',
      'informalMeaning': 'Hi / Hey (Casual greeting for classmates)',
      'informalQuestion': 'Comment ça va ? / Ça va ?',
      'informalResponse': 'Ça va bien, merci ! Et toi ?',
      'informalAudio': 'salut',
    },
    {
      'timeLabel': 'Evening (7:00 PM onwards)',
      'period': 'Soir',
      'icon': Icons.nights_stay_rounded,
      'image': 'assets/images/p4_term1/soir_moon.png',
      'color': const Color(0xFF0D7377),
      'formalGreeting': 'Bonsoir, Monsieur !',
      'formalMeaning': 'Good evening (From 6:00 PM until bedtime)',
      'formalQuestion': 'Comment allez-vous ce soir ?',
      'formalResponse': 'Très bien, merci.',
      'formalAudio': 'bonsoir',
      'informalGreeting': 'Bonsoir / Salut !',
      'informalMeaning': 'Good evening / Hi',
      'informalQuestion': 'Ça va ce soir ?',
      'informalResponse': 'Oui, ça va bien !',
      'informalAudio': 'bonsoir',
    },
    {
      'timeLabel': 'Bedtime (Going to sleep)',
      'period': 'Nuit',
      'icon': Icons.bedtime_rounded,
      'image': 'assets/images/p4_term1/coucher_bed.png',
      'color': const Color(0xFF1A1A2E),
      'formalGreeting': 'Bonne nuit, dormez bien !',
      'formalMeaning': 'Good night (ONLY when going to bed to sleep)',
      'formalQuestion': 'Passez une bonne nuit.',
      'formalResponse': 'Merci, vous aussi !',
      'formalAudio': 'bonne_nuit',
      'informalGreeting': 'Bonne nuit, fais de beaux rêves !',
      'informalMeaning': 'Good night, sweet dreams !',
      'informalQuestion': 'À demain matin !',
      'informalResponse': 'Bonne nuit !',
      'informalAudio': 'bonne_nuit',
    },
  ];

  void _playAudio(String? key) {
    if (key != null && key.isNotEmpty) {
      P4AudioService().playPhrase(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = _dialStates[_selectedDialIndex];

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
          // Top Controls: Time Dial Selector & Formal/Informal Mode Switch
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time-of-Day Greeting Dial',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Select a time of day and toggle formality to see how French greetings adapt',
                    style: LHText.body(LHColors.grey).copyWith(fontSize: 15),
                  ),
                ],
              ),

              // Formal vs Informal Toggle Switch
              Container(
                decoration: BoxDecoration(
                  color: LHColors.cream,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: LHColors.teal.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    _buildFormalityButton('👔 Formal (Politesse)', _isFormal, () {
                      setState(() => _isFormal = true);
                      _playAudio(current['formalAudio']);
                    }),
                    _buildFormalityButton('🤝 Informal (Amiable)', !_isFormal, () {
                      setState(() => _isFormal = false);
                      _playAudio(current['informalAudio']);
                    }),
                  ],
                ),
              ),
            ],
          ),

          const Divider(height: 24),

          // Main Stage
          Expanded(
            child: Row(
              children: [
                // Left 3 Time of Day Dial Cards
                Expanded(
                  flex: 4,
                  child: Column(
                    children: List.generate(_dialStates.length, (index) {
                      final item = _dialStates[index];
                      final isSelected = index == _selectedDialIndex;

                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Material(
                            color: isSelected ? LHColors.teal : LHColors.cream.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(18),
                            elevation: isSelected ? 4 : 0,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(18),
                              onTap: () {
                                setState(() => _selectedDialIndex = index);
                                _playAudio(_isFormal ? item['formalAudio'] : item['informalAudio']);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                                child: Row(
                                  children: [
                                    Icon(
                                      item['icon'] as IconData,
                                      size: 32,
                                      color: isSelected ? LHColors.gold : LHColors.teal,
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item['period'] as String,
                                            style: LHText.subheading(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Text(
                                            item['timeLabel'] as String,
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
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(width: 24),

                // Right Live Conversation Board
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: LHColors.cream,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: LHColors.teal.withOpacity(0.3), width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                              decoration: BoxDecoration(
                                color: _isFormal ? LHColors.teal : const Color(0xFFE65100),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                _isFormal
                                    ? 'FORMAL REGISTER (VOUS) · ADULTS & TEACHERS'
                                    : 'INFORMAL REGISTER (TU) · CLASSMATES & FRIENDS',
                                style: LHText.label(LHColors.white).copyWith(fontSize: 12),
                              ),
                            ),
                            IconButton.filled(
                              style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                              icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                              onPressed: () => _playAudio(_isFormal ? current['formalAudio'] : current['informalAudio']),
                            ),
                          ],
                        ),

                        // Main Greeting Bubble
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: LHColors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: LHColors.turquoise, width: 2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.waving_hand_rounded, color: LHColors.gold, size: 24),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      _isFormal ? current['formalGreeting'] : current['informalGreeting'],
                                      style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                _isFormal ? current['formalMeaning'] : current['informalMeaning'],
                                style: LHText.body(LHColors.grey).copyWith(fontSize: 15),
                              ),
                            ],
                          ),
                        ),

                        // Conversation exchange bubbles
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: LHColors.teal.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Question:',
                                      style: LHText.label(LHColors.teal).copyWith(fontSize: 12),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _isFormal ? current['formalQuestion'] : current['informalQuestion'],
                                      style: LHText.body(LHColors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: LHColors.gold.withOpacity(0.18),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Reply:',
                                      style: LHText.label(LHColors.charcoal).copyWith(fontSize: 12),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _isFormal ? current['formalResponse'] : current['informalResponse'],
                                      style: LHText.body(LHColors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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

  Widget _buildFormalityButton(String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? LHColors.teal : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: LHText.body(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
