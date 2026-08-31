import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 9 — Grand Bilan & Rallye de Révision du 1er Trimestre (BECE JSS3 Prep)
/// 4-Team Live Smartboard Championship Arena, 12 Comprehensive BECE Examination Drills,
/// Team Scoreboards, Buzzer SFX, and Gold Trophy Celebration.
class JSS3Term1RevisionRallyWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3Term1RevisionRallyWidget({super.key, required this.lesson});

  @override
  State<JSS3Term1RevisionRallyWidget> createState() => _JSS3Term1RevisionRallyWidgetState();
}

class _JSS3Term1RevisionRallyWidgetState extends State<JSS3Term1RevisionRallyWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  // 4 Teams state
  final Map<String, int> _teamScores = {
    'Équipe Bleue 🔵': 0,
    'Équipe Verte 🟢': 0,
    'Équipe Or 🟡': 0,
    'Équipe Rouge 🔴': 0,
  };
  String _activeBuzzerTeam = 'Équipe Bleue 🔵';

  // Rally Quiz State
  int _rallyIndex = 0;
  bool _rallyAnswered = false;
  int? _rallySelected;

  static const List<Map<String, dynamic>> _rallyQuestions = [
    {
      'unit': 'UNITÉ 1 — Description',
      'question': 'Où place-t-on l\'adjectif « BEAU » par rapport au nom ?',
      'options': ['Après le nom', 'Avant le nom (règle BANGS)', 'À la fin de la phrase', 'N\'importe où'],
      'correct': 1,
      'explanation': 'Les adjectifs de beauté (beau, joli) se placent AVANT le nom (Un bel homme, une belle robe).',
    },
    {
      'unit': 'UNITÉ 2 — Paysages',
      'question': 'Quelle phrase utilise correctement le verbe pour visiter un lieu ?',
      'options': [
        'Je rends visite à la Tour Eiffel.',
        'Je visite la Tour Eiffel.',
        'Je visite mon oncle.',
        'Je visite chez mon ami.',
      ],
      'correct': 1,
      'explanation': '"Visiter" s\'emploie pour les LIEUX (la Tour Eiffel). Pour les personnes, on dit "rendre visite à".',
    },
    {
      'unit': 'UNITÉ 3 — Habitudes',
      'question': 'Conjuguez le verbe pronominal : « Nous ___ (se réveiller) à six heures. »',
      'options': ['nous réveillons', 'se réveillons', 'vous réveillez', 'me réveille'],
      'correct': 0,
      'explanation': 'Pour "nous", le pronom réfléchi est "nous" : "Nous nous réveillons".',
    },
    {
      'unit': 'UNITÉ 4 — Passé Composé',
      'question': 'Quel auxiliaire utilise le verbe de mouvement « ALLER » ?',
      'options': ['AVOIR (j\'ai allé)', 'ÊTRE (je suis allé)', 'FAIRE (je fais allé)', 'ALLER (je vais allé)'],
      'correct': 1,
      'explanation': '"Aller" fait partie des 16 verbes de la Maison d\'ÊTRE : "Je suis allé(e)".',
    },
    {
      'unit': 'UNITÉ 5 — Objets',
      'question': 'Quelle préposition utilise-t-on devant les matières (bois, cuir, fer) ?',
      'options': ['À', 'DE', 'EN', 'PAR'],
      'correct': 2,
      'explanation': 'On utilise TOUJOURS la préposition "EN" : en bois, en cuir, en fer, en plastique.',
    },
    {
      'unit': 'UNITÉ 6 — Comparatifs',
      'question': 'Quel est le comparatif correct de l\'adjectif « BON » ?',
      'options': ['plus bon', 'meilleur', 'mieux', 'bonner'],
      'correct': 1,
      'explanation': '"Bon" est irrégulier : son comparatif est "meilleur" (f. meilleure).',
    },
    {
      'unit': 'UNITÉ 7 — Dater & Temps',
      'question': '« J\'habite à Lagos ___ cinq ans (et j\'y vis encore). »',
      'options': ['il y a', 'pendant', 'depuis', 'dans'],
      'correct': 2,
      'explanation': '"DEPUIS" s\'emploie avec le présent pour une action continue qui a débuté dans le passé.',
    },
    {
      'unit': 'UNITÉ 8 — Récit Chronologique',
      'question': 'Quel connecteur conclut un récit ou une journée ?',
      'options': ['D\'abord', 'Soudain', 'Enfin / Finalement', 'Ensuite'],
      'correct': 2,
      'explanation': '"Enfin" ou "Finalement" marque la conclusion chronologique du texte.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFD4AC0D), Color(0xFF0D7377)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.emoji_events_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Grand Rallye & Championnat de Révision du 1er Trimestre',
                  style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        // Tabs
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFFB7950B),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFFB7950B),
            tabs: const [
              Tab(icon: Icon(Icons.scoreboard_rounded, size: 18), text: 'Arène Quiz'),
              Tab(icon: Icon(Icons.groups_rounded, size: 18), text: 'Tableau 4 Équipes'),
              Tab(icon: Icon(Icons.military_tech_rounded, size: 18), text: 'Podium Trophée'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildRallyArenaTab(),
              _buildScoreboardTab(),
              _buildPodiumTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRallyArenaTab() {
    final q = _rallyQuestions[_rallyIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Buzzer Selector
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black12),
            ),
            child: Row(
              children: [
                const Icon(Icons.touch_app_rounded, color: Color(0xFFB7950B), size: 20),
                const SizedBox(width: 8),
                const Text('Buzzer Actif :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(width: 8),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _teamScores.keys.map((team) {
                        final isSelected = _activeBuzzerTeam == team;
                        return Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: ChoiceChip(
                            label: Text(team, style: const TextStyle(fontSize: 11)),
                            selected: isSelected,
                            selectedColor: Colors.amber.shade200,
                            onSelected: (val) {
                              if (val) {
                                setState(() => _activeBuzzerTeam = team);
                                _audio.playClick();
                              }
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Question Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFB7950B).withOpacity(0.4)),
              boxShadow: [
                BoxShadow(color: Colors.amber.withOpacity(0.06), blurRadius: 14, offset: const Offset(0, 4)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB7950B),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        q['unit'] as String,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ),
                    Text(
                      'Question #${_rallyIndex + 1} / ${_rallyQuestions.length}',
                      style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  q['question'] as String,
                  style: LangHueyTextStyles.h2.copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Options
          ...List.generate((q['options'] as List<String>).length, (i) {
            final opt = (q['options'] as List<String>)[i];
            final isCorrect = i == q['correct'];
            Color btnColor = Colors.white;
            Color textColor = LangHueyColors.charcoal;

            if (_rallyAnswered) {
              if (isCorrect) {
                btnColor = const Color(0xFF2ECC71);
                textColor = Colors.white;
              } else if (_rallySelected == i) {
                btnColor = const Color(0xFFE74C3C);
                textColor = Colors.white;
              }
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: !_rallyAnswered
                    ? () {
                        setState(() {
                          _rallyAnswered = true;
                          _rallySelected = i;
                          if (isCorrect) {
                            _teamScores[_activeBuzzerTeam] = (_teamScores[_activeBuzzerTeam] ?? 0) + 10;
                            _audio.playCorrect();
                          } else {
                            _audio.playIncorrect();
                          }
                        });
                      }
                    : null,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: btnColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _rallyAnswered && (isCorrect || _rallySelected == i) ? Colors.transparent : Colors.black12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(opt, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 14))),
                      if (_rallyAnswered && isCorrect)
                        const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20)
                      else if (_rallyAnswered && _rallySelected == i)
                        const Icon(Icons.cancel_rounded, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
            );
          }),

          if (_rallyAnswered) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.amber.shade300),
              ),
              child: Text('💡 ${q['explanation']}', style: TextStyle(color: Colors.brown.shade900, fontSize: 13)),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _rallyIndex = (_rallyIndex + 1) % _rallyQuestions.length;
                  _rallyAnswered = false;
                  _rallySelected = null;
                });
                _audio.playClick();
              },
              icon: const Icon(Icons.arrow_forward_rounded),
              label: Text(_rallyIndex + 1 < _rallyQuestions.length ? 'Épreuve Suivante' : 'Terminer le Championnat'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB7950B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildScoreboardTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tableau d\'Honneur des 4 Équipes :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 16),
          ..._teamScores.entries.map((entry) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entry.key, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: LangHueyColors.deepTeal.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${entry.value} pts',
                          style: const TextStyle(color: LangHueyColors.deepTeal, fontWeight: FontWeight.w900, fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline_rounded, color: Colors.green),
                        onPressed: () {
                          setState(() => _teamScores[entry.key] = entry.value + 5);
                          _audio.playClick();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline_rounded, color: Colors.red),
                        onPressed: () {
                          if (entry.value >= 5) {
                            setState(() => _teamScores[entry.key] = entry.value - 5);
                            _audio.playClick();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildPodiumTab() {
    final sorted = _teamScores.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final leader = sorted.first;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFF9E6), Color(0xFFFFF2C2)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFD4AC0D), width: 2),
            ),
            child: Column(
              children: [
                const Text('🏆', style: TextStyle(fontSize: 64)),
                const SizedBox(height: 8),
                Text('GRAND CHAMPION DU 1ER TRIMESTRE', style: TextStyle(color: Colors.brown.shade800, fontWeight: FontWeight.w900, letterSpacing: 1, fontSize: 13)),
                const SizedBox(height: 12),
                Text(leader.key, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFFB7950B))),
                const SizedBox(height: 6),
                Text('Score Final : ${leader.value} points !', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey.shade800)),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    _audio.playCelebration();
                  },
                  icon: const Icon(Icons.celebration_rounded),
                  label: const Text('Célébrer la Victoire ! 🎉'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB7950B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
