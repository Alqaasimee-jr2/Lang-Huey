import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5ExtendedFamilyWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5ExtendedFamilyWidget({super.key, required this.onComplete});

  @override
  State<P5ExtendedFamilyWidget> createState() => _P5ExtendedFamilyWidgetState();
}

class _P5ExtendedFamilyWidgetState extends State<P5ExtendedFamilyWidget> {
  final P5AudioService _audioService = P5AudioService();
  String _selectedRole = 'Le grand-père';
  String _selectedPossessive = 'Mon';

  final List<Map<String, dynamic>> _familyMembers = [
    {
      'role': 'Le grand-père',
      'english': 'Grandfather',
      'possessive': 'Mon',
      'icon': Icons.elderly_rounded,
      'audio': 'le_grand_pere',
      'desc': 'Le père de mon père ou de ma mère'
    },
    {
      'role': 'La grand-mère',
      'english': 'Grandmother',
      'possessive': 'Ma',
      'icon': Icons.elderly_woman_rounded,
      'audio': 'la_grand_mere',
      'desc': 'La mère de mon père ou de ma mère'
    },
    {
      'role': 'L\'oncle',
      'english': 'Uncle',
      'possessive': 'Mon',
      'icon': Icons.person_rounded,
      'audio': 'loncle',
      'desc': 'Le frère de mon père ou de ma mère'
    },
    {
      'role': 'La tante',
      'english': 'Aunt',
      'possessive': 'Ma',
      'icon': Icons.person_3_rounded,
      'audio': 'la_tante',
      'desc': 'La sœur de mon père ou de ma mère'
    },
    {
      'role': 'Le cousin',
      'english': 'Male Cousin',
      'possessive': 'Mon',
      'icon': Icons.boy_rounded,
      'audio': 'le_cousin',
      'desc': 'Le fils de mon oncle ou de ma tante'
    },
    {
      'role': 'La cousine',
      'english': 'Female Cousin',
      'possessive': 'Ma',
      'icon': Icons.girl_rounded,
      'audio': 'la_cousine',
      'desc': 'La fille de mon oncle ou de ma tante'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final current = _familyMembers.firstWhere(
      (m) => m['role'] == _selectedRole,
      orElse: () => _familyMembers.first,
    );

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.cream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.teal, width: 3),
      ),
      child: Row(
        children: [
          // Left: Interactive Family Tree Grid
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1. Touchez un Membre de la Famille :', style: P5Text.subheading(P5Colors.charcoal)),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: P5Colors.gold,
                        foregroundColor: P5Colors.charcoal,
                      ),
                      onPressed: () {
                        _audioService.playPhrase('mon_ma_mes', term: 2);
                      },
                      icon: const Icon(Icons.volume_up_rounded),
                      label: const Text('Règle : Mon / Ma / Mes'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 1.3,
                    ),
                    itemCount: _familyMembers.length,
                    itemBuilder: (context, index) {
                      final item = _familyMembers[index];
                      final isSelected = item['role'] == _selectedRole;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedRole = item['role'];
                            _selectedPossessive = item['possessive'];
                          });
                          _audioService.playPhrase(item['audio'], term: 2);
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isSelected ? P5Colors.teal : P5Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected ? P5Colors.gold : P5Colors.teal.withValues(alpha: 0.3),
                              width: isSelected ? 3 : 1.5,
                            ),
                            boxShadow: isSelected
                                ? [BoxShadow(color: P5Colors.teal.withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 4))]
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                item['icon'] as IconData,
                                size: 36,
                                color: isSelected ? P5Colors.gold : P5Colors.teal,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item['role'] as String,
                                style: P5Text.body(isSelected ? P5Colors.white : P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                item['english'] as String,
                                style: P5Text.caption(isSelected ? P5Colors.cream : P5Colors.charcoal),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 24),

          // Right: Showcase Card & Sentence Builder
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: P5Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: P5Colors.gold, width: 2.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Présentation de la Famille', style: P5Text.subheading(P5Colors.teal), textAlign: TextAlign.center),
                  const Divider(height: 24),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 44,
                          backgroundColor: P5Colors.teal,
                          child: Icon(current['icon'] as IconData, size: 48, color: P5Colors.gold),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Voici ${_selectedPossessive.toLowerCase()} ${_selectedRole.toLowerCase().replaceAll('le ', '').replaceAll('la ', '').replaceAll('l\'', '')} !',
                          style: P5Text.heading(P5Colors.charcoal).copyWith(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'English: This is my ${current['english']}',
                          style: P5Text.body(P5Colors.charcoal),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: P5Colors.cream,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            current['desc'] as String,
                            style: P5Text.caption(P5Colors.teal).copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: P5Colors.teal,
                            foregroundColor: P5Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            _audioService.playPhrase(current['audio'], term: 2);
                          },
                          icon: const Icon(Icons.volume_up_rounded),
                          label: const Text('Prononcer'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: P5Colors.gold,
                          foregroundColor: P5Colors.charcoal,
                        ),
                        onPressed: () {
                          _audioService.playClick();
                          widget.onComplete();
                        },
                        icon: const Icon(Icons.check_circle_rounded),
                        tooltip: 'Complete Station',
                      ),
                    ],
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
