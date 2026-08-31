import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1Term3AnnualGrandRallyWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1Term3AnnualGrandRallyWidget({super.key, required this.lesson});

  @override
  State<JSS1Term3AnnualGrandRallyWidget> createState() => _JSS1Term3AnnualGrandRallyWidgetState();
}

class _JSS1Term3AnnualGrandRallyWidgetState extends State<JSS1Term3AnnualGrandRallyWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedView = 0; // 0: 4-Team Rally, 1: Diplôme Officiel
  int _selectedStationIndex = 0;
  final Map<int, int> _teamScores = {0: 30, 1: 35, 2: 25, 3: 40};

  final List<Map<String, dynamic>> _stations = [
    {
      'station': 'Station 1',
      'title': 'Les Bases du Trimestre 1',
      'icon': Icons.looks_one_rounded,
      'audio': 'station_1_bases_trimestre_1',
      'prompt': 'Comment répond-on à : "Comment allez-vous ?"',
      'options': [
        'Très bien, merci ! Et vous ?',
        'Il fait très chaud',
        'Je vais au marché',
        'Je m\'appelle Chukwuma'
      ],
      'correct': 0,
      'explanation': 'La réponse de courtoisie universelle est "Très bien, merci ! Et vous ?".',
    },
    {
      'station': 'Station 2',
      'title': 'Le Trimestre 2 en Action',
      'icon': Icons.looks_two_rounded,
      'audio': 'station_2_trimestre_2_en_action',
      'prompt': 'Que fait l\'ingénieure dans son travail ?',
      'options': [
        'Elle vend du tissu',
        'Elle conçoit des ponts et des bâtiments',
        'Elle soigne les dents des enfants',
        'Elle cultive des légumes'
      ],
      'correct': 1,
      'explanation': 'L\'ingénieure conçoit des structures et des innovations technologiques.',
    },
    {
      'station': 'Station 3',
      'title': 'La Maîtrise du Trimestre 3',
      'icon': Icons.looks_3_rounded,
      'audio': 'station_3_maitrise_trimestre_3',
      'prompt': 'Quelle phrase exprime une invitation polie ?',
      'options': [
        'Ne courez pas !',
        'Tu veux venir chez moi ce week-end ?',
        'Il est huit heures pile',
        'Je n\'aime pas le poisson'
      ],
      'correct': 1,
      'explanation': '"Tu veux venir chez moi... ?" est la formule clé d\'invitation amicale.',
    },
    {
      'station': 'Station 4',
      'title': 'Défi Suprême de Synthèse',
      'icon': Icons.looks_4_rounded,
      'audio': 'station_4_defi_supreme',
      'prompt': 'Où se place l\'adverbe de fréquence dans la phrase ?',
      'options': [
        'Avant le sujet',
        'Directement après le verbe conjugué',
        'À la fin obligatoire de la phrase',
        'Entre deux adjectifs'
      ],
      'correct': 1,
      'explanation': 'Règle d\'or : l\'adverbe se place directement après le verbe (ex. "Je fais toujours mes devoirs").',
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
      _teamScores[teamIdx] = (_teamScores[teamIdx] ?? 0) + 10;
    });
    _audioService.playPhrase('victoire_eclatante_dix_points', term: 3);
  }

  @override
  Widget build(BuildContext context) {
    final activeStation = _stations[_selectedStationIndex];

    return Column(
      children: [
        // Mode Selector Bar (Rally vs Diploma)
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: JSS1Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: JSS1Colors.lightGrey),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => setState(() => _selectedView = 0),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: _selectedView == 0 ? JSS1Colors.teal : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.emoji_events_rounded, size: 18, color: _selectedView == 0 ? JSS1Colors.gold : JSS1Colors.charcoal),
                        const SizedBox(width: 6),
                        Text(
                          '1. Grand Rallye Annuel (4 Équipes)',
                          style: TextStyle(color: _selectedView == 0 ? JSS1Colors.white : JSS1Colors.charcoal, fontWeight: FontWeight.w900, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() => _selectedView = 1);
                    _audioService.playCelebrate();
                    _audioService.playPhrase('diplome_officiel_de_francais_jss1', term: 3);
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: _selectedView == 1 ? JSS1Colors.gold : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.workspace_premium_rounded, size: 18, color: JSS1Colors.charcoal),
                        SizedBox(width: 6),
                        Text(
                          '2. Diplôme Officiel de Réussite JSS1 🎓',
                          style: TextStyle(color: JSS1Colors.charcoal, fontWeight: FontWeight.w900, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // Main Stage View
        Expanded(
          child: _selectedView == 0 ? _buildRallyArena(activeStation) : _buildDiplomaStage(),
        ),
      ],
    );
  }

  Widget _buildRallyArena(Map<String, dynamic> activeStation) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: 4 Station Challenges
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
                        child: Text('4 Stations du Bilan Annuel', style: JSS1Text.subheading(JSS1Colors.teal), overflow: TextOverflow.ellipsis),
                      ),
                      IconButton(
                        icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal),
                        onPressed: () => _audioService.playPhrase(activeStation['audio'] as String, term: 3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Stations Row
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
                              _audioService.playPhrase(s['audio'] as String, term: 3);
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                              decoration: BoxDecoration(
                                color: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Icon(s['icon'] as IconData, color: isSelected ? JSS1Colors.gold : JSS1Colors.teal, size: 20),
                                  const SizedBox(height: 4),
                                  Text(
                                    s['station'] as String,
                                    style: TextStyle(color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal, fontWeight: FontWeight.w900, fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 10),

                  // Active Station Prompt Box
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: JSS1Colors.cream,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: JSS1Colors.teal.withValues(alpha: 0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Défi : ${activeStation['title']}', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(
                          activeStation['prompt'] as String,
                          style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 15, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Multiple Choice Options
                  ...List.generate((activeStation['options'] as List<String>).length, (optIdx) {
                    final opt = (activeStation['options'] as List<String>)[optIdx];
                    final isSelected = _activeQuizSelection == optIdx;
                    final isCorrect = optIdx == activeStation['correct'];

                    Color cardBg = JSS1Colors.white;
                    if (_hasCheckedStation) {
                      if (isCorrect) {
                        cardBg = JSS1Colors.green.withValues(alpha: 0.15);
                      } else if (isSelected && !isCorrect) {
                        cardBg = const Color(0xFFFFEBEE);
                      }
                    } else if (isSelected) {
                      cardBg = JSS1Colors.teal.withValues(alpha: 0.1);
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: InkWell(
                        onTap: () {
                          if (!_hasCheckedStation) {
                            setState(() => _activeQuizSelection = optIdx);
                            _audioService.playClick();
                          }
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
                                child: Text(
                                  String.fromCharCode(65 + optIdx),
                                  style: TextStyle(color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal, fontWeight: FontWeight.bold, fontSize: 11),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(opt, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 8),

                  if (!_hasCheckedStation)
                    ElevatedButton(
                      onPressed: _activeQuizSelection == null
                          ? null
                          : () {
                              setState(() => _hasCheckedStation = true);
                              final isCorrect = _activeQuizSelection == activeStation['correct'];
                              if (isCorrect) {
                                _audioService.playCorrect();
                              } else {
                                _audioService.playIncorrect();
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: JSS1Colors.teal,
                        foregroundColor: JSS1Colors.white,
                        minimumSize: const Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Vérifier la Réponse', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),

                  if (_hasCheckedStation)
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: JSS1Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_rounded, color: JSS1Colors.green, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              activeStation['explanation'] as String,
                              style: const TextStyle(color: JSS1Colors.charcoal, fontSize: 11, fontWeight: FontWeight.bold),
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

        // Right Column: 4 Teams Live Points & Grand Finale Trigger
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
                      child: Text('CLASSEMENT DES 4 ÉQUIPES', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1.2), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.celebration_rounded, color: JSS1Colors.gold, size: 26),
                      onPressed: () {
                        _audioService.playCelebrate();
                        _audioService.playPhrase('bravo_a_tous_rendez_vous_en_jss2', term: 3);
                      },
                    ),
                  ],
                ),

                // 4 Teams Live Points
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
                        Expanded(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: t['color'] as Color,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(t['name'] as String, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13), overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
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

                // Final Button: Go to Diploma Ceremony
                InkWell(
                  onTap: () {
                    setState(() => _selectedView = 1);
                    _audioService.playCelebrate();
                    _audioService.playPhrase('diplome_officiel_de_francais_jss1', term: 3);
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.workspace_premium_rounded, color: JSS1Colors.charcoal, size: 22),
                        SizedBox(width: 8),
                        Text(
                          'Cérémonie de Remise des Diplômes !',
                          style: TextStyle(color: JSS1Colors.charcoal, fontWeight: FontWeight.w900, fontSize: 13),
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

  Widget _buildDiplomaStage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: JSS1Colors.cream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: JSS1Colors.gold, width: 4),
        boxShadow: [
          BoxShadow(
            color: JSS1Colors.charcoal.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Diploma Header
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.workspace_premium_rounded, color: JSS1Colors.gold, size: 36),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        'DIPLÔME D\'HONNEUR EN LANGUE FRANÇAISE',
                        style: JSS1Text.heroHeading(JSS1Colors.teal).copyWith(fontSize: 22, letterSpacing: 1.2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.workspace_premium_rounded, color: JSS1Colors.gold, size: 36),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'PROGRAMME NATIONAL NIGÉRIAN NERDC — CLASSE DE JUNIOR SECONDARY SCHOOL 1 (JSS1)',
                  style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.8),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Certificate Body
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: JSS1Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: JSS1Colors.teal.withValues(alpha: 0.3)),
              ),
              child: Column(
                children: [
                  const Text(
                    'Décerné solennellement à l\'élève :',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 13, color: JSS1Colors.grey),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'CHAMPION(NE) DE JSS1 FRENCH',
                    style: JSS1Text.heroHeading(JSS1Colors.teal).copyWith(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Pour avoir complété avec succès les 3 Trimestres de Français :\n• Premier Trimestre : Salutations, Alphabet & Descriptions\n• Deuxième Trimestre : Métiers, L\'heure, Routine & Dates\n• Troisième Trimestre : Météo, Fréquence, Invitations & Préparation BECE',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: JSS1Colors.charcoal, height: 1.4, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Signatures & Celebration Action
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('LANG HUEY SMARTBOARD', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.w900)),
                      Text('Certifié Conforme NERDC', style: JSS1Text.caption(JSS1Colors.grey)),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _audioService.playCelebrate();
                    _audioService.playPhrase('bravo_a_tous_rendez_vous_en_jss2', term: 3);
                  },
                  icon: const Icon(Icons.celebration_rounded, color: JSS1Colors.charcoal),
                  label: const Text('Célébrer la Promotion en JSS2 ! 🎉', style: TextStyle(color: JSS1Colors.charcoal, fontWeight: FontWeight.w900, fontSize: 12)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: JSS1Colors.gold,
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('LE PROFESSEUR DE FRANÇAIS', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.w900)),
                      Text('Mention Très Honorable', style: JSS1Text.caption(JSS1Colors.green).copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
