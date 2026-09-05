import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../roadmap/jss2_week_roadmap_screen.dart';
import '../onboarding/onboarding_screen.dart';

class JSS2TermSelectScreen extends StatelessWidget {
  const JSS2TermSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LangHueyColors.warmCream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar with Brand Badge & Guide
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: LangHueyColors.deepTeal,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.school_rounded, color: LangHueyColors.amberGold, size: 24),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'JSS 2 French Language Engine',
                                    style: LangHueyTextStyles.h1.copyWith(fontSize: 20, color: LangHueyColors.deepTeal),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: LangHueyColors.amberGold,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'JSS 2',
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
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const OnboardingScreen(isReplayMode: true),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              color: LangHueyColors.deepTeal.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.3)),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.school_rounded, color: LangHueyColors.deepTeal, size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  'Guide / Kickoff',
                                  style: LangHueyTextStyles.badge.copyWith(
                                    color: LangHueyColors.deepTeal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
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
                                'Smartboard 1080p / 4K Mode',
                                style: LangHueyTextStyles.badge.copyWith(color: LangHueyColors.charcoal),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 36),

              Text(
                'Select School Term',
                style: LangHueyTextStyles.h1.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 4),
              Text(
                'Explore French curriculum modules and practice drills for Junior Secondary School 2.',
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
                    title: 'Term 1 — First Term',
                    subtitle: 'Spatial Position, Wayfinding, Public Transport, Schedules, Itineraries & Troubleshooting',
                    weeksCount: '9 Complete Weeks',
                    icon: Icons.explore_rounded,
                    isAvailable: true,
                  ),
                  const SizedBox(width: 24),

                  // Term 2 (Unlocked)
                  _buildTermCard(
                    context: context,
                    termNumber: 2,
                    title: 'Term 2 — Second Term',
                    subtitle: 'Shopping & Markets, Bargaining, Needs & Utilities, Pharmacy, Clothing & Comparisons',
                    weeksCount: '9 Complete Weeks',
                    icon: Icons.storefront_rounded,
                    isAvailable: true,
                  ),
                  const SizedBox(width: 24),

                  // Term 3 (Unlocked)
                  _buildTermCard(
                    context: context,
                    termNumber: 3,
                    title: 'Term 3 — Third Term',
                    subtitle: 'Math Operations, African & French Food, Cooking Recipes, Restaurant Etiquette & BECE Prep',
                    weeksCount: '9 Complete Weeks',
                    icon: Icons.workspace_premium_rounded,
                    isAvailable: true,
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
                      isAvailable ? 'AVAILABLE' : 'LOCKED',
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
                'TERM $termNumber',
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
