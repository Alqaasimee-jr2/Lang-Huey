import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2ProductQuantityQualityStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2ProductQuantityQualityStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2ProductQuantityQualityStudioWidget> createState() => _JSS2ProductQuantityQualityStudioWidgetState();
}

class _JSS2ProductQuantityQualityStudioWidgetState extends State<JSS2ProductQuantityQualityStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();

  int _selectedProductIndex = 0;
  double _currentQuantity = 1.0; // In kg or Liters

  final List<Map<String, dynamic>> _produce = [
    {
      'name': 'Tomates fraîches bien mûres',
      'unit': 'kg',
      'step': 0.5,
      'min': 0.5,
      'max': 5.0,
      'icon': Icons.eco_rounded,
      'qualityBadge': 'Fraîcheur Garantie (Bio)',
      'audio': 'un_kilo_de_tomates_bien_mures',
    },
    {
      'name': 'Oignons frais du marché',
      'unit': 'kg',
      'step': 0.5,
      'min': 0.5,
      'max': 4.0,
      'icon': Icons.grain_rounded,
      'qualityBadge': 'Premier Choix',
      'audio': 'un_demi_kilo_doignons_frais',
    },
    {
      'name': 'Huile d\'arachide pure',
      'unit': 'Litre',
      'step': 1.0,
      'min': 1.0,
      'max': 5.0,
      'icon': Icons.water_drop_rounded,
      'qualityBadge': '100% Naturelle',
      'audio': 'un_litre_dhuile_darachide',
    },
    {
      'name': 'Œufs de ferme',
      'unit': 'Douzaine',
      'step': 1.0,
      'min': 1.0,
      'max': 3.0,
      'icon': Icons.egg_rounded,
      'qualityBadge': 'Extra Frais',
      'audio': 'une_douzaine_doeufs_frais',
    },
  ];

  String _formatQuantitySentence() {
    final p = _produce[_selectedProductIndex];
    final unit = p['unit'] as String;

    String qtyStr = '';
    if (unit == 'kg') {
      if (_currentQuantity == 0.5) {
        qtyStr = 'un demi-kilo de';
      } else if (_currentQuantity == 1.0) {
        qtyStr = 'un kilo de';
      } else {
        qtyStr = '${_currentQuantity.toStringAsFixed(1)} kilos de';
      }
    } else if (unit == 'Litre') {
      if (_currentQuantity == 1.0) {
        qtyStr = 'un litre d\'';
      } else {
        qtyStr = '${_currentQuantity.toInt()} litres d\'';
      }
    } else if (unit == 'Douzaine') {
      if (_currentQuantity == 1.0) {
        qtyStr = 'une douzaine d\'';
      } else {
        qtyStr = '${_currentQuantity.toInt()} douzaines d\'';
      }
    }

    return 'Je voudrais $qtyStr ${p['name'].toString().toLowerCase()}.';
  }

  @override
  Widget build(BuildContext context) {
    final p = _produce[_selectedProductIndex];

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
                const Icon(Icons.scale_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Laboratoire des Mesures Métriques & Qualité des Produits',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Pesez des légumes, dosez des litres et apprenez la règle d\'or du DE / D\' après les quantités.',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Produce Selector Tabs
          Row(
            children: List.generate(_produce.length, (index) {
              final prod = _produce[index];
              final isSelected = _selectedProductIndex == index;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 0 : 4,
                    right: index == _produce.length - 1 ? 0 : 4,
                  ),
                  child: ChoiceChip(
                    label: Text(
                      prod['name'].toString().split(' ').first,
                      style: const TextStyle(fontSize: 12),
                    ),
                    selected: isSelected,
                    selectedColor: LangHueyColors.deepTeal,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : LangHueyColors.charcoal,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    onSelected: (val) {
                      setState(() {
                        _selectedProductIndex = index;
                        _currentQuantity = prod['min'] as double;
                      });
                      _audioService.playClick();
                    },
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 18),

          // Digital Scale Arena
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Panel: Metric Scale Controls
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(p['icon'] as IconData, color: LangHueyColors.deepTeal, size: 28),
                              const SizedBox(width: 10),
                              Text(p['name'] as String, style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.green.shade200),
                            ),
                            child: Text(
                              p['qualityBadge'] as String,
                              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),

                      // Scale Weight Display
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: LangHueyColors.softTeal,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.2)),
                        ),
                        child: Column(
                          children: [
                            const Text('⚖️ BALANCE ÉLECTRONIQUE DIGITALE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: LangHueyColors.deepTeal)),
                            const SizedBox(height: 6),
                            Text(
                              '${_currentQuantity.toStringAsFixed(_currentQuantity == _currentQuantity.roundToDouble() ? 0 : 1)} ${p['unit']}',
                              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: LangHueyColors.charcoal),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Increment / Decrement Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _currentQuantity > (p['min'] as double)
                                ? () {
                                    setState(() => _currentQuantity -= (p['step'] as double));
                                    _audioService.playClick();
                                  }
                                : null,
                            icon: const Icon(Icons.remove_circle_outline_rounded),
                            label: const Text('Moins'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                              foregroundColor: Colors.black87,
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton.icon(
                            onPressed: _currentQuantity < (p['max'] as double)
                                ? () {
                                    setState(() => _currentQuantity += (p['step'] as double));
                                    _audioService.playClick();
                                  }
                                : null,
                            icon: const Icon(Icons.add_circle_outline_rounded),
                            label: const Text('Plus'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: LangHueyColors.deepTeal,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Right Panel: Live Sentence & Grammar Rule
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
                      Text('Formulation Orale de Commande', style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: LangHueyColors.softTeal,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '« ${_formatQuantitySentence()} »',
                          style: LangHueyTextStyles.frenchHighlight.copyWith(fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: 14),
                      ElevatedButton.icon(
                        onPressed: () {
                          _audioService.playPhrase(p['audio'] as String, term: 2);
                        },
                        icon: const Icon(Icons.volume_up_rounded, size: 20),
                        label: const Text('Écouter la Prononciation'),
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
                          'Règle d\'or : Après un nom de quantité, on utilise toujours "DE" ou "D\'" (un kilo de mangues, pas "des").',
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
