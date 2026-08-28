import 'package:flutter/material.dart';
import '../../../models/p4_lesson_model.dart';
import '../../../services/p4_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Term 2 Week 7 Pattern: School Facilities Campus Map & Subject Preference Dial
class CampusAndSubjectsWidget extends StatefulWidget {
  final P4Lesson lesson;

  const CampusAndSubjectsWidget({super.key, required this.lesson});

  @override
  State<CampusAndSubjectsWidget> createState() =>
      _CampusAndSubjectsWidgetState();
}

class _CampusAndSubjectsWidgetState extends State<CampusAndSubjectsWidget> {
  int _tabIndex = 0; // 0: School Facilities Map, 1: Subjects & "J'aime" Dial
  int _selectedPlaceIndex = 0;
  int _selectedSubjectIndex = 0;

  final List<Map<String, dynamic>> _places = [
    {
      'french': 'La bibliothèque',
      'english': 'The library',
      'phonetics': 'lah bib-lee-oh-tek',
      'detail': 'A quiet place where pupils read storybooks and study.',
      'action': 'Je vais à la bibliothèque pour lire.',
      'icon': Icons.local_library_rounded,
      'audio': 'la_bibliotheque',
    },
    {
      'french': 'La cour de récréation',
      'english': 'The playground',
      'phonetics': 'lah coor duh ray-cray-ah-see-on',
      'detail': 'The outdoor field where pupils run, laugh, and play games.',
      'action': 'Je vais à la cour pour jouer avec mes amis.',
      'icon': Icons.sports_kabaddi_rounded,
      'audio': 'la_cour_de_recreation',
    },
    {
      'french': 'Le bureau du directeur',
      'english': 'The headteacher\'s office',
      'phonetics': 'luh byoo-roh doo dee-rek-tur',
      'detail': 'The administrative office of the school principal.',
      'action': 'Le directeur travaille dans son bureau.',
      'icon': Icons.apartment_rounded,
      'audio': 'bureau_du_directeur',
    },
    {
      'french': 'Les toilettes',
      'english': 'The restrooms / toilets',
      'phonetics': 'lay twah-let',
      'detail': 'Clean school restrooms.',
      'action': 'Je vais aux toilettes.',
      'icon': Icons.wc_rounded,
      'audio': 'les_toilettes',
    },
  ];

