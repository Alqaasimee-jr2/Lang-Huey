import 'package:flutter/material.dart';
import '../../../models/p4_lesson_model.dart';
import '../../../services/p4_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Term 2 Week 3 Pattern: Family Descriptor Lab (Adjectives & Singular Verb Avoir)
class FamilyDescriptorWidget extends StatefulWidget {
  final P4Lesson lesson;

  const FamilyDescriptorWidget({super.key, required this.lesson});

  @override
  State<FamilyDescriptorWidget> createState() =>
      _FamilyDescriptorWidgetState();
}

class _FamilyDescriptorWidgetState extends State<FamilyDescriptorWidget> {
  int _tabIndex = 0; // 0: Adjectives Lab, 1: Verb Avoir Conjugator
  String _selectedSubject = 'Mon père';
  String _selectedAdjective = 'grand';
  bool _isFeminine = false;

  int _selectedAvoirSubjectIndex = 0;
  final List<Map<String, String>> _avoirForms = [
    {'subject': 'Je (J\')', 'verb': 'ai', 'sentence': 'J\'ai un frère et une sœur.', 'english': 'I have a brother and a sister.'},
    {'subject': 'Tu', 'verb': 'as', 'sentence': 'Tu as deux tantes.', 'english': 'You have two aunts.'},
    {'subject': 'Il', 'verb': 'a', 'sentence': 'Il a un grand-père.', 'english': 'He has a grandfather.'},
    {'subject': 'Elle', 'verb': 'a', 'sentence': 'Elle a trois cousins.', 'english': 'She has three cousins.'},
  ];

