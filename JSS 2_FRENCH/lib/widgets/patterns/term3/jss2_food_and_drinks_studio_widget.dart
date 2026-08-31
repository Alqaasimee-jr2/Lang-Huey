import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 2 — Nourriture et Boissons
/// Interactive food & drinks explorer with meal builder, preferences selector,
/// and MANGER/BOIRE conjugation drill.
class JSS2FoodAndDrinksStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;
  const JSS2FoodAndDrinksStudioWidget({super.key, required this.lesson});

  @override
  State<JSS2FoodAndDrinksStudioWidget> createState() => _JSS2FoodAndDrinksStudioWidgetState();
}

class _JSS2FoodAndDrinksStudioWidgetState extends State<JSS2FoodAndDrinksStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS2AudioService _audio = JSS2AudioService();
  late TabController _tabController;

  String _selectedMeal = 'petit-déjeuner';
  final Set<String> _selectedFoods = {};
  final Set<String> _selectedDrinks = {};
  String _preferenceMode = 'aimer'; // aimer, preferer, adorer, detester

  int _conjIndex = 0;
  int _conjScore = 0;
  bool _conjAnswered = false;
  int? _conjSelected;

  static const Map<String, List<Map<String, dynamic>>> _foods = {
    'petit-déjeuner': [
      {'fr': 'le pain', 'en': 'bread', 'icon': '🍞', 'article': 'du pain'},
      {'fr': 'les oeufs', 'en': 'eggs', 'icon': '🥚', 'article': 'des oeufs'},
      {'fr': 'la bouillie', 'en': 'porridge', 'icon': '🥣', 'article': 'de la bouillie'},
      {'fr': 'le beurre', 'en': 'butter', 'icon': '🧈', 'article': 'du beurre'},
    ],
    'déjeuner': [
      {'fr': 'le riz', 'en': 'rice', 'icon': '🍚', 'article': 'du riz'},
      {'fr': 'la viande', 'en': 'meat', 'icon': '🥩', 'article': 'de la viande'},
      {'fr': 'le poisson', 'en': 'fish', 'icon': '🐟', 'article': 'du poisson'},
      {'fr': 'les légumes', 'en': 'vegetables', 'icon': '🥦', 'article': 'des légumes'},
    ],
    'dîner': [
      {'fr': 'le foufou', 'en': 'fufu', 'icon': '🫕', 'article': 'du foufou'},
      {'fr': 'la soupe', 'en': 'soup', 'icon': '🍲', 'article': 'de la soupe'},
      {'fr': 'le plantain', 'en': 'plantain', 'icon': '🍌', 'article': 'du plantain'},
      {'fr': 'les haricots', 'en': 'beans', 'icon': '🫘', 'article': 'des haricots'},
    ],
  };

  static const List<Map<String, dynamic>> _drinks = [
    {'fr': "l'eau", 'en': 'water', 'icon': '💧', 'article': "de l'eau"},
    {'fr': 'le jus', 'en': 'juice', 'icon': '🍊', 'article': 'du jus'},
    {'fr': 'le lait', 'en': 'milk', 'icon': '🥛', 'article': 'du lait'},
    {'fr': 'le thé', 'en': 'tea', 'icon': '🍵', 'article': 'du thé'},
    {'fr': 'la limonade', 'en': 'lemonade', 'icon': '🍋', 'article': 'de la limonade'},
  ];

  static const List<Map<String, dynamic>> _conjQuizzes = [
    {'pronoun': 'Je', 'verb': 'MANGER', 'correct': 'mange', 'options': ['mange', 'manges', 'mangeons', 'mangez']},
    {'pronoun': 'Tu', 'verb': 'BOIRE', 'correct': 'bois', 'options': ['bois', 'boit', 'buvons', 'buvez']},
    {'pronoun': 'Il / Elle', 'verb': 'MANGER', 'correct': 'mange', 'options': ['mange', 'manges', 'mangeons', 'mangent']},
    {'pronoun': 'Nous', 'verb': 'BOIRE', 'correct': 'buvons', 'options': ['buvons', 'boivons', 'buvez', 'boivent']},
    {'pronoun': 'Vous', 'verb': 'MANGER', 'correct': 'mangez', 'options': ['mangez', 'mange', 'mangeons', 'mangent']},
    {'pronoun': 'Ils / Elles', 'verb': 'BOIRE', 'correct': 'boivent', 'options': ['boivent', 'buvons', 'boit', 'buvez']},
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

  String _buildMealSentence() {
    if (_selectedFoods.isEmpty && _selectedDrinks.isEmpty) return '';
    final parts = <String>[];
    if (_selectedFoods.isNotEmpty) {
      parts.add('Je mange ${_selectedFoods.join(", ")}');
    }
    if (_selectedDrinks.isNotEmpty) {
      parts.add('je bois ${_selectedDrinks.join(" et ")}');
    }
    return '${parts.join(" et ")} au $_selectedMeal.';
  }

  String _buildPreferenceSentence(String article, String verb) {
    switch (verb) {
      case 'aimer': return "J'aime $article.";
      case 'preferer': return 'Je préfère $article.';
      case 'adorer': return "J'adore $article.";
      case 'detester': return 'Je déteste $article.';
      default: return '';
    }
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
              colors: [Color(0xFFE67E22), Color(0xFFF39C12)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.restaurant_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'La Table Africaine & Française',
                  style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFFE67E22),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFFE67E22),
            tabs: const [
              Tab(icon: Icon(Icons.lunch_dining_rounded, size: 18), text: 'Repas'),
              Tab(icon: Icon(Icons.favorite_rounded, size: 18), text: 'Préférences'),
              Tab(icon: Icon(Icons.quiz_rounded, size: 18), text: 'Conjugaison'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [_buildMealBuilderTab(), _buildPreferencesTab(), _buildConjugationTab()],
          ),
        ),
      ],
    );
  }

  Widget _buildMealBuilderTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Composez votre repas :', style: LangHueyTextStyles.h2.copyWith(fontSize: 16)),
          const SizedBox(height: 12),

          // Meal time selector
          Row(
            children: ['petit-déjeuner', 'déjeuner', 'dîner'].map((meal) {
              final icons = {'petit-déjeuner': '☀️', 'déjeuner': '🌤️', 'dîner': '🌙'};
              final selected = _selectedMeal == meal;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () {
                      setState(() { _selectedMeal = meal; _selectedFoods.clear(); });
                      _audio.playClick();
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                      decoration: BoxDecoration(
                        color: selected ? const Color(0xFFE67E22) : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: selected ? const Color(0xFFE67E22) : Colors.black12),
                      ),
                      child: Column(
                        children: [
                          Text(icons[meal]!, style: const TextStyle(fontSize: 20)),
                          const SizedBox(height: 4),
                          Text(
                            meal,
                            style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: selected ? Colors.white : LangHueyColors.charcoal),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          // Food grid
          Text('Aliments :', style: LangHueyTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.85,
            children: (_foods[_selectedMeal] ?? []).map((food) {
              final article = food['article'] as String;
              final selected = _selectedFoods.contains(article);
              return GestureDetector(
                onTap: () {
                  setState(() { if (selected) _selectedFoods.remove(article); else _selectedFoods.add(article); });
                  _audio.playClick();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: selected ? const Color(0xFFE67E22).withOpacity(0.15) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: selected ? const Color(0xFFE67E22) : Colors.black12, width: selected ? 2 : 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(food['icon'] as String, style: const TextStyle(fontSize: 28)),
                      const SizedBox(height: 4),
                      Text(food['fr'] as String, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: selected ? const Color(0xFFE67E22) : LangHueyColors.charcoal), textAlign: TextAlign.center),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          // Drinks
          Text('Boissons :', style: LangHueyTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _drinks.map((drink) {
              final article = drink['article'] as String;
              final selected = _selectedDrinks.contains(article);
              return GestureDetector(
                onTap: () {
                  setState(() { if (selected) _selectedDrinks.remove(article); else _selectedDrinks.add(article); });
                  _audio.playClick();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: selected ? const Color(0xFF3498DB).withOpacity(0.15) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: selected ? const Color(0xFF3498DB) : Colors.black12, width: selected ? 2 : 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(drink['icon'] as String, style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 6),
                      Text(drink['fr'] as String, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: selected ? const Color(0xFF3498DB) : LangHueyColors.charcoal)),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          // Sentence
          if (_selectedFoods.isNotEmpty || _selectedDrinks.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF9E7),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFF39C12).withOpacity(0.4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('📣 Ma phrase française :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFFE67E22))),
                  const SizedBox(height: 8),
                  Text(_buildMealSentence(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87, height: 1.4)),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPreferencesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Exprimez vos préférences alimentaires :', style: LangHueyTextStyles.h2.copyWith(fontSize: 15)),
          const SizedBox(height: 16),

          // Verb selector
          Row(
            children: [
              {'verb': 'aimer', 'icon': '😊', 'color': const Color(0xFF2ECC71)},
              {'verb': 'preferer', 'icon': '⭐', 'color': const Color(0xFF3498DB)},
              {'verb': 'adorer', 'icon': '😍', 'color': const Color(0xFFE74C3C)},
              {'verb': 'detester', 'icon': '😤', 'color': const Color(0xFF95A5A6)},
            ].map((item) {
              final selected = _preferenceMode == item['verb'];
              final color = item['color'] as Color;
              final verbs = {'aimer': "J'aime", 'preferer': 'Je préfère', 'adorer': "J'adore", 'detester': 'Je déteste'};
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: GestureDetector(
                    onTap: () { setState(() => _preferenceMode = item['verb'] as String); _audio.playClick(); },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selected ? color : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: selected ? color : Colors.black12),
                      ),
                      child: Column(
                        children: [
                          Text(item['icon'] as String, style: const TextStyle(fontSize: 20)),
                          const SizedBox(height: 4),
                          Text(verbs[item['verb']]!, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: selected ? Colors.white : LangHueyColors.charcoal), textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          // All foods clickable
          Text('Tapez sur un aliment pour générer votre phrase :', style: LangHueyTextStyles.bodySmall),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...(_foods['petit-déjeuner']! + _foods['déjeuner']! + _foods['dîner']! + _drinks).map((item) {
                return GestureDetector(
                  onTap: () {
                    final article = item['article'] as String;
                    final sentence = _buildPreferenceSentence(article, _preferenceMode);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('📣 $sentence', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      backgroundColor: const Color(0xFFE67E22),
                      duration: const Duration(seconds: 3),
                      behavior: SnackBarBehavior.floating,
                    ));
                    _audio.playClick();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black12),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(item['icon'] as String, style: const TextStyle(fontSize: 18)),
                        const SizedBox(width: 6),
                        Text(item['fr'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: LangHueyColors.warmCream,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: LangHueyColors.amberGold.withOpacity(0.4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('💡 Structures de préférence :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 8),
                ...["J'aime + le/la/les + nom.", 'Je préfère + article + nom (+ à + autre chose).', "J'adore + le/la/les + nom.", 'Je déteste + article + nom.'].map((s) =>
                  Padding(padding: const EdgeInsets.only(bottom: 4), child: Text('• $s', style: const TextStyle(fontSize: 12, color: Colors.black87))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConjugationTab() {
    if (_conjIndex >= _conjQuizzes.length) {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.emoji_events_rounded, color: Color(0xFFFFD700), size: 64),
          const SizedBox(height: 16),
          Text('Conjugaison maîtrisée !', style: LangHueyTextStyles.h1),
          const SizedBox(height: 8),
          Text('Score : $_conjScore / ${_conjQuizzes.length}', style: LangHueyTextStyles.h2.copyWith(color: LangHueyColors.deepTeal)),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => setState(() { _conjIndex = 0; _conjScore = 0; _conjAnswered = false; _conjSelected = null; }),
            style: ElevatedButton.styleFrom(backgroundColor: LangHueyColors.deepTeal, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: const Text('Recommencer'),
          ),
        ]),
      );
    }

    final q = _conjQuizzes[_conjIndex];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('${_conjIndex + 1}/${_conjQuizzes.length}', style: LangHueyTextStyles.bodySmall),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(color: const Color(0xFFE67E22), borderRadius: BorderRadius.circular(20)),
              child: Text('Score : $_conjScore', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ]),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFE67E22), Color(0xFFF39C12)]),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                Text(q['pronoun'] as String, style: const TextStyle(color: Colors.white70, fontSize: 18)),
                Text(q['verb'] as String, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('Choisissez la bonne forme du verbe :', style: TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...(q['options'] as List<String>).asMap().entries.map((e) {
            final isCorrect = e.value == q['correct'];
            final isSelected = _conjSelected == e.key;
            Color bgColor = Colors.white;
            if (_conjAnswered) {
              if (isCorrect) bgColor = const Color(0xFF2ECC71);
              else if (isSelected) bgColor = const Color(0xFFE74C3C);
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: _conjAnswered ? null : () {
                  setState(() { _conjSelected = e.key; _conjAnswered = true; if (isCorrect) _conjScore++; });
                  isCorrect ? _audio.playCorrect() : _audio.playIncorrect();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: isSelected && !_conjAnswered ? const Color(0xFFE67E22) : Colors.black12),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('${q['pronoun']} ${e.value}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _conjAnswered && (isCorrect || isSelected) ? Colors.white : Colors.black87)),
                    if (_conjAnswered && isCorrect) const Icon(Icons.check_circle_rounded, color: Colors.white),
                    if (_conjAnswered && isSelected && !isCorrect) const Icon(Icons.cancel_rounded, color: Colors.white),
                  ]),
                ),
              ),
            );
          }),
          if (_conjAnswered) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => setState(() { _conjIndex++; _conjAnswered = false; _conjSelected = null; }),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE67E22), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: Text(_conjIndex + 1 < _conjQuizzes.length ? 'Suivant →' : 'Voir score'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
