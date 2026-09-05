import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../roadmap/jss1_week_roadmap_screen.dart';
import '../onboarding/onboarding_screen.dart';

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
              // Top Header Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: JSS1Colors.teal,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.school_rounded, color: JSS1Colors.gold, size: 28),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'JSS 1 French Language Engine',
                                style: JSS1Text.heading(JSS1Colors.teal),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: JSS1Colors.gold,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'JSS 1',
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
                            color: JSS1Colors.teal.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: JSS1Colors.teal.withOpacity(0.3)),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.school_rounded, color: JSS1Colors.teal, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Guide / Kickoff',
                                style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
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
                              'Smartboard 1080p / 4K Mode',
                              style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 36),

              Text(
                'Select School Term',
                style: JSS1Text.heroHeading(JSS1Colors.charcoal).copyWith(fontSize: 28),
              ),
              Text(
                'Explore French curriculum modules and practice drills for Junior Secondary School 1.',
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
                      title: 'Term 1 — First Term',
                      subtitle: 'Classroom Commands, Greetings, Introductions, Spelling, Descriptions, Hobbies & Preferences',
                      weeksCount: 9,
                      icon: Icons.flag_rounded,
                      isAvailable: true,
                      accentColor: JSS1Colors.teal,
                    ),
                    const SizedBox(width: 24),
                    _buildTermCard(
                      context,
                      termNumber: 2,
                      title: 'Term 2 — Second Term',
                      subtitle: 'Object Properties, Polite Requests, Professions, Telling Time, Daily Routines & Calendar Dates',
                      weeksCount: 9,
                      icon: Icons.calendar_month_rounded,
                      isAvailable: true,
                      accentColor: JSS1Colors.indigo,
                    ),
                    const SizedBox(width: 24),
                    _buildTermCard(
                      context,
                      termNumber: 3,
                      title: 'Term 3 — Third Term',
                      subtitle: 'Weather & Seasons, Frequency, Invitations, Rules, Giving Directions, BECE Prep & Graduation',
                      weeksCount: 9,
                      icon: Icons.celebration_rounded,
                      isAvailable: true,
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
                color: JSS1Colors.charcoal.withOpacity(0.06),
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
                  color: isAvailable ? accentColor : JSS1Colors.grey.withOpacity(0.2),
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
                        color: isAvailable ? JSS1Colors.white.withOpacity(0.2) : JSS1Colors.lightGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isAvailable ? 'AVAILABLE' : 'COMING SOON',
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
                          Text('TERM $termNumber', style: JSS1Text.caption(isAvailable ? accentColor : JSS1Colors.grey).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1)),
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
                              isAvailable ? 'Open $weeksCount Weeks' : 'Term Locked',
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
