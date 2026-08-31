import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 3 — Recettes de Cuisine
/// Interactive recipe builder studio: step sequencer, imperative verb lab,
/// and ingredient assembler for Nigerian & French dishes.
class JSS2CookingRecipesStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;
  const JSS2CookingRecipesStudioWidget({super.key, required this.lesson});

  @override
  State<JSS2CookingRecipesStudioWidget> createState() => _JSS2CookingRecipesStudioWidgetState();
}

class _JSS2CookingRecipesStudioWidgetState extends State<JSS2CookingRecipesStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS2AudioService _audio = JSS2AudioService();
  late TabController _tabController;

  int _activeRecipe = 0;
  final List<bool> _stepCompleted = [false, false, false, false, false];

  int _verbIndex = 0;
  int _verbScore = 0;
  bool _verbAnswered = false;
  int? _verbSelected;

  static const List<Map<String, dynamic>> _recipes = [
    {
      'name': 'Plantain Frit',
      'emoji': '🍌',
      'origin': '🇳🇬 Nigerian',
      'color': Color(0xFFE67E22),
      'ingredients': ["des plantains mûrs", "de l'huile", 'du sel', 'du piment (facultatif)'],
      'steps': [
        {"step": "D'abord, épluchez les plantains.", "verb": "épluchez", "tip": "Peel carefully!"},
        {"step": "Ensuite, coupez-les en tranches épaisses.", "verb": "coupez", "tip": "2cm thickness works best."},
        {"step": "Faites chauffer l'huile dans une poêle.", "verb": "Faites chauffer", "tip": "Medium-high heat."},
        {"step": "Faites frire les tranches 3–4 minutes de chaque côté.", "verb": "Faites frire", "tip": "Golden brown!"},
        {"step": "Enfin, égouttez et servez chaud.", "verb": "égouttez / servez", "tip": "Bon appétit !"},
      ],
    },
    {
      'name': 'Riz au Gras (Jollof)',
      'emoji': '🍚',
      'origin': '🌍 West African',
      'color': Color(0xFFE74C3C),
      'ingredients': ['du riz long', 'des tomates', 'des oignons', "de l'huile", 'du bouillon', 'des épices'],
      'steps': [
        {"step": "D'abord, mixez les tomates et les oignons.", "verb": "mixez", "tip": "Blend until smooth."},
        {"step": "Faites chauffer l'huile et faites revenir les oignons.", "verb": "Faites revenir", "tip": "Until golden."},
        {"step": "Ajoutez la sauce tomate et faites cuire 15 minutes.", "verb": "Ajoutez / faites cuire", "tip": "Stir regularly."},
        {"step": "Versez le riz lavé et ajoutez le bouillon.", "verb": "Versez / ajoutez", "tip": "Water level: 2cm above rice."},
        {"step": "Faites cuire à feu doux jusqu'à absorption.", "verb": "Faites cuire", "tip": "Cover and do not stir!"},
      ],
    },
    {
      'name': 'Crêpes Françaises',
      'emoji': '🥞',
      'origin': '🇫🇷 French',
      'color': Color(0xFF3498DB),
      'ingredients': ['de la farine', 'des oeufs', 'du lait', 'du beurre', 'du sucre', 'du sel'],
      'steps': [
        {"step": "D'abord, mélangez la farine, le sucre et le sel.", "verb": "mélangez", "tip": "Use a large bowl."},
        {"step": "Ajoutez les oeufs et mélangez bien.", "verb": "Ajoutez / mélangez", "tip": "No lumps!"},
        {"step": "Versez le lait progressivement et mélangez.", "verb": "Versez / mélangez", "tip": "Smooth batter."},
        {"step": "Faites chauffer une poêle et ajoutez du beurre.", "verb": "Faites chauffer / ajoutez", "tip": "Non-stick pan."},
        {"step": "Versez la pâte et faites cuire 1 minute de chaque côté.", "verb": "Versez / faites cuire", "tip": "Flip when edges are golden!"},
      ],
    },
  ];

  static const List<Map<String, dynamic>> _verbDrills = [
    {'sentence': '___ les oignons en petits morceaux.', 'verb': 'Couper', 'correct': 'Coupez', 'options': ['Coupez', 'Couper', 'Coupé', 'Je coupe']},
    {'sentence': '___ du sel dans la soupe.', 'verb': 'Ajouter', 'correct': 'Ajoutez', 'options': ['Ajoutez', 'Ajouter', 'Ajoutons', 'Il ajoute']},
    {'sentence': '___ bien tous les ingrédients.', 'verb': 'Mélanger', 'correct': 'Mélangez', 'options': ['Mélangez', 'Mélanger', 'Mélangeons', 'Mélangent']},
    {'sentence': "___ l'huile dans la poêle chaude.", 'verb': 'Verser', 'correct': 'Versez', 'options': ['Versez', 'Verser', 'Il verse', 'Versons']},
    {'sentence': '___ à feu doux pendant 20 minutes.', 'verb': 'Faire cuire', 'correct': 'Faites cuire', 'options': ['Faites cuire', 'Faire cuire', 'Font cuire', 'Fais cuire']},
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
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8E44AD), Color(0xFFD35400)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.soup_kitchen_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Studio de Recettes — Cuisine Mondiale',
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
            labelColor: const Color(0xFF8E44AD),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF8E44AD),
            tabs: const [
              Tab(icon: Icon(Icons.format_list_numbered_rounded, size: 18), text: 'Recette'),
              Tab(icon: Icon(Icons.local_fire_department_rounded, size: 18), text: 'Impératif'),
              Tab(icon: Icon(Icons.list_alt_rounded, size: 18), text: 'Ingrédients'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [_buildRecipeTab(), _buildVerbDrillTab(), _buildIngredientsTab()],
          ),
        ),
      ],
    );
  }

  Widget _buildRecipeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recipe selector
          Text('Choisissez une recette :', style: LangHueyTextStyles.h2.copyWith(fontSize: 15)),
          const SizedBox(height: 12),
          Row(
            children: List.generate(_recipes.length, (i) {
              final r = _recipes[i];
              final selected = _activeRecipe == i;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _activeRecipe = i;
                        for (int j = 0; j < _stepCompleted.length; j++) _stepCompleted[j] = false;
                      });
                      _audio.playClick();
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selected ? (r['color'] as Color) : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: selected ? (r['color'] as Color) : Colors.black12),
                      ),
                      child: Column(
                        children: [
                          Text(r['emoji'] as String, style: const TextStyle(fontSize: 24)),
                          const SizedBox(height: 4),
                          Text(r['name'] as String, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: selected ? Colors.white : LangHueyColors.charcoal), textAlign: TextAlign.center),
                          Text(r['origin'] as String, style: TextStyle(fontSize: 8, color: selected ? Colors.white60 : LangHueyColors.textMuted)),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),

          // Steps
          Text('Étapes de la recette :', style: LangHueyTextStyles.h2.copyWith(fontSize: 15)),
          const SizedBox(height: 12),
          ...(_recipes[_activeRecipe]['steps'] as List).asMap().entries.map((e) {
            final step = e.value as Map<String, dynamic>;
            final done = _stepCompleted[e.key];
            final color = _recipes[_activeRecipe]['color'] as Color;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() => _stepCompleted[e.key] = !_stepCompleted[e.key]);
                  _audio.playClick();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: done ? color.withOpacity(0.1) : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: done ? color : Colors.black12, width: done ? 2 : 1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: done ? color : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: done
                              ? const Icon(Icons.check_rounded, color: Colors.white, size: 18)
                              : Text('${e.key + 1}', style: TextStyle(fontWeight: FontWeight.bold, color: done ? Colors.white : Colors.black54)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(step['step'] as String, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: done ? color : Colors.black87)),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                                  child: Text('🔤 ${step['verb']}', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color)),
                                ),
                                const SizedBox(width: 8),
                                Text('💡 ${step['tip']}', style: const TextStyle(fontSize: 10, color: Colors.black54)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),

          // Progress
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: _stepCompleted.where((s) => s).length / _stepCompleted.length,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(_recipes[_activeRecipe]['color'] as Color),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 6),
          Text(
            '${_stepCompleted.where((s) => s).length}/${_stepCompleted.length} étapes complétées',
            style: LangHueyTextStyles.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildVerbDrillTab() {
    if (_verbIndex >= _verbDrills.length) {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.emoji_events_rounded, color: Color(0xFFFFD700), size: 64),
          const SizedBox(height: 16),
          Text('Impératif maîtrisé !', style: LangHueyTextStyles.h1),
          const SizedBox(height: 8),
          Text('Score : $_verbScore / ${_verbDrills.length}', style: LangHueyTextStyles.h2.copyWith(color: LangHueyColors.deepTeal)),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => setState(() { _verbIndex = 0; _verbScore = 0; _verbAnswered = false; _verbSelected = null; }),
            style: ElevatedButton.styleFrom(backgroundColor: LangHueyColors.deepTeal, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: const Text('Recommencer'),
          ),
        ]),
      );
    }
    final q = _verbDrills[_verbIndex];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('${_verbIndex + 1}/${_verbDrills.length}', style: LangHueyTextStyles.bodySmall),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(color: const Color(0xFF8E44AD), borderRadius: BorderRadius.circular(20)),
              child: Text('Score : $_verbScore', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ]),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF8E44AD), Color(0xFFD35400)]),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                Text('Verbe : ${q['verb']}', style: const TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 8),
                Text(q['sentence'] as String, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                const SizedBox(height: 8),
                const Text('Choisissez la forme impérative correcte.', style: TextStyle(color: Colors.white60, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...(q['options'] as List<String>).asMap().entries.map((e) {
            final isCorrect = e.value == q['correct'];
            final isSelected = _verbSelected == e.key;
            Color bgColor = Colors.white;
            if (_verbAnswered) {
              if (isCorrect) bgColor = const Color(0xFF2ECC71);
              else if (isSelected) bgColor = const Color(0xFFE74C3C);
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: _verbAnswered ? null : () {
                  setState(() { _verbSelected = e.key; _verbAnswered = true; if (isCorrect) _verbScore++; });
                  isCorrect ? _audio.playCorrect() : _audio.playIncorrect();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: isSelected && !_verbAnswered ? const Color(0xFF8E44AD) : Colors.black12),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text(e.value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _verbAnswered && (isCorrect || isSelected) ? Colors.white : Colors.black87)),
                    if (_verbAnswered && isCorrect) const Icon(Icons.check_circle_rounded, color: Colors.white),
                    if (_verbAnswered && isSelected && !isCorrect) const Icon(Icons.cancel_rounded, color: Colors.white),
                  ]),
                ),
              ),
            );
          }),
          if (_verbAnswered) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => setState(() { _verbIndex++; _verbAnswered = false; _verbSelected = null; }),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8E44AD), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: Text(_verbIndex + 1 < _verbDrills.length ? 'Suivant →' : 'Voir score'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildIngredientsTab() {
    final recipe = _recipes[_activeRecipe];
    final color = recipe['color'] as Color;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(18), border: Border.all(color: color.withOpacity(0.3))),
            child: Row(
              children: [
                Text(recipe['emoji'] as String, style: const TextStyle(fontSize: 40)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(recipe['name'] as String, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
                      Text(recipe['origin'] as String, style: const TextStyle(fontSize: 13, color: Colors.black54)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text('Ingrédients nécessaires :', style: LangHueyTextStyles.h2.copyWith(fontSize: 15)),
          const SizedBox(height: 12),
          ...(recipe['ingredients'] as List<String>).asMap().entries.map((e) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(8)),
                    child: Center(child: Text('${e.key + 1}', style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 12))),
                  ),
                  const SizedBox(width: 12),
                  Text(e.value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                ],
              ),
            );
          }),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: LangHueyColors.warmCream, borderRadius: BorderRadius.circular(14), border: Border.all(color: LangHueyColors.amberGold.withOpacity(0.4))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('💡 Séquenceurs de recette :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 8),
                ...["D'abord… (First of all…)", 'Ensuite… (Then…)', 'Puis… (Then…)', 'Enfin… (Finally…)', 'Après avoir cuit… (After cooking…)'].map((s) =>
                  Padding(padding: const EdgeInsets.only(bottom: 4), child: Text('• $s', style: const TextStyle(fontSize: 12)))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
