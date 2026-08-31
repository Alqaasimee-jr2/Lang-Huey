import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2MerchantsAndGoodsStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2MerchantsAndGoodsStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2MerchantsAndGoodsStudioWidget> createState() => _JSS2MerchantsAndGoodsStudioWidgetState();
}

class _JSS2MerchantsAndGoodsStudioWidgetState extends State<JSS2MerchantsAndGoodsStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();
  int _selectedShopIndex = 0;

  final List<Map<String, dynamic>> _shops = [
    {
      'merchant': 'Le Boucher',
      'shop': 'La Boucherie',
      'icon': Icons.restaurant_rounded,
      'color': Colors.red.shade700,
      'audio': 'le_boucher_a_la_boucherie',
      'goods': [
        {'name': 'Viande de bœuf fraîche', 'format': 'au kilo', 'icon': Icons.set_meal_rounded},
        {'name': 'Poulet fermier entier', 'format': 'à la pièce', 'icon': Icons.egg_rounded},
        {'name': 'Saucisses fraîches', 'format': 'en paquet', 'icon': Icons.view_headline_rounded},
      ],
      'rule': 'Chez le boucher, on achète de la viande fraîche au kilo.',
    },
    {
      'merchant': 'Le Boulanger',
      'shop': 'La Boulangerie',
      'icon': Icons.bakery_dining_rounded,
      'color': Colors.amber.shade800,
      'audio': 'le_boulanger_a_la_boulangerie',
      'goods': [
        {'name': 'Baguettes de pain chaud', 'format': 'à l\'unité', 'icon': Icons.breakfast_dining_rounded},
        {'name': 'Croissants au beurre', 'format': 'en sachet', 'icon': Icons.cake_rounded},
        {'name': 'Gâteaux d\'anniversaire', 'format': 'sur commande', 'icon': Icons.celebration_rounded},
      ],
      'rule': 'Chez le boulanger, on achète du pain croustillant et des viennoiseries.',
    },
    {
      'merchant': 'L\'Épicier',
      'shop': 'L\'Épicerie',
      'icon': Icons.local_grocery_store_rounded,
      'color': LangHueyColors.deepTeal,
      'audio': 'lepicier_a_lepicerie',
      'goods': [
        {'name': 'Huile d\'arachide', 'format': 'en bouteille', 'icon': Icons.liquor_rounded},
        {'name': 'Sardines & Tomates', 'format': 'en boîte', 'icon': Icons.view_in_ar_rounded},
        {'name': 'Lait en poudre', 'format': 'en sachet', 'icon': Icons.inventory_rounded},
        {'name': 'Riz & Haricots', 'format': 'en vrac au kilo', 'icon': Icons.scale_rounded},
      ],
      'rule': 'Chez l\'épicier, on trouve des conserves, des bouteilles d\'huile et des produits secs.',
    },
    {
      'merchant': 'Le Poissonnier',
      'shop': 'La Poissonnerie',
      'icon': Icons.set_meal_rounded,
      'color': Colors.blue.shade700,
      'audio': 'le_poissonnier_a_la_poissonnerie',
      'goods': [
        {'name': 'Tilapia & Capitaine frais', 'format': 'au rayon frais', 'icon': Icons.eco_rounded},
        {'name': 'Crevettes géantes', 'format': 'au kilo', 'icon': Icons.catching_pokemon_rounded},
        {'name': 'Poisson séché / fumé', 'format': 'en paquet', 'icon': Icons.waves_rounded},
      ],
      'rule': 'Chez le poissonnier, les poissons sont présentés sur un lit de glace au rayon frais.',
    },
    {
      'merchant': 'Le Libraire',
      'shop': 'La Librairie',
      'icon': Icons.menu_book_rounded,
      'color': Colors.indigo.shade700,
      'audio': 'le_libraire_a_la_librairie',
      'goods': [
        {'name': 'Dictionnaires de français', 'format': 'relié / broché', 'icon': Icons.import_contacts_rounded},
        {'name': 'Romans & Contes africains', 'format': 'à l\'unité', 'icon': Icons.auto_stories_rounded},
        {'name': 'Cahiers et papeterie', 'format': 'en lot de 5', 'icon': Icons.edit_note_rounded},
      ],
      'rule': 'À la librairie, on achète des livres (ne pas confondre avec la bibliothèque où on emprunte).',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentShop = _shops[_selectedShopIndex];
    final goods = currentShop['goods'] as List<Map<String, dynamic>>;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Banner
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
                const Icon(Icons.storefront_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Marché des Commerçants & Modes de Présentation',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Découvrez les commerces spécialisés, les marchandises et leurs modes de conditionnement.',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Shop Selection Cards Row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_shops.length, (index) {
                final shop = _shops[index];
                final isSelected = _selectedShopIndex == index;

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: InkWell(
                    onTap: () {
                      setState(() => _selectedShopIndex = index);
                      _audioService.playPhrase(shop['audio'] as String, term: 2);
                    },
                    borderRadius: BorderRadius.circular(14),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? (shop['color'] as Color).withOpacity(0.12) : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected ? shop['color'] as Color : Colors.black12,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(shop['icon'] as IconData, color: shop['color'] as Color, size: 24),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shop['merchant'] as String,
                                style: TextStyle(
                                  color: isSelected ? (shop['color'] as Color) : LangHueyColors.charcoal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                shop['shop'] as String,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
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

          // Main Shop Stalls & Packaging Matcher
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Panel: Stall Counter
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(currentShop['icon'] as IconData, color: currentShop['color'] as Color, size: 24),
                              const SizedBox(width: 10),
                              Text(
                                'Étal : ${currentShop['shop']}',
                                style: LangHueyTextStyles.h3.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              _audioService.playPhrase(currentShop['audio'] as String, term: 2);
                            },
                            icon: const Icon(Icons.volume_up_rounded, size: 18),
                            label: const Text('Prononcer'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: currentShop['color'] as Color,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 20),
                      Text('Marchandises vendues et conditionnement :', style: LangHueyTextStyles.bodySmall),
                      const SizedBox(height: 10),
                      ...List.generate(goods.length, (idx) {
                        final g = goods[idx];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: LangHueyColors.warmCream,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black.withOpacity(0.05)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(g['icon'] as IconData, color: currentShop['color'] as Color, size: 20),
                                  const SizedBox(width: 10),
                                  Text(
                                    g['name'] as String,
                                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black12),
                                ),
                                child: Text(
                                  g['format'] as String,
                                  style: TextStyle(
                                    color: currentShop['color'] as Color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Right Panel: Packaging Rule Station
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
                      Text('Modes de Présentation', style: LangHueyTextStyles.h3.copyWith(fontSize: 16)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: LangHueyColors.softTeal,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          currentShop['rule'] as String,
                          style: TextStyle(color: LangHueyColors.charcoal, height: 1.4, fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text('Lexique des Emballages :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: LangHueyColors.deepTeal)),
                      const SizedBox(height: 6),
                      _buildPackagingPill('🥫 En boîte de conserve', 'en_boite_de_conserve'),
                      _buildPackagingPill('🍾 En bouteille d\'huile', 'en_bouteille_dhuile'),
                      _buildPackagingPill('🥛 En sachet de lait', 'en_sachet_de_lait_en_poudre'),
                      _buildPackagingPill('⚖️ En vrac au kilo', 'vendu_en_vrac_au_kilo'),
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

  Widget _buildPackagingPill(String label, String audioKey) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: InkWell(
        onTap: () => _audioService.playPhrase(audioKey, term: 2),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              const Icon(Icons.volume_up_rounded, color: LangHueyColors.deepTeal, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
