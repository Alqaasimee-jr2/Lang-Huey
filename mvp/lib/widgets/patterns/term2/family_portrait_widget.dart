import 'package:flutter/material.dart';
import '../../../models/p4_lesson_model.dart';
import '../../../services/p4_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Term 2 Week 1 Pattern: Family Portrait Studio & Possessive Adjectives Lab (Mon vs Ma)
class FamilyPortraitWidget extends StatefulWidget {
  final P4Lesson lesson;

  const FamilyPortraitWidget({super.key, required this.lesson});

  @override
  State<FamilyPortraitWidget> createState() => _FamilyPortraitWidgetState();
}

class _FamilyPortraitWidgetState extends State<FamilyPortraitWidget> {
  int _selectedMemberIndex = 0;
  String _selectedSiblingCount = '1';

  final List<Map<String, dynamic>> _familyMembers = [
    {
      'role': 'Father / Dad',
      'french': 'Le père / Papa',
      'phonetics': 'luh pair / pah-pah',
      'gender': 'Masculin',
      'possessive': 'Mon',
      'possessiveExample': 'Mon père (My father)',
      'intro': 'Voici mon père / C\'est mon père',
      'icon': Icons.man_rounded,
      'avatarColor': LHColors.teal,
      'audio': 'le_pere',
    },
    {
      'role': 'Mother / Mom',
      'french': 'La mère / Maman',
      'phonetics': 'lah mair / mah-mahn',
      'gender': 'Féminin',
      'possessive': 'Ma',
      'possessiveExample': 'Ma mère (My mother)',
      'intro': 'Voici ma mère / C\'est ma mère',
      'icon': Icons.woman_rounded,
      'avatarColor': const Color(0xFFD81B60),
      'audio': 'la_mere',
    },
    {
      'role': 'Brother',
      'french': 'Le frère',
      'phonetics': 'luh frair',
      'gender': 'Masculin',
      'possessive': 'Mon',
      'possessiveExample': 'Mon frère (My brother)',
      'intro': 'Voici mon frère / J\'ai un frère',
      'icon': Icons.boy_rounded,
      'avatarColor': LHColors.turquoise,
      'audio': 'le_frere',
    },
    {
      'role': 'Sister',
      'french': 'La sœur',
      'phonetics': 'lah sur',
      'gender': 'Féminin',
      'possessive': 'Ma',
      'possessiveExample': 'Ma sœur (My sister)',
      'intro': 'Voici ma sœur / J\'ai une sœur',
      'icon': Icons.girl_rounded,
      'avatarColor': LHColors.gold,
      'audio': 'la_soeur',
    },
  ];

