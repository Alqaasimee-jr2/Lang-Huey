import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 6 — Comparer (personnes, objets, situations)
/// Comparative Duel Arena: Superiority, Inferiority, Equality,
/// Irregular forms (bon -> meilleur), and Live Podium Ranking.
class JSS3ComparisonSuperlativesStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3ComparisonSuperlativesStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3ComparisonSuperlativesStudioWidget> createState() =>
      _JSS3ComparisonSuperlativesStudioWidgetState();
}

class _JSS3ComparisonSuperlativesStudioWidgetState
    extends State<JSS3ComparisonSuperlativesStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  int _selectedDuelIndex = 0;

  // Comparison Quiz State
  int _compIndex = 0;
  int _compScore = 0;
  bool _compAnswered = false;
  int? _compSelected;

  static const List<Map<String, dynamic>> _duels = [
    {
      'title': 'Lagos vs Abuja',
      'itemA': {'name': 'Lagos', 'emoji': '🏙️', 'desc': 'Dynamique, peuplée, côtière'},
      'itemB': {'name': 'Abuja', 'emoji': '🏛️', 'desc': 'Calme, ordonnée, moderne'},
      'comparisons': [
        'Lagos est plus grand et plus animé qu\'Abuja. (+)',
        'Abuja est moins bruyante et moins polluée que Lagos. (−)',
        'Abuja est aussi moderne que les grandes capitales. (=)',
        'Lagos est la ville la plus dynamique du Nigeria ! (Superlatif)',
      ],
    },
    {
      'title': 'L\'Avion vs Le Train',
      'itemA': {'name': 'L\'Avion', 'emoji': '✈️', 'desc': 'Rapide, aérien, plus cher'},
      'itemB': {'name': 'Le Train', 'emoji': '🚆', 'desc': 'Confortable, terrestre, économique'},
      'comparisons': [
        'L\'avion est plus rapide que le train. (+)',
        'Le train est moins cher et moins stressant que l\'avion. (−)',
        'Le train moderne est aussi confortable que l\'avion. (=)',
        'L\'avion est le moyen de transport le plus rapide du monde. (Superlatif)',
      ],
    },
    {
      'title': 'Le Jollof Rice Nigérian vs Autres Plats',
      'itemA': {'name': 'Jollof Nigérian', 'emoji': '🍛', 'desc': 'Épicé, savoureux, fumé'},
      'itemB': {'name': 'Riz Blanc', 'emoji': '🍚', 'desc': 'Simple, neutre'},
      'comparisons': [
        'Le jollof rice est plus délicieux et plus parfumé que le riz blanc. (+)',
        'Le riz blanc est moins épicé que le jollof. (−)',
        'Le jollof rice nigérian est le meilleur plat d\'Afrique ! (Superlatif)',
      ],
    },
  ];

  static const List<Map<String, dynamic>> _quizzes = [
    {
      'prompt': 'Complétez : « L\'or est ___ précieux ___ l\'argent. » (supériorité)',
      'options': ['plus ... que', 'moins ... de', 'aussi ... de', 'meilleur ... que'],
      'correct': 0,
      'explanation': 'Comparative of superiority for adjectives is "plus + adjectif + que".',
    },
    {
      'prompt': 'Quel est le comparatif régulier de l\'adjectif « BON » ?',
      'options': ['plus bon', 'meilleur', 'mieux', 'très bon'],
      'correct': 1,
      'explanation': '"Bon" becomes "meilleur" (feminine "meilleure"). "Plus bon" is incorrect.',
    },
    {
      'prompt': '« Elle a ___ devoirs ___ son frère. » (égalité de quantité)',
      'options': ['aussi ... que', 'autant de ... que', 'plus ... de', 'moins ... que'],
      'correct': 1,
      'explanation': 'For quantities of nouns, use "autant de + nom + que" for equality.',
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
              colors: [Color(0xFFF39C12), Color(0xFFD35400)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.compare_arrows_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Arène des Comparatifs & Superlatifs',
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
            labelColor: const Color(0xFFD35400),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFFD35400),
            tabs: const [
              Tab(icon: Icon(Icons.sports_kabaddi_rounded, size: 18), text: 'Arène Duel'),
              Tab(icon: Icon(Icons.rule_rounded, size: 18), text: 'Règles & Irréguliers'),
              Tab(icon: Icon(Icons.quiz_rounded, size: 18), text: 'Défi Comparatif'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildDuelTab(),
              _buildRulesTab(),
              _buildQuizTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDuelTab() {
    final duel = _duels[_selectedDuelIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_duels.length, (index) {
                final d = _duels[index];
                final isSelected = _selectedDuelIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(d['title'] as String),
                    selected: isSelected,
                    selectedColor: Colors.orange.shade100,
                    side: BorderSide(color: isSelected ? Colors.orange : Colors.black12),
                    onSelected: (val) {
                      if (val) {
                        setState(() => _selectedDuelIndex = index);
                        _audio.playClick();
                      }
                    },
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),

          // Side-by-side Battle Cards
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.blue.shade300),
                  ),
                  child: Column(
                    children: [
                      Text(duel['itemA']['emoji'] as String, style: const TextStyle(fontSize: 36)),
                      const SizedBox(height: 4),
                      Text(duel['itemA']['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(duel['itemA']['desc'] as String, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade700, fontSize: 11)),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('VS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFFD35400))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.green.shade300),
                  ),
                  child: Column(
                    children: [
                      Text(duel['itemB']['emoji'] as String, style: const TextStyle(fontSize: 36)),
                      const SizedBox(height: 4),
                      Text(duel['itemB']['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(duel['itemB']['desc'] as String, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade700, fontSize: 11)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Comparison sentences
          Text('Formules Comparatives en Action :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 12),
          ...(duel['comparisons'] as List<String>).map((c) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(c, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: LangHueyColors.charcoal)),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildRulesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1. Comparatifs avec les Adjectifs :', style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                const SizedBox(height: 8),
                Text('• Supériorité (+) : plus + adjectif + que (plus grand que)\n• Infériorité (−) : moins + adjectif + que (moins cher que)\n• Égalité (=) : aussi + adjectif + que (aussi intelligent que)', style: const TextStyle(fontSize: 13, height: 1.5)),
              ],
            ),
          ),
          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('2. Comparatifs avec les Noms (Quantités) :', style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                const SizedBox(height: 8),
                Text('• plus DE + nom + que (plus de livres que)\n• moins DE + nom + que (moins d\'argent que)\n• autant DE + nom + que (autant d\'amis que)', style: const TextStyle(fontSize: 13, height: 1.5)),
              ],
            ),
          ),
          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.amber.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.warning_amber_rounded, color: Colors.brown, size: 20),
                    SizedBox(width: 8),
                    Text('3. Formes Irrégulières Spéciales (BECE Trap) :', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('• BON ➔ MEILLEUR(E) ➔ LE MEILLEUR (Never say: "plus bon")\n• BIEN (adverbe) ➔ MIEUX ➔ LE MIEUX (Never say: "plus bien")', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizTab() {
    final quiz = _quizzes[_compIndex];

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
                Text('Défi Comparatif (#${_compIndex + 1} / ${_quizzes.length})', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Score: $_compScore pts', style: const TextStyle(color: LangHueyColors.amberGold, fontWeight: FontWeight.bold)),
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

            if (_compAnswered) {
              if (isCorrect) {
                btnColor = const Color(0xFF2ECC71);
                textColor = Colors.white;
              } else if (_compSelected == i) {
                btnColor = const Color(0xFFE74C3C);
                textColor = Colors.white;
              }
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: !_compAnswered
                    ? () {
                        setState(() {
                          _compAnswered = true;
                          _compSelected = i;
                          if (isCorrect) {
                            _compScore += 10;
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
                    border: Border.all(color: _compAnswered && (isCorrect || _compSelected == i) ? Colors.transparent : Colors.black12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(opt, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 15)),
                      if (_compAnswered && isCorrect)
                        const Icon(Icons.check_circle_rounded, color: Colors.white)
                      else if (_compAnswered && _compSelected == i)
                        const Icon(Icons.cancel_rounded, color: Colors.white),
                    ],
                  ),
                ),
              ),
            );
          }),

          if (_compAnswered) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.orange.shade300),
              ),
              child: Text('💡 ${quiz['explanation']}', style: TextStyle(color: Colors.orange.shade900, fontSize: 13)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _compIndex = (_compIndex + 1) % _quizzes.length;
                  _compAnswered = false;
                  _compSelected = null;
                });
                _audio.playClick();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD35400),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(_compIndex + 1 < _quizzes.length ? 'Défi Suivant' : 'Recommencer'),
            ),
          ],
        ],
      ),
    );
  }
}
