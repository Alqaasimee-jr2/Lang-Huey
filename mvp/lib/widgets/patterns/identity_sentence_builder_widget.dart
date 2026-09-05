import 'package:flutter/material.dart';
import '../../models/p4_lesson_model.dart';
import '../../services/p4_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

/// Week 4 Pattern: Personal Identity Sentence Lab (Name, Nationality & Subject Pronouns)
class IdentitySentenceBuilderWidget extends StatefulWidget {
  final P4Lesson lesson;

  const IdentitySentenceBuilderWidget({super.key, required this.lesson});

  @override
  State<IdentitySentenceBuilderWidget> createState() =>
      _IdentitySentenceBuilderWidgetState();
}

class _IdentitySentenceBuilderWidgetState
    extends State<IdentitySentenceBuilderWidget> {
  int _tabIndex = 0; // 0: Name & Nationality, 1: Subject Pronouns
  bool _isGirl = false;
  String _selectedName = 'Amina';

  final List<String> _sampleNames = ['Amina', 'Chinedu', 'Femi', 'Zainab', 'Emeka', 'Fatima'];

  final List<Map<String, String>> _pronouns = [
    {'french': 'Je', 'sound': 'zhuh', 'english': 'I', 'example': 'Je m\'appelle Tunde', 'audio': 'pronom_je'},
    {'french': 'Tu', 'sound': 'too', 'english': 'You (informal)', 'example': 'Tu t\'appelles Kofi', 'audio': 'pronom_tu'},
    {'french': 'Il', 'sound': 'eel', 'english': 'He', 'example': 'Il est Nigérian', 'audio': 'pronom_il'},
    {'french': 'Elle', 'sound': 'ell', 'english': 'She', 'example': 'Elle est Nigériane', 'audio': 'pronom_elle'},
  ];

  void _playAudio(String? key) {
    if (key != null && key.isNotEmpty) {
      P4AudioService().playPhrase(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Switcher
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTab(
              title: '🪪 1. Name & Nationality Assembler',
              isActive: _tabIndex == 0,
              onTap: () => setState(() => _tabIndex = 0),
            ),
            const SizedBox(width: 16),
            _buildTab(
              title: '👥 2. Subject Pronouns Lab (Je, Tu, Il, Elle)',
              isActive: _tabIndex == 1,
              onTap: () => setState(() => _tabIndex = 1),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Expanded(
          child: _tabIndex == 0 ? _buildNameNationalityView() : _buildPronounsView(),
        ),
      ],
    );
  }

  Widget _buildTab({required String title, required bool isActive, required VoidCallback onTap}) {
    return Material(
      color: isActive ? LHColors.teal : LHColors.white,
      borderRadius: BorderRadius.circular(14),
      elevation: isActive ? 4 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Text(
            title,
            style: LHText.subheading(isActive ? LHColors.white : LHColors.charcoal).copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameNationalityView() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3), width: 2),
      ),
      child: Row(
        children: [
          // Left: Interactive Controls (Name Picker & Gender Toggle)
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Select Pupil Name',
                      style: LHText.subheading(LHColors.teal).copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _sampleNames.map((name) {
                        final isSelected = name == _selectedName;
                        return ChoiceChip(
                          label: Text(
                            name,
                            style: LHText.body(isSelected ? LHColors.charcoal : LHColors.charcoal).copyWith(
                              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                            ),
                          ),
                          selected: isSelected,
                          selectedColor: LHColors.gold,
                          backgroundColor: LHColors.cream,
                          onSelected: (_) => setState(() => _selectedName = name),
                        );
                      }).toList(),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2. Select Gender (Changes Nationality Ending)',
                      style: LHText.subheading(LHColors.teal).copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Material(
                            color: !_isGirl ? LHColors.teal : LHColors.cream,
                            borderRadius: BorderRadius.circular(14),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(14),
                              onTap: () {
                                setState(() => _isGirl = false);
                                _playAudio('je_suis_nigerian');
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Center(
                                  child: Text(
                                    '👦 Boy (Masculin)',
                                    style: LHText.body(!_isGirl ? LHColors.white : LHColors.charcoal).copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Material(
                            color: _isGirl ? LHColors.teal : LHColors.cream,
                            borderRadius: BorderRadius.circular(14),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(14),
                              onTap: () {
                                setState(() => _isGirl = true);
                                _playAudio('je_suis_nigeriane');
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Center(
                                  child: Text(
                                    '👧 Girl (Féminin)',
                                    style: LHText.body(_isGirl ? LHColors.white : LHColors.charcoal).copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: LHColors.teal.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Grammar Rule: Boys say "Nigérian" (ends in -an). Girls add an "e" and say "Nigériane" (pronounced nee-zhay-ree-ahn)!',
                    style: LHText.body(LHColors.teal).copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 28),

          // Right: Generated Live Speech Card with Speaker Button
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: LHColors.cream,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: LHColors.teal.withValues(alpha: 0.4), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Live Sentence Output',
                        style: LHText.heading(LHColors.teal).copyWith(fontSize: 22),
                      ),
                      IconButton.filled(
                        style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                        icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                        onPressed: () => _playAudio(_isGirl ? 'je_suis_nigeriane' : 'je_suis_nigerian'),
                      ),
                    ],
                  ),

                  // Sentence 1: Name
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.4)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'French Name Statement:',
                                style: LHText.label(LHColors.grey).copyWith(fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Je m\'appelle $_selectedName.',
                                style: LHText.heading(LHColors.teal).copyWith(fontSize: 22),
                              ),
                              Text(
                                '[ zhuh mah-pell $_selectedName ] · My name is $_selectedName',
                                style: LHText.body(LHColors.charcoal).copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.volume_up_rounded, color: LHColors.teal, size: 24),
                          onPressed: () => _playAudio('je_mappelle'),
                        ),
                      ],
                    ),
                  ),

                  // Sentence 2: Nationality
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: LHColors.gold.withValues(alpha: 0.5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'French Nationality Statement (${_isGirl ? "Féminin" : "Masculin"}):',
                                style: LHText.label(LHColors.grey).copyWith(fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _isGirl ? 'Je suis Nigériane.' : 'Je suis Nigérian.',
                                style: LHText.heading(LHColors.teal).copyWith(fontSize: 22),
                              ),
                              Text(
                                _isGirl
                                    ? '[ zhuh swee nee-zhay-ree-ahn ] · I am Nigerian (Girl)'
                                    : '[ zhuh swee nee-zhay-ree-ahn ] · I am Nigerian (Boy)',
                                style: LHText.body(LHColors.charcoal).copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.volume_up_rounded, color: LHColors.gold, size: 24),
                          onPressed: () => _playAudio(_isGirl ? 'je_suis_nigeriane' : 'je_suis_nigerian'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPronounsView() {
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
              Text(
                'The 4 Subject Pronouns (Les Pronoms Sujets)',
                style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: LHColors.cream,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'TAP TO HEAR PRONUNCIATION',
                  style: LHText.label(LHColors.charcoal).copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
          const Divider(height: 20),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.2,
              ),
              itemCount: _pronouns.length,
              itemBuilder: (context, index) {
                final p = _pronouns[index];
                return Material(
                  color: LHColors.cream.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(18),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () => _playAudio(p['audio']),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: LHColors.teal.withValues(alpha: 0.2), width: 1.5),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: const BoxDecoration(
                              color: LHColors.teal,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                p['french']!,
                                style: LHText.heading(LHColors.white).copyWith(fontSize: 22),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${p['french']} = "${p['english']}"',
                                  style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 18),
                                ),
                                Text(
                                  '[ ${p['sound']} ]',
                                  style: LHText.body(LHColors.teal).copyWith(fontSize: 13, fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  p['example']!,
                                  style: LHText.body(LHColors.grey).copyWith(fontSize: 13),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.volume_up_rounded, color: LHColors.teal),
                            onPressed: () => _playAudio(p['audio']),
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
