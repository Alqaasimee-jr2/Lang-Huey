import 'package:flutter/material.dart';
import '../../../models/p4_lesson_model.dart';
import '../../../services/p4_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Term 2 Week 9 Pattern: Interactive Classroom Preposition Playground (Sur, Sous, Dans, Devant, Derrière)
class PrepositionPlaygroundWidget extends StatefulWidget {
  final P4Lesson lesson;

  const PrepositionPlaygroundWidget({super.key, required this.lesson});

  @override
  State<PrepositionPlaygroundWidget> createState() =>
      _PrepositionPlaygroundWidgetState();
}

class _PrepositionPlaygroundWidgetState
    extends State<PrepositionPlaygroundWidget> {
  int _selectedPrepositionIndex = 0;
  String _selectedObject = 'Le stylo';

  final List<Map<String, dynamic>> _prepositions = [
    {
      'french': 'Sur',
      'english': 'On / On top of',
      'sound': 'sur',
      'sentence': 'Le stylo est sur la table.',
      'alignment': Alignment.topCenter,
      'offset': const Offset(0, -60),
      'tip': 'Use "Sur" when an object rests on top of a surface.',
      'audio': 'sur',
    },
    {
      'french': 'Sous',
      'english': 'Under / Beneath',
      'sound': 'soo',
      'sentence': 'Le stylo est sous le bureau.',
      'alignment': Alignment.bottomCenter,
      'offset': const Offset(0, 60),
      'tip': 'Use "Sous" when an object is underneath a desk or chair.',
      'audio': 'sous',
    },
    {
      'french': 'Dans',
      'english': 'In / Inside',
      'sound': 'dahn',
      'sentence': 'Le stylo est dans la boîte.',
      'alignment': Alignment.center,
      'offset': Offset.zero,
      'tip': 'Use "Dans" when an object is inside a school bag or pencil case.',
      'audio': 'dans',
    },
    {
      'french': 'Devant',
      'english': 'In front of',
      'sound': 'duh-vahn',
      'sentence': 'Le professeur est devant la classe.',
      'alignment': Alignment.centerLeft,
      'offset': const Offset(-70, 0),
      'tip': 'Use "Devant" when someone or something is positioned in front.',
      'audio': 'devant_derriere',
    },
    {
      'french': 'Derrière',
      'english': 'Behind',
      'sound': 'dair-ee-air',
      'sentence': 'Le ballon est derrière la boîte.',
      'alignment': Alignment.centerRight,
      'offset': const Offset(70, 0),
      'tip': 'Use "Derrière" when an object is at the back or behind.',
      'audio': 'devant_derriere',
    },
  ];

  void _playAudio(String? key) {
    if (key != null) {
      P4AudioService().playPhrase(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    final active = _prepositions[_selectedPrepositionIndex];

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
                    'Les Prépositions de Lieu (Preposition Playground)',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tap a preposition to move the object on the smartboard and hear the spatial sentence',
                    style: LHText.body(LHColors.grey).copyWith(fontSize: 15),
                  ),
                ],
              ),
              IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                onPressed: () => _playAudio(active['audio'] as String?),
              ),
            ],
          ),

          const Divider(height: 20),

          // 5 Preposition Tabs
          Row(
            children: List.generate(_prepositions.length, (idx) {
              final prep = _prepositions[idx];
              final isSelected = idx == _selectedPrepositionIndex;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: idx < _prepositions.length - 1 ? 8 : 0),
                  child: Material(
                    color: isSelected ? LHColors.teal : LHColors.cream,
                    borderRadius: BorderRadius.circular(14),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        setState(() => _selectedPrepositionIndex = idx);
                        P4AudioService().playSfx(P4SfxType.click);
                        _playAudio(prep['audio'] as String?);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: Text(
                            '${prep['french']} (${prep['english'].toString().split(' / ').first})',
                            style: LHText.body(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
                              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Row(
              children: [
                // Left: Interactive Physics / Spatial Positioning Stage
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: LHColors.cream,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: LHColors.teal.withValues(alpha: 0.3), width: 2),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Central Reference Object (Desk / Table)
                        Container(
                          width: 140,
                          height: 100,
                          decoration: BoxDecoration(
                            color: LHColors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: LHColors.teal, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: LHColors.charcoal.withValues(alpha: 0.08),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.table_restaurant_rounded, size: 40, color: LHColors.teal),
                              Text(
                                'La table',
                                style: LHText.subheading(LHColors.teal).copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),

                        // Moving Dynamic Object
                        AnimatedAlign(
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeOutBack,
                          alignment: active['alignment'] as Alignment,
                          child: Transform.translate(
                            offset: active['offset'] as Offset,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: LHColors.gold,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: LHColors.charcoal.withValues(alpha: 0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.edit_rounded, size: 20, color: LHColors.charcoal),
                                  const SizedBox(width: 6),
                                  Text(
                                    _selectedObject,
                                    style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 24),

                // Right: Generated Spatial Question & Answer Card
                Expanded(
                  flex: 4,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location & Preposition',
                              style: LHText.subheading(LHColors.teal).copyWith(fontSize: 20),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Question: "Où est ${_selectedObject.toLowerCase()} ?"',
                              style: LHText.body(LHColors.grey).copyWith(fontSize: 14, fontStyle: FontStyle.italic),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 6,
                              children: ['Le stylo', 'Le ballon', 'Le livre', 'Le sac'].map((obj) {
                                final isSel = obj == _selectedObject;
                                return ChoiceChip(
                                  label: Text(obj),
                                  selected: isSel,
                                  selectedColor: LHColors.gold,
                                  backgroundColor: LHColors.cream,
                                  onSelected: (_) => setState(() => _selectedObject = obj),
                                );
                              }).toList(),
                            ),
                          ],
                        ),

                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: LHColors.cream,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: LHColors.teal, width: 2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Answer in French:', style: LHText.label(LHColors.grey).copyWith(fontSize: 11)),
                              const SizedBox(height: 4),
                              Text(
                                active['sentence'] as String,
                                style: LHText.heading(LHColors.teal).copyWith(fontSize: 20),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'The pen is ${active['english'].toString().toLowerCase().split(' / ').first} the table/desk.',
                                style: LHText.body(LHColors.charcoal).copyWith(fontSize: 13),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: LHColors.teal.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            active['tip'] as String,
                            style: LHText.body(LHColors.teal).copyWith(fontSize: 13, fontWeight: FontWeight.w600),
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
