import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1InvitationsStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1InvitationsStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1InvitationsStudioWidget> createState() => _JSS1InvitationsStudioWidgetState();
}

class _JSS1InvitationsStudioWidgetState extends State<JSS1InvitationsStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedCategory = 0; // 0: Inviter, 1: Accepter, 2: Refuser
  int _selectedItemIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {
      'title': '1. Inviter',
      'icon': Icons.mail_outline_rounded,
      'color': JSS1Colors.teal,
      'items': [
        {
          'phrase': 'Tu veux venir chez moi ce week-end ?',
          'meaning': 'Do you want to come to my house this weekend?',
          'formula': 'Tu veux + infinitif ?',
          'audio': 'tu_veux_venir_chez_moi',
        },
        {
          'phrase': 'Je t\'invite à mon anniversaire samedi.',
          'meaning': 'I invite you to my birthday party on Saturday.',
          'formula': 'Je t\'invite à + événement',
          'audio': 'je_t_invite_a_mon_anniversaire',
        },
        {
          'phrase': 'Ça te dit de jouer au basket après l\'école ?',
          'meaning': 'Do you feel like playing basketball after school?',
          'formula': 'Ça te dit de + infinitif ?',
          'audio': 'ca_te_dit_de_jouer_au_basket',
        },
      ],
    },
    {
      'title': '2. Accepter (Oui !)',
      'icon': Icons.thumb_up_rounded,
      'color': JSS1Colors.green,
      'items': [
        {
          'phrase': 'Oui, avec grand plaisir !',
          'meaning': 'Yes, with great pleasure!',
          'formula': 'Acceptation très enthousiaste',
          'audio': 'oui_avec_grand_plaisir',
        },
        {
          'phrase': 'Volontiers ! C\'est super sympa.',
          'meaning': 'Gladly! That is super nice.',
          'formula': 'Spontané et chaleureux',
          'audio': 'volontiers_d_accord',
        },
        {
          'phrase': 'D\'accord ! À quelle heure commence la fête ?',
          'meaning': 'Alright! What time does the party start?',
          'formula': 'Acceptation + demande de précision',
          'audio': 'a_quelle_heure_commence_la_fete',
        },
      ],
    },
    {
      'title': '3. Refuser Poliment',
      'icon': Icons.sentiment_dissatisfied_rounded,
      'color': const Color(0xFFE53935),
      'items': [
        {
          'phrase': 'Désolé, je ne peux pas, je dois étudier.',
          'meaning': 'Sorry, I cannot, I have to study.',
          'formula': 'Excuse + motif doux',
          'audio': 'desole_je_ne_peux_pas',
        },
        {
          'phrase': 'C\'est gentil, mais je suis déjà occupé(e).',
          'meaning': 'That is kind, but I am already busy.',
          'formula': 'Remercier + décliner avec courtoisie',
          'audio': 'c_est_gentil_mais_je_suis_occupe',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final activeCat = _categories[_selectedCategory];
    final items = activeCat['items'] as List<Map<String, dynamic>>;
    final safeIndex = _selectedItemIndex < items.length ? _selectedItemIndex : 0;
    final activeItem = items[safeIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Category Tabs & Dialogue Selection
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
                Text('Les 3 Temps de l\'Invitation', style: JSS1Text.subheading(JSS1Colors.teal)),
                const SizedBox(height: 12),

                // 3 Category Tabs
                Row(
                  children: List.generate(_categories.length, (idx) {
                    final cat = _categories[idx];
                    final isSelected = _selectedCategory == idx;

                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: idx < 2 ? 8 : 0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedCategory = idx;
                              _selectedItemIndex = 0;
                            });
                            _audioService.playClick();
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? cat['color'] as Color : JSS1Colors.cream,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              cat['title'] as String,
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

                // Phrases list in selected category
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
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: isSelected ? JSS1Colors.gold : JSS1Colors.teal.withValues(alpha: 0.15),
                                child: Text(
                                  '${idx + 1}',
                                  style: TextStyle(
                                    color: isSelected ? JSS1Colors.charcoal : JSS1Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
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

        // Right Column: Interactive Invitation Card & Dialogue Visualizer
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
                      child: Text('STUDIO D\'INVITATION SOCIALE', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1.2), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.white, size: 28),
                      onPressed: () => _audioService.playPhrase(activeItem['audio'] as String, term: 3),
                    ),
                  ],
                ),

                // Center Invitation Envelope Visual
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: JSS1Colors.gold, width: 2),
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
                              color: activeCat['color'] as Color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              activeCat['title'] as String,
                              style: const TextStyle(color: JSS1Colors.white, fontWeight: FontWeight.w900, fontSize: 12),
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

                // Politeness Rule Box
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.info_outline_rounded, color: JSS1Colors.gold, size: 20),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Règle de politesse : Pour refuser, commencez toujours par remercier ou vous excuser ("Désolé", "C\'est gentil mais...").',
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
