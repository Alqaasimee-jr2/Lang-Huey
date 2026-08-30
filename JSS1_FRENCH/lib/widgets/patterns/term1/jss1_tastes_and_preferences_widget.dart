import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1TastesAndPreferencesWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1TastesAndPreferencesWidget({super.key, required this.lesson});

  @override
  State<JSS1TastesAndPreferencesWidget> createState() => _JSS1TastesAndPreferencesWidgetState();
}

class _JSS1TastesAndPreferencesWidgetState extends State<JSS1TastesAndPreferencesWidget> {
  final JSS1AudioService _audio = JSS1AudioService();
  int _scaleLevel = 2; // 0: Je déteste, 1: Je n'aime pas, 2: J'aime, 3: J'adore, 4: Je préfère
  String _selectedTopic = 'le français';

  final List<Map<String, dynamic>> _scaleItems = [
    {
      'verb': 'Je déteste...',
      'level': 'Haine / Rejet Total',
      'icon': Icons.sentiment_very_dissatisfied_rounded,
      'color': JSS1Colors.red,
      'audio': 'je_deteste',
    },
    {
      'verb': 'Je n\'aime pas...',
      'level': 'Négation Simple',
      'icon': Icons.thumb_down_rounded,
      'color': JSS1Colors.orange,
      'audio': 'je_naime_pas',
    },
    {
      'verb': 'J\'aime...',
      'level': 'Appréciation Positive',
      'icon': Icons.thumb_up_rounded,
      'color': JSS1Colors.teal,
      'audio': 'jaime_beaucoup',
    },
    {
      'verb': 'J\'adore !',
      'level': 'Passion / Grand Amour',
      'icon': Icons.favorite_rounded,
      'color': Color(0xFFE91E63),
      'audio': 'jadore',
    },
    {
      'verb': 'Je préfère... à...',
      'level': 'Comparaison Directe',
      'icon': Icons.compare_arrows_rounded,
      'color': JSS1Colors.indigo,
      'audio': 'je_prefere',
    },
  ];

  final List<String> _topics = [
    'le français',
    'le football',
    'la musique',
    'les mathématiques',
    'le riz jollof',
    'le chocolat',
    'le bruit en classe',
  ];

  @override
  Widget build(BuildContext context) {
    final curScale = _scaleItems[_scaleLevel];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: JSS1Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: JSS1Colors.charcoal.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Bar
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: JSS1Colors.teal.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.favorite_rounded, color: JSS1Colors.teal, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jauge des Goûts & Préférences', style: JSS1Text.heading(JSS1Colors.teal)),
                    Text(
                      'Découvrez l\'échelle des préférences (J\'adore ➔ J\'aime ➔ Je préfère ➔ Je n\'aime pas ➔ Je déteste).',
                      style: JSS1Text.caption(JSS1Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Main 2 Columns
          Expanded(
            child: Row(
              children: [
                // Left Column: Interactive Preference Scale Buttons
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: JSS1Colors.cream,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: JSS1Colors.lightGrey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1. Choisissez le Degré d\'Appréciation', style: JSS1Text.subheading(JSS1Colors.charcoal)),
                        const SizedBox(height: 12),
                        Expanded(
                          child: ListView.separated(
                            itemCount: _scaleItems.length,
                            separatorBuilder: (c, i) => const SizedBox(height: 8),
                            itemBuilder: (context, idx) {
                              final item = _scaleItems[idx];
                              final isSel = _scaleLevel == idx;
                              final c = item['color'] as Color;

                              return InkWell(
                                onTap: () {
                                  setState(() => _scaleLevel = idx);
                                  _audio.playPhrase(item['audio'] as String, term: 1);
                                },
                                borderRadius: BorderRadius.circular(14),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: isSel ? c : JSS1Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: isSel ? c : JSS1Colors.lightGrey),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(item['icon'] as IconData, color: isSel ? JSS1Colors.white : c, size: 22),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item['verb'] as String,
                                              style: JSS1Text.body(isSel ? JSS1Colors.white : JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900),
                                            ),
                                            Text(
                                              item['level'] as String,
                                              style: JSS1Text.caption(isSel ? JSS1Colors.cream : JSS1Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(Icons.volume_up_rounded, color: isSel ? JSS1Colors.white : JSS1Colors.teal, size: 18),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 24),

                // Right Column: Topic Selector & Phrase Synthesis
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [curScale['color'] as Color, (curScale['color'] as Color).withValues(alpha: 0.8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2. Sélectionnez le Sujet :',
                          style: JSS1Text.subheading(JSS1Colors.white).copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: _topics.map((top) {
                            final isSel = _selectedTopic == top;
                            return ChoiceChip(
                              label: Text(top),
                              selected: isSel,
                              selectedColor: JSS1Colors.gold,
                              backgroundColor: JSS1Colors.white.withValues(alpha: 0.2),
                              labelStyle: TextStyle(
                                color: isSel ? JSS1Colors.charcoal : JSS1Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                              onSelected: (sel) {
                                if (sel) {
                                  setState(() => _selectedTopic = top);
                                  _audio.playClick();
                                }
                              },
                            );
                          }).toList(),
                        ),

                        const Divider(color: Colors.white24, height: 28),

                        Text('Phrase Synthétisée en Français :', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: JSS1Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            _scaleLevel == 4
                                ? '« Je préfère $_selectedTopic aux mathématiques parce que c\'est super ! »'
                                : '« ${_scaleItems[_scaleLevel]['verb'].toString().replaceAll('...', '')} $_selectedTopic ! »',
                            style: JSS1Text.heading(JSS1Colors.charcoal).copyWith(fontSize: 18),
                          ),
                        ),

                        const Spacer(),

                        Center(
                          child: ElevatedButton.icon(
                            onPressed: () => _audio.playPhrase(curScale['audio'] as String, term: 1),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: JSS1Colors.gold,
                              foregroundColor: JSS1Colors.charcoal,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            ),
                            icon: const Icon(Icons.volume_up_rounded),
                            label: Text('Écouter l\'Expression', style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800)),
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
