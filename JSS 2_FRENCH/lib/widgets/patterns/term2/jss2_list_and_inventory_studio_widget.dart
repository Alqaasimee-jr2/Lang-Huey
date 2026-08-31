import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2ListAndInventoryStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2ListAndInventoryStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2ListAndInventoryStudioWidget> createState() => _JSS2ListAndInventoryStudioWidgetState();
}

class _JSS2ListAndInventoryStudioWidgetState extends State<JSS2ListAndInventoryStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();
  int _selectedCategoryIndex = 0; // 0: Fournitures, 1: Épicerie, 2: Matériel de Classe

  final List<Map<String, dynamic>> _categories = [
    {
      'title': 'Fournitures Scolaires',
      'icon': Icons.edit_note_rounded,
      'color': LangHueyColors.deepTeal,
      'items': [
        {'name': 'Cahiers d\'exercices (x3)', 'status': 'present', 'audio': 'les_fournitures_scolaires'},
        {'name': 'Stylos bleus (paquet de 5)', 'status': 'present', 'audio': 'cinq_paquets_de_stylos_bleus'},
        {'name': 'Règle graduée de 30 cm', 'status': 'present', 'audio': 'la_regle_pour_mesurer_les_lignes'},
        {'name': 'Gomme blanche', 'status': 'missing', 'audio': 'il_manque_deux_cahiers'},
        {'name': 'Boîte de crayons de couleur', 'status': 'present', 'audio': 'linventaire_du_materiel'},
      ],
    },
    {
      'title': 'Alimentation & Épicerie',
      'icon': Icons.shopping_basket_rounded,
      'color': LangHueyColors.amberGold,
      'items': [
        {'name': 'Riz blanc (2 kilos)', 'status': 'present', 'audio': 'il_nous_faut_du_riz_et_du_sel'},
        {'name': 'Huile d\'arachide (1 litre)', 'status': 'present', 'audio': 'la_liste_des_courses'},
        {'name': 'Sachet de lait en poudre', 'status': 'missing', 'audio': 'il_manque_deux_cahiers'},
        {'name': 'Sucre en morceaux (1 paquet)', 'status': 'present', 'audio': 'cocher_les_elements_achetes'},
        {'name': 'Sel de cuisine iodé', 'status': 'present', 'audio': 'il_nous_faut_du_riz_et_du_sel'},
      ],
    },
    {
      'title': 'Équipement de la Classe',
      'icon': Icons.inventory_2_rounded,
      'color': LangHueyColors.turquoise,
      'items': [
        {'name': 'Craies blanches (10 boîtes)', 'status': 'present', 'audio': 'dix_boites_de_craies_blanches'},
        {'name': 'Chiffon / Éponge pour tableau', 'status': 'present', 'audio': 'compter_les_articles_en_stock'},
        {'name': 'Balai pour le sol', 'status': 'present', 'audio': 'linventaire_du_materiel'},
        {'name': 'Poubelle à papier', 'status': 'missing', 'audio': 'il_manque_deux_cahiers'},
        {'name': 'Marqueurs effaçables', 'status': 'present', 'audio': 'tout_est_au_complet'},
      ],
    },
  ];

  late List<List<bool>> _checkedItems;

  @override
  void initState() {
    super.initState();
    _checkedItems = _categories.map((cat) {
      final items = cat['items'] as List<Map<String, dynamic>>;
      return List.generate(items.length, (index) => items[index]['status'] == 'present');
    }).toList();
  }

  void _toggleItem(int catIndex, int itemIndex) {
    setState(() {
      _checkedItems[catIndex][itemIndex] = !_checkedItems[catIndex][itemIndex];
    });
    _audioService.playClick();
  }

  int get _totalCount {
    int total = 0;
    for (var list in _checkedItems) {
      for (var checked in list) {
        if (checked) total++;
      }
    }
    return total;
  }

  int get _maxCount {
    int total = 0;
    for (var cat in _categories) {
      total += (cat['items'] as List).length;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final currentCat = _categories[_selectedCategoryIndex];
    final items = currentCat['items'] as List<Map<String, dynamic>>;
    final isCategoryComplete = !_checkedItems[_selectedCategoryIndex].contains(false);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Studio Banner
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
                const Icon(Icons.checklist_rtl_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Studio d\'Inventaire & Listes de Courses',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Dressez des inventaires précis, cochez les articles en stock et identifiez ce qui manque.',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.inventory_rounded, color: LangHueyColors.amberGold, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Total en stock : $_totalCount / $_maxCount',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Category Selector Tabs
          Row(
            children: List.generate(_categories.length, (index) {
              final cat = _categories[index];
              final isSelected = _selectedCategoryIndex == index;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 0 : 6,
                    right: index == _categories.length - 1 ? 0 : 6,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() => _selectedCategoryIndex = index);
                      _audioService.playClick();
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? cat['color'] as Color : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? cat['color'] as Color : Colors.black12,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            cat['icon'] as IconData,
                            color: isSelected ? Colors.white : cat['color'] as Color,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              cat['title'] as String,
                              style: TextStyle(
                                color: isSelected ? Colors.white : LangHueyColors.charcoal,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 18),

          // Main Interactive Checklist & Formula Builder
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Checklist Panel
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
                          Text(
                            'Articles & Fournitures (${currentCat['title']})',
                            style: LangHueyTextStyles.h3.copyWith(fontSize: 16),
                          ),
                          Text(
                            isCategoryComplete ? '✅ Au complet' : '⚠️ Articles manquants',
                            style: TextStyle(
                              color: isCategoryComplete ? Colors.green : Colors.orange.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 20),
                      ...List.generate(items.length, (itemIndex) {
                        final item = items[itemIndex];
                        final isChecked = _checkedItems[_selectedCategoryIndex][itemIndex];

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: InkWell(
                            onTap: () => _toggleItem(_selectedCategoryIndex, itemIndex),
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              decoration: BoxDecoration(
                                color: isChecked
                                    ? LangHueyColors.softTeal.withOpacity(0.4)
                                    : Colors.red.shade50.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: isChecked ? LangHueyColors.deepTeal.withOpacity(0.3) : Colors.red.shade200,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    isChecked ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded,
                                    color: isChecked ? LangHueyColors.deepTeal : Colors.grey,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      item['name'] as String,
                                      style: TextStyle(
                                        color: LangHueyColors.charcoal,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        decoration: isChecked ? TextDecoration.none : TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.volume_up_rounded, color: LangHueyColors.deepTeal, size: 20),
                                    onPressed: () {
                                      _audioService.playPhrase(item['audio'] as String, term: 2);
                                    },
                                    tooltip: 'Écouter la prononciation',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Right Formula & Summary Panel
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
                      Text(
                        'Formules d\'Inventaire',
                        style: LangHueyTextStyles.h3.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: LangHueyColors.warmCream,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '• IL Y A + Nom',
                              style: TextStyle(color: LangHueyColors.deepTeal, fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              'Exemple : Il y a dix boîtes de craies.',
                              style: LangHueyTextStyles.bodySmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '• IL FAUT + Nom',
                              style: TextStyle(color: LangHueyColors.deepTeal, fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              'Exemple : Il faut du riz et du sel.',
                              style: LangHueyTextStyles.bodySmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '• IL MANQUE + Nom',
                              style: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              'Exemple : Il manque la gomme blanche.',
                              style: LangHueyTextStyles.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      ElevatedButton.icon(
                        onPressed: () {
                          _audioService.playPhrase(
                            isCategoryComplete ? 'tout_est_au_complet' : 'il_manque_deux_cahiers',
                            term: 2,
                          );
                        },
                        icon: const Icon(Icons.record_voice_over_rounded, size: 20),
                        label: Text(isCategoryComplete ? 'Tout est au complet !' : 'Signaler les manques'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isCategoryComplete ? LangHueyColors.deepTeal : Colors.orange.shade800,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
