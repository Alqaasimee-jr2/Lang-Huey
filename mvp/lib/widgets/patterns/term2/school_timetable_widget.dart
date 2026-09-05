import 'package:flutter/material.dart';
import '../../../models/p4_lesson_model.dart';
import '../../../services/p4_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Term 2 Week 8 Pattern: Weekly Timetable Grid (Les Jours) & Action Verbs Lab
class SchoolTimetableWidget extends StatefulWidget {
  final P4Lesson lesson;

  const SchoolTimetableWidget({super.key, required this.lesson});

  @override
  State<SchoolTimetableWidget> createState() => _SchoolTimetableWidgetState();
}

class _SchoolTimetableWidgetState extends State<SchoolTimetableWidget> {
  int _tabIndex = 0; // 0: 7 Days & Timetable, 1: School Action Verbs
  int _selectedDayIndex = 0;
  int _selectedVerbIndex = 0;

  final List<Map<String, dynamic>> _days = [
    {'french': 'Lundi', 'english': 'Monday', 'sound': 'luhn-dee', 'subject': 'Le français', 'icon': Icons.calendar_today_rounded, 'audio': 'lundi'},
    {'french': 'Mardi', 'english': 'Tuesday', 'sound': 'mahr-dee', 'subject': 'Les mathématiques', 'icon': Icons.calendar_today_rounded, 'audio': 'mardi'},
    {'french': 'Mercredi', 'english': 'Wednesday', 'sound': 'mair-kruh-dee', 'subject': 'Les sciences', 'icon': Icons.calendar_today_rounded, 'audio': 'mercredi'},
    {'french': 'Jeudi', 'english': 'Thursday', 'sound': 'zhuh-dee', 'subject': 'L\'anglais', 'icon': Icons.calendar_today_rounded, 'audio': 'jeudi'},
    {'french': 'Vendredi', 'english': 'Friday', 'sound': 'vahn-druh-dee', 'subject': 'Le sport & Le français', 'icon': Icons.calendar_today_rounded, 'audio': 'vendredi'},
    {'french': 'Samedi', 'english': 'Saturday (Weekend)', 'sound': 'sahm-dee', 'subject': 'Le repos en famille', 'icon': Icons.weekend_rounded, 'audio': 'samedi_dimanche'},
    {'french': 'Dimanche', 'english': 'Sunday (Weekend)', 'sound': 'dee-mahnsh', 'subject': 'Le repos en famille', 'icon': Icons.weekend_rounded, 'audio': 'samedi_dimanche'},
  ];

  final List<Map<String, dynamic>> _verbs = [
    {'infinitive': 'Lire', 'meaning': 'To read', 'conjugated': 'Je lis', 'example': 'À l\'école, je lis un livre.', 'icon': Icons.menu_book_rounded, 'audio': 'lire'},
    {'infinitive': 'Écrire', 'meaning': 'To write', 'conjugated': 'J\'écris', 'example': 'J\'écris dans mon cahier.', 'icon': Icons.draw_rounded, 'audio': 'ecrire'},
    {'infinitive': 'Étudier', 'meaning': 'To study', 'conjugated': 'J\'étudie', 'example': 'J\'étudie le français avec passion.', 'icon': Icons.school_rounded, 'audio': 'etudier'},
    {'infinitive': 'Jouer', 'meaning': 'To play', 'conjugated': 'Je joue', 'example': 'Dans la cour, je joue avec mes amis.', 'icon': Icons.sports_soccer_rounded, 'audio': 'jouer'},
  ];

