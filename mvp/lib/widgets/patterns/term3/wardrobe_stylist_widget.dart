import 'package:flutter/material.dart';
import '../../../services/p4_audio_service.dart';

/// Bespoke Smartboard Pattern Widget for Week 9: Wardrobe & Clothing Stylist
class WardrobeStylistWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const WardrobeStylistWidget({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<WardrobeStylistWidget> createState() => _WardrobeStylistWidgetState();
}

class _WardrobeStylistWidgetState extends State<WardrobeStylistWidget> {
  final P4AudioService _audioService = P4AudioService();
  int _selectedOutfitIndex = 0;

  final List<Map<String, dynamic>> _outfits = [
    {
      'title': 'UNE CHEMISE BLANCHE',
      'french': 'Je porte une chemise blanche',
      'english': 'I am wearing a white shirt',
      'genderNote': 'Féminin (Une chemise -> blanche)',
      'audioKey': 'une_chemise_blanche',
      'icon': Icons.checkroom_rounded,
      'color': const Color(0xFF0D7377),
    },
    {
      'title': 'UN PANTALON NOIR',
      'french': 'Je porte un pantalon noir',
      'english': 'I am wearing black trousers',
      'genderNote': 'Masculin (Un pantalon -> noir)',
      'audioKey': 'un_pantalon_noir',
      'icon': Icons.accessibility_rounded,
      'color': const Color(0xFF1E293B),
    },
    {
      'title': 'UNE ROBE ROUGE',
      'french': 'Je porte une robe rouge',
      'english': 'I am wearing a red dress',
      'genderNote': 'Féminin (Une robe -> rouge)',
      'audioKey': 'une_robe_rouge',
      'icon': Icons.woman_2_rounded,
      'color': const Color(0xFFE11D48),
    },
    {
      'title': 'UNE JUPE BLEUE',
      'french': 'Je porte une jupe bleue',
      'english': 'I am wearing a blue skirt',
      'genderNote': 'Féminin (Une jupe -> bleue)',
      'audioKey': 'la_jupe',
      'icon': Icons.girl_rounded,
      'color': const Color(0xFF0284C7),
    },
    {
      'title': 'DES CHAUSSURES MARRON',
      'french': 'Je porte des chaussures marron',
      'english': 'I am wearing brown shoes',
      'genderNote': 'Pluriel (Des chaussures -> marron invariable)',
      'audioKey': 'des_chaussures_marron',
      'icon': Icons.snowshoeing_rounded,
      'color': const Color(0xFFD97706),
    },
    {
      'title': 'LE CHAPEAU',
      'french': 'Je porte un chapeau',
      'english': 'I am wearing a hat',
      'genderNote': 'Masculin (Un chapeau)',
      'audioKey': 'le_chapeau',
      'icon': Icons.face_retouching_natural_rounded,
      'color': const Color(0xFF6366F1),
    },
  ];

  void _playAudio(String key) {
    _audioService.playPhrase(key, term: 3);
  }

  @override
  Widget build(BuildContext context) {
    final activeOutfit = _outfits[_selectedOutfitIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0D7377), Color(0xFF14BDCC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.checkroom_rounded, color: Colors.white, size: 36),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "LES VÊTEMENTS · CLOTHING & FASHION STYLIST",
                        style: TextStyle(
                          color: Color(0xFFF4A832),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Je m'habille en Français",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Select an article of clothing to practice describing outfits with color gender agreements!",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Active Outfit Spotlight Card
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: (activeOutfit['color'] as Color).withValues(alpha: 0.3), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: (activeOutfit['color'] as Color).withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(activeOutfit['icon'] as IconData, color: activeOutfit['color'] as Color, size: 48),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: activeOutfit['color'] as Color,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          activeOutfit['genderNote'] as String,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        activeOutfit['french'] as String,
                        style: const TextStyle(
                          color: Color(0xFF1E293B),
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        activeOutfit['english'] as String,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () => _playAudio(activeOutfit['audioKey'] as String),
                        icon: const Icon(Icons.volume_up_rounded, size: 20),
                        label: const Text("Listen Outfit Pronunciation"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: activeOutfit['color'] as Color,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Outfits Selection Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _outfits.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.0,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final outfit = _outfits[index];
              final isSelected = index == _selectedOutfitIndex;
              return InkWell(
                onTap: () {
                  setState(() => _selectedOutfitIndex = index);
                  _playAudio(outfit['audioKey'] as String);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? (outfit['color'] as Color) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? (outfit['color'] as Color) : const Color(0xFFE2E8F0),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        outfit['icon'] as IconData,
                        color: isSelected ? Colors.white : (outfit['color'] as Color),
                        size: 28,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              outfit['title'] as String,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: isSelected ? Colors.white : const Color(0xFF1E293B),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              outfit['english'] as String,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: isSelected ? Colors.white.withValues(alpha: 0.9) : const Color(0xFF64748B),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          // Completion Button
          ElevatedButton.icon(
            onPressed: () {
              _audioService.playSfx(P4SfxType.correct);
              widget.onComplete();
            },
            icon: const Icon(Icons.check_circle_rounded, size: 22),
            label: const Text("Complete Wardrobe Studio & Proceed", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0D7377),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }
}
