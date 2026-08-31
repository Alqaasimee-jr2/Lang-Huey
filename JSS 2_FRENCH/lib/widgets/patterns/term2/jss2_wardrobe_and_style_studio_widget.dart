import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2WardrobeAndStyleStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2WardrobeAndStyleStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2WardrobeAndStyleStudioWidget> createState() => _JSS2WardrobeAndStyleStudioWidgetState();
}

class _JSS2WardrobeAndStyleStudioWidgetState extends State<JSS2WardrobeAndStyleStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();

  int _selectedGarmentIndex = 0;
  String _selectedMaterial = 'en coton';
  String _selectedPattern = 'à rayures';
  String _clothingSize = 'M (Taille 40)';
  String _shoeSize = '42';

  final List<Map<String, dynamic>> _garments = [
    {
      'name': 'La chemise',
      'icon': Icons.dry_cleaning_rounded,
      'audio': 'la_chemise_et_le_pantalon',
    },
    {
      'name': 'Le pantalon',
      'icon': Icons.accessibility_rounded,
      'audio': 'un_pantalon_a_carreaux',
    },
    {
      'name': 'La robe',
      'icon': Icons.checkroom_rounded,
      'audio': 'la_robe_et_la_jupe',
    },
    {
      'name': 'Le pagne traditionnel',
      'icon': Icons.style_rounded,
      'audio': 'le_pagne_et_lagbada_traditionnel',
    },
    {
      'name': 'Les chaussures',
      'icon': Icons.roller_skating_rounded,
      'audio': 'les_chaussures_en_cuir_noir',
    },
  ];

  final List<String> _materials = ['en coton', 'en cuir', 'en soie', 'en lin'];
  final List<String> _patterns = ['uni', 'à rayures', 'à carreaux', 'à motifs'];

  String _buildLookSentence() {
    final g = _garments[_selectedGarmentIndex];
    if (g['name'] == 'Les chaussures') {
      return '${g['name']} ${_selectedMaterial} (Pointure $_shoeSize)';
    }
    return '${g['name']} ${_selectedMaterial} ${_selectedPattern} (${_clothingSize})';
  }

  @override
  Widget build(BuildContext context) {
    final g = _garments[_selectedGarmentIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0D7377), Color(0xFF14BDCC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.checkroom_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Studio Stylisme & Garde-Robe : Tenues, Matières & Tailles',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Habillez votre mannequin virtuel en combinant vêtements, pagnes traditionnels, matières (EN) et motifs (À).',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Garment Selector
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_garments.length, (index) {
                final item = _garments[index];
                final isSelected = _selectedGarmentIndex == index;

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: InkWell(
                    onTap: () {
                      setState(() => _selectedGarmentIndex = index);
                      _audioService.playPhrase(item['audio'] as String, term: 2);
                    },
                    borderRadius: BorderRadius.circular(14),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? LangHueyColors.deepTeal : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected ? LangHueyColors.deepTeal : Colors.black12,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            item['icon'] as IconData,
                            color: isSelected ? Colors.white : LangHueyColors.deepTeal,
                            size: 24,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            item['name'] as String,
                            style: TextStyle(
                              color: isSelected ? Colors.white : LangHueyColors.charcoal,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 18),

          // Customization Station
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Panel: Materials & Patterns
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1. Matière de fabrication (Préposition EN) :', style: LangHueyTextStyles.bodySmall),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: _materials.map((mat) {
                          final isSel = _selectedMaterial == mat;
                          return ChoiceChip(
                            label: Text(mat),
                            selected: isSel,
                            selectedColor: LangHueyColors.softTeal,
                            onSelected: (val) {
                              setState(() => _selectedMaterial = mat);
                              _audioService.playClick();
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 14),
                      Text('2. Motif & Style (Préposition À) :', style: LangHueyTextStyles.bodySmall),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: _patterns.map((pat) {
                          final isSel = _selectedPattern == pat;
                          return ChoiceChip(
                            label: Text(pat),
                            selected: isSel,
                            selectedColor: LangHueyColors.softTeal,
                            onSelected: (val) {
                              setState(() => _selectedPattern = pat);
                              _audioService.playClick();
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 14),
                      Text('3. Mensurations (Taille & Pointure) :', style: LangHueyTextStyles.bodySmall),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _clothingSize,
                              decoration: const InputDecoration(
                                labelText: 'Taille vêtement',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              ),
                              items: const [
                                DropdownMenuItem(value: 'S (Taille 38)', child: Text('S (Taille 38)')),
                                DropdownMenuItem(value: 'M (Taille 40)', child: Text('M (Taille 40)')),
                                DropdownMenuItem(value: 'L (Taille 42)', child: Text('L (Taille 42)')),
                                DropdownMenuItem(value: 'XL (Taille 44)', child: Text('XL (Taille 44)')),
                              ],
                              onChanged: (val) {
                                if (val != null) setState(() => _clothingSize = val);
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _shoeSize,
                              decoration: const InputDecoration(
                                labelText: 'Pointure chaussure',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              ),
                              items: const [
                                DropdownMenuItem(value: '39', child: Text('Pointure 39')),
                                DropdownMenuItem(value: '40', child: Text('Pointure 40')),
                                DropdownMenuItem(value: '42', child: Text('Pointure 42')),
                                DropdownMenuItem(value: '44', child: Text('Pointure 44')),
                              ],
                              onChanged: (val) {
                                if (val != null) setState(() => _shoeSize = val);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Right Panel: Live Outfit Description
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Description du Look', style: LangHueyTextStyles.h3.copyWith(fontSize: 16)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: LangHueyColors.softTeal,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.3)),
                        ),
                        child: Text(
                          '« Je porte ${_buildLookSentence()}. »',
                          style: LangHueyTextStyles.frenchHighlight.copyWith(fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: 14),
                      ElevatedButton.icon(
                        onPressed: () {
                          _audioService.playPhrase(g['audio'] as String, term: 2);
                        },
                        icon: const Icon(Icons.volume_up_rounded, size: 20),
                        label: const Text('Prononcer la Tenue'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LangHueyColors.deepTeal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: LangHueyColors.warmCream,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Règle d\'or : EN coton (matière) vs À rayures (motif).',
                          style: LangHueyTextStyles.bodySmall.copyWith(color: LangHueyColors.charcoal),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
