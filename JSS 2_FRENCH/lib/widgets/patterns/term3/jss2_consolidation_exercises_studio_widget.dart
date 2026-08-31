import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 6 — Révision générale des Unités 17–20
/// 4-station rotation consolidation hub: Arithmetic Sprint, Food Flash Cards,
/// Recipe Builder, and Restaurant Reconstruction.
class JSS2ConsolidationExercisesStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;
  const JSS2ConsolidationExercisesStudioWidget({super.key, required this.lesson});

  @override
  State<JSS2ConsolidationExercisesStudioWidget> createState() => _JSS2ConsolidationExercisesStudioWidgetState();
}

class _JSS2ConsolidationExercisesStudioWidgetState extends State<JSS2ConsolidationExercisesStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS2AudioService _audio = JSS2AudioService();
  late TabController _tabController;

  // Station 1: Arithmetic
  int _mathQ = 0, _mathScore = 0;
  bool _mathAnswered = false;
  int? _mathSelected;

  // Station 2: Food Flash Cards
  int _flashCard = 0;
  bool _showAnswer = false;

  // Station 3: Recipe fill-in
  int _recipeQ = 0, _recipeScore = 0;
  bool _recipeAnswered = false;
  int? _recipeSelected;

  // Station 4: Restaurant fill-in
  int _restQ = 0, _restScore = 0;
  bool _restAnswered = false;
  int? _restSelected;

  static const List<Map<String, dynamic>> _mathQuiz = [
    {'q': 'Treize plus dix-sept font ___', 'a': '30 / trente', 'opts': ['30 / trente', '29 / vingt-neuf', '31 / trente et un', '20 / vingt']},
    {'q': 'Quarante-cinq divisé par neuf font ___', 'a': '5 / cinq', 'opts': ['5 / cinq', '6 / six', '4 / quatre', '9 / neuf']},
    {'q': 'Sept fois huit font ___', 'a': '56 / cinquante-six', 'opts': ['56 / cinquante-six', '54 / cinquante-quatre', '63 / soixante-trois', '48 / quarante-huit']},
    {'q': 'Soixante moins trente-deux font ___', 'a': '28 / vingt-huit', 'opts': ['28 / vingt-huit', '32 / trente-deux', '22 / vingt-deux', '38 / trente-huit']},
  ];

  static const List<Map<String, String>> _flashCards = [
    {'fr': "de l'eau", 'en': 'water', 'rule': "Eau starts with a vowel → de l'eau"},
    {'fr': 'du riz', 'en': 'rice', 'rule': 'Riz is masculine → du riz'},
    {'fr': 'de la viande', 'en': 'meat', 'rule': 'Viande is feminine → de la viande'},
    {'fr': 'des légumes', 'en': 'vegetables', 'rule': 'Plural → des légumes'},
    {'fr': 'du lait', 'en': 'milk', 'rule': 'Lait is masculine → du lait'},
    {'fr': 'de la farine', 'en': 'flour', 'rule': 'Farine is feminine → de la farine'},
  ];

  static const List<Map<String, dynamic>> _recipeQuiz = [
    {'q': '"___ les oignons en petits morceaux." (Couper)', 'a': 'Coupez', 'opts': ['Coupez', 'Couper', 'Coupé', 'Je coupe']},
    {'q': '"D\'abord, ___ bien les ingrédients." (Mélanger)', 'a': 'mélangez', 'opts': ['mélangez', 'mélanger', 'mélangeons', 'il mélange']},
    {'q': '"___ le riz lavé dans la casserole." (Verser)', 'a': 'Versez', 'opts': ['Versez', 'Verser', 'Il verse', 'Versons']},
    {'q': '"Enfin, ___ à feu doux." (Faire cuire)', 'a': 'faites cuire', 'opts': ['faites cuire', 'faire cuire', 'font cuire', 'fais cuire']},
  ];

  static const List<Map<String, dynamic>> _restaurantQuiz = [
    {'q': 'Pour demander la note, on dit :', 'a': "L'addition, s'il vous plaît !", 'opts': ["L'addition, s'il vous plaît !", 'La facture, s\'il vous plaît !', 'Le plat, s\'il vous plaît !', 'La carte, s\'il vous plaît !']},
    {'q': 'La forme polie pour commander est :', 'a': 'Je voudrais…', 'opts': ['Je voudrais…', 'Je veux…', 'Donnez-moi…', 'Il me faut…']},
    {'q': 'L\'ordre d\'un repas français est :', 'a': 'Entrée → Plat → Dessert', 'opts': ['Entrée → Plat → Dessert', 'Dessert → Plat → Entrée', 'Plat → Entrée → Dessert', 'Dessert → Entrée → Plat']},
    {'q': 'On dit _____ avant de commencer à manger.', 'a': 'Bon appétit !', 'opts': ['Bon appétit !', "L'addition !", 'Merci !', 'Au revoir !']},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF1ABC9C), Color(0xFF2980B9)]),
          ),
          child: Row(children: [
            const Icon(Icons.refresh_rounded, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Expanded(child: Text('Révision 4 Stations — Unités 17–20', style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 16))),
          ]),
        ),
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF1ABC9C),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF1ABC9C),
            isScrollable: true,
            tabs: const [
              Tab(icon: Icon(Icons.calculate_rounded, size: 16), text: 'Calcul'),
              Tab(icon: Icon(Icons.flash_on_rounded, size: 16), text: 'Nourriture'),
              Tab(icon: Icon(Icons.soup_kitchen_rounded, size: 16), text: 'Recette'),
              Tab(icon: Icon(Icons.restaurant_rounded, size: 16), text: 'Restaurant'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [_buildMathStation(), _buildFlashStation(), _buildRecipeStation(), _buildRestStation()],
          ),
        ),
      ],
    );
  }

  Widget _buildQuizStation({
    required List<Map<String, dynamic>> questions,
    required int index,
    required int score,
    required bool answered,
    required int? selected,
    required Color color,
    required String title,
    required VoidCallback onRestart,
    required Function(int) onAnswer,
    required VoidCallback onNext,
  }) {
    if (index >= questions.length) {
      return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.emoji_events_rounded, color: Color(0xFFFFD700), size: 64),
        const SizedBox(height: 16),
        Text('$title : Terminé !', style: LangHueyTextStyles.h1, textAlign: TextAlign.center),
        const SizedBox(height: 8),
        Text('Score : $score / ${questions.length}', style: LangHueyTextStyles.h2.copyWith(color: LangHueyColors.deepTeal)),
        const SizedBox(height: 24),
        ElevatedButton(onPressed: onRestart, style: ElevatedButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Recommencer')),
      ]));
    }
    final q = questions[index];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('${index + 1}/${questions.length}', style: LangHueyTextStyles.bodySmall),
          Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
            child: Text('Score : $score', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        ]),
        const SizedBox(height: 16),
        Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: BoxDecoration(gradient: LinearGradient(colors: [color.withOpacity(0.8), color]), borderRadius: BorderRadius.circular(18)),
          child: Text(q['q'] as String, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
        const SizedBox(height: 16),
        ...(q['opts'] as List<String>).asMap().entries.map((e) {
          final isCorrect = e.value == q['a'];
          final isSelected = selected == e.key;
          Color bgColor = Colors.white;
          if (answered) { if (isCorrect) bgColor = const Color(0xFF2ECC71); else if (isSelected) bgColor = const Color(0xFFE74C3C); }
          return Padding(padding: const EdgeInsets.only(bottom: 8), child: GestureDetector(
            onTap: answered ? null : () => onAnswer(e.key),
            child: AnimatedContainer(duration: const Duration(milliseconds: 200), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(14), border: Border.all(color: isSelected && !answered ? color : Colors.black12)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(child: Text(e.value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: answered && (isCorrect || isSelected) ? Colors.white : Colors.black87))),
                if (answered && isCorrect) const Icon(Icons.check_circle_rounded, color: Colors.white),
                if (answered && isSelected && !isCorrect) const Icon(Icons.cancel_rounded, color: Colors.white),
              ]))));
        }),
        if (answered) ...[const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onNext, style: ElevatedButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: Text(index + 1 < questions.length ? 'Suivant →' : 'Voir score'))),
        ],
      ]),
    );
  }

  Widget _buildMathStation() => _buildQuizStation(
    questions: _mathQuiz, index: _mathQ, score: _mathScore, answered: _mathAnswered, selected: _mathSelected, color: const Color(0xFF6C3483), title: 'Sprint Calcul',
    onRestart: () => setState(() { _mathQ = 0; _mathScore = 0; _mathAnswered = false; _mathSelected = null; }),
    onAnswer: (idx) { final isCorrect = idx == _mathQuiz[_mathQ]['opts'].indexOf(_mathQuiz[_mathQ]['a']); setState(() { _mathSelected = idx; _mathAnswered = true; if (isCorrect) _mathScore++; }); isCorrect ? _audio.playCorrect() : _audio.playIncorrect(); },
    onNext: () => setState(() { _mathQ++; _mathAnswered = false; _mathSelected = null; }),
  );

  Widget _buildFlashStation() {
    final card = _flashCards[_flashCard];
    return SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(children: [
      Text('Flash Cards — Articles Partitifs', style: LangHueyTextStyles.h2.copyWith(fontSize: 15)),
      const SizedBox(height: 8),
      Text('${_flashCard + 1}/${_flashCards.length}', style: LangHueyTextStyles.bodySmall),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () { setState(() => _showAnswer = !_showAnswer); _audio.playClick(); },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity, height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: _showAnswer ? [const Color(0xFF2ECC71), const Color(0xFF1ABC9C)] : [const Color(0xFFE67E22), const Color(0xFFF39C12)]),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 16, offset: const Offset(0, 6))],
          ),
          child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(_showAnswer ? card['fr']! : card['en']!, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(_showAnswer ? card['rule']! : 'Tapez pour voir l\'article partitif', style: const TextStyle(color: Colors.white70, fontSize: 13), textAlign: TextAlign.center),
            const SizedBox(height: 8),
            const Icon(Icons.touch_app_rounded, color: Colors.white54, size: 24),
          ])),
        ),
      ),
      const SizedBox(height: 20),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        OutlinedButton.icon(
          onPressed: _flashCard > 0 ? () { setState(() { _flashCard--; _showAnswer = false; }); _audio.playClick(); } : null,
          icon: const Icon(Icons.arrow_back_rounded), label: const Text('Précédent'),
          style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        ),
        const SizedBox(width: 12),
        ElevatedButton.icon(
          onPressed: _flashCard < _flashCards.length - 1 ? () { setState(() { _flashCard++; _showAnswer = false; }); _audio.playClick(); } : null,
          icon: const Icon(Icons.arrow_forward_rounded), label: const Text('Suivant'),
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE67E22), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        ),
      ]),
    ]));
  }

  Widget _buildRecipeStation() => _buildQuizStation(
    questions: _recipeQuiz, index: _recipeQ, score: _recipeScore, answered: _recipeAnswered, selected: _recipeSelected, color: const Color(0xFF8E44AD), title: 'Impératif Recette',
    onRestart: () => setState(() { _recipeQ = 0; _recipeScore = 0; _recipeAnswered = false; _recipeSelected = null; }),
    onAnswer: (idx) { final isCorrect = idx == _recipeQuiz[_recipeQ]['opts'].indexOf(_recipeQuiz[_recipeQ]['a']); setState(() { _recipeSelected = idx; _recipeAnswered = true; if (isCorrect) _recipeScore++; }); isCorrect ? _audio.playCorrect() : _audio.playIncorrect(); },
    onNext: () => setState(() { _recipeQ++; _recipeAnswered = false; _recipeSelected = null; }),
  );

  Widget _buildRestStation() => _buildQuizStation(
    questions: _restaurantQuiz, index: _restQ, score: _restScore, answered: _restAnswered, selected: _restSelected, color: const Color(0xFF2C3E50), title: 'Restaurant',
    onRestart: () => setState(() { _restQ = 0; _restScore = 0; _restAnswered = false; _restSelected = null; }),
    onAnswer: (idx) { final isCorrect = idx == _restaurantQuiz[_restQ]['opts'].indexOf(_restaurantQuiz[_restQ]['a']); setState(() { _restSelected = idx; _restAnswered = true; if (isCorrect) _restScore++; }); isCorrect ? _audio.playCorrect() : _audio.playIncorrect(); },
    onNext: () => setState(() { _restQ++; _restAnswered = false; _restSelected = null; }),
  );
}
