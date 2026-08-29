import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../roadmap/p5_week_roadmap_screen.dart';

class P5TermSelectScreen extends StatelessWidget {
  const P5TermSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: P5Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                              decoration: BoxDecoration(
                                color: P5Colors.gold,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'GRADE 5 / PRIMARY 5',
                                style: TextStyle(
                                  color: P5Colors.charcoal,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'LANG HUEY SMARTBOARD',
                              style: P5Text.caption(P5Colors.turquoise).copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Langue Française — Cinquième Année',
                          style: P5Text.heroHeading(P5Colors.white).copyWith(fontSize: 28),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    decoration: BoxDecoration(
                      color: P5Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: P5Colors.white.withOpacity(0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.offline_pin_rounded, color: P5Colors.turquoise, size: 24),
                        const SizedBox(width: 8),
                        Text(
                          '100% Offline Ready',
                          style: P5Text.body(P5Colors.white).copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Term Cards
              Expanded(
                child: Row(
                  children: [
                    // Term 1 (Unlocked)
                    _buildTermCard(
                      context,
                      termNumber: 1,
                      termTitle: 'Premier Trimestre',
                      subtitle: 'Term 1: Numbers 21–60, Presenting Others & Body Anatomy',
                      weeksCount: 13,
                      color: P5Colors.turquoise,
                      isUnlocked: true,
                      topics: [
                        'Alphabet Sounds & Numbers 1–20 Review',
                        'Counting 21–60 & Mental Arithmetic',
                        'Market Prices & Phone Numbers',
                        'Presenting Friends (Voici / C\'est / Il / Elle)',
                        'Head & Body Anatomy + Clinic Station',
                        'Mid-Term & Comprehensive Revision Rallies',
                      ],
                    ),
                    const SizedBox(width: 20),

                    // Term 2
                    _buildTermCard(
                      context,
                      termNumber: 2,
                      termTitle: 'Deuxième Trimestre',
                      subtitle: 'Term 2: Extended Family, Neighbors & Weekly Timetable',
                      weeksCount: 13,
                      color: P5Colors.gold,
                      isUnlocked: true,
                      topics: [
                        'Extended Family (Grands-parents, Oncle, Tante)',
                        'Nephews, Nieces & Family Gatherings',
                        'Neighborhood Community (Voisins, Quartier)',
                        'Expressing Gratitude & Thank-You Letters',
                        'Days of the Week & 7-Day School Timetable',
                        'Term 2 Speed Rally & Evaluation',
                      ],
                    ),
                    const SizedBox(width: 20),

                    // Term 3
                    _buildTermCard(
                      context,
                      termNumber: 3,
                      termTitle: 'Troisième Trimestre',
                      subtitle: 'Term 3: Daily Routine, Sports, Careers & Food',
                      weeksCount: 13,
                      color: P5Colors.indigo,
                      isUnlocked: true,
                      topics: [
                        'Daily Routine & Reflexive Verbs',
                        'Sports, Leisure & Hobbies Lounge',
                        'School Activities & Classroom Borrowing',
                        'Professions & Future Career Dreams',
                        'Food, Meals & Grand Annual Revision',
                        'Primary 5 French Certificate of Excellence',
                      ],
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
    required String termTitle,
    required String subtitle,
    required int weeksCount,
    required Color color,
    required bool isUnlocked,
    required List<String> topics,
  }) {
    return Expanded(
      child: Material(
        color: P5Colors.white,
        borderRadius: BorderRadius.circular(24),
        elevation: 6,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => P5WeekRoadmapScreen(termNumber: termNumber),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'TERM $termNumber',
                        style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 13),
                      ),
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: P5Colors.green.withOpacity(0.15),
                      child: const Icon(Icons.arrow_forward_rounded, color: P5Colors.green, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(termTitle, style: P5Text.heading(P5Colors.charcoal).copyWith(fontSize: 22)),
                const SizedBox(height: 4),
                Text(subtitle, style: P5Text.caption(P5Colors.teal).copyWith(fontWeight: FontWeight.w700)),
                const Divider(height: 20),

                Expanded(
                  child: ListView.builder(
                    itemCount: topics.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.check_circle_outline_rounded, size: 16, color: P5Colors.green),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                topics[index],
                                style: P5Text.caption(P5Colors.charcoal).copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    '$weeksCount WEEKS • TAP TO OPEN',
                    style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 12, letterSpacing: 0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
