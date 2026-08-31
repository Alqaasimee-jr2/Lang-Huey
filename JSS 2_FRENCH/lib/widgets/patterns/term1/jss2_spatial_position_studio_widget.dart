import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2SpatialPositionStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2SpatialPositionStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2SpatialPositionStudioWidget> createState() => _JSS2SpatialPositionStudioWidgetState();
}

class _JSS2SpatialPositionStudioWidgetState extends State<JSS2SpatialPositionStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();

  int _selectedPrepositionIndex = 0;
  int _selectedItemIndex = 0;

  final List<Map<String, dynamic>> _prepositions = [
    {'prep': 'sur', 'meaning': 'on / on top of', 'audio': 'sur_la_table', 'icon': Icons.arrow_upward_rounded},
    {'prep': 'sous', 'meaning': 'under / beneath', 'audio': 'sous_la_chaise', 'icon': Icons.arrow_downward_rounded},
    {'prep': 'devant', 'meaning': 'in front of', 'audio': 'devant_le_tableau', 'icon': Icons.arrow_forward_rounded},
    {'prep': 'derrière', 'meaning': 'behind', 'audio': 'derriere_la_porte', 'icon': Icons.arrow_back_rounded},
    {'prep': 'dans', 'meaning': 'in / inside', 'audio': 'dans_le_sac', 'icon': Icons.input_rounded},
    {'prep': 'entre', 'meaning': 'between', 'audio': 'entre_les_deux_livres', 'icon': Icons.view_column_rounded},
    {'prep': 'à côté de', 'meaning': 'next to / beside', 'audio': 'a_cote_de_la_fenetre', 'icon': Icons.compare_arrows_rounded},
    {'prep': 'au milieu de', 'meaning': 'in the middle of', 'audio': 'au_milieu_de_la_classe', 'icon': Icons.center_focus_strong_rounded},
  ];

  final List<Map<String, dynamic>> _classroomItems = [
    {'name': 'le livre', 'gender': 'm', 'icon': Icons.menu_book_rounded},
    {'name': 'le sac', 'gender': 'm', 'icon': Icons.backpack_rounded},
    {'name': 'la règle', 'gender': 'f', 'icon': Icons.straighten_rounded},
    {'name': 'la trousse', 'gender': 'f', 'icon': Icons.edit_rounded},
    {'name': 'le ballon', 'gender': 'm', 'icon': Icons.sports_soccer_rounded},
  ];

  String _buildSentence() {
    final item = _classroomItems[_selectedItemIndex];
    final prep = _prepositions[_selectedPrepositionIndex];
    final prepName = prep['prep'] as String;

    String reference = 'la table';
    if (prepName == 'devant') {
      reference = 'le tableau';
    } else if (prepName == 'sous') {
      reference = 'la chaise';
    } else if (prepName == 'derrière') {
      reference = 'la porte';
    } else if (prepName == 'dans') {
      reference = 'le cartable';
    } else if (prepName == 'entre') {
      reference = 'les deux cahiers';
    } else if (prepName == 'à côté de') {
      reference = 'du tableau';
    } else if (prepName == 'au milieu de') {
      reference = 'de la classe';
    }

    if (prepName == 'à côté de' || prepName == 'au milieu de') {
      return '${item['name'].toString().capitalize()} est $prepName $reference.';
    }
    return '${item['name'].toString().capitalize()} est $prepName $reference.';
  }

  @override
  Widget build(BuildContext context) {
    final currentPrep = _prepositions[_selectedPrepositionIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F766E), Color(0xFF0D7377)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.spatial_audio_off_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Studio Spatial 3D : Positions Relatives',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Manipulez les objets de la classe et positionnez-les à l\'aide des prépositions de lieu.',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Preposition Selector Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_prepositions.length, (index) {
                final p = _prepositions[index];
                final isSelected = _selectedPrepositionIndex == index;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    avatar: Icon(
                      p['icon'] as IconData,
                      size: 16,
                      color: isSelected ? Colors.white : LangHueyColors.deepTeal,
                    ),
                    label: Text(p['prep'] as String),
                    selected: isSelected,
                    selectedColor: LangHueyColors.deepTeal,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : LangHueyColors.charcoal,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    onSelected: (val) {
                      setState(() => _selectedPrepositionIndex = index);
                      _audioService.playPhrase(p['audio'] as String, term: 1);
                    },
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 18),

          // Main Interactive Positioning Stage
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Panel: Objects
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1. Objet à déplacer :', style: LangHueyTextStyles.bodySmall),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(_classroomItems.length, (index) {
                          final item = _classroomItems[index];
                          final isSelected = _selectedItemIndex == index;

                          return InkWell(
                            onTap: () {
                              setState(() => _selectedItemIndex = index);
                              _audioService.playClick();
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected ? LangHueyColors.softTeal : Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected ? LangHueyColors.deepTeal : Colors.black12,
                                  width: isSelected ? 2 : 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(item['icon'] as IconData, size: 20, color: LangHueyColors.deepTeal),
                                  const SizedBox(width: 8),
                                  Text(item['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 18),
                      // Visual placement box
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: LangHueyColors.warmCream,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: LangHueyColors.amberGold.withOpacity(0.4)),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Icon(
                                currentPrep['icon'] as IconData,
                                size: 40,
                                color: LangHueyColors.deepTeal,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Préposition active : ${currentPrep['prep']} (${currentPrep['meaning']})',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: LangHueyColors.deepTeal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Right Panel: Live Sentence & Audio
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Phrase Générée en Direct', style: LangHueyTextStyles.h3.copyWith(fontSize: 16)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: LangHueyColors.softTeal,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.3)),
                        ),
                        child: Text(
                          _buildSentence(),
                          style: LangHueyTextStyles.frenchHighlight.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 14),
                      ElevatedButton.icon(
                        onPressed: () {
                          _audioService.playPhrase(currentPrep['audio'] as String, term: 1);
                        },
                        icon: const Icon(Icons.volume_up_rounded, size: 20),
                        label: const Text('Écouter la Prononciation'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LangHueyColors.deepTeal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: LangHueyColors.warmCream,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Règle : "à côté de" + "le" devient "DU" (ex: à côté du tableau).',
                          style: LangHueyTextStyles.bodySmall.copyWith(color: LangHueyColors.charcoal),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
