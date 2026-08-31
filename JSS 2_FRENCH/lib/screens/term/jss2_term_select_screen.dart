import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../roadmap/jss2_week_roadmap_screen.dart';

class JSS2TermSelectScreen extends StatelessWidget {
  const JSS2TermSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LangHueyColors.warmCream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Brand Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: LangHueyColors.deepTeal,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(Icons.school_rounded, color: LangHueyColors.amberGold, size: 32),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('LANG HUEY',
                                      style: LangHueyTextStyles.h2.copyWith(
                                        color: LangHueyColors.deepTeal,
                                        letterSpacing: 1.5,
                                      )),
                                  const SizedBox(width: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: LangHueyColors.amberGold,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'JSS 2 FRENCH',
                                      style: LangHueyTextStyles.badge.copyWith(
                                        color: LangHueyColors.charcoal,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Junior Secondary School 2 • Nigerian NERDC Curriculum',
                                style: LangHueyTextStyles.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.cast_for_education_rounded, color: LangHueyColors.deepTeal, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Mode Smartboard 1080p / 4K',
                          style: LangHueyTextStyles.badge.copyWith(color: LangHueyColors.charcoal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 36),

              Text(
                'Sélectionnez le Trimestre Scolaire',
                style: LangHueyTextStyles.h1.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 4),
              Text(
                'Explorez les modules de cours et de révision de français pour la classe de JSS 2 (8e Année).',
                style: LangHueyTextStyles.bodyLarge.copyWith(color: LangHueyColors.textMuted),
              ),

              const SizedBox(height: 32),

              // Term Selection Cards
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Term 1 (Unlocked)
                  _buildTermCard(
                    context: context,
                    termNumber: 1,
                    title: 'PREMIER TRIMESTRE',
                    subtitle: 'Positions Spatiales, Lieux, Accueil Intérieur, Chemins, Transports, Trajets, Horaires & Pépins',
                    weeksCount: '9 Semaines Complètes',
                    icon: Icons.explore_rounded,
                    isAvailable: true,
                  ),
                  const SizedBox(width: 24),

                  // Term 2 (Locked)
                  _buildTermCard(
                    context: context,
                    termNumber: 2,
                    title: 'DEUXIÈME TRIMESTRE',
                    subtitle: 'Commerces & Achats, Repas & Restaurants, Logement & Hébergement, Activités Quotidiennes',
                    weeksCount: '9 Semaines (À Venir)',
                    icon: Icons.shopping_bag_rounded,
                    isAvailable: false,
                  ),
                  const SizedBox(width: 24),

                  // Term 3 (Locked)
                  _buildTermCard(
                    context: context,
                    termNumber: 3,
                    title: 'TROISIÈME TRIMESTRE',
                    subtitle: 'Santé & Corps Humain, Voyages & Vacances, Préparation BECE / JSCE & Grand Bilan Annuel',
                    weeksCount: '9 Semaines (À Venir)',
                    icon: Icons.workspace_premium_rounded,
                    isAvailable: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermCard({
    required BuildContext context,
    required int termNumber,
    required String title,
    required String subtitle,
    required String weeksCount,
    required IconData icon,
    required bool isAvailable,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: isAvailable
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JSS2WeekRoadmapScreen(term: termNumber),
                  ),
                );
              }
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isAvailable ? Colors.white : Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isAvailable ? LangHueyColors.deepTeal : Colors.black12,
              width: isAvailable ? 2 : 1,
            ),
            boxShadow: isAvailable
                ? [
                    BoxShadow(
                      color: LangHueyColors.deepTeal.withOpacity(0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isAvailable ? LangHueyColors.softTeal : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      icon,
                      color: isAvailable ? LangHueyColors.deepTeal : Colors.grey,
                      size: 32,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isAvailable ? LangHueyColors.deepTeal : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      isAvailable ? 'DISPONIBLE' : 'VERROUILLÉ',
                      style: TextStyle(
                        color: isAvailable ? Colors.white : Colors.grey.shade700,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                'TRIMESTRE $termNumber',
                style: LangHueyTextStyles.badge.copyWith(
                  color: isAvailable ? LangHueyColors.deepTeal : Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: LangHueyTextStyles.h2.copyWith(
                  fontSize: 18,
                  color: isAvailable ? LangHueyColors.charcoal : Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: isAvailable ? LangHueyColors.textMuted : Colors.grey,
                  height: 1.4,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    weeksCount,
                    style: TextStyle(
                      color: isAvailable ? LangHueyColors.deepTeal : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    isAvailable ? Icons.arrow_forward_rounded : Icons.lock_outline_rounded,
                    color: isAvailable ? LangHueyColors.deepTeal : Colors.grey,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
