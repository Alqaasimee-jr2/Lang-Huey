import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5FamilyTreeAdvancedWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5FamilyTreeAdvancedWidget({super.key, required this.onComplete});

  @override
  State<P5FamilyTreeAdvancedWidget> createState() => _P5FamilyTreeAdvancedWidgetState();
}

class _P5FamilyTreeAdvancedWidgetState extends State<P5FamilyTreeAdvancedWidget> {
  final P5AudioService _audioService = P5AudioService();
  bool _isBigFamily = true;

  final List<Map<String, dynamic>> _relatives = [
    {
      'role': 'Le neveu',
      'english': 'The nephew (brother/sister\'s son)',
      'audio': 'le_neveu',
      'icon': Icons.boy_rounded,
      'isOld': false,
    },
    {
      'role': 'La nièce',
      'english': 'The niece (brother/sister\'s daughter)',
      'audio': 'la_niece',
      'icon': Icons.girl_rounded,
      'isOld': false,
    },
    {
      'role': 'Le petit-fils',
      'english': 'The grandson',
      'audio': 'le_petit_fils',
      'icon': Icons.child_care_rounded,
      'isOld': false,
    },
    {
      'role': 'La petite-fille',
      'english': 'The granddaughter',
      'audio': 'la_petite_fille',
      'icon': Icons.child_care_rounded,
      'isOld': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.cream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.teal, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top: Family Size Toggle
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: P5Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: P5Colors.gold, width: 2),
            ),
            child: Row(
              children: [
                Text('Taille de la Famille :', style: P5Text.subheading(P5Colors.charcoal)),
                const SizedBox(width: 16),
                Expanded(
                  child: SegmentedButton<bool>(
                    segments: const [
                      ButtonSegment(
                        value: true,
                        icon: Icon(Icons.groups_rounded),
                        label: Text('J\'ai une grande famille'),
                      ),
                      ButtonSegment(
                        value: false,
                        icon: Icon(Icons.group_rounded),
                        label: Text('J\'ai une petite famille'),
                      ),
                    ],
                    selected: {_isBigFamily},
                    onSelectionChanged: (set) {
                      setState(() {
                        _isBigFamily = set.first;
                      });
                      _audioService.playPhrase(
                        _isBigFamily ? 'jai_une_grande_famille' : 'jai_une_petite_famille',
                        term: 2,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Middle: Relatives Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 2.2,
              ),
              itemCount: _relatives.length,
              itemBuilder: (context, index) {
                final rel = _relatives[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: P5Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: P5Colors.teal.withValues(alpha: 0.4), width: 2),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: P5Colors.teal,
                        child: Icon(rel['icon'] as IconData, size: 32, color: P5Colors.gold),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(rel['role'] as String, style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 18)),
                            Text(rel['english'] as String, style: P5Text.caption(P5Colors.charcoal)),
                          ],
                        ),
                      ),
                      IconButton.filled(
                        style: IconButton.styleFrom(backgroundColor: P5Colors.teal, foregroundColor: P5Colors.white),
                        onPressed: () {
                          _audioService.playPhrase(rel['audio'], term: 2);
                        },
                        icon: const Icon(Icons.volume_up_rounded),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // Bottom: Age Descriptors Bar
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: P5Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: P5Colors.teal, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                  onPressed: () {
                    _audioService.playPhrase('age_agee', term: 2);
                  },
                  icon: const Icon(Icons.elderly_rounded),
                  label: const Text('Mon grand-père est âgé (Elderly)'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: P5Colors.teal, foregroundColor: P5Colors.white),
                  onPressed: () {
                    _audioService.playPhrase('jeune', term: 2);
                  },
                  icon: const Icon(Icons.child_care_rounded),
                  label: const Text('Mon neveu est jeune (Young)'),
                ),
                IconButton.filled(
                  style: IconButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                  onPressed: () {
                    _audioService.playClick();
                    widget.onComplete();
                  },
                  icon: const Icon(Icons.check_circle_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
