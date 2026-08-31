import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 8 — Raconter sa journée : récit chronologique
/// Chronological Storyline Workbench, Transitional Connectors Toolkit,
/// and BECE Guided Essay Teleprompter.
class JSS3DayChronologicalNarrativeStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3DayChronologicalNarrativeStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3DayChronologicalNarrativeStudioWidget> createState() =>
      _JSS3DayChronologicalNarrativeStudioWidgetState();
}

class _JSS3DayChronologicalNarrativeStudioWidgetState
    extends State<JSS3DayChronologicalNarrativeStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  // Selected story step
  int _selectedStepIndex = 0;

  // Connectors Quiz
  int _connIndex = 0;
  int _connScore = 0;
  bool _connAnswered = false;
  int? _connSelected;

  static const List<Map<String, dynamic>> _storySteps = [
    {
      'phase': '1. Le Début (Matin)',
      'connector': 'D\'abord / Tout d\'abord',
      'emoji': '🌅',
      'color': Color(0xFFE67E22),
      'sentence': 'D\'abord, je me suis réveillé(e) à six heures du matin avec beaucoup d\'enthousiasme.',
      'note': 'Introduit la première action de la journée.',
    },
    {
      'phase': '2. La Progression (Midi)',
      'connector': 'Ensuite / Puis',
      'emoji': '🏫',
      'color': Color(0xFF2980B9),
      'sentence': 'Ensuite, je suis allé(e) à l\'école et j\'ai assisté à tous mes cours de français et de mathématiques.',
      'note': 'Assure la liaison entre les événements matinaux.',
    },
    {
      'phase': '3. L\'Événement Inattendu (Après-midi)',
      'connector': 'Soudain / Tout à coup',
      'emoji': '⚡',
      'color': Color(0xFFC0392B),
      'sentence': 'Soudain, le ciel s\'est assombri et une pluie torrentielle a éclaté pendant le rassemblement !',
      'note': 'Marque le tournant dramatique (déclenche le Passé Composé !).',
    },
    {
      'phase': '4. L\'Action Parallèle',
      'connector': 'Pendant ce temps',
      'emoji': '🔄',
      'color': Color(0xFF8E44AD),
      'sentence': 'Pendant ce temps, les élèves se sont réfugiés dans le hall principal pour chanter ensemble.',
      'note': 'Indique une action simultanée.',
    },
    {
      'phase': '5. La Conclusion (Soir)',
      'connector': 'Enfin / Finalement',
      'emoji': '🌙',
      'color': Color(0xFF27AE60),
      'sentence': 'Enfin, la pluie s\'est arrêtée et nous sommes rentrés chez nous le cœur rempli de souvenirs inoubliables.',
      'note': 'Conclut le récit de manière positive.',
    },
  ];

  static const List<Map<String, dynamic>> _connQuizzes = [
    {
      'prompt': 'Quel connecteur logique introduit la TOUTE PREMIÈRE étape d\'un récit ?',
      'options': ['Enfin', 'D\'abord', 'Puis', 'Soudain'],
      'correct': 1,
      'explanation': '"D\'abord" or "Tout d\'abord" introduces the first chronological action.',
    },
    {
      'prompt': 'Quel mot signale un événement inattendu et soudain dans l\'histoire ?',
      'options': ['D\'habitude', 'Soudain / Tout à coup', 'Chaque jour', 'Depuis'],
      'correct': 1,
      'explanation': '"Soudain" or "Tout à coup" expresses a sudden, unexpected twist.',
    },
    {
      'prompt': 'Complétez : « La route était inondée, ___ nous avons dû attendre une heure. »',
      'options': ['par conséquent', 'd\'abord', 'pendant que', 'depuis'],
      'correct': 0,
      'explanation': '"Par conséquent" indicates logical result / consequence.',
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
              colors: [Color(0xFF2C3E50), Color(0xFF16A085)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.view_timeline_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Atelier du Récit Chronologique & Connecteurs Logiques',
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
              Tab(icon: Icon(Icons.timeline_rounded, size: 18), text: 'Étapes du Récit'),
              Tab(icon: Icon(Icons.menu_book_rounded, size: 18), text: 'Téléscripteur BECE'),
              Tab(icon: Icon(Icons.quiz_rounded, size: 18), text: 'Défi Connecteurs'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildStepsTab(),
              _buildTeleprompterTab(),
              _buildQuizTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStepsTab() {
    final step = _storySteps[_selectedStepIndex];
    final color = step['color'] as Color;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_storySteps.length, (index) {
                final s = _storySteps[index];
                final isSelected = _selectedStepIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    avatar: Text(s['emoji'] as String),
                    label: Text(s['connector'] as String),
                    selected: isSelected,
                    selectedColor: (s['color'] as Color).withOpacity(0.2),
                    side: BorderSide(color: isSelected ? s['color'] as Color : Colors.black12),
                    onSelected: (val) {
                      if (val) {
                        setState(() => _selectedStepIndex = index);
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(step['emoji'] as String, style: const TextStyle(fontSize: 38)),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(step['phase'] as String, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
                            Text(step['connector'] as String, style: LangHueyTextStyles.h2.copyWith(fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(step['note'] as String, style: TextStyle(color: Colors.grey.shade700, fontSize: 13)),
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
                          '« ${step['sentence']} »',
                          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 14),
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

  Widget _buildTeleprompterTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Modèle d\'Expression Écrite BECE (Récit Complet) :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFFDFEFE),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blueGrey.shade200),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 4)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.auto_stories_rounded, color: Color(0xFF2C3E50), size: 24),
                    SizedBox(width: 10),
                    Text('Titre : Une Journée Mémorable au Collège', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF2C3E50))),
                  ],
                ),
                const Divider(height: 24, thickness: 1),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 14, color: LangHueyColors.charcoal, height: 1.6),
                    children: [
                      TextSpan(text: 'D\'abord, ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFE67E22))),
                      TextSpan(text: 'je me suis réveillé de bonne heure à six heures du matin. '),
                      TextSpan(text: 'Ensuite, ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2980B9))),
                      TextSpan(text: 'j\'ai pris mon petit-déjeuner et j\'ai rejoint mes camarades au collège. '),
                      TextSpan(text: 'Soudain, ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC0392B))),
                      TextSpan(text: 'le proviseur a annoncé que notre école avait gagné le premier prix du concours de français ! '),
                      TextSpan(text: 'Pendant ce temps, ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF8E44AD))),
                      TextSpan(text: 'tous les professeurs applaudissaient et nous félicitaient avec enthousiasme. '),
                      TextSpan(text: 'Par conséquent, ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF16A085))),
                      TextSpan(text: 'nous avons organisé une grande fête scolaire dans l\'après-midi. '),
                      TextSpan(text: 'Enfin, ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF27AE60))),
                      TextSpan(text: 'nous sommes rentrés chez nous fiers et comblés de bonheur. C\'était vraiment une journée inoubliable !'),
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

  Widget _buildQuizTab() {
    final quiz = _connQuizzes[_connIndex];

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
                Text('Défi Connecteurs (#${_connIndex + 1} / ${_connQuizzes.length})', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Score: $_connScore pts', style: const TextStyle(color: LangHueyColors.amberGold, fontWeight: FontWeight.bold)),
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

            if (_connAnswered) {
              if (isCorrect) {
                btnColor = const Color(0xFF2ECC71);
                textColor = Colors.white;
              } else if (_connSelected == i) {
                btnColor = const Color(0xFFE74C3C);
                textColor = Colors.white;
              }
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: !_connAnswered
                    ? () {
                        setState(() {
                          _connAnswered = true;
                          _connSelected = i;
                          if (isCorrect) {
                            _connScore += 10;
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
                    border: Border.all(color: _connAnswered && (isCorrect || _connSelected == i) ? Colors.transparent : Colors.black12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(opt, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 15)),
                      if (_connAnswered && isCorrect)
                        const Icon(Icons.check_circle_rounded, color: Colors.white)
                      else if (_connAnswered && _connSelected == i)
                        const Icon(Icons.cancel_rounded, color: Colors.white),
                    ],
                  ),
                ),
              ),
            );
          }),

          if (_connAnswered) ...[
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
                  _connIndex = (_connIndex + 1) % _connQuizzes.length;
                  _connAnswered = false;
                  _connSelected = null;
                });
                _audio.playClick();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2C3E50),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(_connIndex + 1 < _connQuizzes.length ? 'Défi Suivant' : 'Recommencer'),
            ),
          ],
        ],
      ),
    );
  }
}
