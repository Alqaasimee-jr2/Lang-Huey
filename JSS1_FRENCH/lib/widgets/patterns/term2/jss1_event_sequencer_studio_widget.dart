import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1EventSequencerStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1EventSequencerStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1EventSequencerStudioWidget> createState() => _JSS1EventSequencerStudioWidgetState();
}

class _JSS1EventSequencerStudioWidgetState extends State<JSS1EventSequencerStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedPrepositionIndex = 0; // 0: Avant, 1: Pendant, 2: Après
  int _selectedNarrativeStep = 0; // 0: D'abord, 1: Ensuite, 2: Enfin

  final List<Map<String, dynamic>> _prepositions = [
    {
      'word': 'Avant',
      'meaning': 'Before (Anteriority)',
      'example': 'Avant de manger, je me lave les mains.',
      'explanation': 'Indique une action préalable. Règle : "Avant de + verbe à l\'infinitif" ou "Avant + nom".',
      'icon': Icons.arrow_back_rounded,
      'audio': 'avant_de_manger_je_me_lave_les_mains',
    },
    {
      'word': 'Pendant',
      'meaning': 'During / While (Simultaneity)',
      'example': 'Pendant la classe, les élèves écoutent attentivement.',
      'explanation': 'Indique une durée simultanée avec un autre événement en cours.',
      'icon': Icons.sync_alt_rounded,
      'audio': 'pendant_la_classe_les_eleves_ecoutent',
    },
    {
      'word': 'Après',
      'meaning': 'After (Posteriority)',
      'example': 'Après l\'école, je rentre chez moi faire mes devoirs.',
      'explanation': 'Indique une action postérieure. Règle : suivi directement du nom de l\'événement.',
      'icon': Icons.arrow_forward_rounded,
      'audio': 'apres_l_ecole_je_rentre_chez_moi',
    },
  ];

  final List<Map<String, dynamic>> _narrativeSteps = [
    {
      'step': '1. D\'abord',
      'phrase': 'D\'abord, je me réveille et je fais mon lit.',
      'icon': Icons.looks_one_rounded,
      'audio': 'd_abord',
    },
    {
      'step': '2. Ensuite / Puis',
      'phrase': 'Ensuite, je prends mon bain et je mange le petit-déjeuner.',
      'icon': Icons.looks_two_rounded,
      'audio': 'ensuite_puis',
    },
    {
      'step': '3. Enfin',
      'phrase': 'Enfin, je prends mon sac et je pars à l\'école.',
      'icon': Icons.looks_3_rounded,
      'audio': 'enfin_finalement',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final activePrep = _prepositions[_selectedPrepositionIndex];
    final activeNarrative = _narrativeSteps[_selectedNarrativeStep];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Prepositions & Connectors Selector
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Les 3 Prépositions Temporelles Clés', style: JSS1Text.subheading(JSS1Colors.teal)),
                  const SizedBox(height: 12),
                  Row(
                    children: List.generate(_prepositions.length, (idx) {
                      final p = _prepositions[idx];
                      final isSelected = _selectedPrepositionIndex == idx;
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: idx < 2 ? 8 : 0),
                          child: InkWell(
                            onTap: () {
                              setState(() => _selectedPrepositionIndex = idx);
                              _audioService.playPhrase(p['audio'] as String, term: 2);
                            },
                            borderRadius: BorderRadius.circular(14),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey,
                                  width: isSelected ? 2 : 1,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(p['icon'] as IconData, color: isSelected ? JSS1Colors.gold : JSS1Colors.teal, size: 24),
                                  const SizedBox(height: 6),
                                  Text(
                                    p['word'] as String,
                                    style: TextStyle(
                                      color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    p['meaning'] as String,
                                    style: TextStyle(
                                      color: isSelected ? JSS1Colors.gold : JSS1Colors.grey,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 12),

                  // 2. Connecteurs de Séquence Narratifs
                  Text('2. Connecteurs de Séquence (Raconter une Histoire)', style: JSS1Text.subheading(JSS1Colors.teal).copyWith(fontSize: 15)),
                  const SizedBox(height: 10),
                  ...List.generate(_narrativeSteps.length, (idx) {
                    final step = _narrativeSteps[idx];
                    final isSelected = _selectedNarrativeStep == idx;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () {
                          setState(() => _selectedNarrativeStep = idx);
                          _audioService.playPhrase(step['audio'] as String, term: 2);
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? JSS1Colors.teal.withValues(alpha: 0.1) : JSS1Colors.cream,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey,
                              width: isSelected ? 1.5 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(step['icon'] as IconData, color: isSelected ? JSS1Colors.teal : JSS1Colors.charcoal, size: 20),
                              const SizedBox(width: 10),
                              Text(step['step'] as String, style: TextStyle(color: isSelected ? JSS1Colors.teal : JSS1Colors.charcoal, fontWeight: FontWeight.bold, fontSize: 13)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  step['phrase'] as String,
                                  style: JSS1Text.caption(JSS1Colors.grey).copyWith(fontSize: 11),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(Icons.volume_up_rounded, color: isSelected ? JSS1Colors.teal : JSS1Colors.grey, size: 16),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        // Right Column: Interactive Demonstration & Timeline Visual
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
                      child: Text('LABORATOIRE DE CHRONOLOGIE', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.white, size: 28),
                      onPressed: () => _audioService.playPhrase(activePrep['audio'] as String, term: 2),
                    ),
                  ],
                ),

                // Preposition Spotlight Box
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
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: JSS1Colors.teal,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              activePrep['word'] as String,
                              style: const TextStyle(color: JSS1Colors.gold, fontWeight: FontWeight.w900, fontSize: 16),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(activePrep['meaning'] as String, style: JSS1Text.caption(JSS1Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text('Exemple Pratique :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(
                        activePrep['example'] as String,
                        style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: JSS1Colors.cream,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          activePrep['explanation'] as String,
                          style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontSize: 11, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),

                // Narrative Sequence Step Spotlight
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: JSS1Colors.white.withValues(alpha: 0.2)),
                  ),
                  child: Row(
                    children: [
                      Icon(activeNarrative['icon'] as IconData, color: JSS1Colors.gold, size: 24),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(activeNarrative['step'] as String, style: const TextStyle(color: JSS1Colors.gold, fontWeight: FontWeight.bold, fontSize: 12)),
                            Text(activeNarrative['phrase'] as String, style: const TextStyle(color: JSS1Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
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
