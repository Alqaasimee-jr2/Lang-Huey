import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 3 — Expliquer ses habitudes et sa routine
/// 24-Hour Habit Clock, Reflexive Verbs Conjugation Lab, and Frequency Adverbs Gauge.
class JSS3HabitsAndRoutineStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3HabitsAndRoutineStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3HabitsAndRoutineStudioWidget> createState() => _JSS3HabitsAndRoutineStudioWidgetState();
}

class _JSS3HabitsAndRoutineStudioWidgetState extends State<JSS3HabitsAndRoutineStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  // Selected routine slot
  int _selectedTimeIndex = 0;

  // Conjugation quiz state
  int _conjIndex = 0;
  int _conjScore = 0;
  bool _conjAnswered = false;
  int? _conjSelected;

  static const List<Map<String, dynamic>> _timeline = [
    {
      'time': '06h00',
      'label': 'Le Réveil',
      'verb': 'se réveiller',
      'phrase': 'Je me réveille à 6h00 au son du réveil.',
      'emoji': '⏰',
      'color': Color(0xFFE67E22),
    },
    {
      'time': '06h15',
      'label': 'La Toilette',
      'verb': 'se laver / se brosser',
      'phrase': 'Je me lave et je me brosse les dents.',
      'emoji': '🪥',
      'color': Color(0xFF3498DB),
    },
    {
      'time': '06h45',
      'label': 'L\'Habillement',
      'verb': 's\'habiller',
      'phrase': 'Je m\'habille en uniforme scolaire.',
      'emoji': '👔',
      'color': Color(0xFF9B59B6),
    },
    {
      'time': '07h15',
      'label': 'Le Départ',
      'verb': 'partir à l\'école',
      'phrase': 'D\'habitude, je prends le bus scolaire pour aller au collège.',
      'emoji': '🚌',
      'color': Color(0xFF1ABC9C),
    },
    {
      'time': '12h30',
      'label': 'Le Déjeuner',
      'verb': 'déjeuner',
      'phrase': 'Nous déjeunons ensemble à la cantine scolaire.',
      'emoji': '🍱',
      'color': Color(0xFFF39C12),
    },
    {
      'time': '16h00',
      'label': 'Les Devoirs',
      'verb': 'étudier / réviser',
      'phrase': 'Je révise régulièrement mes leçons de français.',
      'emoji': '📚',
      'color': Color(0xFF2C3E50),
    },
    {
      'time': '21h30',
      'label': 'Le Coucher',
      'verb': 'se coucher',
      'phrase': 'Je me couche tôt pour être en forme le lendemain.',
      'emoji': '🛌',
      'color': Color(0xFF34495E),
    },
  ];

  static const List<Map<String, dynamic>> _conjQuizzes = [
    {
      'subject': 'Je',
      'verb': 'SE LEVER',
      'options': ['me lève', 'te lèves', 'se lève', 'nous levons'],
      'correct': 0,
      'explanation': '"Je" takes the reflexive pronoun "me" and ending "-e": "Je me lève".',
    },
    {
      'subject': 'Nous',
      'verb': 'S\'HABILLER',
      'options': ['s\'habillons', 'nous habillons', 'vous habillez', 'm\'habille'],
      'correct': 1,
      'explanation': '"Nous" takes the reflexive pronoun "nous": "Nous nous habillons".',
    },
    {
      'subject': 'Ils',
      'verb': 'SE COUCHER',
      'options': ['se couche', 'se couches', 'se couchent', 'se couchons'],
      'correct': 2,
      'explanation': '"Ils" takes "se" with plural ending "-ent": "Ils se couchent".',
    },
    {
      'subject': 'Tu',
      'verb': 'SE BROSSER',
      'options': ['te brosses', 'me brosse', 'se brosse', 'vous brossez'],
      'correct': 0,
      'explanation': '"Tu" takes "te" with second-person ending "-es": "Tu te brosses".',
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
              colors: [Color(0xFFE67E22), Color(0xFFD35400)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.schedule_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Studio des Habitudes & Routine Quotidienne',
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
            labelColor: const Color(0xFFE67E22),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFFE67E22),
            tabs: const [
              Tab(icon: Icon(Icons.access_time_filled_rounded, size: 18), text: 'Horloge Routine'),
              Tab(icon: Icon(Icons.psychology_rounded, size: 18), text: 'Verbes Réflexifs'),
              Tab(icon: Icon(Icons.speed_rounded, size: 18), text: 'Jauge Fréquence'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildTimelineTab(),
              _buildConjugationTab(),
              _buildFrequencyTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineTab() {
    final slot = _timeline[_selectedTimeIndex];
    final color = slot['color'] as Color;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Horizontal timeline selector
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_timeline.length, (index) {
                final s = _timeline[index];
                final isSelected = _selectedTimeIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      setState(() => _selectedTimeIndex = index);
                      _audio.playClick();
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? s['color'] as Color : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: isSelected ? s['color'] as Color : Colors.black12),
                      ),
                      child: Column(
                        children: [
                          Text(s['emoji'] as String, style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 4),
                          Text(
                            s['time'] as String,
                            style: TextStyle(
                              color: isSelected ? Colors.white : LangHueyColors.charcoal,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),

          // Routine Detail Card
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(slot['emoji'] as String, style: const TextStyle(fontSize: 40)),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(slot['time'] as String, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
                            Text(slot['label'] as String, style: LangHueyTextStyles.h2.copyWith(fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(slot['verb'] as String, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 11)),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.record_voice_over_rounded, color: color, size: 22),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '« ${slot['phrase']} »',
                          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
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

  Widget _buildConjugationTab() {
    final quiz = _conjQuizzes[_conjIndex];

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
                Text('Atelier des Verbes Réflexifs (#${_conjIndex + 1} / ${_conjQuizzes.length})', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Score: $_conjScore pts', style: const TextStyle(color: LangHueyColors.amberGold, fontWeight: FontWeight.bold)),
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
            child: Column(
              children: [
                Text('Conjuguez pour le sujet :', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                const SizedBox(height: 8),
                Text('« ${quiz['subject']} + ${quiz['verb']} »', style: LangHueyTextStyles.h2.copyWith(color: const Color(0xFFE67E22), fontSize: 22)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          ...List.generate((quiz['options'] as List<String>).length, (i) {
            final opt = (quiz['options'] as List<String>)[i];
            final isCorrect = i == quiz['correct'];
            Color btnColor = Colors.white;
            Color textColor = LangHueyColors.charcoal;

            if (_conjAnswered) {
              if (isCorrect) {
                btnColor = const Color(0xFF2ECC71);
                textColor = Colors.white;
              } else if (_conjSelected == i) {
                btnColor = const Color(0xFFE74C3C);
                textColor = Colors.white;
              }
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: !_conjAnswered
                    ? () {
                        setState(() {
                          _conjAnswered = true;
                          _conjSelected = i;
                          if (isCorrect) {
                            _conjScore += 10;
                            _audio.playCorrect();
                          } else {
                            _audio.playIncorrect();
                          }
                        });
                      }
                    : null,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: btnColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _conjAnswered && (isCorrect || _conjSelected == i) ? Colors.transparent : Colors.black12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${quiz['subject']} $opt', style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 15)),
                      if (_conjAnswered && isCorrect)
                        const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20)
                      else if (_conjAnswered && _conjSelected == i)
                        const Icon(Icons.cancel_rounded, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
            );
          }),

          if (_conjAnswered) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.amber.shade300),
              ),
              child: Text('💡 ${quiz['explanation']}', style: TextStyle(color: Colors.brown.shade800, fontSize: 13)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _conjIndex = (_conjIndex + 1) % _conjQuizzes.length;
                  _conjAnswered = false;
                  _conjSelected = null;
                });
                _audio.playClick();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE67E22),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(_conjIndex + 1 < _conjQuizzes.length ? 'Question Suivante' : 'Recommencer l\'entraînement'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFrequencyTab() {
    final frequencies = [
      {'label': 'Toujours / Chaque jour', 'percent': '100%', 'color': const Color(0xFF27AE60), 'ex': 'Je fais toujours mes devoirs avant de dormir.'},
      {'label': 'Souvent / Régulièrement', 'percent': '75%', 'color': const Color(0xFF2980B9), 'ex': 'Je joue souvent au football avec mes voisins.'},
      {'label': 'D\'habitude / En général', 'percent': '60%', 'color': const Color(0xFF8E44AD), 'ex': 'D\'habitude, je prends le bus scolaire à 7h15.'},
      {'label': 'Parfois / De temps en temps', 'percent': '40%', 'color': const Color(0xFFE67E22), 'ex': 'De temps en temps, nous allons à la plage.'},
      {'label': 'Rarement', 'percent': '15%', 'color': const Color(0xFFE74C3C), 'ex': 'Je mange rarement des friandises en semaine.'},
      {'label': 'Ne... jamais', 'percent': '0%', 'color': const Color(0xFF7F8C8D), 'ex': 'Je ne suis jamais en retard à l\'école.'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Jauge de Fréquence des Habitudes (0% à 100%) :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 16),
          ...frequencies.map((item) {
            final color = item['color'] as Color;
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
                      Text(item['label'] as String, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 15)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(item['percent'] as String, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text('Ex : ${item['ex']}', style: TextStyle(color: Colors.grey.shade700, fontSize: 13, fontStyle: FontStyle.italic)),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
