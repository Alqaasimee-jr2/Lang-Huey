import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 7 (Term 2) — Préparation intensive au BECE — Partie I : Grammaire & Conjugaison
/// BECE Grammar Arena, Pronoun Transformer (COD/COI), and Gold Rules Reference.
class JSS3BECEGrammarPrepStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3BECEGrammarPrepStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3BECEGrammarPrepStudioWidget> createState() =>
      _JSS3BECEGrammarPrepStudioWidgetState();
}

class _JSS3BECEGrammarPrepStudioWidgetState
    extends State<JSS3BECEGrammarPrepStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  int _selectedTransformIndex = 0;
  bool _showTransformation = false;

  // Quiz state
  int _drillIndex = 0;
  int _drillScore = 0;
  bool _drillAnswered = false;
  int? _drillSelected;

  static const List<Map<String, String>> _transforms = [
    {
      'original': 'Fatima mange la pomme.',
      'type': 'COD Féminin Singulier (la)',
      'replaced': 'Fatima la mange.',
      'explanation': '« la pomme » est remplacé directement par « la » devant le verbe.',
    },
    {
      'original': 'Aminu téléphone à son père.',
      'type': 'COI Singulier avec À (lui)',
      'replaced': 'Aminu lui téléphone.',
      'explanation': '« à son père » est un complément d\'objet indirect remplacé par « lui ».',
    },
    {
      'original': 'Le professeur donne des devoirs aux élèves.',
      'type': 'COI Pluriel avec AUX (leur)',
      'replaced': 'Le professeur leur donne des devoirs.',
      'explanation': '« aux élèves » est un COI pluriel remplacé par « leur » (jamais de S !).',
    },
    {
      'original': 'Nous avons acheté ces beaux livres.',
      'type': 'COD Pluriel (les)',
      'replaced': 'Nous les avons achetés.',
      'explanation': '« ces beaux livres » est remplacé par « les », et le participe passé s\'accorde (+s) car le COD est placé avant !',
    },
  ];

  static const List<Map<String, dynamic>> _beceDrills = [
    {
      'q': 'BECE DRILL 1 : « Si tu écoutes attentivement, tu ___ la règle. » (comprendre)',
      'options': ['comprends', 'comprendras (Futur simple)', 'as compris', 'comprenais'],
      'correct': 1,
      'expl': 'Formule d\'examen : SI + Présent ➔ FUTUR SIMPLE (« comprendras »).',
    },
    {
      'q': 'BECE DRILL 2 : « Les voyageuses sont ___ à Lagos ce matin. » (arriver)',
      'options': ['arrivé', 'arrivée', 'arrivés', 'arrivées'],
      'correct': 3,
      'expl': 'Avec l\'auxiliaire ÊTRE, le participe passé s\'accorde avec le sujet féminin pluriel (« arrivées »).',
    },
    {
      'q': 'BECE DRILL 3 : « Tu as parlé à tes amis ? — Oui, je ___ ai parlé. »',
      'options': ['les', 'leur', 'lui', 'des'],
      'correct': 1,
      'expl': '« À tes amis » est un COI pluriel ➔ pronom « leur » (« je leur ai parlé »).',
    },
    {
      'q': 'BECE DRILL 4 : Quel est le radical du verbe AVOIR au futur simple ?',
      'options': ['av-', 'aur-', 'ai-', 'ser-'],
      'correct': 1,
      'expl': 'Le radical régulier du verbe AVOIR au futur simple est « aur- » (j\'aurai, tu auras).',
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
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2C3E50), Color(0xFF1B4F72)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.school_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Bootcamp BECE Partie I : Grammaire, Pronoms & Concordance des Temps',
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
            labelColor: const Color(0xFF1B4F72),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF1B4F72),
            tabs: const [
              Tab(icon: Icon(Icons.quiz_rounded, size: 18), text: 'Drills BECE QCM'),
              Tab(icon: Icon(Icons.transform_rounded, size: 18), text: 'Transformateur Pronoms'),
              Tab(icon: Icon(Icons.star_outline_rounded, size: 18), text: 'Règles d\'Or d\'Examen'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildDrillsTab(),
              _buildPronounsTab(),
              _buildGoldRulesTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDrillsTab() {
    final drill = _beceDrills[_drillIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF1B4F72),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Session BECE QCM (#${_drillIndex + 1} / ${_beceDrills.length})', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Score : $_drillScore pts', style: const TextStyle(color: LangHueyColors.amberGold, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black12),
            ),
            child: Text(
              drill['q'] as String,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.4),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 18),

          ...List.generate((drill['options'] as List<String>).length, (i) {
            final opt = (drill['options'] as List<String>)[i];
            final isCorrect = i == drill['correct'];
            Color bg = Colors.white;
            Color textCol = LangHueyColors.charcoal;

            if (_drillAnswered) {
              if (isCorrect) {
                bg = const Color(0xFF27AE60);
                textCol = Colors.white;
              } else if (_drillSelected == i) {
                bg = const Color(0xFFE74C3C);
                textCol = Colors.white;
              }
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: !_drillAnswered
                    ? () {
                        setState(() {
                          _drillAnswered = true;
                          _drillSelected = i;
                          if (isCorrect) {
                            _drillScore += 10;
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
                    color: bg,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _drillAnswered && (isCorrect || _drillSelected == i) ? Colors.transparent : Colors.black12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(opt, style: TextStyle(color: textCol, fontWeight: FontWeight.bold, fontSize: 15)),
                      if (_drillAnswered && isCorrect)
                        const Icon(Icons.check_circle_rounded, color: Colors.white)
                      else if (_drillAnswered && _drillSelected == i)
                        const Icon(Icons.cancel_rounded, color: Colors.white),
                    ],
                  ),
                ),
              ),
            );
          }),

          if (_drillAnswered) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Text('💡 ${drill['expl']}', style: TextStyle(color: Colors.blue.shade900, fontSize: 13)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _drillIndex = (_drillIndex + 1) % _beceDrills.length;
                  _drillAnswered = false;
                  _drillSelected = null;
                });
                _audio.playClick();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B4F72),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(_drillIndex + 1 < _beceDrills.length ? 'Question Suivante' : 'Recommencer'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPronounsTab() {
    final tr = _transforms[_selectedTransformIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sélectionnez la phrase à transformer :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_transforms.length, (i) {
                final isSel = _selectedTransformIndex == i;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text('Exemple ${i + 1}'),
                    selected: isSel,
                    selectedColor: const Color(0xFF1B4F72).withOpacity(0.2),
                    side: BorderSide(color: isSel ? const Color(0xFF1B4F72) : Colors.black12),
                    onSelected: (val) {
                      if (val) {
                        setState(() {
                          _selectedTransformIndex = i;
                          _showTransformation = false;
                        });
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
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF1B4F72).withOpacity(0.4)),
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
                    Text('Type : ${tr['type']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF1B4F72))),
                    const Icon(Icons.swap_horizontal_circle_rounded, color: Color(0xFF1B4F72)),
                  ],
                ),
                const SizedBox(height: 14),
                const Text('Phrase Initiale :', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('« ${tr['original']} »', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: LangHueyColors.charcoal)),
                const SizedBox(height: 16),

                if (!_showTransformation)
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() => _showTransformation = true);
                      _audio.playWhoosh();
                    },
                    icon: const Icon(Icons.auto_fix_high_rounded),
                    label: const Text('Remplacer par le Pronom'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B4F72),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                else ...[
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Phrase Transformée :', style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('« ${tr['replaced']} »', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                        const SizedBox(height: 8),
                        Text('💡 ${tr['explanation']}', style: TextStyle(fontSize: 12, color: Colors.green.shade900)),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoldRulesTab() {
    final rules = [
      {'rule': '1. PRONOM LEUR (COI)', 'desc': 'Le pronom « LEUR » ne prend JAMAIS de "s" quand il remplace un complément à des personnes : "Je leur parle".'},
      {'rule': '2. ACCORD AVEC ÊTRE', 'desc': 'Tous les verbes de la Maison d\'ÊTRE s\'accordent en genre et nombre avec le sujet : "Elles sont arrivées".'},
      {'rule': '3. STRUCTURE SI + PRÉSENT', 'desc': 'La condition avec "SI" au présent entraîne obligatoirement le FUTUR SIMPLE : "Si nous travaillons, nous réussirons".'},
      {'rule': '4. PASSÉ RÉCENT vs FUTUR PROCHE', 'desc': 'Passé récent = VENIR DE + inf ("Il vient d\'arriver"). Futur proche = ALLER + inf ("Il va arriver").'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: rules.length,
      itemBuilder: (context, i) {
        final r = rules[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.amber.shade400),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(r['rule']!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.brown.shade800)),
              const SizedBox(height: 6),
              Text(r['desc']!, style: const TextStyle(fontSize: 13, color: LangHueyColors.charcoal, height: 1.4)),
            ],
          ),
        );
      },
    );
  }
}
