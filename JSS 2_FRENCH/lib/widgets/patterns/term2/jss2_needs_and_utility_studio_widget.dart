import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2NeedsAndUtilityStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2NeedsAndUtilityStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2NeedsAndUtilityStudioWidget> createState() => _JSS2NeedsAndUtilityStudioWidgetState();
}

class _JSS2NeedsAndUtilityStudioWidgetState extends State<JSS2NeedsAndUtilityStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();
  int _selectedToolIndex = 0;

  final List<Map<String, dynamic>> _tools = [
    {
      'tool': 'Les ciseaux',
      'utility': 'servent à couper le papier et le tissu',
      'needPhrase': 'J\'ai besoin de ciseaux pour mon atelier d\'art.',
      'icon': Icons.content_cut_rounded,
      'audio': 'les_ciseaux_pour_couper_le_papier',
    },
    {
      'tool': 'La règle graduée',
      'utility': 'sert à mesurer et tracer des lignes droites',
      'needPhrase': 'Il me faut une règle pour le cours de géométrie.',
      'icon': Icons.straighten_rounded,
      'audio': 'la_regle_pour_mesurer_les_lignes',
    },
    {
      'tool': 'Le dictionnaire bilingue',
      'utility': 'sert à chercher le sens et la traduction des mots',
      'needPhrase': 'J\'ai besoin d\'un dictionnaire pour lire le texte.',
      'icon': Icons.menu_book_rounded,
      'audio': 'jai_besoin_dun_dictionnaire',
    },
    {
      'tool': 'Le balai',
      'utility': 'sert à nettoyer et balayer le sol de la classe',
      'needPhrase': 'Il nous faut un balai pour le ménage quotidien.',
      'icon': Icons.cleaning_services_rounded,
      'audio': 'le_balai_pour_nettoyer_la_classe',
    },
    {
      'tool': 'La calculatrice',
      'utility': 'sert à faire des calculs mathématiques rapides',
      'needPhrase': 'J\'ai besoin d\'une calculatrice pour l\'examen.',
      'icon': Icons.calculate_rounded,
      'audio': 'la_calculatrice_pour_compter',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentTool = _tools[_selectedToolIndex];

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
                colors: [Color(0xFF0D7377), Color(0xFF0F766E)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.handyman_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Atelier des Besoins & Utilité : « À quoi ça sert ? »',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Associez les objets du quotidien à leurs fonctions clés : "Ça sert à + infinitif" et "J\'ai besoin de...".',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Main Interactive Tool Selector & Workbench
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Panel: Tools List
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
                      Text('Sélectionnez un outil / objet :', style: LangHueyTextStyles.h3.copyWith(fontSize: 16)),
                      const SizedBox(height: 12),
                      ...List.generate(_tools.length, (index) {
                        final t = _tools[index];
                        final isSelected = _selectedToolIndex == index;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() => _selectedToolIndex = index);
                              _audioService.playPhrase(t['audio'] as String, term: 2);
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                              decoration: BoxDecoration(
                                color: isSelected ? LangHueyColors.softTeal : LangHueyColors.warmCream,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected ? LangHueyColors.deepTeal : Colors.black12,
                                  width: isSelected ? 2 : 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    t['icon'] as IconData,
                                    color: isSelected ? LangHueyColors.deepTeal : LangHueyColors.charcoal,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          t['tool'] as String,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: isSelected ? LangHueyColors.deepTeal : LangHueyColors.charcoal,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          t['utility'] as String,
                                          style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.volume_up_rounded,
                                    color: isSelected ? LangHueyColors.deepTeal : Colors.grey,
                                    size: 20,
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

              // Right Panel: Functional Sentence Generator
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
                      Text('Générateur d\'Utilité en Direct', style: LangHueyTextStyles.h3.copyWith(fontSize: 16)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: LangHueyColors.softTeal,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.3)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '« ${currentTool['tool']} ${currentTool['utility']}. »',
                              style: LangHueyTextStyles.frenchHighlight.copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Besoin : « ${currentTool['needPhrase']} »',
                              style: TextStyle(color: LangHueyColors.deepTeal, fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      ElevatedButton.icon(
                        onPressed: () {
                          _audioService.playPhrase(currentTool['audio'] as String, term: 2);
                        },
                        icon: const Icon(Icons.volume_up_rounded, size: 20),
                        label: const Text('Écouter la Formule'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LangHueyColors.deepTeal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: LangHueyColors.warmCream,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Règle : "Servir à + Infinitif" exprime la fonction intrinsèque d\'un outil.',
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
