import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../roadmap/jss1_week_roadmap_screen.dart';

class JSS1TermSelectScreen extends StatelessWidget {
  const JSS1TermSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JSS1Colors.cream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Brand Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: JSS1Colors.teal,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.school_rounded, color: JSS1Colors.gold, size: 32),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('LANG HUEY', style: JSS1Text.heading(JSS1Colors.teal).copyWith(letterSpacing: 1.5)),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: JSS1Colors.gold,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'JSS 1 FRENCH',
                                  style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Junior Secondary School • Nigerian NERDC Curriculum',
                            style: JSS1Text.caption(JSS1Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: JSS1Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: JSS1Colors.lightGrey),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.cast_for_education_rounded, color: JSS1Colors.teal, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Mode Smartboard 1080p / 4K',
                          style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 36),

              Text(
                'Sélectionnez le Trimestre Scolaire',
                style: JSS1Text.heroHeading(JSS1Colors.charcoal).copyWith(fontSize: 28),
              ),
              Text(
                'Explorez les modules de cours et de révision de français pour la classe de JSS1 (7e Année).',
                style: JSS1Text.body(JSS1Colors.grey),
              ),

              const SizedBox(height: 28),

              // 3 Term Cards
              Expanded(
                child: Row(
                  children: [
                    _buildTermCard(
                      context,
                      termNumber: 1,
                      title: 'Premier Trimestre',
                      subtitle: 'Ordres de classe, Salutations, Présentation, Orthographe, Descriptions, Loisirs & Goûts',
                      weeksCount: 9,
                      icon: Icons.flag_rounded,
                      isAvailable: true,
                      accentColor: JSS1Colors.teal,
                    ),
                    const SizedBox(width: 24),
                    _buildTermCard(
                      context,
                      termNumber: 2,
                      title: 'Deuxième Trimestre',
                      subtitle: 'Mon École, Horaires et Emploi du Temps, Famille, Repas, Achats au Marché & Santé',
                      weeksCount: 13,
                      icon: Icons.calendar_month_rounded,
                      isAvailable: false,
                      accentColor: JSS1Colors.indigo,
                    ),
                    const SizedBox(width: 24),
                    _buildTermCard(
                      context,
                      termNumber: 3,
                      title: 'Troisième Trimestre',
                      subtitle: 'Sports, Voyages, Météo, Logement, Nature, Projets d\'Avenir & Bilan Annuel BECE',
                      weeksCount: 13,
                      icon: Icons.celebration_rounded,
                      isAvailable: false,
                      accentColor: JSS1Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermCard(
    BuildContext context, {
    required int termNumber,
    required String title,
    required String subtitle,
    required int weeksCount,
    required IconData icon,
    required bool isAvailable,
    required Color accentColor,
  }) {
    return Expanded(
      child: InkWell(
        onTap: isAvailable
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JSS1WeekRoadmapScreen(term: termNumber),
                  ),
                );
              }
            : null,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          decoration: BoxDecoration(
            color: JSS1Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isAvailable ? accentColor : JSS1Colors.lightGrey,
              width: isAvailable ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: JSS1Colors.charcoal.withValues(alpha: 0.06),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Term Header Banner
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isAvailable ? accentColor : JSS1Colors.grey.withValues(alpha: 0.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(icon, color: isAvailable ? JSS1Colors.gold : JSS1Colors.grey, size: 32),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isAvailable ? JSS1Colors.white.withValues(alpha: 0.2) : JSS1Colors.lightGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isAvailable ? 'DISPONIBLE' : 'BIENTÔT',
                        style: TextStyle(
                          color: isAvailable ? JSS1Colors.white : JSS1Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Term Body
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('TRIMESTRE $termNumber', style: JSS1Text.caption(isAvailable ? accentColor : JSS1Colors.grey).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1)),
                          const SizedBox(height: 4),
                          Text(title, style: JSS1Text.heading(JSS1Colors.charcoal).copyWith(fontSize: 20)),
                          const SizedBox(height: 10),
                          Text(subtitle, style: JSS1Text.body(JSS1Colors.grey).copyWith(fontSize: 14), maxLines: 3, overflow: TextOverflow.ellipsis),
                        ],
                      ),

                      // Bottom Button
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: isAvailable ? accentColor : JSS1Colors.lightGrey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isAvailable ? 'Ouvrir les 13 Semaines' : 'Trimestre Verrouillé',
                              style: JSS1Text.body(isAvailable ? JSS1Colors.white : JSS1Colors.grey).copyWith(fontWeight: FontWeight.w800),
                            ),
                            if (isAvailable) ...[
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward_rounded, color: JSS1Colors.gold, size: 20),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
