import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1Term1RevisionRallyWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1Term1RevisionRallyWidget({super.key, required this.lesson});

  @override
  State<JSS1Term1RevisionRallyWidget> createState() => _JSS1Term1RevisionRallyWidgetState();
}

class _JSS1Term1RevisionRallyWidgetState extends State<JSS1Term1RevisionRallyWidget> {
  final JSS1AudioService _audio = JSS1AudioService();
  int _activeTeam = 0; // 0: Équipe A, 1: Équipe B, 2: Équipe C, 3: Équipe D
  final List<int> _teamScores = [0, 0, 0, 0];
  int _currentRound = 0;

  final List<Map<String, dynamic>> _rounds = [
    {
      'station': 'Manche 1 : Ordres & Salutations',
      'question': 'Que signifie « Fermez vos cahiers et silence, s\'il vous plaît ! » ?',
      'options': [
        'Close your notebooks and silence, please!',
        'Open your books and repeat after me!',
        'Stand up and speak loudly!',
        'Sit down and write your name!',
      ],
      'correct': 0,
      'audio': 'silence_sil_vous_plait',
    },
    {
      'station': 'Manche 2 : Présentation & Âge',
      'question': 'Traduisez : « Elle a treize ans et elle habite à Abuja. »',
      'options': [
        'He is 12 years old and lives in Lagos.',
        'She is 13 years old and lives in Abuja.',
        'She is 13 years old and lives in Kano.',
        'I am 13 years old and live in Abuja.',
      ],
      'correct': 1,
      'audio': 'il_a_treize_ans',
    },
    {
      'station': 'Manche 3 : Description & Accords',
      'question': 'Quelle est la forme féminine correcte pour « grand, beau et travailleur » ?',
      'options': [
        'Grande, belle et travailleuse',
        'Grand, belle et travailleur',
        'Grande, beauté et travailleuse',
        'Grandes, belles et travailleurs',
      ],
      'correct': 0,
      'audio': 'grand_grande',
    },
    {
      'station': 'Manche 4 : Goûts & Loisirs',
      'question': 'Comment dit-on « I prefer football to swimming » ?',
      'options': [
        'Je préfère le football à la natation.',
        'Je déteste le football et la natation.',
        'J\'adore nager et courir.',
        'Je joue au football tous les jours.',
      ],
      'correct': 0,
      'audio': 'je_prefere',
    },
  ];

  int? _selectedAnswer;
  bool? _isCorrect;

  void _submitRallyAnswer(int idx) {
    final round = _rounds[_currentRound];
    final isRight = idx == round['correct'];

    setState(() {
      _selectedAnswer = idx;
      _isCorrect = isRight;
      if (isRight) {
        _teamScores[_activeTeam] += 10;
        _audio.playCorrect();
      } else {
        _audio.playIncorrect();
      }
    });
  }

  void _nextRound() {
    setState(() {
      _selectedAnswer = null;
      _isCorrect = null;
      if (_currentRound < _rounds.length - 1) {
        _currentRound++;
        _activeTeam = (_activeTeam + 1) % 4;
      } else {
        _audio.playCelebrate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final round = _rounds[_currentRound];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: JSS1Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: JSS1Colors.charcoal.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Bar
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: JSS1Colors.gold.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.military_tech_rounded, color: JSS1Colors.charcoal, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Grand Rallye de Révision par Équipes', style: JSS1Text.heading(JSS1Colors.teal)),
                    Text(
                      'Compétition interactive sur le Smartboard en 4 équipes (A, B, C, D) pour réviser tout le trimestre !',
                      style: JSS1Text.caption(JSS1Colors.grey),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _audio.playPhrase('etes_vous_prets', term: 1),
                style: ElevatedButton.styleFrom(
                  backgroundColor: JSS1Colors.gold,
                  foregroundColor: JSS1Colors.charcoal,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                icon: const Icon(Icons.flash_on_rounded),
                label: Text('Êtes-vous prêts ?', style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900)),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Team Scoreboards Banner
          Row(
            children: List.generate(4, (idx) {
              final teamLetter = ['A', 'B', 'C', 'D'][idx];
              final isTurn = _activeTeam == idx;
              final colors = [JSS1Colors.teal, JSS1Colors.gold, JSS1Colors.indigo, Color(0xFFE91E63)];

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: idx < 3 ? 10 : 0),
                  child: InkWell(
                    onTap: () => setState(() => _activeTeam = idx),
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      decoration: BoxDecoration(
                        color: isTurn ? colors[idx] : JSS1Colors.cream,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: colors[idx], width: isTurn ? 2 : 1),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Équipe $teamLetter',
                            style: JSS1Text.caption(isTurn ? JSS1Colors.white : JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800),
                          ),
                          Text(
                            '${_teamScores[idx]} pts',
                            style: JSS1Text.subheading(isTurn ? JSS1Colors.white : colors[idx]).copyWith(fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 20),

          // Main Question Card
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: JSS1Colors.cream,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: JSS1Colors.lightGrey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(round['station'] as String, style: JSS1Text.subheading(JSS1Colors.teal)),
                      IconButton.filled(
                        onPressed: () => _audio.playPhrase(round['audio'] as String, term: 1),
                        icon: const Icon(Icons.volume_up_rounded),
                        style: IconButton.styleFrom(backgroundColor: JSS1Colors.gold, foregroundColor: JSS1Colors.charcoal),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(round['question'] as String, style: JSS1Text.heading(JSS1Colors.charcoal).copyWith(fontSize: 19)),

                  const SizedBox(height: 18),

                  // 4 Answer Options
                  Expanded(
                    child: GridView.builder(
                      itemCount: (round['options'] as List).length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3.2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, optIdx) {
                        final optText = round['options'][optIdx] as String;
                        Color bg = JSS1Colors.white;
                        Color tc = JSS1Colors.charcoal;

                        if (_selectedAnswer != null) {
                          if (optIdx == round['correct']) {
                            bg = JSS1Colors.green;
                            tc = JSS1Colors.white;
                          } else if (optIdx == _selectedAnswer) {
                            bg = JSS1Colors.red;
                            tc = JSS1Colors.white;
                          }
                        }

                        return ElevatedButton(
                          onPressed: _selectedAnswer != null ? null : () => _submitRallyAnswer(optIdx),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: bg,
                            foregroundColor: tc,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                            side: BorderSide(color: JSS1Colors.lightGrey),
                          ),
                          child: Text(
                            optText,
                            style: JSS1Text.body(tc).copyWith(fontWeight: FontWeight.w700, fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),

                  if (_selectedAnswer != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _isCorrect! ? 'Bravo ! +10 points pour l\'Équipe ${['A', 'B', 'C', 'D'][_activeTeam]} !' : 'Oups ! Mauvaise réponse.',
                          style: JSS1Text.body(_isCorrect! ? JSS1Colors.green : JSS1Colors.red).copyWith(fontWeight: FontWeight.w800),
                        ),
                        ElevatedButton.icon(
                          onPressed: _nextRound,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: JSS1Colors.teal,
                            foregroundColor: JSS1Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          icon: const Icon(Icons.arrow_forward_rounded),
                          label: Text(_currentRound < _rounds.length - 1 ? 'Manche Suivante' : 'Terminer le Rallye', style: const TextStyle(fontWeight: FontWeight.bold)),
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
