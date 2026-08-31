import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 7 — Évaluation Orale: Conversations Guidées
/// Oral assessment preparation with scenario prompts, pronunciation drills,
/// liaison trainer, and discourse marker practice.
class JSS2GuidedConversationsStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;
  const JSS2GuidedConversationsStudioWidget({super.key, required this.lesson});

  @override
  State<JSS2GuidedConversationsStudioWidget> createState() => _JSS2GuidedConversationsStudioWidgetState();
}

class _JSS2GuidedConversationsStudioWidgetState extends State<JSS2GuidedConversationsStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS2AudioService _audio = JSS2AudioService();
  late TabController _tabController;

  int _selectedPrompt = 0;
  int _liaisonQ = 0, _liaisonScore = 0;
  bool _liaisonAnswered = false;
  int? _liaisonSelected;
  bool _showMarkerTip = false;
  int _markerIndex = 0;

  static const List<Map<String, dynamic>> _prompts = [
    {
      'topic': 'Transport',
      'emoji': '🚌',
      'question': 'Comment vas-tu à l\'école chaque matin ?',
      'sample': 'Je vais à l\'école en bus. Le trajet prend environ 20 minutes. L\'arrêt de bus se trouve près de ma maison. Parfois, si je suis en retard, je prends un moto-taxi.',
      'tips': ['Use "en bus / à pied / en voiture" for transport modes.', 'Include time expressions: "chaque matin, environ, parfois".', 'Mention distance or duration: "ça prend 20 minutes".'],
    },
    {
      'topic': 'Nourriture',
      'emoji': '🍚',
      'question': 'Décris ton repas préféré. Qu\'est-ce que tu manges et bois ?',
      'sample': 'Mon repas préféré est le riz au gras avec du poulet. Je mange ça au déjeuner. J\'aime aussi les légumes verts. Comme boisson, je préfère l\'eau fraîche au jus.',
      'tips': ['Use "mon repas préféré est…" to open.', 'Include MANGER + BOIRE conjugations.', 'Express preference with "J\'aime / Je préfère".'],
    },
    {
      'topic': 'Recette',
      'emoji': '👨‍🍳',
      'question': 'Explique comment préparer un plat simple que tu connais.',
      'sample': "D'abord, il faut éplucher et couper les plantains. Ensuite, faites chauffer l'huile dans une poêle. Puis, faites frire les tranches pendant 4 minutes. Enfin, égouttez et servez chaud.",
      'tips': ["Use imperative: 'coupez, faites frire, ajoutez...'", "Sequence with: d'abord, ensuite, puis, enfin.", "Mention key ingredients: 'il faut...'"],
    },
    {
      'topic': 'Restaurant',
      'emoji': '🍽️',
      'question': 'Tu es au restaurant. Commande un repas complet.',
      'sample': 'Bonjour ! Je voudrais une table pour deux, s\'il vous plaît. Comme entrée, je prends la soupe de légumes. Pour le plat principal, je voudrais le poulet rôti. Et comme dessert, une glace au chocolat. L\'addition, s\'il vous plaît.',
      'tips': ['Open with a greeting and reservation request.', 'Use "je voudrais" for all orders.', "Close with 'L'addition, s'il vous plaît !'"],
    },
  ];

  static const List<Map<String, dynamic>> _liaisonQuiz = [
    {'phrase': 'Les enfants jouent.', 'liaison': 'Les_enfants', 'sound': '[le.z‿ɑ̃.fɑ̃]', 'correct': 0, 'opts': ['Les_enfants (liaison obligatoire)', 'Les enfants (pas de liaison)', 'Lé enfants', "L'enfants"]},
    {'phrase': 'Nous allons au marché.', 'liaison': 'Nous_allons', 'sound': '[nu.z‿a.lɔ̃]', 'correct': 0, 'opts': ['Nous_allons (liaison)', 'Nous allons (pas de liaison)', 'Noux allons', 'Nous_aillons']},
    {'phrase': 'Il est au restaurant.', 'liaison': 'Il_est', 'sound': '[i.l‿ɛ]', 'correct': 0, 'opts': ['Il_est (liaison)', 'Il est (séparé)', 'Ill est', 'Il ait']},
    {'phrase': 'Vous avez faim.', 'liaison': 'Vous_avez', 'sound': '[vu.z‿a.ve]', 'correct': 0, 'opts': ['Vous_avez (liaison)', 'Vous avez (séparé)', 'Vouse avez', 'Vou avez']},
  ];

  static const List<Map<String, String>> _markers = [
    {'fr': 'Eh bien…', 'en': 'Well…', 'use': 'When you need a moment to think before answering.'},
    {'fr': 'En fait…', 'en': 'Actually / In fact…', 'use': 'To clarify or correct what you just said.'},
    {'fr': 'Bon…', 'en': 'Right… / OK…', 'use': 'To transition to a new point or summarize.'},
    {'fr': 'Voyons…', 'en': "Let's see…", 'use': 'When you\'re searching for a word or idea.'},
    {'fr': 'C\'est-à-dire…', 'en': 'That is to say…', 'use': 'To rephrase or explain in other words.'},
    {'fr': 'En d\'autres termes…', 'en': 'In other words…', 'use': 'To offer a clearer explanation.'},
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
            gradient: LinearGradient(colors: [Color(0xFF1A5276), Color(0xFF2E86C1)]),
          ),
          child: Row(children: [
            const Icon(Icons.record_voice_over_rounded, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Expanded(child: Text('Studio de Conversations Guidées', style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 16))),
          ]),
        ),
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF1A5276),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF2E86C1),
            tabs: const [
              Tab(icon: Icon(Icons.question_answer_rounded, size: 18), text: 'Prompts'),
              Tab(icon: Icon(Icons.link_rounded, size: 18), text: 'Liaison'),
              Tab(icon: Icon(Icons.chat_bubble_outline_rounded, size: 18), text: 'Marqueurs'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [_buildPromptsTab(), _buildLiaisonTab(), _buildMarkersTab()],
          ),
        ),
      ],
    );
  }

  Widget _buildPromptsTab() {
    final prompt = _prompts[_selectedPrompt];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Topic selector
          Row(
            children: List.generate(_prompts.length, (i) {
              final p = _prompts[i];
              final selected = _selectedPrompt == i;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: GestureDetector(
                    onTap: () { setState(() => _selectedPrompt = i); _audio.playClick(); },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selected ? const Color(0xFF1A5276) : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: selected ? const Color(0xFF1A5276) : Colors.black12),
                      ),
                      child: Column(children: [
                        Text(p['emoji'] as String, style: const TextStyle(fontSize: 20)),
                        Text(p['topic'] as String, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: selected ? Colors.white : LangHueyColors.charcoal)),
                      ]),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),

          // Question prompt
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF1A5276), Color(0xFF2E86C1)]),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(children: [
                  Icon(Icons.mic_rounded, color: Colors.white70, size: 18),
                  SizedBox(width: 6),
                  Text('Question d\'évaluation orale :', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ]),
                const SizedBox(height: 8),
                Text(prompt['question'] as String, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold, height: 1.4)),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Sample answer
          Text('📝 Exemple de réponse modèle :', style: LangHueyTextStyles.h2.copyWith(fontSize: 14)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black12),
            ),
            child: Text(prompt['sample'] as String, style: const TextStyle(fontSize: 13, height: 1.6, color: Colors.black87, fontStyle: FontStyle.italic)),
          ),
          const SizedBox(height: 16),

          // Tips
          Text('💡 Conseils pour cette question :', style: LangHueyTextStyles.h2.copyWith(fontSize: 14)),
          const SizedBox(height: 8),
          ...(prompt['tips'] as List<String>).map((tip) =>
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xFF1A5276).withOpacity(0.06), borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFF1A5276).withOpacity(0.2))),
              child: Row(children: [
                const Icon(Icons.check_circle_rounded, color: Color(0xFF2E86C1), size: 18),
                const SizedBox(width: 8),
                Expanded(child: Text(tip, style: const TextStyle(fontSize: 12, color: Colors.black87))),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiaisonTab() {
    if (_liaisonQ >= _liaisonQuiz.length) {
      return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.emoji_events_rounded, color: Color(0xFFFFD700), size: 64),
        const SizedBox(height: 16),
        Text('Liaison maîtrisée !', style: LangHueyTextStyles.h1),
        const SizedBox(height: 8),
        Text('Score : $_liaisonScore / ${_liaisonQuiz.length}', style: LangHueyTextStyles.h2.copyWith(color: LangHueyColors.deepTeal)),
        const SizedBox(height: 24),
        ElevatedButton(onPressed: () => setState(() { _liaisonQ = 0; _liaisonScore = 0; _liaisonAnswered = false; _liaisonSelected = null; }), style: ElevatedButton.styleFrom(backgroundColor: LangHueyColors.deepTeal, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Recommencer')),
      ]));
    }
    final q = _liaisonQuiz[_liaisonQ];
    return SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('${_liaisonQ + 1}/${_liaisonQuiz.length}', style: LangHueyTextStyles.bodySmall),
        Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), decoration: BoxDecoration(color: const Color(0xFF1A5276), borderRadius: BorderRadius.circular(20)), child: Text('Score : $_liaisonScore', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ]),
      const SizedBox(height: 20),
      Container(width: double.infinity, padding: const EdgeInsets.all(24), decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF1A5276), Color(0xFF2E86C1)]), borderRadius: BorderRadius.circular(18)),
        child: Column(children: [
          const Text('Comment prononce-t-on cette phrase ?', style: TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 12),
          Text(q['phrase'] as String, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)), child: Text(q['sound'] as String, style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'monospace'))),
        ])),
      const SizedBox(height: 20),
      ...(q['opts'] as List<String>).asMap().entries.map((e) {
        final isCorrect = e.key == q['correct'];
        final isSelected = _liaisonSelected == e.key;
        Color bgColor = Colors.white;
        if (_liaisonAnswered) { if (isCorrect) bgColor = const Color(0xFF2ECC71); else if (isSelected) bgColor = const Color(0xFFE74C3C); }
        return Padding(padding: const EdgeInsets.only(bottom: 8), child: GestureDetector(
          onTap: _liaisonAnswered ? null : () {
            setState(() { _liaisonSelected = e.key; _liaisonAnswered = true; if (isCorrect) _liaisonScore++; });
            isCorrect ? _audio.playCorrect() : _audio.playIncorrect();
          },
          child: AnimatedContainer(duration: const Duration(milliseconds: 200), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(14), border: Border.all(color: isSelected && !_liaisonAnswered ? const Color(0xFF1A5276) : Colors.black12)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(child: Text(e.value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: _liaisonAnswered && (isCorrect || isSelected) ? Colors.white : Colors.black87))),
              if (_liaisonAnswered && isCorrect) const Icon(Icons.check_circle_rounded, color: Colors.white),
              if (_liaisonAnswered && isSelected && !isCorrect) const Icon(Icons.cancel_rounded, color: Colors.white),
            ]))));
      }),
      if (_liaisonAnswered) ...[const SizedBox(height: 12),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => setState(() { _liaisonQ++; _liaisonAnswered = false; _liaisonSelected = null; }), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A5276), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: Text(_liaisonQ + 1 < _liaisonQuiz.length ? 'Suivant →' : 'Voir score'))),
      ],
    ]));
  }

  Widget _buildMarkersTab() {
    final marker = _markers[_markerIndex];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: const Color(0xFF2C3E50), borderRadius: BorderRadius.circular(14)),
            child: const Text('Marqueurs discursifs — Natural oral fillers in French', style: TextStyle(color: Colors.white, fontSize: 13), textAlign: TextAlign.center),
          ),
          const SizedBox(height: 20),

          // Marker card
          GestureDetector(
            onTap: () { setState(() => _showMarkerTip = !_showMarkerTip); _audio.playClick(); },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: double.infinity, height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: _showMarkerTip ? [const Color(0xFF2E86C1), const Color(0xFF1A5276)] : [const Color(0xFF8E44AD), const Color(0xFF6C3483)]),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(marker['fr']!, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(_showMarkerTip ? marker['use']! : '"${marker['en']!}"', style: const TextStyle(color: Colors.white70, fontSize: 14), textAlign: TextAlign.center),
                const SizedBox(height: 8),
                const Icon(Icons.touch_app_rounded, color: Colors.white54, size: 22),
              ])),
            ),
          ),
          const SizedBox(height: 16),

          // Navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: _markerIndex > 0 ? () { setState(() { _markerIndex--; _showMarkerTip = false; }); _audio.playClick(); } : null,
                icon: const Icon(Icons.arrow_back_rounded), label: const Text('Précédent'),
                style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: _markerIndex < _markers.length - 1 ? () { setState(() { _markerIndex++; _showMarkerTip = false; }); _audio.playClick(); } : null,
                icon: const Icon(Icons.arrow_forward_rounded), label: const Text('Suivant'),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A5276), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // All markers reference
          Text('Tous les marqueurs :', style: LangHueyTextStyles.h2.copyWith(fontSize: 14)),
          const SizedBox(height: 8),
          ..._markers.asMap().entries.map((e) => Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: e.key == _markerIndex ? const Color(0xFF8E44AD).withOpacity(0.1) : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: e.key == _markerIndex ? const Color(0xFF8E44AD).withOpacity(0.4) : Colors.black12),
            ),
            child: Row(children: [
              SizedBox(width: 100, child: Text(e.value['fr']!, style: TextStyle(fontWeight: FontWeight.bold, color: e.key == _markerIndex ? const Color(0xFF8E44AD) : Colors.black87))),
              Expanded(child: Text(e.value['use']!, style: const TextStyle(fontSize: 11, color: Colors.black54))),
            ]),
          )),
        ],
      ),
    );
  }
}