  void _playAudio(String? key) {
    if (key != null) {
      P4AudioService().playPhrase(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Mode Switcher
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTab(
              title: '📅 1. 7 Days of the Week & Timetable',
              isActive: _tabIndex == 0,
              onTap: () => setState(() => _tabIndex = 0),
            ),
            const SizedBox(width: 16),
            _buildTab(
              title: '⚡ 2. School Action Verbs (Lire, Écrire, Étudier, Jouer)',
              isActive: _tabIndex == 1,
              onTap: () => setState(() => _tabIndex = 1),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Expanded(
          child: _tabIndex == 0 ? _buildDaysView() : _buildVerbsView(),
        ),
      ],
    );
  }

  Widget _buildTab({required String title, required bool isActive, required VoidCallback onTap}) {
    return Material(
      color: isActive ? LHColors.teal : LHColors.white,
      borderRadius: BorderRadius.circular(14),
      elevation: isActive ? 4 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Text(
            title,
            style: LHText.subheading(isActive ? LHColors.white : LHColors.charcoal).copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDaysView() {
    final active = _days[_selectedDayIndex];

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3), width: 2),
      ),
      child: Row(
        children: [
          // Left: 7 Days Grid
          Expanded(
            flex: 6,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.1,
              ),
              itemCount: _days.length,
              itemBuilder: (context, idx) {
                final day = _days[idx];
                final isSelected = idx == _selectedDayIndex;

                return Material(
                  color: isSelected ? LHColors.teal : LHColors.cream.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(16),
                  elevation: isSelected ? 4 : 0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setState(() => _selectedDayIndex = idx);
                      P4AudioService().playSfx(P4SfxType.click);
                      _playAudio(day['audio'] as String?);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            day['icon'] as IconData,
                            color: isSelected ? LHColors.gold : LHColors.teal,
                            size: 24,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            day['french'] as String,
                            style: LHText.subheading(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            day['english'] as String,
                            style: LHText.body(isSelected ? LHColors.white.withValues(alpha: 0.85) : LHColors.grey).copyWith(
                              fontSize: 11,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 24),

          // Right: Schedule Sentence Spotlight
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: LHColors.cream,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: LHColors.gold.withValues(alpha: 0.6), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Day & Timetable',
                        style: LHText.subheading(LHColors.teal).copyWith(fontSize: 20),
                      ),
                      IconButton.filled(
                        style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                        icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 22),
                        onPressed: () => _playAudio(active['audio'] as String?),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        active['french'] as String,
                        style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 28),
                      ),
                      Text(
                        '[ ${active['sound']} ] · ${active['english']}',
                        style: LHText.body(LHColors.teal).copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.4)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Timetable Sentence:', style: LHText.label(LHColors.grey).copyWith(fontSize: 11)),
                        const SizedBox(height: 4),
                        Text(
                          'Le ${active['french'].toString().toLowerCase()}, j\'ai ${active['subject'].toString().toLowerCase()}.',
                          style: LHText.subheading(LHColors.teal).copyWith(fontSize: 16),
                        ),
                        Text(
                          'On ${active['english'].toString().split(' ').first}, I have ${active['subject']}.',
                          style: LHText.body(LHColors.charcoal).copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: LHColors.teal.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Rule: In French, days of the week are written in lowercase (lundi, mardi...)!',
                      style: LHText.body(LHColors.teal).copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerbsView() {
    final active = _verbs[_selectedVerbIndex];

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3), width: 2),
      ),
      child: Row(
        children: [
          // Left 4 Verbs
          Expanded(
            flex: 5,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 1.6,
              ),
              itemCount: _verbs.length,
              itemBuilder: (context, idx) {
                final v = _verbs[idx];
                final isSelected = idx == _selectedVerbIndex;

                return Material(
                  color: isSelected ? LHColors.teal : LHColors.cream.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(16),
                  elevation: isSelected ? 4 : 0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setState(() => _selectedVerbIndex = idx);
                      P4AudioService().playSfx(P4SfxType.click);
                      _playAudio(v['audio'] as String?);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            v['icon'] as IconData,
                            color: isSelected ? LHColors.gold : LHColors.teal,
                            size: 28,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            v['infinitive'] as String,
                            style: LHText.subheading(isSelected ? LHColors.white : LHColors.charcoal).copyWith(fontSize: 16),
                          ),
                          Text(
                            v['meaning'] as String,
                            style: LHText.body(isSelected ? LHColors.white.withValues(alpha: 0.85) : LHColors.grey).copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 24),

          // Right Action Sentence Card
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: LHColors.cream,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: LHColors.teal, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'School Activity in Action',
                        style: LHText.subheading(LHColors.teal).copyWith(fontSize: 20),
                      ),
                      IconButton.filled(
                        style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                        icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 22),
                        onPressed: () => _playAudio(active['audio'] as String?),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: LHColors.gold, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Action Statement (Verb + Je):', style: LHText.label(LHColors.grey).copyWith(fontSize: 11)),
                        const SizedBox(height: 4),
                        Text(
                          active['example'] as String,
                          style: LHText.heading(LHColors.teal).copyWith(fontSize: 20),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Infinitive: ${active['infinitive']} (${active['meaning']}) -> ${active['conjugated']}',
                          style: LHText.body(LHColors.charcoal).copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Combined School Speech: "À l\'école, je lis et j\'écris. Dans la cour, je joue avec mes amis !"',
                      style: LHText.body(LHColors.charcoal).copyWith(fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
