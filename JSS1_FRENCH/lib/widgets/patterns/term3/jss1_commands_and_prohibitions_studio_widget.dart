import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1CommandsAndProhibitionsStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1CommandsAndProhibitionsStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1CommandsAndProhibitionsStudioWidget> createState() => _JSS1CommandsAndProhibitionsStudioWidgetState();
}

class _JSS1CommandsAndProhibitionsStudioWidgetState extends State<JSS1CommandsAndProhibitionsStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedMode = 0; // 0: Ordre, 1: Interdiction, 2: Autorisation
  int _selectedRuleIndex = 0;

  final List<Map<String, dynamic>> _modes = [
    {
      'title': '1. Donner un Ordre',
      'icon': Icons.campaign_rounded,
      'color': JSS1Colors.teal,
      'rules': [
        {
          'phrase': 'Faites attention et écoutez attentivement !',
          'meaning': 'Pay attention and listen carefully!',
          'formula': 'Impératif présent (Vous)',
          'icon': Icons.warning_amber_rounded,
          'audio': 'faites_attention_ordre',
        },
        {
          'phrase': 'Taisez-vous et rangez vos cahiers !',
          'meaning': 'Be quiet and put away your notebooks!',
          'formula': 'Impératif de discipline',
          'icon': Icons.volume_off_rounded,
          'audio': 'taisez_vous_silence',
        },
        {
          'phrase': 'Rangez vos affaires et asseyez-vous.',
          'meaning': 'Pack your things and sit down.',
          'formula': 'Double consigne scolaire',
          'icon': Icons.chair_rounded,
          'audio': 'rangez_vos_affaires_asseyez_vous',
        },
      ],
    },
    {
      'title': '2. Interdire',
      'icon': Icons.block_rounded,
      'color': const Color(0xFFE53935),
      'rules': [
        {
          'phrase': 'Ne bavardez pas pendant le cours !',
          'meaning': 'Do not chat during the class!',
          'formula': 'Ne + verbe + pas',
          'icon': Icons.speaker_notes_off_rounded,
          'audio': 'ne_bavardez_pas_en_classe',
        },
        {
          'phrase': 'Il est strictement interdit de tricher.',
          'meaning': 'It is strictly forbidden to cheat.',
          'formula': 'Il est interdit de + infinitif',
          'icon': Icons.cancel_rounded,
          'audio': 'il_est_interdit_de_tricher',
        },
        {
          'phrase': 'Défense de fumer et de faire du bruit.',
          'meaning': 'No smoking and no making noise.',
          'formula': 'Défense de + infinitif',
          'icon': Icons.do_not_disturb_on_rounded,
          'audio': 'defense_de_fumer_ne_pas_entrer',
        },
      ],
    },
    {
      'title': '3. Autoriser',
      'icon': Icons.check_circle_rounded,
      'color': JSS1Colors.green,
      'rules': [
        {
          'phrase': 'Vous pouvez entrer dans la salle.',
          'meaning': 'You may enter the hall / classroom.',
          'formula': 'Vous pouvez + infinitif',
          'icon': Icons.meeting_room_rounded,
          'audio': 'vous_pouvez_entrer_tu_peux_sortir',
        },
        {
          'phrase': 'C\'est permis, vous avez l\'autorisation.',
          'meaning': 'It is allowed, you have authorization.',
          'formula': 'C\'est permis / accord officiel',
          'icon': Icons.verified_rounded,
          'audio': 'c_est_permis_vous_avez_l_autorisation',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final activeMode = _modes[_selectedMode];
    final rules = activeMode['rules'] as List<Map<String, dynamic>>;
    final safeIndex = _selectedRuleIndex < rules.length ? _selectedRuleIndex : 0;
    final activeRule = rules[safeIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Mode Selector Tabs & Rule Cards
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
                Text('Règlement & Autorisations Scolaires', style: JSS1Text.subheading(JSS1Colors.teal)),
                const SizedBox(height: 12),

                // 3 Mode Tabs
                Row(
                  children: List.generate(_modes.length, (idx) {
                    final m = _modes[idx];
                    final isSelected = _selectedMode == idx;

                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: idx < 2 ? 8 : 0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMode = idx;
                              _selectedRuleIndex = 0;
                            });
                            _audioService.playClick();
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? m['color'] as Color : JSS1Colors.cream,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              m['title'] as String,
                              style: TextStyle(
                                color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                fontWeight: FontWeight.w900,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 10),

                // Rules List in Active Mode
                Expanded(
                  child: ListView.separated(
                    itemCount: rules.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, idx) {
                      final r = rules[idx];
                      final isSelected = safeIndex == idx;

                      return InkWell(
                        onTap: () {
                          setState(() => _selectedRuleIndex = idx);
                          _audioService.playPhrase(r['audio'] as String, term: 3);
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.all(12),
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
                              Icon(r['icon'] as IconData, color: isSelected ? JSS1Colors.gold : JSS1Colors.teal, size: 24),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      r['phrase'] as String,
                                      style: TextStyle(
                                        color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      r['meaning'] as String,
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

        // Right Column: Official School Regulations & Signage Board
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
                      child: Text('PANNEAU DE SIGNALISATION', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1.2), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.white, size: 28),
                      onPressed: () => _audioService.playPhrase(activeRule['audio'] as String, term: 3),
                    ),
                  ],
                ),

                // Center Signboard
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: activeMode['color'] as Color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              activeMode['title'] as String,
                              style: const TextStyle(color: JSS1Colors.white, fontWeight: FontWeight.w900, fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              activeRule['formula'] as String,
                              style: JSS1Text.caption(JSS1Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        activeRule['phrase'] as String,
                        style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        activeRule['meaning'] as String,
                        style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                // Grammar Insight Box
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.rule_rounded, color: JSS1Colors.gold, size: 20),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Grammaire : À l\'impératif, on supprime le pronom sujet ("Faites attention !" et non "Vous faites attention !").',
                          style: TextStyle(color: JSS1Colors.white, fontSize: 11, fontStyle: FontStyle.italic),
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
