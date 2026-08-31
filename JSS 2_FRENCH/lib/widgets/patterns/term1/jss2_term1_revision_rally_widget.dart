import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2Term1RevisionRallyWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2Term1RevisionRallyWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2Term1RevisionRallyWidget> createState() => _JSS2Term1RevisionRallyWidgetState();
}

class _JSS2Term1RevisionRallyWidgetState extends State<JSS2Term1RevisionRallyWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();

  final List<Map<String, dynamic>> _teams = [
    {'name': 'Équipe Bleue', 'color': Colors.blue.shade700, 'score': 30},
    {'name': 'Équipe Verte', 'color': Colors.green.shade700, 'score': 40},
    {'name': 'Équipe Rouge', 'color': Colors.red.shade700, 'score': 20},
    {'name': 'Équipe Jaune', 'color': Colors.amber.shade700, 'score': 25},
  ];

  int _currentQuestionIndex = 0;
  bool _answerRevealed = false;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. Quelle préposition utilise-t-on pour dire « under the table » ?',
      'answer': '« SOUS la table » (sous)',
      'audio': 'sous_la_chaise',
    },
    {
      'question': '2. Comment contracte-t-on « à côté de + le marché » ?',
      'answer': '« À côté DU marché » (de + le = DU)',
      'audio': 'a_cote_de_la_fenetre',
    },
    {
      'question': '3. Quelle est la préposition pour aller à moto ou à vélo ?',
      'answer': 'La préposition « À » (à moto, à vélo, à pied car sans habitacle)',
      'audio': 'a_moto',
    },
    {
      'question': '4. Que dit-on pour « What time does the train leave? » ?',
      'answer': '« À quelle heure part le train ? »',
      'audio': 'a_quelle_heure_part_le_train',
    },
    {
      'question': '5. Que signifie l\'expression « tomber en panne » ?',
      'answer': 'To break down (avoir une panne mécanique)',
      'audio': 'le_bus_est_tombe_en_panne',
    },
  ];

  void _addPoints(int teamIndex, int delta) {
    setState(() {
      _teams[teamIndex]['score'] = ((_teams[teamIndex]['score'] as int) + delta).clamp(0, 999);
    });
    if (delta > 0) {
      _audioService.playCorrect();
    } else {
      _audioService.playIncorrect();
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = _questions[_currentQuestionIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F766E), Color(0xFFF4A832)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.emoji_events_rounded, color: Colors.white, size: 38),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Grand Rallye du 1er Trimestre : Championnat JSS 2',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Compétition interactive en 4 équipes couvrant les unités 1 à 8 (Positions, Lieux, Chemins, Transports & Horaires).',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white.withOpacity(0.9)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // 4 Teams Live Scoreboard
          Row(
            children: List.generate(_teams.length, (index) {
              final t = _teams[index];
              return Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: index == 0 ? 0 : 4,
                    right: index == _teams.length - 1 ? 0 : 4,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: t['color'] as Color, width: 2),
                  ),
                  child: Column(
                    children: [
                      Text(
                        t['name'] as String,
                        style: TextStyle(
                          color: t['color'] as Color,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${t['score']} pts',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: LangHueyColors.charcoal,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline_rounded, size: 18, color: Colors.grey),
                            onPressed: () => _addPoints(index, -5),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_circle_rounded, size: 22, color: t['color'] as Color),
                            onPressed: () => _addPoints(index, 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 18),

          // Live Question Arena
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: LangHueyColors.deepTeal,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Question ${_currentQuestionIndex + 1} / ${_questions.length}',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_rounded, size: 18),
                          onPressed: _currentQuestionIndex > 0
                              ? () {
                                  setState(() {
                                    _currentQuestionIndex--;
                                    _answerRevealed = false;
                                  });
                                  _audioService.playClick();
                                }
                              : null,
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                          onPressed: _currentQuestionIndex < _questions.length - 1
                              ? () {
                                  setState(() {
                                    _currentQuestionIndex++;
                                    _answerRevealed = false;
                                  });
                                  _audioService.playClick();
                                }
                              : null,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Question Prompt
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: LangHueyColors.warmCream,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    q['question'] as String,
                    style: LangHueyTextStyles.h3.copyWith(fontSize: 16),
                  ),
                ),

                const SizedBox(height: 14),

                if (_answerRevealed)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.shade300),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle_rounded, color: Colors.green, size: 28),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Réponse Officielle :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.green)),
                              Text(
                                q['answer'] as String,
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: LangHueyColors.charcoal),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.volume_up_rounded, color: Colors.green, size: 24),
                          onPressed: () => _audioService.playPhrase(q['audio'] as String, term: 1),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 14),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() => _answerRevealed = !_answerRevealed);
                          if (_answerRevealed) {
                            _audioService.playPhrase(q['audio'] as String, term: 1);
                          }
                        },
                        icon: Icon(_answerRevealed ? Icons.visibility_off_rounded : Icons.visibility_rounded, size: 18),
                        label: Text(_answerRevealed ? 'Masquer la Réponse' : 'Révéler la Réponse'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LangHueyColors.deepTeal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
