import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1CommunicativeRoleplayStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1CommunicativeRoleplayStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1CommunicativeRoleplayStudioWidget> createState() => _JSS1CommunicativeRoleplayStudioWidgetState();
}

class _JSS1CommunicativeRoleplayStudioWidgetState extends State<JSS1CommunicativeRoleplayStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedScenarioIndex = 0;

  final List<Map<String, dynamic>> _scenarios = [
    {
      'title': '1. Au Marché (Achats & Prix)',
      'context': 'Négociation polie au marché scolaire à Lagos.',
      'speakerA': 'Le Client (Élève)',
      'lineA': 'Bonjour Madame, combien coûte ce beau cahier ?',
      'audioA': 'bonjour_combien_coute_ce_cahier',
      'speakerB': 'La Commerçante',
      'lineB': 'Bonjour ! Ça coûte cinq cents nairas.',
      'audioB': 'ca_coute_cinq_cents_nairas',
      'icon': Icons.shopping_basket_rounded,
      'color': JSS1Colors.teal,
    },
    {
      'title': '2. À l\'Infirmerie Scolaire (Santé)',
      'context': 'Consultation médicale rapide avec l\'infirmière.',
      'speakerA': 'L\'Infirmière',
      'lineA': 'Bonjour mon enfant, où avez-vous mal ?',
      'audioA': 'ou_avez_vous_mal_mal_au_ventre',
      'speakerB': 'L\'Élève Malade',
      'lineB': 'J\'ai mal au ventre depuis ce matin, Madame.',
      'audioB': 'ou_avez_vous_mal_mal_au_ventre',
      'icon': Icons.healing_rounded,
      'color': const Color(0xFFE53935),
    },
    {
      'title': '3. Accueil de l\'École (Visiteur)',
      'context': 'Un parent visiteur recherche le délégué de JSS1.',
      'speakerA': 'Le Visiteur',
      'lineA': 'Pardon Monsieur, puis-je parler au délégué de classe ?',
      'audioA': 'puis_je_parler_au_delegue',
      'speakerB': 'Le Surveillant',
      'lineB': 'Oui, il est dans la classe de JSS1 au premier étage.',
      'audioB': 'il_est_dans_la_classe_de_jss1',
      'icon': Icons.domain_rounded,
      'color': JSS1Colors.indigo,
    },
    {
      'title': '4. Invitation du Week-end (Loisirs)',
      'context': 'Deux amis planifient de regarder le match de football.',
      'speakerA': 'Ami A',
      'lineA': 'Tu veux venir regarder le grand match de football samedi ?',
      'audioA': 'tu_veux_venir_regarder_le_match',
      'speakerB': 'Ami B',
      'lineB': 'C\'est une excellente idée, j\'arrive chez toi à 15 heures !',
      'audioB': 'excellente_idee_j_arrive_a_15h',
      'icon': Icons.sports_soccer_rounded,
      'color': JSS1Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final active = _scenarios[_selectedScenarioIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: 4 Scenarios Selector
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
                Text('4 Scénarios de Jeux de Rôles', style: JSS1Text.subheading(JSS1Colors.teal)),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    itemCount: _scenarios.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, idx) {
                      final sc = _scenarios[idx];
                      final isSelected = _selectedScenarioIndex == idx;

                      return InkWell(
                        onTap: () {
                          setState(() => _selectedScenarioIndex = idx);
                          _audioService.playClick();
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
                              Icon(sc['icon'] as IconData, color: isSelected ? JSS1Colors.gold : JSS1Colors.teal, size: 24),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      sc['title'] as String,
                                      style: TextStyle(
                                        color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      sc['context'] as String,
                                      style: TextStyle(
                                        color: isSelected ? JSS1Colors.gold : JSS1Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded, color: isSelected ? JSS1Colors.white : JSS1Colors.grey, size: 14),
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

        // Right Column: Interactive Roleplay Stage & Dual Speech Bubbles
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
                      child: Text('THÉÂTRE DE COMMUNICATION', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1.2), overflow: TextOverflow.ellipsis),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: active['color'] as Color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        active['title'] as String,
                        style: const TextStyle(color: JSS1Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ),
                  ],
                ),

                // Speaker A Speech Bubble
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: JSS1Colors.teal,
                        child: const Icon(Icons.person_rounded, color: JSS1Colors.gold, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(active['speakerA'] as String, style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 2),
                            Text(
                              active['lineA'] as String,
                              style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal),
                        onPressed: () => _audioService.playPhrase(active['audioA'] as String, term: 3),
                      ),
                    ],
                  ),
                ),

                // Speaker B Speech Bubble
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: JSS1Colors.cream,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: JSS1Colors.gold, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: JSS1Colors.gold,
                        child: const Icon(Icons.person_2_rounded, color: JSS1Colors.charcoal, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(active['speakerB'] as String, style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 2),
                            Text(
                              active['lineB'] as String,
                              style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal),
                        onPressed: () => _audioService.playPhrase(active['audioB'] as String, term: 3),
                      ),
                    ],
                  ),
                ),

                // Play Full Scene Prompt
                InkWell(
                  onTap: () async {
                    await _audioService.playPhrase(active['audioA'] as String, term: 3);
                    await Future.delayed(const Duration(milliseconds: 2400));
                    await _audioService.playPhrase(active['audioB'] as String, term: 3);
                  },
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
                        Icon(Icons.play_circle_filled_rounded, color: JSS1Colors.charcoal, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Jouer le Dialogue Complet en Duo',
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
