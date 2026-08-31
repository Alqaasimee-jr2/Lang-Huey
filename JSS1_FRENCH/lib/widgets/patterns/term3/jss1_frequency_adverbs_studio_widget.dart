import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1FrequencyAdverbsStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1FrequencyAdverbsStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1FrequencyAdverbsStudioWidget> createState() => _JSS1FrequencyAdverbsStudioWidgetState();
}

class _JSS1FrequencyAdverbsStudioWidgetState extends State<JSS1FrequencyAdverbsStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedAdverbIndex = 0;

  final List<Map<String, dynamic>> _adverbs = [
    {
      'adverb': 'Toujours',
      'percent': '100%',
      'level': 1.0,
      'meaning': 'Always (Habitude permanente)',
      'example': 'Je fais toujours mes devoirs avant de dormir.',
      'color': JSS1Colors.green,
      'icon': Icons.all_inclusive_rounded,
      'audio': 'je_fais_toujours_mes_devoirs',
    },
    {
      'adverb': 'Souvent',
      'percent': '75%',
      'level': 0.75,
      'meaning': 'Often (Régulièrement)',
      'example': 'Nous jouons souvent au football le mercredi.',
      'color': JSS1Colors.teal,
      'icon': Icons.repeat_rounded,
      'audio': 'nous_jouons_souvent_au_football',
    },
    {
      'adverb': 'Parfois / Quelquefois',
      'percent': '50%',
      'level': 0.50,
      'meaning': 'Sometimes (De temps en temps)',
      'example': 'Je regarde parfois la télévision après le dîner.',
      'color': JSS1Colors.gold,
      'icon': Icons.shuffle_rounded,
      'audio': 'parfois_quelquefois',
    },
    {
      'adverb': 'Rarement',
      'percent': '20%',
      'level': 0.20,
      'meaning': 'Rarely / Seldom (Très peu souvent)',
      'example': 'Cet élève sérieux arrive rarement en retard.',
      'color': const Color(0xFFFF9800),
      'icon': Icons.hourglass_bottom_rounded,
      'audio': 'rarement',
    },
    {
      'adverb': 'Ne ... jamais',
      'percent': '0%',
      'level': 0.0,
      'meaning': 'Never (Fréquence nulle / Négation)',
      'example': 'Je ne triche jamais pendant l\'examen.',
      'color': const Color(0xFFE53935),
      'icon': Icons.block_rounded,
      'audio': 'ne_jamais',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final active = _adverbs[_selectedAdverbIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: 5 Frequency Tiers Selector
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.charcoal.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('Échelle des 5 Adverbes de Fréquence', style: JSS1Text.subheading(JSS1Colors.teal), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal),
                      onPressed: () => _audioService.playPhrase('a_quelle_frequence_fais_tu_du_sport', term: 3),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    itemCount: _adverbs.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, idx) {
                      final adv = _adverbs[idx];
                      final isSelected = _selectedAdverbIndex == idx;

                      return InkWell(
                        onTap: () {
                          setState(() => _selectedAdverbIndex = idx);
                          _audioService.playPhrase(adv['audio'] as String, term: 3);
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 52,
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: adv['color'] as Color,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  adv['percent'] as String,
                                  style: const TextStyle(color: JSS1Colors.white, fontWeight: FontWeight.w900, fontSize: 12),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      adv['adverb'] as String,
                                      style: TextStyle(
                                        color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      adv['meaning'] as String,
                                      style: TextStyle(
                                        color: isSelected ? JSS1Colors.gold : JSS1Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.volume_up_rounded, color: isSelected ? JSS1Colors.white : JSS1Colors.grey, size: 18),
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

        const SizedBox(width: 20),

        // Right Column: Interactive Sentence Construction Stage
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: JSS1Colors.teal,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.teal.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('LABORATOIRE DE SYNTAXE', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1.2), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.white, size: 28),
                      onPressed: () => _audioService.playPhrase(active['audio'] as String, term: 3),
                    ),
                  ],
                ),

                // Visual Gauge Bar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Fréquence : ${active['adverb']}', style: const TextStyle(color: JSS1Colors.white, fontWeight: FontWeight.bold)),
                        Text(active['percent'] as String, style: const TextStyle(color: JSS1Colors.gold, fontWeight: FontWeight.w900, fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: (active['level'] as double),
                        minHeight: 12,
                        backgroundColor: JSS1Colors.white.withValues(alpha: 0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(active['color'] as Color),
                      ),
                    ),
                  ],
                ),

                // Spoken Sentence Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Exemple en Contexte :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(
                        active['example'] as String,
                        style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: JSS1Colors.cream,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Règle d\'or : L\'adverbe se place TOUJOURS après le verbe conjugué (ex. "Je fais toujours", "Nous jouons souvent").',
                          style: TextStyle(color: JSS1Colors.charcoal, fontSize: 11, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),

                // Action Prompt
                InkWell(
                  onTap: () => _audioService.playPhrase('a_quelle_frequence_fais_tu_du_sport', term: 3),
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: JSS1Colors.gold,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.help_outline_rounded, color: JSS1Colors.charcoal, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Question : "À quelle fréquence fais-tu du sport ?"',
                          style: TextStyle(color: JSS1Colors.charcoal, fontWeight: FontWeight.w900, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
