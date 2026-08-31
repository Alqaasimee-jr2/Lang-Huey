import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 5 — Décrire un objet
/// 3D Object Inspector: Shapes, Materials with EN preposition,
/// Utility & function formulas ("Ça sert à..."), and "Objet Mystère" Riddle Game.
class JSS3ObjectDescriptionStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3ObjectDescriptionStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3ObjectDescriptionStudioWidget> createState() => _JSS3ObjectDescriptionStudioWidgetState();
}

class _JSS3ObjectDescriptionStudioWidgetState extends State<JSS3ObjectDescriptionStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  // Selected object state
  int _selectedObjectIndex = 0;

  // Riddle Quiz state
  int _riddleIndex = 0;
  int _riddleScore = 0;
  bool _riddleAnswered = false;
  int? _riddleSelected;

  static const List<Map<String, dynamic>> _objects = [
    {
      'name': 'Le Sac d\'École (Cartable)',
      'emoji': '🎒',
      'shape': 'Rectangulaire',
      'material': 'en cuir véritable et en tissu',
      'color': Color(0xFF8D6E63),
      'weight': 'Lourd (avec les livres)',
      'function': 'Il sert à transporter les cahiers, livres et fournitures scolaires.',
      'formula': 'C\'est un grand sac rectangulaire en cuir noir qui sert à ranger mes affaires.',
    },
    {
      'name': 'La Bouteille Isotherme',
      'emoji': '🍶',
      'shape': 'Cylindrique / Ronde',
      'material': 'en métal (acier inoxydable) et plastique',
      'color': Color(0xFF00ACC1),
      'weight': 'Léger',
      'function': 'Elle sert à conserver l\'eau fraîche ou les boissons chaudes.',
      'formula': 'C\'est une bouteille cylindrique en métal qui sert à garder l\'eau fraîche.',
    },
    {
      'name': 'La Table d\'Étude',
      'emoji': '🪵',
      'shape': 'Rectangulaire / Carrée',
      'material': 'en bois massif et pieds en fer',
      'color': Color(0xFF6D4C41),
      'weight': 'Lourd et robuste',
      'function': 'Elle sert à écrire, faire ses devoirs et poser l\'ordinateur.',
      'formula': 'Ce meuble en bois et en fer sert à étudier et faire ses devoirs.',
    },
    {
      'name': 'Le Smartphone',
      'emoji': '📱',
      'shape': 'Rectangulaire et plat',
      'material': 'en verre trempé et en aluminium',
      'color': Color(0xFF37474F),
      'weight': 'Très léger',
      'function': 'Il sert à communiquer, faire des recherches sur internet et calculer.',
      'formula': 'Cet appareil plat en verre et métal sert à communiquer et apprendre.',
    },
  ];

  static const List<Map<String, dynamic>> _riddles = [
    {
      'clues': [
        'Je suis de forme rectangulaire.',
        'Je suis composé de papier et d\'une couverture en carton.',
        'Je contiens des définitions et la traduction des mots.',
        'Je sers à enrichir le vocabulaire.',
      ],
      'options': ['Le dictionnaire', 'La règle', 'La chaise', 'Le ballon'],
      'correct': 0,
      'explanation': 'Un dictionnaire sert à chercher les mots et enrichir son vocabulaire.',
    },
    {
      'clues': [
        'Je suis en métal ou en plastique.',
        'Je suis longue, plate et graduée en centimètres.',
        'Je sers à tracer des lignes droites et mesurer des longueurs.',
      ],
      'options': ['La gomme', 'La règle', 'Le stylo', 'Le compas'],
      'correct': 1,
      'explanation': 'Une règle graduée sert à mesurer et tracer des traits droits.',
    },
    {
      'clues': [
        'Je suis sphérique / rond.',
        'Je suis souvent fabriqué en cuir ou en caoutchouc synthétique.',
        'On me tape du pied pour marquer des buts sur le terrain.',
      ],
      'options': ['La montre', 'La pomme', 'Le ballon de football', 'L\'assiette'],
      'correct': 2,
      'explanation': 'Le ballon de football est rond et fabriqué en cuir ou matière synthétique.',
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
              colors: [Color(0xFF6D4C41), Color(0xFF0D7377)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.category_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Studio de Description des Objets & Matières',
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
            labelColor: const Color(0xFF6D4C41),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF6D4C41),
            tabs: const [
              Tab(icon: Icon(Icons.layers_rounded, size: 18), text: 'Inspecteur d\'Objets'),
              Tab(icon: Icon(Icons.construction_rounded, size: 18), text: 'Préposition EN'),
              Tab(icon: Icon(Icons.help_center_rounded, size: 18), text: 'Objet Mystère'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildInspectorTab(),
              _buildMaterialsTab(),
              _buildRiddleTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInspectorTab() {
    final obj = _objects[_selectedObjectIndex];
    final color = obj['color'] as Color;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_objects.length, (index) {
                final o = _objects[index];
                final isSelected = _selectedObjectIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    avatar: Text(o['emoji'] as String),
                    label: Text(o['name'] as String),
                    selected: isSelected,
                    selectedColor: (o['color'] as Color).withOpacity(0.2),
                    side: BorderSide(color: isSelected ? o['color'] as Color : Colors.black12),
                    onSelected: (val) {
                      if (val) {
                        setState(() => _selectedObjectIndex = index);
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
                  children: [
                    Text(obj['emoji'] as String, style: const TextStyle(fontSize: 40)),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(obj['name'] as String, style: LangHueyTextStyles.h2.copyWith(fontSize: 18)),
                          Text('Fiche Technique de l\'Objet', style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                _buildSpecRow(Icons.category_rounded, 'Forme géométrique :', obj['shape'] as String, color),
                const SizedBox(height: 10),
                _buildSpecRow(Icons.science_rounded, 'Matière (Préposition EN) :', obj['material'] as String, color),
                const SizedBox(height: 10),
                _buildSpecRow(Icons.fitness_center_rounded, 'Poids & Maniabilité :', obj['weight'] as String, color),
                const SizedBox(height: 10),
                _buildSpecRow(Icons.build_circle_rounded, 'Usage & Fonction :', obj['function'] as String, color),

                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.record_voice_over_rounded, color: color, size: 22),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '« ${obj['formula']} »',
                          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13, fontStyle: FontStyle.italic),
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

  Widget _buildSpecRow(IconData icon, String title, String value, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: LangHueyColors.charcoal, fontSize: 13),
              children: [
                TextSpan(text: '$title ', style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMaterialsTab() {
    final materials = [
      {'mat': 'en bois', 'meaning': 'made of wood', 'ex': 'La porte est en bois.'},
      {'mat': 'en cuir', 'meaning': 'made of leather', 'ex': 'Mes chaussures sont en cuir.'},
      {'mat': 'en plastique', 'meaning': 'made of plastic', 'ex': 'Une gourde en plastique recyclable.'},
      {'mat': 'en verre', 'meaning': 'made of glass', 'ex': 'Une fenêtre en verre transparent.'},
      {'mat': 'en métal / fer', 'meaning': 'made of metal / iron', 'ex': 'Une clé en métal.'},
      {'mat': 'en or / argent', 'meaning': 'made of gold / silver', 'ex': 'Une chaîne en or fin.'},
      {'mat': 'en coton / tissu', 'meaning': 'made of cotton / fabric', 'ex': 'Un uniforme en coton doux.'},
      {'mat': 'en papier / carton', 'meaning': 'made of paper / cardboard', 'ex': 'Un cahier en papier.'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.amber.shade300),
            ),
            child: Row(
              children: [
                const Icon(Icons.lightbulb_rounded, color: Colors.brown, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'RÈGLE DU BECE : On emploie TOUJOURS la préposition "EN" devant les matières (en bois, en cuir, en fer).',
                    style: TextStyle(color: Colors.brown.shade900, fontWeight: FontWeight.bold, fontSize: 13),
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
              childAspectRatio: 2.2,
            ),
            itemCount: materials.length,
            itemBuilder: (context, index) {
              final m = materials[index];
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(m['mat']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF6D4C41))),
                    Text(m['meaning']!, style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
                    Text(m['ex']!, style: const TextStyle(color: LangHueyColors.deepTeal, fontSize: 11, fontStyle: FontStyle.italic)),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRiddleTab() {
    final riddle = _riddles[_riddleIndex];

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
                Text('Devinette : Objet Mystère (#${_riddleIndex + 1} / ${_riddles.length})', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Score: $_riddleScore pts', style: const TextStyle(color: LangHueyColors.amberGold, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.psychology_rounded, color: Color(0xFF6D4C41), size: 24),
                    SizedBox(width: 8),
                    Text('Qui suis-je ? (Indices) :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 12),
                ...(riddle['clues'] as List<String>).map((c) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        const Icon(Icons.check_rounded, size: 16, color: Color(0xFF6D4C41)),
                        const SizedBox(width: 8),
                        Expanded(child: Text(c, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 20),

          ...List.generate((riddle['options'] as List<String>).length, (i) {
            final opt = (riddle['options'] as List<String>)[i];
            final isCorrect = i == riddle['correct'];
            Color btnColor = Colors.white;
            Color textColor = LangHueyColors.charcoal;

            if (_riddleAnswered) {
              if (isCorrect) {
                btnColor = const Color(0xFF2ECC71);
                textColor = Colors.white;
              } else if (_riddleSelected == i) {
                btnColor = const Color(0xFFE74C3C);
                textColor = Colors.white;
              }
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: !_riddleAnswered
                    ? () {
                        setState(() {
                          _riddleAnswered = true;
                          _riddleSelected = i;
                          if (isCorrect) {
                            _riddleScore += 10;
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
                    border: Border.all(color: _riddleAnswered && (isCorrect || _riddleSelected == i) ? Colors.transparent : Colors.black12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(opt, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 15)),
                      if (_riddleAnswered && isCorrect)
                        const Icon(Icons.check_circle_rounded, color: Colors.white)
                      else if (_riddleAnswered && _riddleSelected == i)
                        const Icon(Icons.cancel_rounded, color: Colors.white),
                    ],
                  ),
                ),
              ),
            );
          }),

          if (_riddleAnswered) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green.shade300),
              ),
              child: Text('💡 ${riddle['explanation']}', style: TextStyle(color: Colors.green.shade900, fontSize: 13)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _riddleIndex = (_riddleIndex + 1) % _riddles.length;
                  _riddleAnswered = false;
                  _riddleSelected = null;
                });
                _audio.playClick();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6D4C41),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(_riddleIndex + 1 < _riddles.length ? 'Devinette Suivante' : 'Recommencer'),
            ),
          ],
        ],
      ),
    );
  }
}
