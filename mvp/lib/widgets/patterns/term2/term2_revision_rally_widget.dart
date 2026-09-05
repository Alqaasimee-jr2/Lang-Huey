import 'package:flutter/material.dart';
import '../../../models/p4_lesson_model.dart';
import '../../../services/p4_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Term 2 Weeks 5, 11 & 12 Pattern: Comprehensive Term 2 Revision Rally & Oral Speed Check
class Term2RevisionRallyWidget extends StatefulWidget {
  final P4Lesson lesson;

  const Term2RevisionRallyWidget({super.key, required this.lesson});

  @override
  State<Term2RevisionRallyWidget> createState() =>
      _Term2RevisionRallyWidgetState();
}

class _Term2RevisionRallyWidgetState extends State<Term2RevisionRallyWidget> {
  int _activeTopicIndex = 0;

  final List<Map<String, dynamic>> _revisionTopics = [
    {
      'title': '1. Famille & Possessifs',
      'icon': Icons.family_restroom_rounded,
      'items': [
        {'prompt': 'Father / Mother:', 'french': 'Mon père / Ma mère', 'detail': 'Mon = Masc, Ma = Fem', 'audio': 'mon_pere_ma_mere'},
        {'prompt': 'Brother / Sister:', 'french': 'Mon frère / Ma sœur', 'detail': 'Close siblings', 'audio': 'mon_frere_ma_soeur'},
        {'prompt': 'Grandparents:', 'french': 'Grand-père & Grand-mère', 'detail': 'Generation 1', 'audio': 'grand_pere_grand_mere'},
        {'prompt': 'Uncle / Aunt:', 'french': 'L\'oncle & La tante', 'detail': 'Extended family', 'audio': 'oncle_et_tante'},
      ],
    },
    {
      'title': '2. L\'École & Les Lieux',
      'icon': Icons.school_rounded,
      'items': [
        {'prompt': 'Stationery:', 'french': 'Le stylo, Le cahier, Le livre', 'detail': 'Masculine items', 'audio': 'stylo_et_cahier'},
        {'prompt': 'Board & Desk:', 'french': 'Le tableau & Le bureau', 'detail': 'Classroom furniture', 'audio': 'livre_et_tableau'},
        {'prompt': 'Library:', 'french': 'La bibliothèque', 'detail': 'Quiet study place', 'audio': 'la_bibliotheque'},
        {'prompt': 'Playground:', 'french': 'La cour de récréation', 'detail': 'Outdoor recreation', 'audio': 'la_cour_de_recreation'},
      ],
    },
    {
      'title': '3. Verbes & Jours',
      'icon': Icons.calendar_month_rounded,
      'items': [
        {'prompt': 'Verb Avoir (Singular):', 'french': 'J\'ai, Tu as, Il a, Elle a', 'detail': 'To have (possession)', 'audio': 'avoir_singular'},
        {'prompt': 'Verb Aller (Singular):', 'french': 'Je vais, Tu vas, Il va, Elle va', 'detail': 'To go (direction)', 'audio': 'je_vais'},
        {'prompt': 'School Days:', 'french': 'Lundi, Mardi, Mercredi, Jeudi, Vendredi', 'detail': '5 class days', 'audio': 'jours_semaine_all'},
        {'prompt': 'Action Verbs:', 'french': 'Lire, Écrire, Étudier, Jouer', 'detail': 'Daily actions', 'audio': 'lire'},
      ],
    },
    {
      'title': '4. Couleurs & Prépositions',
      'icon': Icons.palette_rounded,
      'items': [
        {'prompt': '6 Core Colors:', 'french': 'Rouge, Bleu, Jaune, Vert, Noir, Blanc', 'detail': 'Placed after nouns', 'audio': 'couleurs_all'},
        {'prompt': 'On & Under:', 'french': 'Sur (on) & Sous (under)', 'detail': 'Sur la table / Sous le bureau', 'audio': 'sur'},
        {'prompt': 'In / Inside:', 'french': 'Dans le sac', 'detail': 'Enclosure', 'audio': 'dans'},
        {'prompt': 'In Front & Behind:', 'french': 'Devant & Derrière', 'detail': 'Front and back', 'audio': 'devant_derriere'},
      ],
    },
  ];

  void _playPhrase(String? audioKey) {
    if (audioKey != null) {
      P4AudioService().playPhrase(audioKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final active = _revisionTopics[_activeTopicIndex];
    final items = active['items'] as List<Map<String, String>>;

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
                    'Term 2 Speed Revision Rally & Oral Speed Check',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Cycle through core Term 2 categories: Family, School, Verbs, Days, and Colors',
                    style: LHText.body(LHColors.grey).copyWith(fontSize: 15),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: LHColors.cream,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'TAP CARDS TO LISTEN',
                  style: LHText.label(LHColors.charcoal).copyWith(fontSize: 12),
                ),
              ),
            ],
          ),

          const Divider(height: 20),

          // Topic Selectors
          Row(
            children: List.generate(_revisionTopics.length, (idx) {
              final topic = _revisionTopics[idx];
              final isCurrent = idx == _activeTopicIndex;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: idx < _revisionTopics.length - 1 ? 12 : 0),
                  child: Material(
                    color: isCurrent ? LHColors.teal : LHColors.cream,
                    borderRadius: BorderRadius.circular(14),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        setState(() => _activeTopicIndex = idx);
                        P4AudioService().playSfx(P4SfxType.click);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              topic['icon'] as IconData,
                              color: isCurrent ? LHColors.gold : LHColors.teal,
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                topic['title'] as String,
                                style: LHText.body(isCurrent ? LHColors.white : LHColors.charcoal).copyWith(
                                  fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w600,
                                  fontSize: 13,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 20),

          // 4 Big Flash Cards for Active Topic
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.2,
              ),
              itemCount: items.length,
              itemBuilder: (context, idx) {
                final item = items[idx];
                return Material(
                  color: LHColors.cream.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(18),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () => _playPhrase(item['audio']),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: LHColors.teal.withValues(alpha: 0.25), width: 1.5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item['prompt']!,
                                  style: LHText.label(LHColors.teal).copyWith(fontSize: 12),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['french']!,
                                  style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 18),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['detail']!,
                                  style: LHText.body(LHColors.grey).copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: LHColors.gold,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
