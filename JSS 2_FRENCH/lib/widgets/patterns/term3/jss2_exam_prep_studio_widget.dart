import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 8 — Préparation aux Examens
/// Full exam prep suite: MCQ simulation, error correction workshop,
/// essay planning scaffold, and timed grammar sprint.
class JSS2ExamPrepStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;
  const JSS2ExamPrepStudioWidget({super.key, required this.lesson});

  @override
  State<JSS2ExamPrepStudioWidget> createState() => _JSS2ExamPrepStudioWidgetState();
}

class _JSS2ExamPrepStudioWidgetState extends State<JSS2ExamPrepStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS2AudioService _audio = JSS2AudioService();
  late TabController _tabController;

  // MCQ
  int _mcqIndex = 0, _mcqScore = 0;
  bool _mcqAnswered = false;
  int? _mcqSelected;

  // Error correction
  int _errIndex = 0;
  bool _errRevealed = false;

  // Essay plan
  int _essayTopic = 0;
  final Map<String, String> _essayNotes = {};

  // Grammar sprint
  int _sprintQ = 0, _sprintScore = 0;
  bool _sprintAnswered = false;
  int? _sprintSelected;

  static const List<Map<String, dynamic>> _mcqQuestions = [
    {'q': 'Je voudrais réserver ___ table pour deux personnes.', 'a': 'une', 'opts': ['une', 'un', 'des', 'le']},
    {'q': 'Comment dit-on "I am eating rice" en français ?', 'a': 'Je mange du riz.', 'opts': ['Je mange du riz.', 'Je mange le riz.', "J'ai mangé du riz.", 'Je mangeais du riz.']},
    {'q': '15 × 4 = ___', 'a': 'soixante', 'opts': ['soixante', 'quarante', 'cinquante', 'soixante-dix']},
    {'q': 'Pour demander la note au restaurant, on dit :', 'a': "L'addition, s'il vous plaît.", 'opts': ["L'addition, s'il vous plaît.", 'La note, vite !', 'Payez maintenant.', 'Je veux payer.']},
    {'q': 'D\'abord, ___ les légumes. (Couper - impératif)', 'a': 'coupez', 'opts': ['coupez', 'coupons', 'couper', 'je coupe']},
    {'q': 'Quel article partitif utilise-t-on pour "milk" (masculin) ?', 'a': 'du lait', 'opts': ['du lait', 'de la lait', 'des lait', 'de lait']},
    {'q': '"Il ___  ___ eau." (boire)', 'a': 'boit de l\'', 'opts': ["boit de l'", "mange de l'", "boit du", "boit la"]},
    {'q': 'Quelle est la forme correcte ? (Nous – MANGER)', 'a': 'Nous mangeons', 'opts': ['Nous mangeons', 'Nous mangez', 'Nous manges', 'Nous mangent']},
  ];

  static const List<Map<String, String>> _errorExercises = [
    {'incorrect': 'Je voudrais le poulet rôti et le eau minérale.', 'correct': "Je voudrais le poulet rôti et l'eau minérale.", 'rule': "l'eau — Eau commence par une voyelle, donc le devient l'."},
    {'incorrect': "D'abord, couper les oignons en petits morceaux.", 'correct': "D'abord, coupez les oignons en petits morceaux.", 'rule': "Les recettes utilisent l'impératif : couper devient coupez."},
    {'incorrect': 'Je mange la riz tous les jours.', 'correct': 'Je mange du riz tous les jours.', 'rule': "Le riz est masculin. Article partitif : du riz."},
    {'incorrect': 'Nous allons au restaurant en pied.', 'correct': 'Nous allons au restaurant à pied.', 'rule': "On dit à pied, pas en pied."},
    {'incorrect': 'Vingt plus quinze font trente-quatre.', 'correct': 'Vingt plus quinze font trente-cinq.', 'rule': '20 + 15 = 35 (trente-cinq).'},
  ];

  static const List<Map<String, dynamic>> _essayTopics = [
    {'title': 'Mon repas idéal', 'emoji': '🍽️', 'scaffold': ['Introduction: Quel est mon repas préféré ?', 'Para 1: Ce que je mange (aliments + articles partitifs)', 'Para 2: Ce que je bois (boissons)', 'Para 3: Pourquoi j\'aime ce repas', 'Conclusion: Bon appétit !']},
    {'title': 'Une journée au marché', 'emoji': '🛒', 'scaffold': ['Introduction: Je vais au marché…', 'Para 1: Les commerçants et les marchandises', 'Para 2: Comment j\'achète (dialogue de marchandage)', 'Para 3: Je paie et je reçois la monnaie', 'Conclusion: Le marché est vivant et coloré !']},
    {'title': 'Ma recette favorite', 'emoji': '👨‍🍳', 'scaffold': ["Introduction: Je vais expliquer comment préparer…", 'Para 1: Les ingrédients nécessaires', "Para 2: D'abord, ensuite… (étapes en impératif)", 'Para 3: Combien de temps ça prend ?', 'Conclusion: Bon appétit !']},
  ];

  static const List<Map<String, dynamic>> _sprintQuestions = [
    {'q': 'Conjuguez BOIRE (il) :', 'a': 'boit', 'opts': ['boit', 'bois', 'buivent', 'buvez']},
    {'q': 'Article partitif pour "farine" (f.) :', 'a': 'de la farine', 'opts': ['de la farine', 'du farine', 'des farine', 'de farine']},
    {'q': '50 ÷ 5 = ___', 'a': 'dix', 'opts': ['dix', 'cinq', 'sept', 'huit']},
    {'q': 'Polite way to order food :', 'a': 'Je voudrais…', 'opts': ['Je voudrais…', 'Donnez-moi…', 'Je veux…', 'Apportez !']},
    {'q': 'Imperative of MÉLANGER (vous) :', 'a': 'Mélangez', 'opts': ['Mélangez', 'Mélangons', 'Mélanger', 'Mélangent']},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    for (final t in _essayTopics) { _essayNotes[t['title'] as String] = ''; }
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
            gradient: LinearGradient(colors: [Color(0xFF922B21), Color(0xFFCB4335)]),
          ),
          child: Row(children: [
            const Icon(Icons.quiz_rounded, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Expanded(child: Text('Studio de Préparation aux Examens', style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 16))),
          ]),
        ),
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF922B21),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF922B21),
            isScrollable: true,
            tabs: const [
              Tab(icon: Icon(Icons.checklist_rounded, size: 16), text: 'QCM'),
              Tab(icon: Icon(Icons.edit_rounded, size: 16), text: 'Erreurs'),
              Tab(icon: Icon(Icons.description_rounded, size: 16), text: 'Rédaction'),
              Tab(icon: Icon(Icons.bolt_rounded, size: 16), text: 'Sprint'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [_buildMCQTab(), _buildErrorTab(), _buildEssayTab(), _buildSprintTab()],
          ),
        ),
      ],
    );
  }

  Widget _buildMCQTab() {
    if (_mcqIndex >= _mcqQuestions.length) {
      return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.emoji_events_rounded, color: Color(0xFFFFD700), size: 64),
        const SizedBox(height: 16),
        Text('QCM terminé !', style: LangHueyTextStyles.h1),
        const SizedBox(height: 8),
        Text('Score : $_mcqScore / ${_mcqQuestions.length}', style: LangHueyTextStyles.h2.copyWith(color: LangHueyColors.deepTeal)),
        const SizedBox(height: 8),
        Text('${(_mcqScore / _mcqQuestions.length * 100).round()}% de réussite', style: TextStyle(color: _mcqScore >= 6 ? const Color(0xFF2ECC71) : const Color(0xFFE74C3C), fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 24),
        ElevatedButton(onPressed: () => setState(() { _mcqIndex = 0; _mcqScore = 0; _mcqAnswered = false; _mcqSelected = null; }), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF922B21), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Recommencer')),
      ]));
    }
    final q = _mcqQuestions[_mcqIndex];
    return SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('QCM ${_mcqIndex + 1}/${_mcqQuestions.length}', style: LangHueyTextStyles.bodySmall),
        Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), decoration: BoxDecoration(color: const Color(0xFF922B21), borderRadius: BorderRadius.circular(20)), child: Text('Score : $_mcqScore', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      const SizedBox(height: 16),
      Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF922B21), Color(0xFFCB4335)]), borderRadius: BorderRadius.circular(18)),
        child: Text(q['q'] as String, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
      const SizedBox(height: 16),
      ...(q['opts'] as List<String>).asMap().entries.map((e) {
        final isCorrect = e.value == q['a'];
        final isSelected = _mcqSelected == e.key;
        Color bgColor = Colors.white;
        if (_mcqAnswered) { if (isCorrect) bgColor = const Color(0xFF2ECC71); else if (isSelected) bgColor = const Color(0xFFE74C3C); }
        return Padding(padding: const EdgeInsets.only(bottom: 8), child: GestureDetector(
          onTap: _mcqAnswered ? null : () { setState(() { _mcqSelected = e.key; _mcqAnswered = true; if (isCorrect) _mcqScore++; }); isCorrect ? _audio.playCorrect() : _audio.playIncorrect(); },
          child: AnimatedContainer(duration: const Duration(milliseconds: 200), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(14), border: Border.all(color: isSelected && !_mcqAnswered ? const Color(0xFF922B21) : Colors.black12)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(child: Text(e.value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: _mcqAnswered && (isCorrect || isSelected) ? Colors.white : Colors.black87))),
              if (_mcqAnswered && isCorrect) const Icon(Icons.check_circle_rounded, color: Colors.white),
              if (_mcqAnswered && isSelected && !isCorrect) const Icon(Icons.cancel_rounded, color: Colors.white),
            ]))));
      }),
      if (_mcqAnswered) ...[const SizedBox(height: 12),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => setState(() { _mcqIndex++; _mcqAnswered = false; _mcqSelected = null; }), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF922B21), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: Text(_mcqIndex + 1 < _mcqQuestions.length ? 'Suivant →' : 'Voir score'))),
      ],
    ]));
  }

  Widget _buildErrorTab() {
    final err = _errorExercises[_errIndex];
    return SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Exercice ${_errIndex + 1}/${_errorExercises.length}', style: LangHueyTextStyles.bodySmall),
        Row(children: List.generate(_errorExercises.length, (i) => Container(margin: const EdgeInsets.only(left: 4), width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: i == _errIndex ? const Color(0xFF922B21) : Colors.grey.shade300)))),
      ]),
      const SizedBox(height: 20),
      Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: const Color(0xFFE74C3C).withOpacity(0.08), borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE74C3C).withOpacity(0.3))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(children: [Icon(Icons.error_outline_rounded, color: Color(0xFFE74C3C)), SizedBox(width: 8), Text('Phrase incorrecte :', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFE74C3C)))]),
          const SizedBox(height: 8),
          Text(err['incorrect']!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87, decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFE74C3C))),
        ])),
      const SizedBox(height: 12),
      if (_errRevealed) ...[
        Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: const Color(0xFF2ECC71).withOpacity(0.08), borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFF2ECC71).withOpacity(0.4))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(children: [Icon(Icons.check_circle_rounded, color: Color(0xFF2ECC71)), SizedBox(width: 8), Text('Correction :', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2ECC71)))]),
            const SizedBox(height: 8),
            Text(err['correct']!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 12),
            Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black12)),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Icon(Icons.lightbulb_rounded, color: Color(0xFFF39C12), size: 18),
                const SizedBox(width: 8),
                Expanded(child: Text(err['rule']!, style: const TextStyle(fontSize: 12, color: Colors.black87))),
              ])),
          ])),
        const SizedBox(height: 12),
        Row(children: [
          if (_errIndex > 0) OutlinedButton(onPressed: () { setState(() { _errIndex--; _errRevealed = false; }); _audio.playClick(); }, style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('← Précédent')),
          const Spacer(),
          if (_errIndex < _errorExercises.length - 1) ElevatedButton(onPressed: () { setState(() { _errIndex++; _errRevealed = false; }); _audio.playClick(); }, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF922B21), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Suivant →')),
        ]),
      ] else
        SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: () { setState(() => _errRevealed = true); _audio.playClick(); }, icon: const Icon(Icons.visibility_rounded), label: const Text('Voir la correction'), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF922B21), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))))),
    ]));
  }

  Widget _buildEssayTab() {
    final topic = _essayTopics[_essayTopic];
    return SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: List.generate(_essayTopics.length, (i) {
          final t = _essayTopics[i];
          final selected = _essayTopic == i;
          return Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 3), child: GestureDetector(
            onTap: () { setState(() => _essayTopic = i); _audio.playClick(); },
            child: AnimatedContainer(duration: const Duration(milliseconds: 200), padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(color: selected ? const Color(0xFF922B21) : Colors.grey.shade100, borderRadius: BorderRadius.circular(12), border: Border.all(color: selected ? const Color(0xFF922B21) : Colors.black12)),
              child: Column(children: [
                Text(t['emoji'] as String, style: const TextStyle(fontSize: 20)),
                Text(t['title'] as String, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: selected ? Colors.white : LangHueyColors.charcoal), textAlign: TextAlign.center),
              ])),
          )));
        }),
      ),
      const SizedBox(height: 20),
      Text('Plan de rédaction : "${topic['title']}"', style: LangHueyTextStyles.h2.copyWith(fontSize: 14)),
      const SizedBox(height: 12),
      ...(topic['scaffold'] as List<String>).asMap().entries.map((e) =>
        Container(margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black12)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(width: 24, height: 24, decoration: BoxDecoration(color: const Color(0xFF922B21), borderRadius: BorderRadius.circular(6)), child: Center(child: Text('${e.key + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)))),
            const SizedBox(width: 10),
            Expanded(child: Text(e.value, style: const TextStyle(fontSize: 12, color: Colors.black87, fontStyle: FontStyle.italic))),
          ]))),
      const SizedBox(height: 16),
      Text('📝 Vos notes pour ce sujet :', style: LangHueyTextStyles.h2.copyWith(fontSize: 14)),
      const SizedBox(height: 8),
      TextField(
        key: ValueKey(topic['title']),
        onChanged: (v) => _essayNotes[topic['title'] as String] = v,
        maxLines: 6,
        decoration: InputDecoration(hintText: 'Écrivez vos idées ici…', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), contentPadding: const EdgeInsets.all(14)),
        style: const TextStyle(fontSize: 13),
      ),
    ]));
  }

  Widget _buildSprintTab() {
    if (_sprintQ >= _sprintQuestions.length) {
      return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.bolt_rounded, color: Color(0xFFFFD700), size: 64),
        const SizedBox(height: 16),
        Text('Sprint terminé !', style: LangHueyTextStyles.h1),
        const SizedBox(height: 8),
        Text('Score : $_sprintScore / ${_sprintQuestions.length}', style: LangHueyTextStyles.h2.copyWith(color: LangHueyColors.deepTeal)),
        const SizedBox(height: 24),
        ElevatedButton(onPressed: () => setState(() { _sprintQ = 0; _sprintScore = 0; _sprintAnswered = false; _sprintSelected = null; }), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF922B21), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Recommencer')),
      ]));
    }
    final q = _sprintQuestions[_sprintQ];
    return SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Sprint ${_sprintQ + 1}/${_sprintQuestions.length}', style: LangHueyTextStyles.bodySmall),
        Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), decoration: BoxDecoration(color: const Color(0xFF922B21), borderRadius: BorderRadius.circular(20)), child: Text('$_sprintScore ⚡', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      const SizedBox(height: 16),
      Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF922B21), Color(0xFFCB4335)]), borderRadius: BorderRadius.circular(18)), child: Text(q['q'] as String, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
      const SizedBox(height: 16),
      ...(q['opts'] as List<String>).asMap().entries.map((e) {
        final isCorrect = e.value == q['a'];
        final isSelected = _sprintSelected == e.key;
        Color bgColor = Colors.white;
        if (_sprintAnswered) { if (isCorrect) bgColor = const Color(0xFF2ECC71); else if (isSelected) bgColor = const Color(0xFFE74C3C); }
        return Padding(padding: const EdgeInsets.only(bottom: 8), child: GestureDetector(
          onTap: _sprintAnswered ? null : () { setState(() { _sprintSelected = e.key; _sprintAnswered = true; if (isCorrect) _sprintScore++; }); isCorrect ? _audio.playCorrect() : _audio.playIncorrect(); },
          child: AnimatedContainer(duration: const Duration(milliseconds: 200), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(14), border: Border.all(color: isSelected && !_sprintAnswered ? const Color(0xFF922B21) : Colors.black12)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(child: Text(e.value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: _sprintAnswered && (isCorrect || isSelected) ? Colors.white : Colors.black87))),
              if (_sprintAnswered && isCorrect) const Icon(Icons.check_circle_rounded, color: Colors.white),
              if (_sprintAnswered && isSelected && !isCorrect) const Icon(Icons.cancel_rounded, color: Colors.white),
            ]))));
      }),
      if (_sprintAnswered) ...[const SizedBox(height: 12),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => setState(() { _sprintQ++; _sprintAnswered = false; _sprintSelected = null; }), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF922B21), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: Text(_sprintQ + 1 < _sprintQuestions.length ? 'Suivant ⚡' : 'Voir score'))),
      ],
    ]));
  }
}
