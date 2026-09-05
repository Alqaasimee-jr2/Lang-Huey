import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../onboarding/onboarding_screen.dart';

class P4TermSelectScreen extends StatelessWidget {
  const P4TermSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LHColors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Lang Huey',
                        style: LHText.heading(LHColors.white).copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 36,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                        decoration: BoxDecoration(
                          color: LHColors.turquoise.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.5)),
                        ),
                        child: Text(
                          'GRADE 4 / PRIMARY 4 FRENCH',
                          style: LHText.label(LHColors.turquoise).copyWith(fontSize: 13),
                        ),
                      ),
                    ],
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
                            color: LHColors.turquoise.withValues(alpha: 0.25),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.6)),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.school_rounded, color: LHColors.turquoise, size: 16),
                              const SizedBox(width: 8),
                              Text(
                                'Guide / Kickoff',
                                style: LHText.label(LHColors.white).copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
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
                          color: LHColors.white.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'NIT7ER · 2026',
                          style: LHText.label(LHColors.white).copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Text(
                'Select Academic Term to Begin',
                style: LHText.heading(LHColors.white).copyWith(fontSize: 32),
              ),
              const SizedBox(height: 6),
              Text(
                'Government-Approved NERDC Curriculum for Primary 4 French Language',
                style: LHText.body(LHColors.turquoise).copyWith(fontSize: 18),
              ),

              const SizedBox(height: 32),

              // 3 Term Cards Grid
              Expanded(
                child: Row(
                  children: [
                    // Term 1 (Ready)
                    Expanded(
                      child: _buildTermCard(
                        context: context,
                        termNumber: 1,
                        title: 'Premier Trimestre',
                        englishTitle: 'First Term',
                        theme: 'Identity, Greetings, Numbers 1–20 & Francophone Geography',
                        weeksCount: 13,
                        isUnlocked: true,
                        badgeColor: LHColors.gold,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/p4_roadmap',
                            arguments: 1,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 20),

                    // Term 2 (Unlocked & Complete)
                    Expanded(
                      child: _buildTermCard(
                        context: context,
                        termNumber: 2,
                        title: 'Deuxième Trimestre',
                        englishTitle: 'Second Term',
                        theme: 'Family Members, School Environment, Objects, Prepositions & Colors',
                        weeksCount: 13,
                        isUnlocked: true,
                        badgeColor: LHColors.gold,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/p4_roadmap',
                            arguments: 2,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 20),

                    // Term 3 (Unlocked & Complete)
                    Expanded(
                      child: _buildTermCard(
                        context: context,
                        termNumber: 3,
                        title: 'Troisième Trimestre',
                        englishTitle: 'Third Term',
                        theme: 'Telling Time, Daily Routine, Meals, Body Anatomy, Clothes & Weather',
                        weeksCount: 13,
                        isUnlocked: true,
                        badgeColor: LHColors.gold,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/p4_roadmap',
                            arguments: 3,
                          );
                        },
                      ),
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

  Widget _buildTermCard({
    required BuildContext context,
    required int termNumber,
    required String title,
    required String englishTitle,
    required String theme,
    required int weeksCount,
    required bool isUnlocked,
    required Color badgeColor,
    required VoidCallback? onTap,
  }) {
    return Material(
      color: LHColors.white,
      borderRadius: BorderRadius.circular(24),
      elevation: isUnlocked ? 6 : 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: isUnlocked
                ? Border.all(color: LHColors.turquoise, width: 2.5)
                : Border.all(color: LHColors.grey.withValues(alpha: 0.3), width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: isUnlocked ? LHColors.teal : LHColors.grey.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'TERM 0$termNumber',
                      style: LHText.label(isUnlocked ? LHColors.white : LHColors.grey).copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  if (!isUnlocked)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: LHColors.cream,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'UPCOMING',
                        style: LHText.label(LHColors.grey).copyWith(fontSize: 11),
                      ),
                    ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 26),
                  ),
                  Text(
                    englishTitle,
                    style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    theme,
                    style: LHText.body(LHColors.grey).copyWith(fontSize: 15, height: 1.4),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '$weeksCount Lessons',
                      style: LHText.body(LHColors.charcoal).copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (isUnlocked)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: LHColors.gold,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: LHColors.gold.withValues(alpha: 0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Open',
                            style: LHText.body(LHColors.charcoal).copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.arrow_forward_rounded, color: LHColors.charcoal, size: 16),
                        ],
                      ),
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
