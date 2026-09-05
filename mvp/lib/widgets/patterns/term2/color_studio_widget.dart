import 'package:flutter/material.dart';
import '../../../models/p4_lesson_model.dart';
import '../../../services/p4_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Term 2 Week 10 Pattern: Color Palette Studio (Les Couleurs) & Parent-Teacher Meeting Stage
class ColorStudioWidget extends StatefulWidget {
  final P4Lesson lesson;

  const ColorStudioWidget({super.key, required this.lesson});

  @override
  State<ColorStudioWidget> createState() => _ColorStudioWidgetState();
}

class _ColorStudioWidgetState extends State<ColorStudioWidget> {
  int _tabIndex = 0; // 0: Color Palette & Agreement, 1: Parent-Teacher Role-Play
  int _selectedColorIndex = 0;

  final List<Map<String, dynamic>> _colors = [
    {
      'frenchMasc': 'Rouge',
      'frenchFem': 'Rouge',
      'english': 'Red',
      'colorHex': const Color(0xFFD32F2F),
      'exampleMasc': 'Mon cahier est rouge.',
      'exampleFem': 'Ma trousse est rouge.',
      'audio': 'rouge',
    },
    {
      'frenchMasc': 'Bleu',
      'frenchFem': 'Bleue',
      'english': 'Blue',
      'colorHex': const Color(0xFF1976D2),
      'exampleMasc': 'Le stylo est bleu.',
      'exampleFem': 'La règle est bleue.',
      'audio': 'bleu',
    },
    {
      'frenchMasc': 'Jaune',
      'frenchFem': 'Jaune',
      'english': 'Yellow',
      'colorHex': const Color(0xFFFBC02D),
      'exampleMasc': 'Le crayon est jaune.',
      'exampleFem': 'La porte est jaune.',
      'audio': 'jaune',
    },
    {
      'frenchMasc': 'Vert',
      'frenchFem': 'Verte',
      'english': 'Green',
      'colorHex': const Color(0xFF388E3C),
      'exampleMasc': 'Le sac est vert.',
      'exampleFem': 'La table est verte.',
      'audio': 'vert',
    },
    {
      'frenchMasc': 'Noir',
      'frenchFem': 'Noire',
      'english': 'Black',
      'colorHex': const Color(0xFF212121),
      'exampleMasc': 'Le tableau est noir.',
      'exampleFem': 'La chaise est noire.',
      'audio': 'noir',
    },
    {
      'frenchMasc': 'Blanc',
      'frenchFem': 'Blanche',
      'english': 'White',
      'colorHex': const Color(0xFFEEEEEE),
      'textColor': LHColors.charcoal,
      'exampleMasc': 'Le papier est blanc.',
      'exampleFem': 'La craie est blanche.',
      'audio': 'blanc',
    },
  ];

  void _playAudio(String? key) {
    if (key != null) {
      P4AudioService().playPhrase(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Mode Switcher
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTab(
              title: '🎨 1. Colors & Agreement Studio (Les Couleurs)',
              isActive: _tabIndex == 0,
              onTap: () => setState(() => _tabIndex = 0),
            ),
            const SizedBox(width: 16),
            _buildTab(
              title: '🤝 2. Parent-Teacher Meeting Role-Play ("Enchanté")',
              isActive: _tabIndex == 1,
              onTap: () => setState(() => _tabIndex = 1),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Expanded(
          child: _tabIndex == 0 ? _buildColorsView() : _buildRolePlayView(),
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

  Widget _buildColorsView() {
    final active = _colors[_selectedColorIndex];

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3), width: 2),
      ),
      child: Row(
        children: [
          // Left 6 Color Swatches
          Expanded(
            flex: 5,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 1.2,
              ),
              itemCount: _colors.length,
              itemBuilder: (context, idx) {
                final c = _colors[idx];
                final isSelected = idx == _selectedColorIndex;

                return Material(
                  color: c['colorHex'] as Color,
                  borderRadius: BorderRadius.circular(16),
                  elevation: isSelected ? 6 : 2,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setState(() => _selectedColorIndex = idx);
                      P4AudioService().playSfx(P4SfxType.click);
                      _playAudio(c['audio'] as String?);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected ? LHColors.gold : Colors.white.withValues(alpha: 0.5),
                          width: isSelected ? 4 : 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          c['frenchMasc'] as String,
                          style: TextStyle(
                            color: c['textColor'] ?? Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            shadows: [
                              if (c['textColor'] == null)
                                const Shadow(color: Colors.black45, blurRadius: 4, offset: Offset(0, 1)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 24),

          // Right Color Agreement Showcase
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: LHColors.cream,
                borderRadius: BorderRadius.circular(20),
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
                        'Color Agreement Lab',
                        style: LHText.subheading(LHColors.teal).copyWith(fontSize: 20),
                      ),
                      IconButton.filled(
                        style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                        icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 22),
                        onPressed: () => _playAudio(active['audio'] as String?),
                      ),
                    ],
                  ),

                  // Masculine Example
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: LHColors.teal.withValues(alpha: 0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Masculine Form (${active['frenchMasc']}):', style: LHText.label(LHColors.grey).copyWith(fontSize: 11)),
                        const SizedBox(height: 2),
                        Text(
                          active['exampleMasc'] as String,
                          style: LHText.heading(LHColors.teal).copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                  ),

                  // Feminine Example (+e / irregular)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: LHColors.gold, width: 1.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Feminine Form (${active['frenchFem']}):', style: LHText.label(LHColors.grey).copyWith(fontSize: 11)),
                        const SizedBox(height: 2),
                        Text(
                          active['exampleFem'] as String,
                          style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: LHColors.teal.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Grammar Rule: Colors come AFTER nouns in French! (Le stylo bleu, La règle verte).',
                      style: LHText.body(LHColors.teal).copyWith(fontSize: 12, fontWeight: FontWeight.w600),
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

  Widget _buildRolePlayView() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Parent-Teacher Meeting Role-Play Stage',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Pupils introduce their parents to the teacher with poise and politeness',
                    style: LHText.body(LHColors.grey).copyWith(fontSize: 14),
                  ),
                ],
              ),
              IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                onPressed: () => P4AudioService().playPhrase('enchante'),
              ),
            ],
          ),

          const Divider(),

          // 3 Conversation Steps
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: LHColors.cream,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LHColors.teal, width: 2),
            ),
            child: Column(
              children: [
                _buildDialogueRow('1. Élève (Pupil):', '"Bonjour, Madame. Voici mon père."', LHColors.teal),
                const SizedBox(height: 8),
                _buildDialogueRow('2. Père (Father):', '"Bonjour Madame. Enchanté."', LHColors.charcoal),
                const SizedBox(height: 8),
                _buildDialogueRow('3. Professeur (Teacher):', '"Bonjour Monsieur. Enchantée !"', LHColors.gold),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: LHColors.teal.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.tips_and_updates_rounded, color: LHColors.gold, size: 24),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Courtesy Note: "Enchanté" means "Pleased to meet you". A man says "Enchanté", while a woman writes "Enchantée" (+e)!',
                    style: LHText.body(LHColors.teal).copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialogueRow(String speaker, String text, Color accent) {
    return Row(
      children: [
        SizedBox(
          width: 160,
          child: Text(
            speaker,
            style: LHText.subheading(accent).copyWith(fontSize: 14, fontWeight: FontWeight.w800),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