  final List<Map<String, dynamic>> _adjectives = [
    {
      'masc': 'grand',
      'fem': 'grande',
      'english': 'Tall / Big',
      'sound': 'grahn / grahnd',
      'icon': Icons.height_rounded,
    },
    {
      'masc': 'petit',
      'fem': 'petite',
      'english': 'Short / Small',
      'sound': 'puh-tee / puh-teet',
      'icon': Icons.accessibility_new_rounded,
    },
    {
      'masc': 'jeune',
      'fem': 'jeune',
      'english': 'Young',
      'sound': 'zhuhn',
      'icon': Icons.child_care_rounded,
    },
    {
      'masc': 'vieux',
      'fem': 'vieille',
      'english': 'Old',
      'sound': 'vyuh / vyeh-ee',
      'icon': Icons.elderly_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Mode Switcher
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTab(
              title: '📏 1. Family Adjective Lab (Grand, Petit, Jeune, Vieux)',
              isActive: _tabIndex == 0,
              onTap: () => setState(() => _tabIndex = 0),
            ),
            const SizedBox(width: 16),
            _buildTab(
              title: '✨ 2. Verb "Avoir" (To Have) Conjugator',
              isActive: _tabIndex == 1,
              onTap: () => setState(() => _tabIndex = 1),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Expanded(
          child: _tabIndex == 0 ? _buildAdjectivesView() : _buildAvoirView(),
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
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAdjectivesView() {
    final adjData = _adjectives.firstWhere(
      (a) => a['masc'] == _selectedAdjective || a['fem'] == _selectedAdjective,
      orElse: () => _adjectives.first,
    );

    final agreedAdj = _isFeminine ? (adjData['fem'] as String) : (adjData['masc'] as String);

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Row(
        children: [
          // Left: Interactive Subject & Adjective Controls
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
                      '1. Select Family Member:',
                      style: LHText.subheading(LHColors.teal).copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        {'name': 'Mon père', 'fem': false},
                        {'name': 'Ma mère', 'fem': true},
                        {'name': 'Mon frère', 'fem': false},
                        {'name': 'Ma sœur', 'fem': true},
                        {'name': 'Mon grand-père', 'fem': false},
                        {'name': 'Ma grand-mère', 'fem': true},
                      ].map((item) {
                        final isSel = item['name'] == _selectedSubject;
                        return ChoiceChip(
                          label: Text(item['name'] as String),
                          selected: isSel,
                          selectedColor: LHColors.gold,
                          backgroundColor: LHColors.cream,
                          onSelected: (_) {
                            setState(() {
                              _selectedSubject = item['name'] as String;
                              _isFeminine = item['fem'] as bool;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2. Select Trait / Adjective:',
                      style: LHText.subheading(LHColors.teal).copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _adjectives.map((adj) {
                        final isSel = adj['masc'] == _selectedAdjective || adj['fem'] == _selectedAdjective;
                        return ChoiceChip(
                          avatar: Icon(adj['icon'] as IconData, size: 16),
                          label: Text('${adj['masc']} / ${adj['fem']} (${adj['english']})'),
                          selected: isSel,
                          selectedColor: LHColors.gold,
                          backgroundColor: LHColors.cream,
                          onSelected: (_) {
                            setState(() => _selectedAdjective = adj['masc'] as String);
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: LHColors.teal.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Grammar Rule: Feminine family members (Ma mère, Ma sœur) add an "e" to the adjective (grand -> grande, petit -> petite). Vieux becomes vieille!',
                    style: LHText.body(LHColors.teal).copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 28),

          // Right: Generated Live Description Card
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: LHColors.cream,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: LHColors.teal, width: 2),
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
                        style: LHText.subheading(LHColors.teal).copyWith(fontSize: 22),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: _isFeminine ? const Color(0xFFD81B60) : LHColors.teal,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _isFeminine ? 'Féminin (+e)' : 'Masculin',
                          style: LHText.label(LHColors.white).copyWith(fontSize: 11),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: LHColors.gold, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'French Description:',
                          style: LHText.label(LHColors.grey).copyWith(fontSize: 12),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '$_selectedSubject est $agreedAdj.',
                          style: LHText.heading(LHColors.teal).copyWith(fontSize: 26),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'My ${_selectedSubject.toLowerCase().replaceAll('mon ', '').replaceAll('ma ', '')} is ${adjData['english'].toString().toLowerCase().split(' / ').first}.',
                          style: LHText.body(LHColors.charcoal).copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  // Logic Connection Box
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Family Logic: "Le père de mon père est mon grand-père" (The father of my father is my grandfather)!',
                      style: LHText.body(LHColors.charcoal).copyWith(fontSize: 13, fontStyle: FontStyle.italic),
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

  Widget _buildAvoirView() {
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
              Text(
                'Verb "Avoir" (To Have) — Singular Conjugation Lab',
                style: LHText.heading(LHColors.teal).copyWith(fontSize: 22),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: LHColors.cream,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'TAP TO SWITCH PRONOUN',
                  style: LHText.label(LHColors.charcoal).copyWith(fontSize: 11),
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
              itemCount: _avoirForms.length,
              itemBuilder: (context, idx) {
                final form = _avoirForms[idx];
                final isSelected = idx == _selectedAvoirSubjectIndex;

                return Material(
                  color: isSelected ? LHColors.teal : LHColors.cream.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(18),
                  elevation: isSelected ? 4 : 0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      setState(() => _selectedAvoirSubjectIndex = idx);
                      P4AudioService().playSfx(P4SfxType.click);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: isSelected ? LHColors.gold : LHColors.teal.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: isSelected ? LHColors.gold : LHColors.teal,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                form['verb']!,
                                style: LHText.heading(isSelected ? LHColors.charcoal : LHColors.white).copyWith(fontSize: 20),
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
                                  '${form['subject']} + ${form['verb']}',
                                  style: LHText.subheading(isSelected ? LHColors.white : LHColors.charcoal).copyWith(fontSize: 16),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  form['sentence']!,
                                  style: LHText.body(isSelected ? LHColors.gold : LHColors.teal).copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  form['english']!,
                                  style: LHText.body(isSelected ? LHColors.white.withOpacity(0.8) : LHColors.grey).copyWith(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
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
