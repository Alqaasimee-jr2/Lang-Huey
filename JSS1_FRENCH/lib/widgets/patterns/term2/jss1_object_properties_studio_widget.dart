import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1ObjectPropertiesStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1ObjectPropertiesStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1ObjectPropertiesStudioWidget> createState() => _JSS1ObjectPropertiesStudioWidgetState();
}

class _JSS1ObjectPropertiesStudioWidgetState extends State<JSS1ObjectPropertiesStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedObjectIndex = 0;
  String _selectedSize = 'grand'; // 'grand' or 'petit'
  String _selectedShape = 'rond'; // 'rond', 'carre', 'rectangulaire'
  String _selectedWeight = 'lourd'; // 'lourd', 'leger', 'dur', 'doux'
  String _selectedColor = 'rouge'; // 'rouge', 'bleu', 'noir', 'vert'

  final List<Map<String, dynamic>> _objects = [
    {
      'name': 'Le sac à dos',
      'gender': 'M',
      'base': 'sac',
      'icon': Icons.backpack_rounded,
      'audio': 'grand_grande',
    },
    {
      'name': 'La table',
      'gender': 'F',
      'base': 'table',
      'icon': Icons.table_restaurant_rounded,
      'audio': 'carre_carree',
    },
    {
      'name': 'Le ballon',
      'gender': 'M',
      'base': 'ballon',
      'icon': Icons.sports_soccer_rounded,
      'audio': 'rond_ronde',
    },
    {
      'name': 'La boîte',
      'gender': 'F',
      'base': 'boîte',
      'icon': Icons.inventory_2_rounded,
      'audio': 'petit_petite',
    },
    {
      'name': 'Le livre',
      'gender': 'M',
      'base': 'livre',
      'icon': Icons.menu_book_rounded,
      'audio': 'lourd_lourde',
    },
    {
      'name': 'La règle',
      'gender': 'F',
      'base': 'règle',
      'icon': Icons.straighten_rounded,
      'audio': 'leger_legere',
    },
  ];

  String _getConstructedSentence() {
    final obj = _objects[_selectedObjectIndex];
    final isFem = obj['gender'] == 'F';

    // Size agreement
    final sizeStr = isFem
        ? (_selectedSize == 'grand' ? 'grande' : 'petite')
        : (_selectedSize == 'grand' ? 'grand' : 'petit');

    // Shape agreement
    String shapeStr;
    if (_selectedShape == 'rond') {
      shapeStr = isFem ? 'ronde' : 'rond';
    } else if (_selectedShape == 'carre') {
      shapeStr = isFem ? 'carrée' : 'carré';
    } else {
      shapeStr = isFem ? 'rectangulaire' : 'rectangulaire';
    }

    // Weight/texture agreement
    String weightStr;
    if (_selectedWeight == 'lourd') {
      weightStr = isFem ? 'lourde' : 'lourd';
    } else if (_selectedWeight == 'leger') {
      weightStr = isFem ? 'légère' : 'léger';
    } else if (_selectedWeight == 'dur') {
      weightStr = isFem ? 'dure' : 'dur';
    } else {
      weightStr = isFem ? 'douce' : 'doux';
    }

    // Color agreement
    String colorStr;
    if (_selectedColor == 'rouge') {
      colorStr = 'rouge';
    } else if (_selectedColor == 'bleu') {
      colorStr = isFem ? 'bleue' : 'bleu';
    } else if (_selectedColor == 'noir') {
      colorStr = isFem ? 'noire' : 'noir';
    } else {
      colorStr = isFem ? 'verte' : 'vert';
    }

    final article = isFem ? 'Une' : 'Un';
    return '$article $sizeStr ${obj['base']} $shapeStr, $weightStr et $colorStr.';
  }

  @override
  Widget build(BuildContext context) {
    final activeObject = _objects[_selectedObjectIndex];
    final isFem = activeObject['gender'] == 'F';
    final sentence = _getConstructedSentence();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Object Selector & Adjective Attribute Controls
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.charcoal.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Icons.tune_rounded, color: JSS1Colors.teal, size: 24),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text('1. Choisissez l\'Objet à Décrire', style: JSS1Text.subheading(JSS1Colors.charcoal), overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: isFem ? JSS1Colors.indigo.withValues(alpha: 0.1) : JSS1Colors.teal.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          isFem ? 'Féminin (La / Une)' : 'Masculin (Le / Un)',
                          style: TextStyle(
                            color: isFem ? JSS1Colors.indigo : JSS1Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Object Chips
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(_objects.length, (idx) {
                      final isSelected = _selectedObjectIndex == idx;
                      final obj = _objects[idx];
                      return ChoiceChip(
                        avatar: Icon(obj['icon'] as IconData, size: 18, color: isSelected ? JSS1Colors.white : JSS1Colors.teal),
                        label: Text(obj['name'] as String),
                        selected: isSelected,
                        selectedColor: JSS1Colors.teal,
                        backgroundColor: JSS1Colors.cream,
                        labelStyle: TextStyle(
                          color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                          fontWeight: FontWeight.bold,
                        ),
                        onSelected: (selected) {
                          if (selected) {
                            setState(() => _selectedObjectIndex = idx);
                            _audioService.playClick();
                          }
                        },
                      );
                    }),
                  ),

                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 12),

                  // Attribute Row 1: Taille (Size)
                  Text('2. Taille & Dimension (Grand / Petit)', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildOptionChip('Grand (Large/Big)', _selectedSize == 'grand', () {
                        setState(() => _selectedSize = 'grand');
                        _audioService.playPhrase('grand_grande', term: 2);
                      }),
                      const SizedBox(width: 8),
                      _buildOptionChip('Petit (Small/Short)', _selectedSize == 'petit', () {
                        setState(() => _selectedSize = 'petit');
                        _audioService.playPhrase('petit_petite', term: 2);
                      }),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Attribute Row 2: Forme (Shape)
                  Text('3. Forme Géométrique (Rond / Carré / Rectangulaire)', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildOptionChip('Rond(e)', _selectedShape == 'rond', () {
                        setState(() => _selectedShape = 'rond');
                        _audioService.playPhrase('rond_ronde', term: 2);
                      }),
                      _buildOptionChip('Carré(e)', _selectedShape == 'carre', () {
                        setState(() => _selectedShape = 'carre');
                        _audioService.playPhrase('carre_carree', term: 2);
                      }),
                      _buildOptionChip('Rectangulaire', _selectedShape == 'rectangulaire', () {
                        setState(() => _selectedShape = 'rectangulaire');
                        _audioService.playClick();
                      }),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Attribute Row 3: Poids & Texture (Weight & Texture)
                  Text('4. Poids & Texture (Lourd / Léger / Dur / Doux)', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildOptionChip('Lourd(e)', _selectedWeight == 'lourd', () {
                        setState(() => _selectedWeight = 'lourd');
                        _audioService.playPhrase('lourd_lourde', term: 2);
                      }),
                      _buildOptionChip('Léger(ère)', _selectedWeight == 'leger', () {
                        setState(() => _selectedWeight == 'leger');
                        _audioService.playPhrase('leger_legere', term: 2);
                      }),
                      _buildOptionChip('Dur(e)', _selectedWeight == 'dur', () {
                        setState(() => _selectedWeight == 'dur');
                        _audioService.playPhrase('dur_dure', term: 2);
                      }),
                      _buildOptionChip('Doux(ce)', _selectedWeight == 'doux', () {
                        setState(() => _selectedWeight == 'doux');
                        _audioService.playPhrase('doux_douce', term: 2);
                      }),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Attribute Row 4: Couleur
                  Text('5. Couleur de l\'Objet', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildOptionChip('Rouge', _selectedColor == 'rouge', () => setState(() => _selectedColor = 'rouge')),
                      _buildOptionChip('Bleu(e)', _selectedColor == 'bleu', () => setState(() => _selectedColor = 'bleu')),
                      _buildOptionChip('Noir(e)', _selectedColor == 'noir', () => setState(() => _selectedColor = 'noir')),
                      _buildOptionChip('Vert(e)', _selectedColor == 'vert', () => setState(() => _selectedColor = 'vert')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        // Right Column: Live Smartboard Display & Concordance Showcase
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: JSS1Colors.teal,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.teal.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Object Card
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text('STUDIO D\'ACCORD DES ADJECTIFS', style: JSS1Text.caption(JSS1Colors.gold).copyWith(letterSpacing: 1.2, fontWeight: FontWeight.w900), overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: JSS1Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Grammaire Vivante',
                            style: JSS1Text.caption(JSS1Colors.white).copyWith(fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: JSS1Colors.white.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(activeObject['icon'] as IconData, size: 72, color: JSS1Colors.gold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        activeObject['name'] as String,
                        style: JSS1Text.heroHeading(JSS1Colors.white).copyWith(fontSize: 22),
                      ),
                    ),
                  ],
                ),

                // Center Generated Description Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Description Générée :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal),
                            onPressed: () {
                              _audioService.playPhrase(activeObject['audio'] as String, term: 2);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        sentence,
                        style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 17, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: JSS1Colors.cream,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          isFem
                              ? 'Règle : Noun féminin ➔ Accord des adjectifs au féminin (+e, légère, douce, carrée).'
                              : 'Règle : Noun masculin ➔ Forme de base (grand, rond, lourd, doux).',
                          style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontSize: 11, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),

                // Audio Practice Button
                InkWell(
                  onTap: () {
                    _audioService.playPhrase('de_quelle_couleur_est_cet_objet', term: 2);
                  },
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: JSS1Colors.gold,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.record_voice_over_rounded, color: JSS1Colors.charcoal, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Écouter : "De quelle couleur est cet objet ?"',
                          style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionChip(String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
