import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 9 / Final — Grand Rally: Révision & Célébration JSS 2
/// A 5-zone celebration hub: All-Term Trophy Room, Term Rapid-Fire Quiz,
/// Vocabulary Champion board, Certificate builder, and legacy leaderboard.
class JSS2GrandRallyStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;
  const JSS2GrandRallyStudioWidget({super.key, required this.lesson});

  @override
  State<JSS2GrandRallyStudioWidget> createState() => _JSS2GrandRallyStudioWidgetState();
}

class _JSS2GrandRallyStudioWidgetState extends State<JSS2GrandRallyStudioWidget>
    with TickerProviderStateMixin {
  final JSS2AudioService _audio = JSS2AudioService();
  late TabController _tabController;
  late AnimationController _confettiController;

  int _rallyQ = 0, _rallyScore = 0;
  bool _rallyAnswered = false;
  int? _rallySelected;
  bool _showCertificate = false;
  String _studentName = '';
  final TextEditingController _nameController = TextEditingController();

  static const List<Map<String, dynamic>> _allTermAchievements = [
    // Term 1
    {'term': 1, 'unit': 1, 'title': 'Position Expert', 'emoji': '📍', 'summary': 'Savoir demander et expliquer la position'},
    {'term': 1, 'unit': 2, 'title': 'Landmark Navigator', 'emoji': '🗺️', 'summary': 'Situer les lieux les uns par rapport aux autres'},
    {'term': 1, 'unit': 3, 'title': 'Welcoming Guide', 'emoji': '👋', 'summary': 'Accueillir et guider quelqu\'un'},
    {'term': 1, 'unit': 4, 'title': 'Route Master', 'emoji': '🧭', 'summary': 'Demander / indiquer le chemin'},
    {'term': 1, 'unit': 5, 'title': 'Transport Expert', 'emoji': '🚌', 'summary': 'Les moyens de transport'},
    {'term': 1, 'unit': 6, 'title': 'Journey Planner', 'emoji': '🗺️', 'summary': 'Expliquer un trajet'},
    {'term': 1, 'unit': 7, 'title': 'Schedule Master', 'emoji': '🕐', 'summary': 'Demander / indiquer des horaires'},
    {'term': 1, 'unit': 8, 'title': 'Problem Solver', 'emoji': '🆘', 'summary': 'Réagir à un problème de transport'},
    // Term 2
    {'term': 2, 'unit': 9, 'title': 'List Builder', 'emoji': '📋', 'summary': 'Établir des listes et des inventaires'},
    {'term': 2, 'unit': 10, 'title': 'Market Explorer', 'emoji': '🛒', 'summary': 'Les commerçants et marchandises'},
    {'term': 2, 'unit': 11, 'title': 'Deal Maker', 'emoji': '🤝', 'summary': 'Acheter et marchander'},
    {'term': 2, 'unit': 12, 'title': 'Need Expresser', 'emoji': '💡', 'summary': 'Exprimer un besoin et son utilité'},
    {'term': 2, 'unit': 13, 'title': 'Health Helper', 'emoji': '💊', 'summary': 'À la pharmacie'},
    {'term': 2, 'unit': 14, 'title': 'Fashion Expert', 'emoji': '👗', 'summary': 'Les vêtements et accessoires'},
    {'term': 2, 'unit': 15, 'title': 'Choice Maker', 'emoji': '⭐', 'summary': 'Apprécier, comparer, choisir'},
    {'term': 2, 'unit': 16, 'title': 'Quality Judge', 'emoji': '🏅', 'summary': 'Quantité et qualité des produits'},
    // Term 3
    {'term': 3, 'unit': 17, 'title': 'Math Champion', 'emoji': '🔢', 'summary': 'Opérations de calcul simple'},
    {'term': 3, 'unit': 18, 'title': 'Food Connoisseur', 'emoji': '🍽️', 'summary': 'Nourriture et boissons'},
    {'term': 3, 'unit': 19, 'title': 'Master Chef', 'emoji': '👨‍🍳', 'summary': 'Recettes de cuisine'},
    {'term': 3, 'unit': 20, 'title': 'Restaurant Pro', 'emoji': '🥂', 'summary': 'Au restaurant / café'},
  ];

  static const List<Map<String, dynamic>> _rallyQuiz = [
    {'q': 'Comment dit-on "turn left" en français ?', 'a': 'Tournez à gauche.', 'opts': ['Tournez à gauche.', 'Allez à gauche.', 'À gauche, tournez.', 'Gauche tournez.'], 'term': 1},
    {'q': 'Dans un marché, comment demande-t-on le prix ?', 'a': 'Combien ça coûte ?', 'opts': ['Combien ça coûte ?', 'Quel est le prix ?', 'Coûte combien ?', 'C\'est quoi le prix ?'], 'term': 2},
    {'q': '6 × 9 = ___', 'a': 'cinquante-quatre', 'opts': ['cinquante-quatre', 'cinquante-six', 'quarante-huit', 'soixante'], 'term': 3},
    {'q': '"J\'ai besoin d\'aspirine." — Où êtes-vous ?', 'a': 'À la pharmacie.', 'opts': ['À la pharmacie.', 'Au marché.', 'Au restaurant.', 'À la gare.'], 'term': 2},
    {'q': 'Quelle phrase est à l\'impératif correct ?', 'a': "D'abord, mélangez les ingrédients.", 'opts': ["D'abord, mélangez les ingrédients.", "D'abord, mélanger les ingrédients.", "D'abord, je mélange les ingrédients.", "D'abord, il mélange les ingrédients."], 'term': 3},
    {'q': '"Le prochain bus part à quelle heure ?" — Quelle est la vraie question ?', 'a': 'À quelle heure part le prochain bus ?', 'opts': ['À quelle heure part le prochain bus ?', 'Quand le bus arrive-t-il ?', 'Quel bus prendre ?', 'Où est le bus ?'], 'term': 1},
    {'q': 'Exprimez votre préférence : ___ le jus d\'orange.', 'a': "Je préfère le jus d'orange.", 'opts': ["Je préfère le jus d'orange.", "J'aime pas le jus.", "Je veux le jus.", "Je bois du jus."], 'term': 3},
    {'q': '"Ce pantalon est trop cher !" — Comment marchandez-vous ?', 'a': 'Faites-moi un bon prix, s\'il vous plaît.', 'opts': ["Faites-moi un bon prix, s'il vous plaît.", "Je n'achète pas.", "C'est trop.", "Donnez-moi un rabais !"], 'term': 2},
    {'q': 'Pour finir un repas au restaurant, on dit :', 'a': "L'addition, s'il vous plaît !", 'opts': ["L'addition, s'il vous plaît !", "La carte, s'il vous plaît !", "La commande, s'il vous plaît !", "La monnaie !"], 'term': 3},
    {'q': '"Pour aller à la gare, s\'il vous plaît ?" — Réponse correcte :', 'a': "Allez tout droit, puis tournez à droite.", 'opts': ["Allez tout droit, puis tournez à droite.", 'Allez, tournez.', 'Droite, tout droit.', 'Tournez, puis allez.'], 'term': 1},
  ];

  static const Map<int, Color> _termColors = {1: Color(0xFF3498DB), 2: Color(0xFF2ECC71), 3: Color(0xFF9B59B6)};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _confettiController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _confettiController.dispose();
    _nameController.dispose();
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
              colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('🏆', style: TextStyle(fontSize: 28)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('GRAND RALLY — JSS 2 FRANÇAIS', style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 14)),
                        const Text('3 Terms • 20 Units • Champion Level', style: TextStyle(color: Colors.amber, fontSize: 11, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF0F3460),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: Colors.amber,
            isScrollable: true,
            tabs: const [
              Tab(icon: Icon(Icons.emoji_events_rounded, size: 16), text: 'Trophées'),
              Tab(icon: Icon(Icons.bolt_rounded, size: 16), text: 'Rally Quiz'),
              Tab(icon: Icon(Icons.workspace_premium_rounded, size: 16), text: 'Certificat'),
              Tab(icon: Icon(Icons.bar_chart_rounded, size: 16), text: 'Statistiques'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [_buildTrophyTab(), _buildRallyQuizTab(), _buildCertificateTab(), _buildStatsTab()],
          ),
        ),
      ],
    );
  }

  Widget _buildTrophyTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF1A1A2E), Color(0xFF0F3460)]),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [1, 2, 3].map((term) {
                final count = _allTermAchievements.where((a) => a['term'] == term).length;
                return Column(
                  children: [
                    Container(width: 48, height: 48, decoration: BoxDecoration(color: _termColors[term]!, borderRadius: BorderRadius.circular(14)),
                      child: Center(child: Text('T$term', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)))),
                    const SizedBox(height: 6),
                    Text('$count unités', style: const TextStyle(color: Colors.white70, fontSize: 11)),
                    Text('Term $term', style: TextStyle(color: _termColors[term]!, fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          ...[1, 2, 3].map((term) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(children: [
                  Container(width: 4, height: 20, decoration: BoxDecoration(color: _termColors[term]!, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(width: 8),
                  Text('Trimestre $term', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: _termColors[term]!)),
                ]),
              ),
              Wrap(
                spacing: 8, runSpacing: 8,
                children: _allTermAchievements.where((a) => a['term'] == term).map((a) =>
                  Container(
                    width: 86,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: (_termColors[term]!).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: _termColors[term]!.withOpacity(0.3)),
                    ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(a['emoji'] as String, style: const TextStyle(fontSize: 22)),
                      const SizedBox(height: 4),
                      Text('U${a['unit']}', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: _termColors[term]!)),
                      Text(a['title'] as String, style: const TextStyle(fontSize: 8, color: Colors.black54), textAlign: TextAlign.center),
                    ]),
                  )).toList(),
              ),
              const SizedBox(height: 20),
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildRallyQuizTab() {
    if (_rallyQ >= _rallyQuiz.length) {
      final pct = (_rallyScore / _rallyQuiz.length * 100).round();
      final grade = pct >= 90 ? 'A+' : pct >= 80 ? 'A' : pct >= 70 ? 'B' : pct >= 60 ? 'C' : 'D';
      final gradeColor = pct >= 70 ? const Color(0xFF2ECC71) : const Color(0xFFE74C3C);
      return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(pct >= 70 ? '🏆' : '📚', style: const TextStyle(fontSize: 64)),
        const SizedBox(height: 16),
        Text('Grand Rally terminé !', style: LangHueyTextStyles.h1, textAlign: TextAlign.center),
        const SizedBox(height: 8),
        Text('$_rallyScore / ${_rallyQuiz.length}  •  $pct%  •  Grade: $grade', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: gradeColor)),
        const SizedBox(height: 8),
        Text(pct >= 90 ? '🎉 JSS 2 Champion !' : pct >= 70 ? '✅ Très bien réussi !' : '📖 Révisez encore un peu.', style: const TextStyle(fontSize: 14, color: Colors.black54)),
        const SizedBox(height: 24),
        ElevatedButton(onPressed: () { setState(() { _rallyQ = 0; _rallyScore = 0; _rallyAnswered = false; _rallySelected = null; }); }, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0F3460), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Rejouer le Rally')),
      ]));
    }
    final q = _rallyQuiz[_rallyQ];
    final termColor = _termColors[q['term'] as int] ?? Colors.blueGrey;
    return SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Q${_rallyQ + 1}/${_rallyQuiz.length}  •  T${q['term']}', style: LangHueyTextStyles.bodySmall),
        Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), decoration: BoxDecoration(color: termColor, borderRadius: BorderRadius.circular(20)), child: Text('$_rallyScore 🏆', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      const SizedBox(height: 16),
      Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: BoxDecoration(gradient: LinearGradient(colors: [const Color(0xFF1A1A2E), termColor.withOpacity(0.8)]), borderRadius: BorderRadius.circular(18)),
        child: Column(children: [
          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: termColor.withOpacity(0.4), borderRadius: BorderRadius.circular(20)), child: Text('TRIMESTRE ${q['term']}', style: const TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold))),
          const SizedBox(height: 12),
          Text(q['q'] as String, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        ])),
      const SizedBox(height: 16),
      ...(q['opts'] as List<String>).asMap().entries.map((e) {
        final isCorrect = e.value == q['a'];
        final isSelected = _rallySelected == e.key;
        Color bgColor = Colors.white;
        if (_rallyAnswered) { if (isCorrect) bgColor = const Color(0xFF2ECC71); else if (isSelected) bgColor = const Color(0xFFE74C3C); }
        return Padding(padding: const EdgeInsets.only(bottom: 8), child: GestureDetector(
          onTap: _rallyAnswered ? null : () { setState(() { _rallySelected = e.key; _rallyAnswered = true; if (isCorrect) _rallyScore++; }); isCorrect ? _audio.playCorrect() : _audio.playIncorrect(); },
          child: AnimatedContainer(duration: const Duration(milliseconds: 200), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(14), border: Border.all(color: isSelected && !_rallyAnswered ? termColor : Colors.black12)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(child: Text(e.value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: _rallyAnswered && (isCorrect || isSelected) ? Colors.white : Colors.black87))),
              if (_rallyAnswered && isCorrect) const Icon(Icons.check_circle_rounded, color: Colors.white),
              if (_rallyAnswered && isSelected && !isCorrect) const Icon(Icons.cancel_rounded, color: Colors.white),
            ]))));
      }),
      if (_rallyAnswered) ...[const SizedBox(height: 12),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => setState(() { _rallyQ++; _rallyAnswered = false; _rallySelected = null; }), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0F3460), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: Text(_rallyQ + 1 < _rallyQuiz.length ? 'Suivant 🏆' : 'Voir résultats'))),
      ],
    ]));
  }

  Widget _buildCertificateTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          if (!_showCertificate) ...[
            const Icon(Icons.workspace_premium_rounded, size: 64, color: Colors.amber),
            const SizedBox(height: 16),
            Text('Générez votre Certificat', style: LangHueyTextStyles.h1, textAlign: TextAlign.center),
            const SizedBox(height: 8),
            const Text('Entrez votre nom pour recevoir votre certificat de réussite JSS 2.', style: TextStyle(color: Colors.black54, fontSize: 13), textAlign: TextAlign.center),
            const SizedBox(height: 24),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Votre prénom et nom',
                prefixIcon: const Icon(Icons.person_rounded),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                contentPadding: const EdgeInsets.all(16),
              ),
              textCapitalization: TextCapitalization.words,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(width: double.infinity, child: ElevatedButton.icon(
              onPressed: () {
                if (_nameController.text.trim().isNotEmpty) {
                  setState(() { _studentName = _nameController.text.trim(); _showCertificate = true; });
                  _audio.playCelebrate();
                }
              },
              icon: const Icon(Icons.emoji_events_rounded),
              label: const Text('Générer mon certificat'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black87, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            )),
          ] else ...[
            // Certificate display
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF1A1A2E), Color(0xFF0F3460)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.amber, width: 2),
                boxShadow: [BoxShadow(color: Colors.amber.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 8))],
              ),
              child: Column(children: [
                const Text('🏆', style: TextStyle(fontSize: 48)),
                const SizedBox(height: 12),
                const Text('CERTIFICAT DE RÉUSSITE', style: TextStyle(color: Colors.amber, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2)),
                const SizedBox(height: 8),
                const Text('Ce certificat est décerné à', style: TextStyle(color: Colors.white54, fontSize: 12)),
                const SizedBox(height: 8),
                Text(_studentName, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('Pour avoir complété avec succès', style: TextStyle(color: Colors.white54, fontSize: 12)),
                const SizedBox(height: 4),
                const Text('FRANÇAIS JSS 2\nTrimestre 1, 2 & 3', style: TextStyle(color: Colors.amber, fontSize: 16, fontWeight: FontWeight.bold, height: 1.4), textAlign: TextAlign.center),
                const SizedBox(height: 12),
                const Text('20 Unités • 3 Trimestres • Niveau NERDC', style: TextStyle(color: Colors.white38, fontSize: 11)),
                const SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ...[1, 2, 3].map((t) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: _termColors[t]!.withOpacity(0.3), borderRadius: BorderRadius.circular(20), border: Border.all(color: _termColors[t]!)),
                    child: Text('T$t ✓', style: TextStyle(color: _termColors[t]!, fontWeight: FontWeight.bold, fontSize: 12)),
                  )),
                ]),
                const SizedBox(height: 16),
                const Text('🌟 Félicitations ! 🌟', style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold)),
              ]),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () => setState(() { _showCertificate = false; _nameController.clear(); }),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Nouveau certificat'),
              style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatsTab() {
    final stats = [
      {'label': 'Unités complétées', 'value': '20', 'icon': Icons.check_circle_rounded, 'color': const Color(0xFF2ECC71)},
      {'label': 'Trimestres', 'value': '3', 'icon': Icons.calendar_today_rounded, 'color': const Color(0xFF3498DB)},
      {'label': 'Semaines d\'étude', 'value': '27', 'icon': Icons.today_rounded, 'color': const Color(0xFF9B59B6)},
      {'label': 'Types de patterns', 'value': '25+', 'icon': Icons.extension_rounded, 'color': const Color(0xFFE67E22)},
      {'label': 'Vocabulaire appris', 'value': '300+', 'icon': Icons.menu_book_rounded, 'color': const Color(0xFFE74C3C)},
      {'label': 'Exercices interactifs', 'value': '150+', 'icon': Icons.quiz_rounded, 'color': const Color(0xFF1ABC9C)},
    ];
    final skills = [
      {'skill': 'Directions & Transport', 'icon': '🗺️', 'term': 1},
      {'skill': 'Shopping & Market', 'icon': '🛒', 'term': 2},
      {'skill': 'Health & Pharmacy', 'icon': '💊', 'term': 2},
      {'skill': 'Math in French', 'icon': '🔢', 'term': 3},
      {'skill': 'Food & Cuisine', 'icon': '🍽️', 'term': 3},
      {'skill': 'Restaurant French', 'icon': '🥂', 'term': 3},
      {'skill': 'Role-Play & Dialogue', 'icon': '🎭', 'term': 3},
    ];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Votre parcours JSS 2 :', style: LangHueyTextStyles.h2.copyWith(fontSize: 15)),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0,
            children: stats.map((s) => Container(
              decoration: BoxDecoration(color: (s['color'] as Color).withOpacity(0.1), borderRadius: BorderRadius.circular(16), border: Border.all(color: (s['color'] as Color).withOpacity(0.3))),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(s['icon'] as IconData, color: s['color'] as Color, size: 24),
                const SizedBox(height: 6),
                Text(s['value'] as String, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: s['color'] as Color)),
                Text(s['label'] as String, style: const TextStyle(fontSize: 9, color: Colors.black54), textAlign: TextAlign.center),
              ]),
            )).toList(),
          ),
          const SizedBox(height: 20),
          Text('Compétences acquises :', style: LangHueyTextStyles.h2.copyWith(fontSize: 15)),
          const SizedBox(height: 12),
          ...skills.map((s) => Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black12)),
            child: Row(children: [
              Text(s['icon'] as String, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 12),
              Expanded(child: Text(s['skill'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: _termColors[s['term'] as int]!.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                child: Text('T${s['term']}', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: _termColors[s['term'] as int]!))),
              const SizedBox(width: 8),
              const Icon(Icons.check_circle_rounded, color: Color(0xFF2ECC71), size: 18),
            ]),
          )),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF1A1A2E), Color(0xFF0F3460)]),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Column(children: [
              const Text('🚀 JSS 3 — Prochain niveau', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 8),
              const Text('Continuez votre voyage linguistique avec des sujets encore plus avancés.', style: TextStyle(color: Colors.white70, fontSize: 12), textAlign: TextAlign.center),
            ]),
          ),
        ],
      ),
    );
  }
}
