import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 9 (Term 2) — Grand Bilan & Rallye de Révision du 2e Trimestre (Simulation BECE)
/// 4-Team Championship Arena, 12 Term 2 BECE Drills, Live Buzzer SFX, and Silver Trophy Podium.
class JSS3Term2RevisionRallyWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3Term2RevisionRallyWidget({super.key, required this.lesson});

  @override
  State<JSS3Term2RevisionRallyWidget> createState() =>
      _JSS3Term2RevisionRallyWidgetState();
}

class _JSS3Term2RevisionRallyWidgetState
    extends State<JSS3Term2RevisionRallyWidget> {
  final JSS3AudioService _audio = JSS3AudioService();

  // Team scores
  final Map<String, int> _teamScores = {
    'Équipe Bleue 🔵': 0,
    'Équipe Verte 🟢': 0,
    'Équipe Or 🟡': 0,
    'Équipe Rouge 🔴': 0,
  };

  String _selectedActiveTeam = 'Équipe Bleue 🔵';
  int _currentQuestionIndex = 0;
  bool _answered = false;
  int? _selectedOption;
  bool _showFinalPodium = false;

  static const List<Map<String, dynamic>> _rallyQuestions = [
    {
      'unit': 'Unité 1 : Relater au Passé',
      'prompt': '« Pendant que nous ___ nos valises, le taxi est arrivé. » (préparer)',
      'options': ['préparons', 'préparions (Imparfait)', 'avons préparé', 'préparerons'],
      'correct': 1,
      'expl': 'Action continue en cours avec "Pendant que" ➔ Imparfait (« préparions »).',
    },
    {
      'unit': 'Unité 2 : Le Passé Récent',
      'prompt': 'Comment traduit-on : "The headmaster has just made an announcement" ?',
      'options': [
        'Le proviseur va faire une annonce.',
        'Le proviseur vient de faire une annonce.',
        'Le proviseur faisait une annonce.',
        'Le proviseur a fait une annonce hier.',
      ],
      'correct': 1,
      'expl': 'Passé récent : VENIR au présent + DE + Infinitif ➔ « vient de faire ».',
    },
    {
      'unit': 'Unité 3 : Journal Intime',
      'prompt': 'Quelle formule ouvre traditionnellement une entrée de journal intime ?',
      'options': ['Monsieur le Juge,', 'Cher journal,', 'À toute la famille,', 'Chers collègues,'],
      'correct': 1,
      'expl': 'La formule standard est « Cher journal, » précédée de la date.',
    },
    {
      'unit': 'Unité 4 : Le Futur Proche',
      'prompt': 'Mettez à la forme négative : « Je vais abandonner. »',
      'options': [
        'Je vais ne pas abandonner.',
        'Je ne vais pas abandonner !',
        'Je ne vais abandonner pas.',
        'Je ne pas vais abandonner.',
      ],
      'correct': 1,
      'expl': 'Ne... pas encadre le verbe auxiliaire ALLER : « Je ne vais pas abandonner ! ».',
    },
    {
      'unit': 'Unité 5 : Le Futur Simple',
      'prompt': 'Quel est le futur simple du verbe ÊTRE pour « Nous » ?',
      'options': ['Nous sommes', 'Nous serons', 'Nous étions', 'Nous allons être'],
      'correct': 1,
      'expl': 'Radical de ÊTRE = « ser- » + terminaison « -ons » ➔ « Nous serons ».',
    },
    {
      'unit': 'Unité 5 : Hypothèse avec SI',
      'prompt': '« Si tu étudies avec discipline, tu ___ tous tes examens. » (réussir)',
      'options': ['réussissais', 'réussiras (Futur simple)', 'as réussi', 'réussirais'],
      'correct': 1,
      'expl': 'Règle d\'or BECE : SI + Présent ➔ FUTUR SIMPLE (« réussiras »).',
    },
    {
      'unit': 'Unité 6 : Consolidation',
      'prompt': 'Quel temps exprime une action à long terme dans l\'avenir ?',
      'options': ['Le Passé Récent', 'L\'Imparfait', 'Le Futur Simple', 'Le Passé Composé'],
      'correct': 2,
      'expl': 'Le Futur Simple exprime des projets d\'avenir lointains et des ambitions.',
    },
    {
      'unit': 'Unité 7 : Pronoms d\'Objet',
      'prompt': '« Fatima écrit une lettre à sa mère ➔ Fatima ___ écrit une lettre. »',
      'options': ['la', 'lui', 'leur', 'les'],
      'correct': 1,
      'expl': '« À sa mère » est un COI singulier ➔ pronom « lui » (« Fatima lui écrit »).',
    },
    {
      'unit': 'Unité 7 : Accord avec ÊTRE',
      'prompt': '« Les championnes de relais sont ___ sur le podium. » (monter)',
      'options': ['monté', 'montée', 'montés', 'montées'],
      'correct': 3,
      'expl': 'Avec ÊTRE, accord au féminin pluriel (+es) ➔ « montées ».',
    },
    {
      'unit': 'Unité 8 : Connecteurs de Rédaction',
      'prompt': 'Quel connecteur logique permet d\'introduire la conclusion d\'une rédaction ?',
      'options': ['Tout d\'abord', 'Soudain', 'Pour conclure / En somme', 'Pendant ce temps'],
      'correct': 2,
      'expl': '« Pour conclure » ou « En somme » introduit le paragraphe de conclusion.',
    },
    {
      'unit': 'Unité 8 : Orthographe BECE',
      'prompt': 'Quel mot est correctement accentué en français ?',
      'options': ['medecin', 'médecin', 'mèdécin', 'médecîn'],
      'correct': 1,
      'expl': '« médecin » prend un accent aigu sur le premier e.',
    },
    {
      'unit': 'Grand Bilan : Synthèse',
      'prompt': 'Quelle phrase associe parfaitement le Passé Récent et le Futur Proche ?',
      'options': [
        'Je viens de réviser et maintenant je vais réussir le BECE !',
        'Je vais de réviser et je viens réussir.',
        'Je venais réviser et je viens de réussir.',
        'Je suis de réviser et je vais révisé.',
      ],
      'correct': 0,
      'expl': '« Je viens de réviser (Passé Récent) et maintenant je vais réussir (Futur Proche) » !',
    },
  ];

  @override
  Widget build(BuildContext context) {
    if (_showFinalPodium) {
      return _buildPodiumView();
    }

    final q = _rallyQuestions[_currentQuestionIndex];

    return Column(
      children: [
        // Live Rally Top Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1B4F72), Color(0xFF2C3E50)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.emoji_events_rounded, color: Colors.amber, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Grand Bilan & Simulation BECE — 2e Trimestre',
                  style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 16),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.workspace_premium_rounded, color: Colors.amber),
                tooltip: 'Voir le Podium',
                onPressed: () {
                  setState(() => _showFinalPodium = true);
                  _audio.playCelebrate();
                },
              ),
            ],
          ),
        ),

        // Live Team Scoreboard Bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          color: const Color(0xFF152238),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _teamScores.keys.map((team) {
                final isSelected = _selectedActiveTeam == team;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      setState(() => _selectedActiveTeam = team);
                      _audio.playClick();
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: isSelected ? Colors.amber : Colors.white24, width: isSelected ? 2 : 1),
                      ),
                      child: Row(
                        children: [
                          Text(team, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: isSelected ? Colors.black87 : Colors.white)),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(6)),
                            child: Text('${_teamScores[team]}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        // Question Arena Area
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xFF1B4F72).withOpacity(0.12), borderRadius: BorderRadius.circular(8)),
                      child: Text(q['unit'] as String, style: const TextStyle(color: Color(0xFF1B4F72), fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    Text('Défi #${_currentQuestionIndex + 1} / ${_rallyQuestions.length}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 14),

                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.black12),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Text(
                    q['prompt'] as String,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.4),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 18),

                ...List.generate((q['options'] as List<String>).length, (idx) {
                  final opt = (q['options'] as List<String>)[idx];
                  final isCorrect = idx == q['correct'];
                  Color btnBg = Colors.white;
                  Color textCol = LangHueyColors.charcoal;

                  if (_answered) {
                    if (isCorrect) {
                      btnBg = const Color(0xFF27AE60);
                      textCol = Colors.white;
                    } else if (_selectedOption == idx) {
                      btnBg = const Color(0xFFE74C3C);
                      textCol = Colors.white;
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: !_answered
                          ? () {
                              setState(() {
                                _answered = true;
                                _selectedOption = idx;
                                if (isCorrect) {
                                  _teamScores[_selectedActiveTeam] = (_teamScores[_selectedActiveTeam] ?? 0) + 10;
                                  _audio.playCorrect();
                                } else {
                                  _audio.playIncorrect();
                                }
                              });
                            }
                          : null,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: btnBg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _answered && (isCorrect || _selectedOption == idx) ? Colors.transparent : Colors.black12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(opt, style: TextStyle(color: textCol, fontWeight: FontWeight.bold, fontSize: 14)),
                            ),
                            if (_answered && isCorrect)
                              const Icon(Icons.check_circle_rounded, color: Colors.white)
                            else if (_answered && _selectedOption == idx)
                              const Icon(Icons.cancel_rounded, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  );
                }),

                if (_answered) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blueGrey.shade200),
                    ),
                    child: Text('💡 ${q['expl']}', style: TextStyle(color: Colors.blueGrey.shade900, fontSize: 13)),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentQuestionIndex + 1 < _rallyQuestions.length) {
                        setState(() {
                          _currentQuestionIndex++;
                          _answered = false;
                          _selectedOption = null;
                        });
                        _audio.playClick();
                      } else {
                        setState(() => _showFinalPodium = true);
                        _audio.playCelebrate();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B4F72),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(_currentQuestionIndex + 1 < _rallyQuestions.length ? 'Défi Suivant' : 'Couronner les Champions (Podium) 🏆'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPodiumView() {
    final sortedTeams = _teamScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Icon(Icons.military_tech_rounded, size: 72, color: Colors.amber),
          const SizedBox(height: 12),
          Text('PODIUM DU GRAND BILAN TRIMESTRE 2', style: LangHueyTextStyles.h1.copyWith(color: const Color(0xFF1B4F72), fontSize: 20), textAlign: TextAlign.center),
          const SizedBox(height: 6),
          const Text('Simulation Nationale BECE — Félicitations à toutes les équipes !', style: TextStyle(color: Colors.grey, fontSize: 13), textAlign: TextAlign.center),
          const SizedBox(height: 24),

          ...List.generate(sortedTeams.length, (i) {
            final t = sortedTeams[i];
            final rankEmojis = ['🥇', '🥈', '🥉', '🎖️'];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: i == 0 ? Colors.amber : Colors.black12, width: i == 0 ? 2 : 1),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Row(
                children: [
                  Text(rankEmojis[i], style: const TextStyle(fontSize: 26)),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(t.key, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(color: const Color(0xFF1B4F72), borderRadius: BorderRadius.circular(10)),
                    child: Text('${t.value} pts', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _showFinalPodium = false;
                _currentQuestionIndex = 0;
                _answered = false;
                _selectedOption = null;
              });
              _audio.playClick();
            },
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Recommencer la Simulation BECE'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B4F72),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}
