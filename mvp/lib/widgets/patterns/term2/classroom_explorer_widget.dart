import 'package:flutter/material.dart';
import '../../../models/p4_lesson_model.dart';
import '../../../services/p4_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Term 2 Week 4 Pattern: Interactive Classroom Explorer & School Objects Soundboard
class ClassroomExplorerWidget extends StatefulWidget {
  final P4Lesson lesson;

  const ClassroomExplorerWidget({super.key, required this.lesson});

  @override
  State<ClassroomExplorerWidget> createState() =>
      _ClassroomExplorerWidgetState();
}

class _ClassroomExplorerWidgetState extends State<ClassroomExplorerWidget> {
  int _selectedItemIndex = 0;

  final List<Map<String, dynamic>> _classroomItems = [
    {
      'french': 'Le tableau',
      'english': 'The board (Chalkboard / Whiteboard)',
      'phonetics': 'luh tab-loh',
      'gender': 'Masculin',
      'example': 'Le professeur écrit sur le tableau.',
      'icon': Icons.tv_rounded,
      'audio': 'le_tableau',
    },
    {
      'french': 'Le bureau',
      'english': 'The desk / Teacher\'s table',
      'phonetics': 'luh byoo-roh',
      'gender': 'Masculin',
      'example': 'Mon livre est sur le bureau.',
      'icon': Icons.table_restaurant_rounded,
      'audio': 'le_bureau',
    },
    {
      'french': 'Le cahier',
      'english': 'The notebook / Exercise book',
      'phonetics': 'luh kah-yay',
      'gender': 'Masculin',
      'example': 'J\'écris mes devoirs dans mon cahier.',
      'icon': Icons.menu_book_rounded,
      'audio': 'le_cahier',
    },
    {
      'french': 'Le livre',
      'english': 'The textbook / Book',
      'phonetics': 'luh leev-ruh',
      'gender': 'Masculin',
      'example': 'Je lis une histoire dans mon livre.',
      'icon': Icons.auto_stories_rounded,
      'audio': 'le_livre',
    },
    {
      'french': 'Le stylo',
      'english': 'The pen',
      'phonetics': 'luh stee-loh',
      'gender': 'Masculin',
      'example': 'Mon stylo est bleu.',
      'icon': Icons.edit_rounded,
      'audio': 'le_stylo',
    },
    {
      'french': 'Le crayon',
      'english': 'The pencil',
      'phonetics': 'luh kray-on',
      'gender': 'Masculin',
      'example': 'Je dessine avec un crayon.',
      'icon': Icons.create_rounded,
      'audio': 'le_crayon',
    },
    {
      'french': 'Le professeur',
      'english': 'The teacher (Male)',
      'phonetics': 'luh pro-fess-ur',
      'gender': 'Masculin',
      'example': 'Le professeur enseigne le français.',
      'icon': Icons.school_rounded,
      'audio': 'le_professeur',
    },
    {
      'french': 'L\'élève',
      'english': 'The student / Pupil',
      'phonetics': 'lay-lev',
      'gender': 'Masculin / Féminin',
      'example': 'L\'élève écoute attentivement en classe.',
      'icon': Icons.face_rounded,
      'audio': 'leleve',
    },
  ];

  void _playAudio(String? key) {
    if (key != null) {
      P4AudioService().playPhrase(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    final active = _classroomItems[_selectedItemIndex];

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dans la Salle de Classe (Classroom Explorer)',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tap any classroom item or person to discover its French name, gender, and usage',
                    style: LHText.body(LHColors.grey).copyWith(fontSize: 15),
                  ),
                ],
              ),
              IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                onPressed: () => _playAudio(active['audio'] as String?),
              ),
            ],
          ),

          const Divider(height: 20),

          Expanded(
            child: Row(
              children: [
                // Left 4x2 Grid of Classroom Items
                Expanded(
                  flex: 6,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.15,
                    ),
                    itemCount: _classroomItems.length,
                    itemBuilder: (context, idx) {
                      final item = _classroomItems[idx];
                      final isSelected = idx == _selectedItemIndex;

                      return Material(
                        color: isSelected ? LHColors.teal : LHColors.cream.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(16),
                        elevation: isSelected ? 4 : 0,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            setState(() => _selectedItemIndex = idx);
                            P4AudioService().playSfx(P4SfxType.click);
                            _playAudio(item['audio'] as String?);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  item['icon'] as IconData,
                                  color: isSelected ? LHColors.gold : LHColors.teal,
                                  size: 32,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item['french'] as String,
                                  style: LHText.body(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
                                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.center,
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

                // Right Object Spotlight Card
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: LHColors.cream,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: LHColors.teal.withValues(alpha: 0.4), width: 2),
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
                                active['gender'] as String,
                                style: LHText.label(LHColors.white).copyWith(fontSize: 11),
                              ),
                            ),
                            Icon(active['icon'] as IconData, color: LHColors.gold, size: 28),
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
                              '[ ${active['phonetics']} ]',
                              style: LHText.body(LHColors.teal).copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              active['english'] as String,
                              style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 16),
                            ),
                          ],
                        ),

                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: LHColors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Example Sentence:', style: LHText.label(LHColors.grey).copyWith(fontSize: 11)),
                              const SizedBox(height: 2),
                              Text(
                                active['example'] as String,
                                style: LHText.body(LHColors.charcoal).copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: LHColors.gold.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Say: "Voici mon école et ma salle de classe !"',
                            style: LHText.body(LHColors.charcoal).copyWith(fontSize: 13, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