  final List<Map<String, dynamic>> _subjects = [
    {
      'french': 'Le français',
      'english': 'French',
      'phonetics': 'luh frahn-say',
      'statement': 'J\'aime le français !',
      'icon': Icons.translate_rounded,
      'color': LHColors.teal,
      'audio': 'le_francais',
    },
    {
      'french': 'L\'anglais',
      'english': 'English',
      'phonetics': 'lon-glay',
      'statement': 'J\'aime l\'anglais !',
      'icon': Icons.language_rounded,
      'color': LHColors.turquoise,
      'audio': 'langlais',
    },
    {
      'french': 'Les mathématiques',
      'english': 'Mathematics / Maths',
      'phonetics': 'lay maht',
      'statement': 'J\'étudie les mathématiques !',
      'icon': Icons.calculate_rounded,
      'color': const Color(0xFF8E24AA),
      'audio': 'les_mathematiques',
    },
    {
      'french': 'Les sciences',
      'english': 'Sciences',
      'phonetics': 'lay syahns',
      'statement': 'J\'aime les sciences !',
      'icon': Icons.science_rounded,
      'color': const Color(0xFF2E7D32),
      'audio': 'les_sciences',
    },
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
              title: '🏫 1. School Facilities Campus Map (Les Lieux)',
              isActive: _tabIndex == 0,
              onTap: () => setState(() => _tabIndex = 0),
            ),
            const SizedBox(width: 16),
            _buildTab(
              title: '📚 2. School Subjects & Preferences ("J\'aime...")',
              isActive: _tabIndex == 1,
              onTap: () => setState(() => _tabIndex = 1),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Expanded(
          child: _tabIndex == 0 ? _buildPlacesView() : _buildSubjectsView(),
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

  Widget _buildPlacesView() {
    final active = _places[_selectedPlaceIndex];

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Row(
        children: [
          // Left: 4 Facilities Cards
          Expanded(
            flex: 5,
            child: ListView.separated(
              itemCount: _places.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, idx) {
                final place = _places[idx];
                final isSelected = idx == _selectedPlaceIndex;

                return Material(
                  color: isSelected ? LHColors.teal : LHColors.cream.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(16),
                  elevation: isSelected ? 4 : 0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setState(() => _selectedPlaceIndex = idx);
                      P4AudioService().playSfx(P4SfxType.click);
                      _playAudio(place['audio'] as String?);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          Icon(
                            place['icon'] as IconData,
                            color: isSelected ? LHColors.gold : LHColors.teal,
                            size: 28,
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  place['french'] as String,
                                  style: LHText.subheading(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  place['english'] as String,
                                  style: LHText.body(isSelected ? LHColors.white.withOpacity(0.85) : LHColors.grey).copyWith(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.volume_up_rounded,
                            color: isSelected ? LHColors.gold : LHColors.teal,
                            size: 22,
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

          // Right: Facility Spotlight & "Aller" Sentence Generator
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: LHColors.cream,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: LHColors.teal.withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: LHColors.teal,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'CAMPUS LOCATION',
                          style: LHText.label(LHColors.white).copyWith(fontSize: 11),
                        ),
                      ),
                      IconButton.filled(
                        style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                        icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                        onPressed: () => _playAudio(active['audio'] as String?),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        active['french'] as String,
                        style: LHText.heading(LHColors.teal).copyWith(fontSize: 26),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '[ ${active['phonetics']} ] · ${active['english']}',
                        style: LHText.body(LHColors.charcoal).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        active['detail'] as String,
                        style: LHText.body(LHColors.grey).copyWith(fontSize: 14),
                      ),
                    ],
                  ),

                  // Verb Aller Sentence Card
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: LHColors.gold, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Verb "Aller" (To Go) Sentence:',
                          style: LHText.label(LHColors.teal).copyWith(fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          active['action'] as String,
                          style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 16),
                        ),
                      ],
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

  Widget _buildSubjectsView() {
    final active = _subjects[_selectedSubjectIndex];

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Row(
        children: [
          // Left 4 Subjects Grid
          Expanded(
            flex: 5,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 1.6,
              ),
              itemCount: _subjects.length,
              itemBuilder: (context, idx) {
                final subj = _subjects[idx];
                final isSelected = idx == _selectedSubjectIndex;

                return Material(
                  color: isSelected ? LHColors.teal : LHColors.cream.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(16),
                  elevation: isSelected ? 4 : 0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setState(() => _selectedSubjectIndex = idx);
                      P4AudioService().playSfx(P4SfxType.click);
                      _playAudio(subj['audio'] as String?);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            subj['icon'] as IconData,
                            color: isSelected ? LHColors.gold : LHColors.teal,
                            size: 32,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            subj['french'] as String,
                            style: LHText.subheading(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
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

          // Right "J'aime" Statement Card
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: LHColors.cream,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: LHColors.gold.withOpacity(0.6), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Expressing Preference',
                        style: LHText.subheading(LHColors.teal).copyWith(fontSize: 20),
                      ),
                      IconButton.filled(
                        style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                        icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                        onPressed: () => _playAudio(active['audio'] as String?),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: LHColors.teal, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('French Preference Statement:', style: LHText.label(LHColors.grey).copyWith(fontSize: 11)),
                        const SizedBox(height: 6),
                        Text(
                          active['statement'] as String,
                          style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'I like ${active['english']} !',
                          style: LHText.body(LHColors.charcoal).copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: LHColors.teal.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Grammar Rule: Always use the definite article (le, l\', les) with J\'aime: J\'aime le français, J\'aime l\'anglais, J\'aime les mathématiques!',
                      style: LHText.body(LHColors.teal).copyWith(fontSize: 13, fontWeight: FontWeight.w600),
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
