import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1PoliteRequestsStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1PoliteRequestsStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1PoliteRequestsStudioWidget> createState() => _JSS1PoliteRequestsStudioWidgetState();
}

class _JSS1PoliteRequestsStudioWidgetState extends State<JSS1PoliteRequestsStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedMode = 0; // 0: Borrowing items (Peer), 1: Reception / Meeting Someone (Formal)
  int _selectedBorrowItemIndex = 0;
  int _selectedOfficialIndex = 0;

  final List<Map<String, dynamic>> _borrowItems = [
    {
      'item': 'un stylo',
      'phrase': 'Peux-tu me prêter ton stylo, s\'il te plaît ?',
      'reply': 'Oui, voici pour toi !',
      'icon': Icons.edit_rounded,
      'audio': 'peux_tu_me_preter_ton_stylo',
    },
    {
      'item': 'une règle',
      'phrase': 'Prête-moi ta règle, s\'il te plaît !',
      'reply': 'Avec plaisir, tiens !',
      'icon': Icons.straighten_rounded,
      'audio': 'prete_moi_ta_regle',
    },
    {
      'item': 'une gomme',
      'phrase': 'Je voudrais emprunter ta gomme, s\'il te plaît.',
      'reply': 'Pas de problème, prends-la !',
      'icon': Icons.auto_fix_high_rounded,
      'audio': 'je_voudrais',
    },
    {
      'item': 'un cahier',
      'phrase': 'Peux-tu me montrer ton cahier de français ?',
      'reply': 'Oui bien sûr, regarde !',
      'icon': Icons.menu_book_rounded,
      'audio': 'sil_te_plait',
    },
  ];

  final List<Map<String, dynamic>> _officials = [
    {
      'title': 'Le Principal (Headmaster)',
      'inquiry': 'Bonjour Monsieur, puis-je voir le Principal, s\'il vous plaît ?',
      'response': 'Oui, asseyez-vous un instant dans la salle d\'attente.',
      'icon': Icons.badge_rounded,
      'audio': 'puis_je_voir_le_principal',
    },
    {
      'title': 'Madame Dupont (Professeure)',
      'inquiry': 'Excusez-moi Madame, est-ce que Madame Dupont est là ?',
      'response': 'Oui, elle est dans la salle des professeurs.',
      'icon': Icons.person_search_rounded,
      'audio': 'est_ce_que_madame_dupont_est_la',
    },
    {
      'title': 'L\'Infirmière Scolaire (School Nurse)',
      'inquiry': 'Bonjour, puis-je voir l\'infirmière ? Je ne me sens pas bien.',
      'response': 'Entrez tout de suite à l\'infirmerie.',
      'icon': Icons.local_hospital_rounded,
      'audio': 'sil_vous_plait',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Mode Selector Tab Bar
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: JSS1Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: JSS1Colors.lightGrey),
          ),
          child: Row(
            children: [
              Expanded(
                child: _buildModeTab(
                  index: 0,
                  title: 'Scénario 1 : Emprunter entre Camarades (Tutoiement)',
                  icon: Icons.school_rounded,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildModeTab(
                  index: 1,
                  title: 'Scénario 2 : À la Réception & Administration (Vouvoiement)',
                  icon: Icons.domain_rounded,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Main Interactive Stage
        Expanded(
          child: _selectedMode == 0 ? _buildBorrowingStage() : _buildReceptionStage(),
        ),
      ],
    );
  }

  Widget _buildModeTab({required int index, required String title, required IconData icon}) {
    final isSelected = _selectedMode == index;
    return InkWell(
      onTap: () {
        setState(() => _selectedMode = index);
        _audioService.playClick();
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: isSelected ? JSS1Colors.teal : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: isSelected ? JSS1Colors.gold : JSS1Colors.grey),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                  fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
                  fontSize: 13,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBorrowingStage() {
    final activeItem = _borrowItems[_selectedBorrowItemIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Item Selector
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Objets à Emprunter Poliment :', style: JSS1Text.subheading(JSS1Colors.teal)),
                Text('Sélectionnez un matériel pour lancer le dialogue élève-élève.', style: JSS1Text.caption(JSS1Colors.grey)),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: _borrowItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, idx) {
                      final item = _borrowItems[idx];
                      final isSelected = _selectedBorrowItemIndex == idx;
                      return InkWell(
                        onTap: () {
                          setState(() => _selectedBorrowItemIndex = idx);
                          _audioService.playPhrase(item['audio'] as String, term: 2);
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: isSelected ? JSS1Colors.teal.withValues(alpha: 0.1) : JSS1Colors.cream,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(item['icon'] as IconData, color: isSelected ? JSS1Colors.teal : JSS1Colors.charcoal),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Emprunter ${item['item']}',
                                  style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                              ),
                              Icon(Icons.volume_up_rounded, color: isSelected ? JSS1Colors.teal : JSS1Colors.grey, size: 18),
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

        const SizedBox(width: 16),

        // Right Column: Dialogue Bubble Simulation
        Expanded(
          flex: 7,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: JSS1Colors.teal.withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('DIALOGUE EN CLASSE (TUTOIEMENT)', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal, size: 24),
                      onPressed: () => _audioService.playPhrase(activeItem['audio'] as String, term: 2),
                    ),
                  ],
                ),

                // Student A Request Bubble
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: JSS1Colors.teal.withValues(alpha: 0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    border: Border.all(color: JSS1Colors.teal.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: JSS1Colors.teal,
                        child: Text('A', style: TextStyle(color: JSS1Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Élève A (Demande polie) :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(
                              activeItem['phrase'] as String,
                              style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Student B Reply Bubble
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: JSS1Colors.gold.withValues(alpha: 0.15),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    border: Border.all(color: JSS1Colors.gold.withValues(alpha: 0.5)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: JSS1Colors.gold,
                        child: Text('B', style: TextStyle(color: JSS1Colors.charcoal, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Élève B (Réponse bienveillante) :', style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(
                              activeItem['reply'] as String,
                              style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Gratitude Box
                InkWell(
                  onTap: () => _audioService.playPhrase('merci_beaucoup_de_rien', term: 2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: JSS1Colors.cream,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.thumb_up_alt_rounded, color: JSS1Colors.teal, size: 18),
                            const SizedBox(width: 8),
                            Text('Clôture : "Merci beaucoup ! — De rien !"', style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal, size: 16),
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

  Widget _buildReceptionStage() {
    final activeOfficial = _officials[_selectedOfficialIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Official Directory
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Personnes à Demander :', style: JSS1Text.subheading(JSS1Colors.teal)),
                Text('Sélectionnez un responsable pour simuler l\'échange au secrétariat.', style: JSS1Text.caption(JSS1Colors.grey)),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: _officials.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, idx) {
                      final off = _officials[idx];
                      final isSelected = _selectedOfficialIndex == idx;
                      return InkWell(
                        onTap: () {
                          setState(() => _selectedOfficialIndex = idx);
                          _audioService.playPhrase(off['audio'] as String, term: 2);
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: isSelected ? JSS1Colors.teal.withValues(alpha: 0.1) : JSS1Colors.cream,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(off['icon'] as IconData, color: isSelected ? JSS1Colors.teal : JSS1Colors.charcoal),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  off['title'] as String,
                                  style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                              ),
                              Icon(Icons.volume_up_rounded, color: isSelected ? JSS1Colors.teal : JSS1Colors.grey, size: 18),
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

        const SizedBox(width: 16),

        // Right Column: Formal Reception Dialogue
        Expanded(
          flex: 7,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: JSS1Colors.indigo.withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('ACCUEIL & RÉCEPTION (VOUVOIEMENT)', style: JSS1Text.caption(JSS1Colors.indigo).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.indigo, size: 24),
                      onPressed: () => _audioService.playPhrase(activeOfficial['audio'] as String, term: 2),
                    ),
                  ],
                ),

                // Visitor Request Bubble
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: JSS1Colors.indigo.withValues(alpha: 0.08),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    border: Border.all(color: JSS1Colors.indigo.withValues(alpha: 0.25)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: JSS1Colors.indigo,
                        child: Icon(Icons.person_rounded, color: JSS1Colors.white, size: 18),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Le Visiteur / L\'Élève (Formule formelle) :', style: JSS1Text.caption(JSS1Colors.indigo).copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(
                              activeOfficial['inquiry'] as String,
                              style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 15, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Receptionist Reply Bubble
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: JSS1Colors.cream,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    border: Border.all(color: JSS1Colors.lightGrey),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: JSS1Colors.charcoal,
                        child: Icon(Icons.support_agent_rounded, color: JSS1Colors.white, size: 18),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('La Secrétaire (Accueil poli) :', style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(
                              activeOfficial['response'] as String,
                              style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 15, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Key Rule Banner
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: JSS1Colors.indigo.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline_rounded, color: JSS1Colors.indigo, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Règle d\'or : On dit toujours "Bonjour Monsieur/Madame" avant d\'exprimer sa demande.',
                          style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontSize: 12, fontWeight: FontWeight.bold),
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
