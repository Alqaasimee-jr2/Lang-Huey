import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2ComparisonAndChoiceStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2ComparisonAndChoiceStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2ComparisonAndChoiceStudioWidget> createState() => _JSS2ComparisonAndChoiceStudioWidgetState();
}

class _JSS2ComparisonAndChoiceStudioWidgetState extends State<JSS2ComparisonAndChoiceStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();

  int _comparisonPairIndex = 0;
  String _selectedChoice = 'Modèle A';

  final List<Map<String, dynamic>> _pairs = [
    {
      'topic': 'Robes de Cérémonie',
      'itemA': {'name': 'Robe Dorée en Soie', 'price': 15000, 'elegance': 'Très élégante', 'icon': Icons.checkroom_rounded},
      'itemB': {'name': 'Robe Rouge en Coton', 'price': 10000, 'elegance': 'Aussi jolie', 'icon': Icons.dry_cleaning_rounded},
      'comparison': 'La robe dorée est plus chère que la robe rouge.',
      'audio': 'cette_robe_est_tres_elegante',
    },
    {
      'itemA': {'name': 'Pantalon Noir en Lin', 'price': 8000, 'elegance': 'Confortable', 'icon': Icons.accessibility_rounded},
      'itemB': {'name': 'Jean Bleu Brut', 'price': 8000, 'elegance': 'Confortable', 'icon': Icons.accessibility_rounded},
      'topic': 'Pantalons Quotidiens',
      'comparison': 'Le pantalon noir est aussi confortable que le jean.',
      'audio': 'ce_pantalon_est_plus_cher_que_lautre',
    },
    {
      'topic': 'Chemises de Ville',
      'itemA': {'name': 'Chemise Blanche Épurée', 'price': 6000, 'elegance': 'Légère', 'icon': Icons.dry_cleaning_rounded},
      'itemB': {'name': 'Chemise en Laine Épaisse', 'price': 9000, 'elegance': 'Plus chaude', 'icon': Icons.style_rounded},
      'comparison': 'La chemise blanche est moins chaude que la chemise en laine.',
      'audio': 'cette_chemise_est_moins_chaude',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final pair = _pairs[_comparisonPairIndex];
    final itemA = pair['itemA'] as Map<String, dynamic>;
    final itemB = pair['itemB'] as Map<String, dynamic>;

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
                colors: [Color(0xFF0F766E), Color(0xFF0D7377)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.compare_arrows_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Arène de Comparaison & Prise de Décision',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Comparez deux articles côte à côte (plus... que, moins... que, aussi... que) et exprimez votre choix final.',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Topic Selector Tabs
          Row(
            children: List.generate(_pairs.length, (index) {
              final p = _pairs[index];
              final isSel = _comparisonPairIndex == index;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 0 : 4,
                    right: index == _pairs.length - 1 ? 0 : 4,
                  ),
                  child: ChoiceChip(
                    label: Text(p['topic'] as String, style: const TextStyle(fontSize: 12)),
                    selected: isSel,
                    selectedColor: LangHueyColors.deepTeal,
                    labelStyle: TextStyle(
                      color: isSel ? Colors.white : LangHueyColors.charcoal,
                      fontWeight: isSel ? FontWeight.bold : FontWeight.normal,
                    ),
                    onSelected: (val) {
                      setState(() {
                        _comparisonPairIndex = index;
                        _selectedChoice = 'Modèle A';
                      });
                      _audioService.playClick();
                    },
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 18),

          // Side-by-Side Comparative Cards
          Row(
            children: [
              // Item A Card
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _selectedChoice == 'Modèle A' ? LangHueyColors.softTeal : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _selectedChoice == 'Modèle A' ? LangHueyColors.deepTeal : Colors.black12,
                      width: _selectedChoice == 'Modèle A' ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(itemA['icon'] as IconData, size: 36, color: LangHueyColors.deepTeal),
                      const SizedBox(height: 8),
                      Text(itemA['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), textAlign: TextAlign.center),
                      const SizedBox(height: 4),
                      Text('Prix : ${itemA['price']} ₦', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13)),
                      Text(itemA['elegance'] as String, style: TextStyle(color: Colors.grey.shade700, fontSize: 12)),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() => _selectedChoice = 'Modèle A');
                          _audioService.playPhrase('je_prefere_celui_ci', term: 2);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedChoice == 'Modèle A' ? LangHueyColors.deepTeal : Colors.grey.shade200,
                          foregroundColor: _selectedChoice == 'Modèle A' ? Colors.white : Colors.black87,
                        ),
                        child: const Text('« Je préfère celui-ci »', style: TextStyle(fontSize: 11)),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 14),

              // VS Indicator
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: LangHueyColors.amberGold,
                  shape: BoxShape.circle,
                ),
                child: const Text('VS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ),

              const SizedBox(width: 14),

              // Item B Card
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _selectedChoice == 'Modèle B' ? LangHueyColors.softTeal : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _selectedChoice == 'Modèle B' ? LangHueyColors.deepTeal : Colors.black12,
                      width: _selectedChoice == 'Modèle B' ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(itemB['icon'] as IconData, size: 36, color: LangHueyColors.deepTeal),
                      const SizedBox(height: 8),
                      Text(itemB['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), textAlign: TextAlign.center),
                      const SizedBox(height: 4),
                      Text('Prix : ${itemB['price']} ₦', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13)),
                      Text(itemB['elegance'] as String, style: TextStyle(color: Colors.grey.shade700, fontSize: 12)),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() => _selectedChoice = 'Modèle B');
                          _audioService.playPhrase('je_prends_celle_la', term: 2);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedChoice == 'Modèle B' ? LangHueyColors.deepTeal : Colors.grey.shade200,
                          foregroundColor: _selectedChoice == 'Modèle B' ? Colors.white : Colors.black87,
                        ),
                        child: const Text('« Je prends celle-là »', style: TextStyle(fontSize: 11)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Comparative Synthesis Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black12),
            ),
            child: Row(
              children: [
                const Icon(Icons.auto_awesome_rounded, color: LangHueyColors.amberGold, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Formule de Comparaison :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      Text(
                        '« ${pair['comparison']} »',
                        style: LangHueyTextStyles.frenchHighlight.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up_rounded, color: LangHueyColors.deepTeal, size: 24),
                  onPressed: () => _audioService.playPhrase(pair['audio'] as String, term: 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
