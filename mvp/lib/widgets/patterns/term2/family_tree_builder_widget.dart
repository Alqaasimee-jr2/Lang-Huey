import 'package:flutter/material.dart';
import '../../../models/p4_lesson_model.dart';
import '../../../services/p4_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Term 2 Week 2 Pattern: Interactive 3-Generation Family Tree (L'Arbre Généalogique) & Naming Lab
class FamilyTreeBuilderWidget extends StatefulWidget {
  final P4Lesson lesson;

  const FamilyTreeBuilderWidget({super.key, required this.lesson});

  @override
  State<FamilyTreeBuilderWidget> createState() =>
      _FamilyTreeBuilderWidgetState();
}

class _FamilyTreeBuilderWidgetState extends State<FamilyTreeBuilderWidget> {
  String _selectedNodeKey = 'grand_pere';
  String _customName = 'Babatunde';

  final Map<String, Map<String, dynamic>> _treeNodes = {
    'grand_pere': {
      'title': 'Le grand-père (Papi)',
      'relation': 'Grandfather',
      'level': 'Generation 1 (Top)',
      'pronoun': 'Il',
      'gender': 'Masculin',
      'sampleName': 'Babatunde',
      'audio': 'le_grand_pere',
      'color': LHColors.teal,
      'icon': Icons.elderly_rounded,
    },
    'grand_mere': {
      'title': 'La grand-mère (Mami)',
      'relation': 'Grandmother',
      'level': 'Generation 1 (Top)',
      'pronoun': 'Elle',
      'gender': 'Féminin',
      'sampleName': 'Zainab',
      'audio': 'la_grand_mere',
      'color': const Color(0xFF8E24AA),
      'icon': Icons.elderly_woman_rounded,
    },
    'oncle': {
      'title': 'L\'oncle',
      'relation': 'Uncle (Father/Mother\'s Brother)',
      'level': 'Generation 2 (Middle)',
      'pronoun': 'Il',
      'gender': 'Masculin',
      'sampleName': 'Tunde',
      'audio': 'loncle',
      'color': LHColors.turquoise,
      'icon': Icons.person_rounded,
    },
    'tante': {
      'title': 'La tante',
      'relation': 'Aunt (Father/Mother\'s Sister)',
      'level': 'Generation 2 (Middle)',
      'pronoun': 'Elle',
      'gender': 'Féminin',
      'sampleName': 'Funke',
      'audio': 'la_tante',
      'color': const Color(0xFFD81B60),
      'icon': Icons.person_3_rounded,
    },
    'cousin': {
      'title': 'Le cousin',
      'relation': 'Cousin (Boy)',
      'level': 'Generation 3 (Bottom)',
      'pronoun': 'Il',
      'gender': 'Masculin',
      'sampleName': 'Emeka',
      'audio': 'le_cousin',
      'color': LHColors.gold,
      'icon': Icons.boy_rounded,
    },
    'cousine': {
      'title': 'La cousine',
      'relation': 'Cousin (Girl)',
      'level': 'Generation 3 (Bottom)',
      'pronoun': 'Elle',
      'gender': 'Féminin',
      'sampleName': 'Amina',
      'audio': 'la_cousine',
      'color': const Color(0xFFE91E63),
      'icon': Icons.girl_rounded,
    },
  };

