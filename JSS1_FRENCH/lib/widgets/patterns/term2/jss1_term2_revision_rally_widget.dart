import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1Term2RevisionRallyWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1Term2RevisionRallyWidget({super.key, required this.lesson});

  @override
  State<JSS1Term2RevisionRallyWidget> createState() => _JSS1Term2RevisionRallyWidgetState();
}

class _JSS1Term2RevisionRallyWidgetState extends State<JSS1Term2RevisionRallyWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedStationIndex = 0;
  final Map<int, int> _teamScores = {0: 15, 1: 20, 2: 10, 3: 25};

  final List<Map<String, dynamic>> _stations = [
    {
      'station': 'Station 1',
      'title': 'Propriétés & Demandes Polies',
      'weeks': 'Semaines 1 & 2',
      'icon': Icons.category_rounded,
      'audio': 'station_1_proprietes_et_demandes',
      'prompt': 'Comment dit-on : "Lend me your red pen please" ?',
      'options': [
        'Prête-moi ton stylo rouge, s\'il te plaît !',
        'Je prends la règle bleue',
        'Puis-je sortir dehors ?',
        'Le sac est lourd et dur'
      ],
      'correctIndex': 0,
      'explanation': '"Prête-moi" = lend me, "ton stylo rouge" = your red pen, "s\'il te plaît" = please.',
    },
    {
      'station': 'Station 2',
      'title': 'Les Métiers & Professions',
      'weeks': 'Semaine 3',
      'icon': Icons.work_rounded,
      'audio': 'station_2_metiers_et_professions',
      'prompt': 'Que fait l\'enseignante à l\'école ?',
      'options': [
        'Elle vend du tissu au marché',
        'Elle enseigne aux élèves avec dévouement',
        'Elle soigne les dents des malades',
        'Elle défend la loi au tribunal'
      ],
      'correctIndex': 1,
      'explanation': 'L\'enseignante enseigne aux élèves dans la classe.',
    },
    {
      'station': 'Station 3',
      'title': 'L\'Heure, Horaires & Dates',
      'weeks': 'Semaines 4, 5 & 6',
      'icon': Icons.access_time_rounded,
      'audio': 'station_3_heure_horaires_et_dates',
      'prompt': 'Quelle est la date de la fête de l\'Indépendance du Nigeria ?',
      'options': [
        'Le premier janvier',
        'Le premier octobre (1er octobre)',
        'Le 25 décembre',
        'Le 27 mai'
      ],
      'correctIndex': 1,
      'explanation': 'La fête nationale du Nigeria est célébrée le 1er octobre.',
    },
    {
      'station': 'Station 4',
      'title': 'Chronologie & Emploi du Temps',
      'weeks': 'Semaines 7 & 8',
      'icon': Icons.timeline_rounded,
      'audio': 'station_4_chronologie_et_semaine',
      'prompt': 'Complétez la phrase : "_______ le cours, les élèves écoutent le professeur."',
      'options': ['Avant de', 'Pendant', 'Hier', 'Jamais'],
      'correctIndex': 1,
      'explanation': '"Pendant le cours" exprime l\'action continue et simultanée pendant la classe.',
    },
  ];

  final List<Map<String, dynamic>> _teams = [
    {'name': 'Équipe Bleue', 'color': JSS1Colors.teal},
    {'name': 'Équipe Verte', 'color': JSS1Colors.green},
    {'name': 'Équipe Or', 'color': JSS1Colors.gold},
    {'name': 'Équipe Rouge', 'color': const Color(0xFFE53935)},
  ];

  int? _activeQuizSelection;
  bool _hasCheckedStation = false;

  void _awardPointsToTeam(int teamIdx) {
    setState(() {
      _teamScores[teamIdx] = (_teamScores[teamIdx] ?? 0) + 5;
    });
    _audioService.playPhrase('bonne_reponse_cinq_points', term: 2);
  }

  @override
  Widget build(BuildContext context) {
    final activeStation = _stations[_selectedStationIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: 4 Challenge Stations & Quiz Arena
        Expanded(
          flex: 7,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.charcoal.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('4 Stations de Défi du Trimestre', style: JSS1Text.subheading(JSS1Colors.teal), overflow: TextOverflow.ellipsis),
                      ),
                      IconButton(
                        icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal),
                        onPressed: () => _audioService.playPhrase(activeStation['audio'] as String, term: 2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // 4 Stations Selector
                  Row(
                    children: List.generate(_stations.length, (idx) {
                      final s = _stations[idx];
                      final isSelected = _selectedStationIndex == idx;
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: idx < 3 ? 8 : 0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedStationIndex = idx;
                                _activeQuizSelection = null;
                                _hasCheckedStation = false;
                              });
                              _audioService.playPhrase(s['audio'] as String, term: 2);
                            },
                            borderRadius: BorderRadius.circular(14),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey,
                                  width: isSelected ? 2 : 1,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(s['icon'] as IconData, color: isSelected ? JSS1Colors.gold : JSS1Colors.teal, size: 22),
                                  const SizedBox(height: 4),
                                  Text(s['station'] as String, style: TextStyle(color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal, fontWeight: FontWeight.w900, fontSize: 12)),
                                  Text(s['weeks'] as String, style: TextStyle(color: isSelected ? JSS1Colors.gold : JSS1Colors.grey, fontSize: 10)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 12),

                  // Active Station Challenge Box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: JSS1Colors.cream,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: JSS1Colors.teal.withValues(alpha: 0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Défi : ${activeStation['title']}',
                              style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1),
                            ),
                            InkWell(
                              onTap: () => _audioService.playPhrase('appuyez_sur_le_buzzer_pour_repondre', term: 2),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: JSS1Colors.gold,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.touch_app_rounded, size: 14, color: JSS1Colors.charcoal),
                                    SizedBox(width: 4),
                                    Text('Buzzer !', style: TextStyle(color: JSS1Colors.charcoal, fontWeight: FontWeight.bold, fontSize: 11)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          activeStation['prompt'] as String,
                          style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Multiple Choice Options
                  ...List.generate((activeStation['options'] as List<String>).length, (optIdx) {
                    final opt = (activeStation['options'] as List<String>)[optIdx];
                    final isSelected = _activeQuizSelection == optIdx;
                    final isCorrect = optIdx == activeStation['correctIndex'];

                    Color cardBg = JSS1Colors.white;
                    Color borderColor = JSS1Colors.lightGrey;

                    if (_hasCheckedStation) {
                      if (isCorrect) {
                        cardBg = JSS1Colors.green.withValues(alpha: 0.15);
                        borderColor = JSS1Colors.green;
                      } else if (isSelected && !isCorrect) {
                        cardBg = const Color(0xFFFFEBEE);
                        borderColor = const Color(0xFFE53935);
                      }
                    } else if (isSelected) {
                      cardBg = JSS1Colors.teal.withValues(alpha: 0.1);
                      borderColor = JSS1Colors.teal;
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () {
                          if (!_hasCheckedStation) {
                            setState(() => _activeQuizSelection = optIdx);
                            _audioService.playClick();
                          }
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: borderColor, width: isSelected ? 2 : 1),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
                                child: Text(
                                  String.fromCharCode(65 + optIdx),
                                  style: TextStyle(
                                    color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  opt,
                                  style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 10),

                  // Validation Button
                  if (!_hasCheckedStation)
                    ElevatedButton(
                      onPressed: _activeQuizSelection == null
                          ? null
                          : () {
                              setState(() => _hasCheckedStation = true);
                              final isCorrect = _activeQuizSelection == activeStation['correctIndex'];
                              if (isCorrect) {
                                _audioService.playCorrect();
                              } else {
                                _audioService.playIncorrect();
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: JSS1Colors.teal,
                        foregroundColor: JSS1Colors.white,
                        minimumSize: const Size(double.infinity, 44),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Vérifier la Réponse du Défi', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),

                  if (_hasCheckedStation)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: JSS1Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: JSS1Colors.green),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_rounded, color: JSS1Colors.green, size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              activeStation['explanation'] as String,
                              style: const TextStyle(color: JSS1Colors.charcoal, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        // Right Column: 4-Team Live Scoreboard & Buzzer Controller
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: JSS1Colors.teal,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.teal.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('TABLEAU DES SCORES', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1.2), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.celebration_rounded, color: JSS1Colors.gold, size: 26),
                      onPressed: () {
                        _audioService.playCelebrate();
                        _audioService.playPhrase('felicitations_pour_le_deuxieme_trimestre', term: 2);
                      },
                    ),
                  ],
                ),

                // 4 Teams Live Point Tiles
                ...List.generate(_teams.length, (tIdx) {
                  final t = _teams[tIdx];
                  final score = _teamScores[tIdx] ?? 0;

                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: JSS1Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: t['color'] as Color,
                            ),
                            const SizedBox(width: 10),
                            Text(t['name'] as String, style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800, fontSize: 13)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('$score pts', style: JSS1Text.subheading(JSS1Colors.teal).copyWith(fontWeight: FontWeight.w900, fontSize: 15)),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () => _awardPointsToTeam(tIdx),
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: JSS1Colors.gold,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.add_rounded, size: 16, color: JSS1Colors.charcoal),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),

                // Term 2 Grand Celebration Button
                InkWell(
                  onTap: () {
                    _audioService.playCelebrate();
                    _audioService.playPhrase('felicitations_pour_le_deuxieme_trimestre', term: 2);
                  },
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: JSS1Colors.gold,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.emoji_events_rounded, color: JSS1Colors.charcoal, size: 22),
                        const SizedBox(width: 8),
                        Text(
                          'Célébration du 2e Trimestre !',
                          style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
