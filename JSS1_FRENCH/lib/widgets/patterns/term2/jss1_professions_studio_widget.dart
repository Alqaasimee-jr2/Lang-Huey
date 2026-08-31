import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1ProfessionsStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1ProfessionsStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1ProfessionsStudioWidget> createState() => _JSS1ProfessionsStudioWidgetState();
}

class _JSS1ProfessionsStudioWidgetState extends State<JSS1ProfessionsStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedCareerIndex = 0;
  bool _isFeminine = false;

  final List<Map<String, dynamic>> _careers = [
    {
      'mascTitle': 'Le médecin',
      'femTitle': 'La femme médecin',
      'workplace': 'À l\'hôpital ou à la clinique',
      'duty': 'Il/Elle soigne les personnes malades et prescrit des médicaments.',
      'frenchDuty': 'Il soigne les malades à l\'hôpital.',
      'icon': Icons.medical_services_rounded,
      'audio': 'le_medecin',
      'dutyAudio': 'il_soigne_les_malades',
    },
    {
      'mascTitle': 'L\'enseignant',
      'femTitle': 'L\'enseignante',
      'workplace': 'À l\'école ou au collège',
      'duty': 'Il/Elle enseigne aux élèves et explique les leçons.',
      'frenchDuty': 'Elle enseigne aux élèves avec passion.',
      'icon': Icons.school_rounded,
      'audio': 'l_enseignant_l_enseignante',
      'dutyAudio': 'elle_enseigne_aux_eleves',
    },
    {
      'mascTitle': 'L\'ingénieur',
      'femTitle': 'L\'ingénieure',
      'workplace': 'Sur les chantiers et dans les bureaux d\'études',
      'duty': 'Il/Elle conçoit et construit des ponts, des routes et des bâtiments.',
      'frenchDuty': 'Il construit des ponts et des infrastructures modernes.',
      'icon': Icons.engineering_rounded,
      'audio': 'l_ingenieur_l_ingenieure',
      'dutyAudio': 'l_ingenieur_l_ingenieure',
    },
    {
      'mascTitle': 'L\'avocat',
      'femTitle': 'L\'avocate',
      'workplace': 'Au tribunal et dans son cabinet juridique',
      'duty': 'Il/Elle défend la loi, la justice et ses clients devant le juge.',
      'frenchDuty': 'Elle défend la justice au tribunal.',
      'icon': Icons.gavel_rounded,
      'audio': 'l_avocat_l_avocate',
      'dutyAudio': 'l_avocat_l_avocate',
    },
    {
      'mascTitle': 'L\'infirmier',
      'femTitle': 'L\'infirmière',
      'workplace': 'À l\'hôpital et à l\'infirmerie scolaire',
      'duty': 'Il/Elle prend soin des patients et assiste le médecin.',
      'frenchDuty': 'Il prend la température et aide les blessés.',
      'icon': Icons.healing_rounded,
      'audio': 'l_infirmier_l_infirmiere',
      'dutyAudio': 'l_infirmier_l_infirmiere',
    },
    {
      'mascTitle': 'Le commerçant',
      'femTitle': 'La commerçante',
      'workplace': 'Au marché ou dans son magasin',
      'duty': 'Il/Elle vend des vivres, des vêtements et des marchandises.',
      'frenchDuty': 'Elle vend des produits frais et des tissus.',
      'icon': Icons.storefront_rounded,
      'audio': 'le_commercant_la_commercante',
      'dutyAudio': 'le_commercant_la_commercante',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final active = _careers[_selectedCareerIndex];
    final title = _isFeminine ? active['femTitle'] as String : active['mascTitle'] as String;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Career Directory & Gender Toggle
        Expanded(
          flex: 5,
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
                      child: Text('Galerie des Métiers', style: JSS1Text.subheading(JSS1Colors.teal), overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(width: 8),
                    // Gender Toggle Switch
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: JSS1Colors.cream,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          _buildGenderChip('Masc (Il)', !_isFeminine, () {
                            setState(() => _isFeminine = false);
                            _audioService.playClick();
                          }),
                          const SizedBox(width: 4),
                          _buildGenderChip('Fém (Elle)', _isFeminine, () {
                            setState(() => _isFeminine = true);
                            _audioService.playClick();
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                Expanded(
                  child: GridView.builder(
                    itemCount: _careers.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, idx) {
                      final c = _careers[idx];
                      final isSelected = _selectedCareerIndex == idx;
                      final cardTitle = _isFeminine ? c['femTitle'] as String : c['mascTitle'] as String;

                      return InkWell(
                        onTap: () {
                          setState(() => _selectedCareerIndex = idx);
                          _audioService.playPhrase(c['audio'] as String, term: 2);
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                c['icon'] as IconData,
                                color: isSelected ? JSS1Colors.gold : JSS1Colors.teal,
                                size: 24,
                              ),
                              Text(
                                cardTitle,
                                style: TextStyle(
                                  color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
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

        // Right Column: Active Career Spotlight & Duty Details
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
                // Top Header with Speaker
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: JSS1Colors.white.withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(active['icon'] as IconData, color: JSS1Colors.gold, size: 28),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: JSS1Text.heroHeading(JSS1Colors.white).copyWith(fontSize: 22),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  _isFeminine ? 'Profession au féminin' : 'Profession au masculin',
                                  style: JSS1Text.caption(JSS1Colors.gold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.white, size: 28),
                      onPressed: () => _audioService.playPhrase(active['audio'] as String, term: 2),
                    ),
                  ],
                ),

                // Duty & Workplace Box
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Workplace
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on_rounded, color: JSS1Colors.teal, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Lieu de travail :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                                Text(active['workplace'] as String, style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontSize: 14, fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 20),
                      // Core Duty
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.task_alt_rounded, color: JSS1Colors.teal, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Mission & Responsabilités :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                                Text(active['duty'] as String, style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Ambition Generator: "Quand je serai grand(e)..."
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
                      const Icon(Icons.auto_awesome_rounded, color: JSS1Colors.gold, size: 22),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _isFeminine
                              ? 'Exemple : "Quand je serai grande, je veux être ${_cleanArticle(title)}."'
                              : 'Exemple : "Quand je serai grand, je veux être ${_cleanArticle(title)}."',
                          style: const TextStyle(color: JSS1Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
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

  String _cleanArticle(String title) {
    if (title.startsWith('Le ') || title.startsWith('La ')) {
      return title.substring(3);
    }
    if (title.startsWith('L\'')) {
      return title.substring(2);
    }
    return title;
  }

  Widget _buildGenderChip(String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? JSS1Colors.teal : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