  void _selectNode(String key) {
    setState(() {
      _selectedNodeKey = key;
      _customName = _treeNodes[key]!['sampleName'] as String;
    });
    P4AudioService().playSfx(P4SfxType.click);
    final audioKey = _treeNodes[key]!['audio'] as String?;
    if (audioKey != null) {
      P4AudioService().playPhrase(audioKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final active = _treeNodes[_selectedNodeKey]!;

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
                    'L\'Arbre Généalogique (Interactive Family Tree)',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tap any branch node to explore extended family members and generate naming statements',
                    style: LHText.body(LHColors.grey).copyWith(fontSize: 15),
                  ),
                ],
              ),
              IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                onPressed: () => P4AudioService().playPhrase(active['audio'] as String),
              ),
            ],
          ),

          const Divider(height: 20),

          Expanded(
            child: Row(
              children: [
                // Left 3-Generation Tree Visualizer
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: LHColors.cream,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: LHColors.teal.withOpacity(0.3), width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Gen 1: Grandparents
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildTreeNode(
                              keyName: 'grand_pere',
                              title: 'Grand-père',
                              subtitle: 'Papi',
                              icon: Icons.elderly_rounded,
                            ),
                            const SizedBox(width: 24),
                            _buildTreeNode(
                              keyName: 'grand_mere',
                              title: 'Grand-mère',
                              subtitle: 'Mami',
                              icon: Icons.elderly_woman_rounded,
                            ),
                          ],
                        ),

                        const Icon(Icons.arrow_downward_rounded, color: LHColors.teal, size: 22),

                        // Gen 2: Uncles / Aunts
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildTreeNode(
                              keyName: 'oncle',
                              title: 'L\'oncle',
                              subtitle: 'Uncle',
                              icon: Icons.person_rounded,
                            ),
                            const SizedBox(width: 24),
                            _buildTreeNode(
                              keyName: 'tante',
                              title: 'La tante',
                              subtitle: 'Aunt',
                              icon: Icons.person_3_rounded,
                            ),
                          ],
                        ),

                        const Icon(Icons.arrow_downward_rounded, color: LHColors.teal, size: 22),

                        // Gen 3: Cousins & Me
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildTreeNode(
                              keyName: 'cousin',
                              title: 'Le cousin',
                              subtitle: 'Boy cousin',
                              icon: Icons.boy_rounded,
                            ),
                            const SizedBox(width: 24),
                            _buildTreeNode(
                              keyName: 'cousine',
                              title: 'La cousine',
                              subtitle: 'Girl cousin',
                              icon: Icons.girl_rounded,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 24),

                // Right Node Spotlight & Naming Lab
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: LHColors.gold.withOpacity(0.6), width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: LHColors.teal,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                active['level'] as String,
                                style: LHText.label(LHColors.white).copyWith(fontSize: 11),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              active['title'] as String,
                              style: LHText.heading(LHColors.teal).copyWith(fontSize: 22),
                            ),
                            Text(
                              active['relation'] as String,
                              style: LHText.body(LHColors.grey).copyWith(fontSize: 14),
                            ),
                          ],
                        ),

                        // Stating Name Box (Il s'appelle vs Elle s'appelle)
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: LHColors.cream,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: LHColors.turquoise.withOpacity(0.4)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Naming Statement (${active['pronoun']} s\'appelle):',
                                style: LHText.label(LHColors.teal).copyWith(fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${active['pronoun']} s\'appelle $_customName.',
                                style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 20),
                              ),
                              Text(
                                '${active['pronoun'] == 'Il' ? 'His' : 'Her'} name is $_customName.',
                                style: LHText.body(LHColors.grey).copyWith(fontSize: 13),
                              ),
                            ],
                          ),
                        ),

                        // Quick Name Chips
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sample Family Names:',
                              style: LHText.label(LHColors.charcoal).copyWith(fontSize: 12),
                            ),
                            const SizedBox(height: 6),
                            Wrap(
                              spacing: 6,
                              children: ['Babatunde', 'Zainab', 'Tunde', 'Funke', 'Emeka', 'Amina'].map((nm) {
                                final isSel = nm == _customName;
                                return ChoiceChip(
                                  label: Text(nm),
                                  selected: isSel,
                                  selectedColor: LHColors.gold,
                                  backgroundColor: LHColors.cream,
                                  onSelected: (_) => setState(() => _customName = nm),
                                );
                              }).toList(),
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

  Widget _buildTreeNode({
    required String keyName,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isSelected = keyName == _selectedNodeKey;

    return Material(
      color: isSelected ? LHColors.teal : LHColors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: isSelected ? 4 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _selectNode(keyName),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? LHColors.gold : LHColors.teal.withOpacity(0.3),
              width: 2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? LHColors.gold : LHColors.teal,
                size: 24,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: LHText.subheading(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: LHText.body(isSelected ? LHColors.white.withOpacity(0.85) : LHColors.grey).copyWith(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
