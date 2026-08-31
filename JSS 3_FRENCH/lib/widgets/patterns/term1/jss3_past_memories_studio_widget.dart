import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 4 — Parler d'un événement passé (les souvenirs)
/// Time Machine Memory Vault: Passé Composé vs Imparfait dual lab,
/// Auxiliary Selector (Avoir vs Être), and Childhood Photo Album.
class JSS3PastMemoriesStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3PastMemoriesStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3PastMemoriesStudioWidget> createState() => _JSS3PastMemoriesStudioWidgetState();
}

class _JSS3PastMemoriesStudioWidgetState extends State<JSS3PastMemoriesStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  int _selectedMemoryIndex = 0;

  // Tense Battle Quiz
  int _battleIndex = 0;
  int _battleScore = 0;
  bool _battleAnswered = false;
  int? _battleSelected;

  static const List<Map<String, dynamic>> _memories = [
    {
      'title': 'Mon Premier Jour en Primary 1',
      'year': 'Il y a 8 ans',
      'emoji': '🎒',
      'color': Color(0xFF8E44AD),
      'imparfait': 'J\'avais six ans, j\'étais très petit et un peu timide.',
      'passeCompose': 'Soudain, la maîtresse m\'a souri et m\'a donné un bonbon. J\'ai arrêté de pleurer.',
    },
    {
      'title': 'Le Voyage à Calabar',
      'year': 'L\'année dernière',
      'emoji': '🚌',
      'color': Color(0xFF2980B9),
      'imparfait': 'Il faisait très beau et la route était bordée de grands arbres verdoyants.',
      'passeCompose': 'Nous sommes arrivés à midi et nous avons visité le musée historique.',
    },
    {
      'title': 'Le Grand Match Interclasses',
      'year': 'Le mois dernier',
      'emoji': '⚽',
      'color': Color(0xFF27AE60),
      'imparfait': 'Tous les élèves chantaient et encourageaient les deux équipes.',
      'passeCompose': 'À la dernière minute, notre capitaine a marqué un but extraordinaire !',
    },
  ];

  static const List<Map<String, dynamic>> _battleQuizzes = [
    {
      'prompt': '« Quand j\'___ petit, j\'habitais à Ibadan. » (être - état/description dans le passé)',
      'options': ['ai été (Passé Composé)', 'étais (Imparfait)'],
      'correct': 1,
      'explanation': 'Use the Imparfait ("étais") for age, state, or background description in the past.',
    },
    {
      'prompt': '« Soudain, la cloche ___ à quatorze heures. » (sonner - action soudaine et précise)',
      'options': ['a sonné (Passé Composé)', 'sonnait (Imparfait)'],
      'correct': 0,
      'explanation': 'Use the Passé Composé ("a sonné") for a punctual, completed action marked by "Soudain".',
    },
    {
      'prompt': '« Samedi dernier, nous ___ à la plage avec nos cousins. » (aller)',
      'options': ['sommes allés (ÊTRE)', 'avons allé (AVOIR)'],
      'correct': 0,
      'explanation': '"Aller" is a movement verb that requires ÊTRE and agreement: "sommes allés".',
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
              colors: [Color(0xFF8E44AD), Color(0xFF2C3E50)],
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
                  'Machine à Remonter le Temps : Passé Composé & Imparfait',
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
            labelColor: const Color(0xFF8E44AD),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF8E44AD),
            tabs: const [
              Tab(icon: Icon(Icons.auto_stories_rounded, size: 18), text: 'Album Souvenirs'),
              Tab(icon: Icon(Icons.compare_arrows_rounded, size: 18), text: 'Passé Composé vs Imparfait'),
              Tab(icon: Icon(Icons.home_work_rounded, size: 18), text: 'Maison d\'ÊTRE'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildMemoriesTab(),
              _buildBattleTab(),
              _buildEtreHouseTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMemoriesTab() {
    final mem = _memories[_selectedMemoryIndex];
    final color = mem['color'] as Color;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_memories.length, (index) {
                final m = _memories[index];
                final isSelected = _selectedMemoryIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ChoiceChip(
                    avatar: Text(m['emoji'] as String),
                    label: Text(m['title'] as String),
                    selected: isSelected,
                    selectedColor: (m['color'] as Color).withOpacity(0.2),
                    side: BorderSide(color: isSelected ? m['color'] as Color : Colors.black12),
                    onSelected: (val) {
                      if (val) {
                        setState(() => _selectedMemoryIndex = index);
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
                        Text(mem['emoji'] as String, style: const TextStyle(fontSize: 38)),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(mem['title'] as String, style: LangHueyTextStyles.h2.copyWith(fontSize: 17)),
                            Text(mem['year'] as String, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Imparfait block
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
                      const Row(
                        children: [
                          Icon(Icons.brush_rounded, color: Colors.blue, size: 18),
                          SizedBox(width: 8),
                          Text('IMPARFAIT (Décor & Émotions du passé) :', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text('« ${mem['imparfait']} »', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: LangHueyColors.charcoal)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Passé Composé block
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
                      const Row(
                        children: [
                          Icon(Icons.bolt_rounded, color: Colors.orange, size: 18),
                          SizedBox(width: 8),
                          Text('PASSÉ COMPOSÉ (Action précise & terminée) :', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text('« ${mem['passeCompose']} »', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: LangHueyColors.charcoal)),
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

  Widget _buildBattleTab() {
    final quiz = _battleQuizzes[_battleIndex];

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
                Text('Défi des Temps du Passé (#${_battleIndex + 1} / ${_battleQuizzes.length})', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Score: $_battleScore pts', style: const TextStyle(color: LangHueyColors.amberGold, fontWeight: FontWeight.bold)),
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

            if (_battleAnswered) {
              if (isCorrect) {
                btnColor = const Color(0xFF2ECC71);
                textColor = Colors.white;
              } else if (_battleSelected == i) {
                btnColor = const Color(0xFFE74C3C);
                textColor = Colors.white;
              }
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: !_battleAnswered
                    ? () {
                        setState(() {
                          _battleAnswered = true;
                          _battleSelected = i;
                          if (isCorrect) {
                            _battleScore += 10;
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
                    border: Border.all(color: _battleAnswered && (isCorrect || _battleSelected == i) ? Colors.transparent : Colors.black12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(opt, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 15)),
                      if (_battleAnswered && isCorrect)
                        const Icon(Icons.check_circle_rounded, color: Colors.white)
                      else if (_battleAnswered && _battleSelected == i)
                        const Icon(Icons.cancel_rounded, color: Colors.white),
                    ],
                  ),
                ),
              ),
            );
          }),

          if (_battleAnswered) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: Text('💡 ${quiz['explanation']}', style: TextStyle(color: Colors.purple.shade900, fontSize: 13)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _battleIndex = (_battleIndex + 1) % _battleQuizzes.length;
                  _battleAnswered = false;
                  _battleSelected = null;
                });
                _audio.playClick();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8E44AD),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(_battleIndex + 1 < _battleQuizzes.length ? 'Défi Suivant' : 'Recommencer l\'entraînement'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEtreHouseTab() {
    final vandertrampVerbs = [
      {'v': 'Devenir (devenu)', 'meaning': 'to become'},
      {'v': 'Revenir (revenu)', 'meaning': 'to come back'},
      {'v': 'Monter (monté)', 'meaning': 'to go up'},
      {'v': 'Rester (resté)', 'meaning': 'to stay'},
      {'v': 'Sortir (sorti)', 'meaning': 'to go out'},
      {'v': 'Venir (venu)', 'meaning': 'to come'},
      {'v': 'Aller (allé)', 'meaning': 'to go'},
      {'v': 'Naître (né)', 'meaning': 'to be born'},
      {'v': 'Descendre (descendu)', 'meaning': 'to go down'},
      {'v': 'Entrer (entré)', 'meaning': 'to enter'},
      {'v': 'Rentrer (rentré)', 'meaning': 'to return home'},
      {'v': 'Tomber (tombé)', 'meaning': 'to fall'},
      {'v': 'Retourner (retourné)', 'meaning': 'to go back'},
      {'v': 'Arriver (arrivé)', 'meaning': 'to arrive'},
      {'v': 'Mourir (mort)', 'meaning': 'to die'},
      {'v': 'Partir (parti)', 'meaning': 'to leave'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.teal.shade300),
            ),
            child: Row(
              children: [
                const Icon(Icons.house_rounded, color: Colors.teal, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Les 16 Verbes de la Maison d\'ÊTRE (DR & MRS VANDERTRAMP) : N\'oubliez pas l\'accord du participe passé avec le sujet !',
                    style: TextStyle(color: Colors.teal.shade900, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.4,
            ),
            itemCount: vandertrampVerbs.length,
            itemBuilder: (context, idx) {
              final item = vandertrampVerbs[idx];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item['v']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF8E44AD))),
                    Text(item['meaning']!, style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