  void _playAudio(String? key) {
    if (key != null) {
      P4AudioService().playPhrase(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = _familyMembers[_selectedMemberIndex];

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
                    'Family Portrait Studio & Possessive Lab',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tap a family member to explore gender articles ("Le / La") and possessives ("Mon / Ma")',
                    style: LHText.body(LHColors.grey).copyWith(fontSize: 15),
                  ),
                ],
              ),
              IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                onPressed: () => _playAudio(current['audio'] as String?),
              ),
            ],
          ),

          const Divider(height: 20),

          // 4 Member Tabs
          Row(
            children: List.generate(_familyMembers.length, (idx) {
              final member = _familyMembers[idx];
              final isSelected = idx == _selectedMemberIndex;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: idx < _familyMembers.length - 1 ? 10 : 0),
                  child: Material(
                    color: isSelected ? LHColors.teal : LHColors.cream,
                    borderRadius: BorderRadius.circular(14),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        setState(() => _selectedMemberIndex = idx);
                        P4AudioService().playSfx(P4SfxType.click);
                        _playAudio(member['audio'] as String?);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              member['icon'] as IconData,
                              color: isSelected ? LHColors.gold : LHColors.teal,
                              size: 20,
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                member['role'] as String,
                                style: LHText.body(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
                                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                                  fontSize: 14,
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

          // Stage Details
          Expanded(
            child: Row(
              children: [
                // Left: Portrait Card & Possessive Rules
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: LHColors.cream,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: LHColors.teal.withValues(alpha: 0.3), width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: current['avatarColor'] as Color,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                current['icon'] as IconData,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: LHColors.white,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      current['gender'] as String,
                                      style: LHText.label(LHColors.teal).copyWith(fontSize: 12),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    current['french'] as String,
                                    style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 22),
                                  ),
                                  Text(
                                    '[ ${current['phonetics']} ] · ${current['role']}',
                                    style: LHText.body(LHColors.grey).copyWith(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // Possessive Rule Box
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: LHColors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: LHColors.gold, width: 1.5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Possessive Adjective: "${current['possessive']}"',
                                style: LHText.subheading(LHColors.teal).copyWith(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'We say "${current['possessiveExample']}" because ${current['role']} is ${current['gender'].toLowerCase()} in French!',
                                style: LHText.body(LHColors.charcoal).copyWith(fontSize: 13),
                              ),
                            ],
                          ),
                        ),

                        // Sibling Count Selector (if brother or sister)
                        if (current['role'] == 'Brother' || current['role'] == 'Sister')
                          Row(
                            children: [
                              Text(
                                'How many? ',
                                style: LHText.body(LHColors.teal).copyWith(fontWeight: FontWeight.w700),
                              ),
                              ...['1', '2', '3', '4'].map((cnt) {
                                final isSel = cnt == _selectedSiblingCount;
                                return Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: ChoiceChip(
                                    label: Text(cnt),
                                    selected: isSel,
                                    selectedColor: LHColors.gold,
                                    backgroundColor: LHColors.white,
                                    onSelected: (_) => setState(() => _selectedSiblingCount = cnt),
                                  ),
                                );
                              }),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 24),

                // Right: Generated Live Sentences
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: LHColors.gold.withValues(alpha: 0.6), width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'French Introduction Sentences',
                          style: LHText.subheading(LHColors.teal).copyWith(fontSize: 20),
                        ),

                        // Sentence 1: Voici
                        _buildSentenceCard(
                          label: '1. Presenting with "Voici" (Here is):',
                          french: 'Voici ${current['possessive'].toLowerCase()} ${(current['french'] as String).split(' / ').first.toLowerCase().replaceAll('le ', '').replaceAll('la ', '')}.',
                          english: 'Here is my ${current['role'].toString().toLowerCase()}.',
                        ),

                        // Sentence 2: C'est
                        _buildSentenceCard(
                          label: '2. Identifying with "C\'est" (This is):',
                          french: 'C\'est ${current['possessive'].toLowerCase()} ${(current['french'] as String).split(' / ').first.toLowerCase().replaceAll('le ', '').replaceAll('la ', '')}.',
                          english: 'This is my ${current['role'].toString().toLowerCase()}.',
                        ),

                        // Sentence 3: J'ai
                        _buildSentenceCard(
                          label: '3. Stating with "J\'ai" (I have):',
                          french: current['role'] == 'Brother' || current['role'] == 'Sister'
                              ? (_selectedSiblingCount == '1'
                                  ? (current['role'] == 'Brother' ? 'J\'ai un frère.' : 'J\'ai une sœur.')
                                  : 'J\'ai $_selectedSiblingCount ${current['role'] == 'Brother' ? 'frères' : 'sœurs'}.')
                              : 'J\'aime mon père et ma mère.',
                          english: current['role'] == 'Brother' || current['role'] == 'Sister'
                              ? (_selectedSiblingCount == '1'
                                  ? (current['role'] == 'Brother' ? 'I have one brother.' : 'I have one sister.')
                                  : 'I have $_selectedSiblingCount ${current['role'] == 'Brother' ? 'brothers' : 'sisters'}.')
                              : 'I love my father and my mother.',
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

  Widget _buildSentenceCard({required String label, required String french, required String english}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: LHColors.cream.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: LHText.label(LHColors.grey).copyWith(fontSize: 11)),
          const SizedBox(height: 2),
          Text(
            french,
            style: LHText.heading(LHColors.teal).copyWith(fontSize: 18),
          ),
          Text(
            english,
            style: LHText.body(LHColors.charcoal).copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
