import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5SchoolSubjectsWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5SchoolSubjectsWidget({super.key, required this.onComplete});

  @override
  State<P5SchoolSubjectsWidget> createState() => _P5SchoolSubjectsWidgetState();
}

class _P5SchoolSubjectsWidgetState extends State<P5SchoolSubjectsWidget> {
  final P5AudioService _audioService = P5AudioService();
  String _favoriteSubject = 'Le français';

  final List<Map<String, dynamic>> _subjects = [
    {'name': 'Le français', 'english': 'French Language', 'audio': 'le_francais', 'icon': Icons.translate_rounded},
    {'name': 'L\'anglais', 'english': 'English Language', 'audio': 'langlais', 'icon': Icons.language_rounded},
    {'name': 'Les mathématiques', 'english': 'Mathematics', 'audio': 'les_mathematiques', 'icon': Icons.calculate_rounded},
    {'name': 'Les sciences', 'english': 'Science', 'audio': 'les_sciences', 'icon': Icons.science_rounded},
    {'name': 'L\'histoire', 'english': 'History', 'audio': 'lhistoire', 'icon': Icons.account_balance_rounded},
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Les Matières Scolaires :', style: P5Text.subheading(P5Colors.charcoal)),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                onPressed: () {
                  _audioService.playPhrase('ma_matiere_preferee', term: 3);
                },
                icon: const Icon(Icons.star_rounded),
                label: const Text('Ma matière préférée'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              children: _subjects.map((sub) {
                final isFav = sub['name'] == _favoriteSubject;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _favoriteSubject = sub['name'];
                        });
                        _audioService.playPhrase(sub['audio'], term: 3);
                      },
                      borderRadius: BorderRadius.circular(18),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isFav ? P5Colors.teal : P5Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: isFav ? P5Colors.gold : P5Colors.teal.withValues(alpha: 0.3),
                            width: isFav ? 3 : 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(sub['icon'] as IconData, size: 44, color: isFav ? P5Colors.gold : P5Colors.teal),
                            const SizedBox(height: 10),
                            Text(
                              sub['name'] as String,
                              style: P5Text.subheading(isFav ? P5Colors.white : P5Colors.charcoal).copyWith(fontSize: 16),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              sub['english'] as String,
                              style: P5Text.caption(isFav ? P5Colors.cream : P5Colors.charcoal),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            IconButton.filled(
                              style: IconButton.styleFrom(
                                backgroundColor: isFav ? P5Colors.gold : P5Colors.teal,
                                foregroundColor: isFav ? P5Colors.charcoal : P5Colors.white,
                              ),
                              onPressed: () {
                                _audioService.playPhrase(sub['audio'], term: 3);
                              },
                              icon: const Icon(Icons.volume_up_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: P5Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: P5Colors.gold, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Déclaration : "Ma matière préférée est $_favoriteSubject !"',
                  style: P5Text.body(P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: P5Colors.teal, foregroundColor: P5Colors.white),
                  onPressed: () {
                    _audioService.playClick();
                    widget.onComplete();
                  },
                  icon: const Icon(Icons.check_circle_rounded),
                  label: const Text('Valider'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
