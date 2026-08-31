import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 1 (Term 2) — Relater un événement passé et situer les actions
/// Multi-Tense Narrative Weaver: Passé Composé for Actions, Imparfait for Setting/States,
/// Temporal Adverbs Timeline, and Anecdote Storyteller.
class JSS3NarratingPastEventsStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3NarratingPastEventsStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3NarratingPastEventsStudioWidget> createState() =>
      _JSS3NarratingPastEventsStudioWidgetState();
}

class _JSS3NarratingPastEventsStudioWidgetState
    extends State<JSS3NarratingPastEventsStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  int _selectedStoryIndex = 0;

  // Tense Quiz State
  int _quizIndex = 0;
  int _quizScore = 0;
  bool _quizAnswered = false;
  int? _quizSelected;

  static const List<Map<String, dynamic>> _stories = [
    {
      'title': 'L\'Orage au Collège',
      'emoji': '⚡',
      'color': Color(0xFF2C3E50),
      'imparfaitSetting': 'Il faisait très chaud et le ciel était couvert de nuages gris.',
      'passeComposeAction': 'Brusquement, le tonnerre a grondé et une forte pluie a commencé.',
      'connectors': 'Pendant que nous révisions, soudain la lumière s\'est coupée.',
    },
    {
      'title': 'Le Voyage vers le Village',
      'emoji': '🚌',
      'color': Color(0xFF16A085),
      'imparfaitSetting': 'La route était longue et les collines étaient verdoyantes.',
      'passeComposeAction': 'Nous sommes arrivés au village à midi et les grands-parents nous ont accueillis avec joie.',
      'connectors': 'Autrefois, ce trajet prenait trois jours à cheval.',
    },
    {
      'title': 'La Finale du Tournoi',
      'emoji': '🏆',
      'color': Color(0xFFE67E22),
      'imparfaitSetting': 'Tous les élèves étaient excités et chantaient avec ferveur.',
      'passeComposeAction': 'À la dernière minute, Aminu a marqué un but spectaculaire et nous avons gagné.',
      'connectors': 'Ce jour-là, l\'école a célébré la victoire jusqu\'au soir.',
    },
  ];

  static const List<Map<String, dynamic>> _quizzes = [
    {
      'prompt': '« Pendant que nous ___ au football, la pluie a commencé. » (jouer - action continue en cours)',
      'options': ['avons joué (PC)', 'jouions (Imparfait)', 'jouerons (Futur)', 'jouons (Présent)'],
      'correct': 1,
      'explanation': 'Ongoing background action introduced by "Pendant que" takes the Imparfait : "jouions".',
    },
    {
      'prompt': '« Soudain, le professeur ___ dans la salle. » (entrer - action soudaine et précise)',
      'options': ['est entré (PC)', 'entrait (Imparfait)', 'entrera (Futur)', 'vient d\'entrer'],
      'correct': 0,
      'explanation': 'Sudden punctual action marked by "Soudain" takes the Passé Composé : "est entré".',
    },
    {
      'prompt': 'Quel adverbe temporel signifie "in the old days / formerly" ?',
      'options': ['Demain', 'Bientôt', 'Autrefois / Jadis', 'Tout de suite'],
      'correct': 2,
      'explanation': '"Autrefois" and "Jadis" mean formerly / in the past.',
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
              colors: [Color(0xFF2C3E50), Color(0xFF34495E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.history_edu_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Studio de Narration au Passé & Adverbes Temporels',
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
            labelColor: const Color(0xFF2C3E50),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF2C3E50),
            tabs: const [
              Tab(icon: Icon(Icons.auto_stories_rounded, size: 18), text: 'Récits & Histoires'),
              Tab(icon: Icon(Icons.timeline_rounded, size: 18), text: 'Adverbes Temporels'),
              Tab(icon: Icon(Icons.quiz_rounded, size: 18), text: 'Défi des Temps'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildStoriesTab(),
              _buildAdverbsTab(),
              _buildQuizTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStoriesTab() {
    final story = _stories[_selectedStoryIndex];
    final color = story['color'] as Color;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_stories.length, (index) {
                final s = _stories[index];
                final isSelected = _selectedStoryIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    avatar: Text(s['emoji'] as String),
                    label: Text(s['title'] as String),
                    selected: isSelected,
                    selectedColor: (s['color'] as Color).withOpacity(0.2),
                    side: BorderSide(color: isSelected ? s['color'] as Color : Colors.black12),
                    onSelected: (val) {
                      if (val) {
                        setState(() => _selectedStoryIndex = index);
                        _audio.playClick();
                      }
                    },
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withOpacity(0.4), width: 1.5),
              boxShadow: [
                BoxShadow(color: color.withOpacity(0.08), blurRadius: 16, offset: const Offset(0, 6)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(story['emoji'] as String, style: const TextStyle(fontSize: 38)),
                    const SizedBox(width: 14),
                    Text(story['title'] as String, style: LangHueyTextStyles.h2.copyWith(fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 18),

                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('1. DÉCOR & ÉTAT (Imparfait) :', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 11)),
                      const SizedBox(height: 4),
                      Text('« ${story['imparfaitSetting']} »', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: LangHueyColors.charcoal)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('2. ACTION & ÉVÉNEMENT (Passé Composé) :', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange, fontSize: 11)),
                      const SizedBox(height: 4),
                      Text('« ${story['passeComposeAction']} »', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: LangHueyColors.charcoal)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.purple.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('3. ANCRAGE TEMPOREL (Adverbes) :', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 11)),
                      const SizedBox(height: 4),
                      Text('« ${story['connectors']} »', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: LangHueyColors.charcoal)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdverbsTab() {
    final adverbs = [
      {'adv': 'Autrefois / Jadis', 'meaning': 'In the past / Formerly', 'ex': 'Autrefois, le village n\'avait pas d\'électricité.'},
      {'adv': 'Alors / À ce moment-là', 'meaning': 'Then / At that exact moment', 'ex': 'Il pleuvait, alors nous sommes rentrés.'},
      {'adv': 'Pendant que / Tandis que', 'meaning': 'While / As', 'ex': 'Pendant que le professeur parlait, les élèves écrivaient.'},
      {'adv': 'Soudainement / Brusquement', 'meaning': 'Suddenly / Abruptly', 'ex': 'Brusquement, la porte s\'est ouverte.'},
      {'adv': 'La veille / Le lendemain', 'meaning': 'The eve / The day after', 'ex': 'La veille de l\'examen, nous avons tout révisé.'},
      {'adv': 'Ce jour-là / Plus tard', 'meaning': 'That day / Later on', 'ex': 'Ce jour-là restera gravé dans nos cœurs.'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('La Boîte à Outils Temporelle pour le Récit :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 16),
          ...adverbs.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item['adv']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF2C3E50))),
                      const Icon(Icons.schedule_send_rounded, color: Color(0xFF2C3E50), size: 20),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(item['meaning']!, style: TextStyle(color: Colors.grey.shade700, fontSize: 13)),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('Ex : ${item['ex']}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: LangHueyColors.deepTeal)),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildQuizTab() {
    final quiz = _quizzes[_quizIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: LangHueyColors.charcoal,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Défi Passé Composé vs Imparfait (#${_quizIndex + 1} / ${_quizzes.length})', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Score: $_quizScore pts', style: const TextStyle(color: LangHueyColors.amberGold, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.black12),
            ),
            child: Text(
              quiz['prompt'] as String,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.4),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),

          ...List.generate((quiz['options'] as List<String>).length, (i) {
            final opt = (quiz['options'] as List<String>)[i];
            final isCorrect = i == quiz['correct'];
            Color btnColor = Colors.white;
            Color textColor = LangHueyColors.charcoal;

            if (_quizAnswered) {
              if (isCorrect) {
                btnColor = const Color(0xFF2ECC71);
                textColor = Colors.white;
              } else if (_quizSelected == i) {
                btnColor = const Color(0xFFE74C3C);
                textColor = Colors.white;
              }
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: !_quizAnswered
                    ? () {
                        setState(() {
                          _quizAnswered = true;
                          _quizSelected = i;
                          if (isCorrect) {
                            _quizScore += 10;
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
                    color: btnColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _quizAnswered && (isCorrect || _quizSelected == i) ? Colors.transparent : Colors.black12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(opt, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 15)),
                      if (_quizAnswered && isCorrect)
                        const Icon(Icons.check_circle_rounded, color: Colors.white)
                      else if (_quizAnswered && _quizSelected == i)
                        const Icon(Icons.cancel_rounded, color: Colors.white),
                    ],
                  ),
                ),
              ),
            );
          }),

          if (_quizAnswered) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blueGrey.shade300),
              ),
              child: Text('💡 ${quiz['explanation']}', style: TextStyle(color: Colors.blueGrey.shade900, fontSize: 13)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _quizIndex = (_quizIndex + 1) % _quizzes.length;
                  _quizAnswered = false;
                  _quizSelected = null;
                });
                _audio.playClick();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2C3E50),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(_quizIndex + 1 < _quizzes.length ? 'Question Suivante' : 'Recommencer'),
            ),
          ],
        ],
      ),
    );
  }
}
