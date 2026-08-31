import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1PermissionAndAdviceStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1PermissionAndAdviceStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1PermissionAndAdviceStudioWidget> createState() => _JSS1PermissionAndAdviceStudioWidgetState();
}

class _JSS1PermissionAndAdviceStudioWidgetState extends State<JSS1PermissionAndAdviceStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedMode = 0; // 0: Permission, 1: Conseil
  int _selectedItemIndex = 0;

  final List<Map<String, dynamic>> _modes = [
    {
      'title': '1. Demander la Permission',
      'icon': Icons.help_outline_rounded,
      'color': JSS1Colors.teal,
      'items': [
        {
          'phrase': 'Puis-je emprunter votre dictionnaire ?',
          'meaning': 'May I borrow your dictionary, Sir/Madam?',
          'formula': 'Puis-je + infinitif (Inversion très polie)',
          'icon': Icons.menu_book_rounded,
          'audio': 'puis_je_emprunter_votre_dictionnaire',
        },
        {
          'phrase': 'Est-ce que je peux poser une question ?',
          'meaning': 'Can I ask a question?',
          'formula': 'Est-ce que je peux + infinitif',
          'icon': Icons.contact_support_rounded,
          'audio': 'est_ce_que_je_peux_poser_une_question',
        },
        {
          'phrase': 'Permettez-moi de sortir, s\'il vous plaît.',
          'meaning': 'Allow me to step out, please.',
          'formula': 'Permettez-moi de + infinitif',
          'icon': Icons.door_front_door_rounded,
          'audio': 'permettez_moi_de_sortir_sil_vous_plait',
        },
        {
          'phrase': 'Oui, bien sûr, vas-y !',
          'meaning': 'Yes, of course, go ahead!',
          'formula': 'Accord bienveillant',
          'icon': Icons.thumb_up_alt_rounded,
          'audio': 'oui_bien_sur_vas_y',
        },
      ],
    },
    {
      'title': '2. Donner un Bon Conseil',
      'icon': Icons.lightbulb_rounded,
      'color': JSS1Colors.gold,
      'items': [
        {
          'phrase': 'Tu devrais réviser tes leçons chaque soir.',
          'meaning': 'You should review your lessons every evening.',
          'formula': 'Tu devrais + infinitif (Conditionnel doux)',
          'icon': Icons.edit_calendar_rounded,
          'audio': 'tu_devrais_reviser_tes_lecons',
        },
        {
          'phrase': 'Il faut bien écouter le professeur en classe.',
          'meaning': 'One must listen well to the teacher in class.',
          'formula': 'Il faut + infinitif (Nécessité générale)',
          'icon': Icons.hearing_rounded,
          'audio': 'il_faut_bien_ecouter_le_professeur',
        },
        {
          'phrase': 'Tu ferais bien de te reposer un peu.',
          'meaning': 'You would do well to rest a little.',
          'formula': 'Tu ferais bien de + infinitif',
          'icon': Icons.bed_rounded,
          'audio': 'tu_ferais_bien_de_te_reposer',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final activeMode = _modes[_selectedMode];
    final items = activeMode['items'] as List<Map<String, dynamic>>;
    final safeIndex = _selectedItemIndex < items.length ? _selectedItemIndex : 0;
    final activeItem = items[safeIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Mode Selector & Items List
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
                Text('Permission & Conseils d\'Étude', style: JSS1Text.subheading(JSS1Colors.teal)),
                const SizedBox(height: 12),

                // 2 Mode Tabs
                Row(
                  children: List.generate(_modes.length, (idx) {
                    final m = _modes[idx];
                    final isSelected = _selectedMode == idx;

                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: idx == 0 ? 8 : 0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMode = idx;
                              _selectedItemIndex = 0;
                            });
                            _audioService.playClick();
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(m['icon'] as IconData, size: 18, color: isSelected ? JSS1Colors.gold : JSS1Colors.charcoal),
                                const SizedBox(width: 6),
                                Text(
                                  m['title'] as String,
                                  style: TextStyle(
                                    color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
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

                // Items list
                Expanded(
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, idx) {
                      final it = items[idx];
                      final isSelected = safeIndex == idx;

                      return InkWell(
                        onTap: () {
                          setState(() => _selectedItemIndex = idx);
                          _audioService.playPhrase(it['audio'] as String, term: 3);
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
                              Icon(it['icon'] as IconData, color: isSelected ? JSS1Colors.gold : JSS1Colors.teal, size: 22),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      it['phrase'] as String,
                                      style: TextStyle(
                                        color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      it['meaning'] as String,
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

        // Right Column: Dialogue Box & Grammar Insight
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
                      child: Text('STUDIO CONSEIL & COURTOISIE', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1.2), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.white, size: 28),
                      onPressed: () => _audioService.playPhrase(activeItem['audio'] as String, term: 3),
                    ),
                  ],
                ),

                // Spoken Speech Card
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
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: JSS1Colors.teal,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              activeMode['title'] as String,
                              style: const TextStyle(color: JSS1Colors.gold, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              activeItem['formula'] as String,
                              style: JSS1Text.caption(JSS1Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        activeItem['phrase'] as String,
                        style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        activeItem['meaning'] as String,
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
                      Icon(Icons.lightbulb_rounded, color: JSS1Colors.gold, size: 20),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Règle d\'or : On dit toujours "Puis-je ?" et jamais "Peux-je ?". Pour conseiller, le conditionnel "Tu devrais" est la formule la plus polie.',
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
