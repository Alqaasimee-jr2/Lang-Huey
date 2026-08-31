import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 5 (Term 2) — Faire des projets d'avenir : le futur simple
/// Future Simple Dream Machine, Irregular Stems Workbench, and "SI + Présent ➔ Futur Simple" Hypothesis Lab.
class JSS3FuturePlansAndAspirationsStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3FuturePlansAndAspirationsStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3FuturePlansAndAspirationsStudioWidget> createState() =>
      _JSS3FuturePlansAndAspirationsStudioWidgetState();
}

class _JSS3FuturePlansAndAspirationsStudioWidgetState
    extends State<JSS3FuturePlansAndAspirationsStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  int _selectedCareerIndex = 0;
  String _selectedIrregularVerb = 'Être';

  static const List<Map<String, dynamic>> _careers = [
    {
      'job': 'Médecin Spécialiste 🩺',
      'phrase': 'Quand je serai grand(e), je serai médecin et je soignerai les malades dans les hôpitaux.',
      'futureVerbs': 'serai (être), soignerai (soigner), construirai (construire)',
      'color': Color(0xFF1ABC9C),
    },
    {
      'job': 'Ingénieur Aéronautique ✈️',
      'phrase': 'Dans dix ans, je serai ingénieur et je fabriquerai des avions ultramodernes.',
      'futureVerbs': 'serai (être), fabriquerai (fabriquer), voyagerai (voyager)',
      'color': Color(0xFF3498DB),
    },
    {
      'job': 'Diplomate & Ambassadeur 🌍',
      'phrase': 'À l\'avenir, je représenterai le Nigeria dans les ambassades francophones à Paris et Dakar.',
      'futureVerbs': 'représenterai (représenter), négocierai (négocier), parlerai (parler)',
      'color': Color(0xFFE67E22),
    },
    {
      'job': 'Expert en Informatique & IA 💻',
      'phrase': 'Plus tard, je développerai des applications éducatives pour toute l\'Afrique.',
      'futureVerbs': 'développerai (développer), dirigerai (diriger), créerai (créer)',
      'color': Color(0xFF9B59B6),
    },
  ];

  static const Map<String, Map<String, dynamic>> _irregularStems = {
    'Être': {
      'stem': 'ser-',
      'forms': 'je serai, tu seras, il sera, nous serons, vous serez, ils seront',
      'ex': 'Demain, je serai à l\'heure.',
    },
    'Avoir': {
      'stem': 'aur-',
      'forms': 'j\'aurai, tu auras, elle aura, nous aurons, vous aurez, elles auront',
      'ex': 'L\'année prochaine, nous aurons notre brevet.',
    },
    'Faire': {
      'stem': 'fer-',
      'forms': 'je ferai, tu feras, on fera, nous ferons, vous ferez, ils feront',
      'ex': 'Je ferai de mon mieux pour réussir.',
    },
    'Aller': {
      'stem': 'ir-',
      'forms': 'j\'irai, tu iras, il ira, nous irons, vous irez, ils iront',
      'ex': 'Pendant les vacances, nous irons au village.',
    },
    'Pouvoir': {
      'stem': 'pourr-',
      'forms': 'je pourrai, tu pourras, elle pourra, nous pourrons, vous pourrez, ils pourront',
      'ex': 'Avec le travail, tu pourras tout accomplir.',
    },
    'Vouloir': {
      'stem': 'voudr-',
      'forms': 'je voudrai, tu voudras, on voudra, nous voudrons, vous voudrez, ils voudront',
      'ex': 'Si tu le veux, ils voudront t\'aider.',
    },
  };

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
              colors: [Color(0xFF16A085), Color(0xFF1ABC9C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.rocket_launch_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Machine des Rêves : Projets d\'Avenir & Le Futur Simple',
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
            labelColor: const Color(0xFF16A085),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF16A085),
            tabs: const [
              Tab(icon: Icon(Icons.psychology_rounded, size: 18), text: 'Projets de Métiers'),
              Tab(icon: Icon(Icons.star_rounded, size: 18), text: 'Radicaux Irréguliers'),
              Tab(icon: Icon(Icons.alt_route_rounded, size: 18), text: 'Hypothèses avec SI'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildCareerTab(),
              _buildIrregularStemsTab(),
              _buildHypothesisTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCareerTab() {
    final career = _careers[_selectedCareerIndex];
    final color = career['color'] as Color;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/jss3_term2/jss3_t2w5_future_careers.jpg',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(),
            ),
          ),
          const SizedBox(height: 16),
          Text('Choisissez votre Ambition d\'Avenir :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_careers.length, (idx) {
                final c = _careers[idx];
                final isSel = _selectedCareerIndex == idx;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(c['job'] as String),
                    selected: isSel,
                    selectedColor: (c['color'] as Color).withOpacity(0.2),
                    side: BorderSide(color: isSel ? c['color'] as Color : Colors.black12),
                    onSelected: (val) {
                      if (val) {
                        setState(() => _selectedCareerIndex = idx);
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
              border: Border.all(color: color.withOpacity(0.5), width: 2),
              boxShadow: [
                BoxShadow(color: color.withOpacity(0.1), blurRadius: 18, offset: const Offset(0, 6)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: color.withOpacity(0.15), shape: BoxShape.circle),
                      child: const Icon(Icons.workspace_premium_rounded, color: Colors.teal, size: 28),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(career['job'] as String, style: LangHueyTextStyles.h2.copyWith(fontSize: 18)),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  '« ${career['phrase']} »',
                  style: const TextStyle(fontSize: 16, height: 1.5, fontWeight: FontWeight.bold, color: LangHueyColors.charcoal),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.teal.shade200),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.auto_fix_high_rounded, color: Colors.teal, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Verbes au Futur Simple : ${career['futureVerbs']}',
                          style: TextStyle(color: Colors.teal.shade900, fontWeight: FontWeight.bold, fontSize: 13),
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

  Widget _buildIrregularStemsTab() {
    final verbInfo = _irregularStems[_selectedIrregularVerb]!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Les 6 Radicaux Irréguliers Indispensables (BECE) :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _irregularStems.keys.map((verb) {
              final isSel = _selectedIrregularVerb == verb;
              return ChoiceChip(
                label: Text(verb),
                selected: isSel,
                selectedColor: const Color(0xFF16A085).withOpacity(0.2),
                side: BorderSide(color: isSel ? const Color(0xFF16A085) : Colors.black12),
                onSelected: (val) {
                  if (val) {
                    setState(() => _selectedIrregularVerb = verb);
                    _audio.playClick();
                  }
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF16A085).withOpacity(0.4)),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Verbe : $_selectedIrregularVerb', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF16A085))),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: Colors.amber.shade100, borderRadius: BorderRadius.circular(8)),
                      child: Text('Radical : ${verbInfo['stem']}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber.shade900)),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const Divider(),
                const SizedBox(height: 8),
                const Text('Conjugaison complète au Futur Simple :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 6),
                Text(verbInfo['forms'] as String, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: LangHueyColors.charcoal, height: 1.6)),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(8)),
                  child: Text('Exemple : « ${verbInfo['ex']} »', style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: Color(0xFF16A085))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHypothesisTab() {
    final hypotheses = [
      {'si': 'Si tu étudies avec discipline,', 'futur': 'tu réussiras ton examen avec mention.'},
      {'si': 'Si nous parlons français tous les jours,', 'futur': 'nous deviendrons bilingues.'},
      {'si': 'S\'il fait beau samedi prochain,', 'futur': 'nous irons visiter le parc national.'},
      {'si': 'Si vous écoutez le professeur,', 'futur': 'vous comprendrez toutes les règles.'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: hypotheses.length,
      itemBuilder: (context, i) {
        final h = hypotheses[i];
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
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: Colors.indigo.shade50, borderRadius: BorderRadius.circular(6)),
                    child: const Text('SI + PRÉSENT', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward_rounded, size: 14, color: Colors.grey),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: Colors.teal.shade50, borderRadius: BorderRadius.circular(6)),
                    child: const Text('FUTUR SIMPLE', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                '« ${h['si']} ${h['futur']} »',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: LangHueyColors.charcoal, height: 1.4),
              ),
            ],
          ),
        );
      },
    );
  }
}
