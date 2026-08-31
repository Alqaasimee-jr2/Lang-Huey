import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2LocatingPlacesStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2LocatingPlacesStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2LocatingPlacesStudioWidget> createState() => _JSS2LocatingPlacesStudioWidgetState();
}

class _JSS2LocatingPlacesStudioWidgetState extends State<JSS2LocatingPlacesStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();

  int _selectedTargetIndex = 0;
  int _selectedRefIndex = 1;
  int _selectedDistanceIndex = 0; // 0: près de, 1: loin de, 2: en face de

  final List<Map<String, dynamic>> _buildings = [
    {'name': 'La poste', 'gender': 'f', 'icon': Icons.local_post_office_rounded},
    {'name': 'La banque', 'gender': 'f', 'icon': Icons.account_balance_rounded},
    {'name': 'L\'hôpital', 'gender': 'm_vowel', 'icon': Icons.local_hospital_rounded},
    {'name': 'L\'école', 'gender': 'f_vowel', 'icon': Icons.school_rounded},
    {'name': 'Le marché', 'gender': 'm', 'icon': Icons.storefront_rounded},
    {'name': 'La pharmacie', 'gender': 'f', 'icon': Icons.medical_services_rounded},
    {'name': 'Le commissariat', 'gender': 'm', 'icon': Icons.local_police_rounded},
    {'name': 'La gare', 'gender': 'f', 'icon': Icons.directions_bus_rounded},
  ];

  final List<Map<String, dynamic>> _distances = [
    {'phrase': 'près de', 'meaning': 'near / close to', 'audio': 'pres_du_marche'},
    {'phrase': 'loin de', 'meaning': 'far from', 'audio': 'loin_du_centre_ville'},
    {'phrase': 'en face de', 'meaning': 'opposite / facing', 'audio': 'en_face_de_la_poste'},
  ];

  String _buildLocationSentence() {
    final target = _buildings[_selectedTargetIndex];
    final ref = _buildings[_selectedRefIndex];
    final dist = _distances[_selectedDistanceIndex]['phrase'] as String;

    String refContracted = '';
    final g = ref['gender'] as String;
    if (g == 'm') {
      refContracted = 'du ${ref['name'].toString().toLowerCase().replaceFirst('le ', '')}';
    } else if (g == 'f') {
      refContracted = 'de ${ref['name'].toString().toLowerCase()}';
    } else if (g == 'm_vowel' || g == 'f_vowel') {
      refContracted = 'd\'${ref['name'].toString().toLowerCase()}';
    }

    return '${target['name']} est située $dist $refContracted.';
  }

  @override
  Widget build(BuildContext context) {
    final dist = _distances[_selectedDistanceIndex];

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
                const Icon(Icons.location_city_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Carte Interactive de la Ville : Situer les Lieux',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Situez les bâtiments publics (la poste, l\'hôpital, le marché) en appliquant les contractions DU, DE LA, DE L\'.',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Main Layout
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Panel: Buildings Selector
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
                      Text('1. Bâtiment Principal (Sujet) :', style: LangHueyTextStyles.bodySmall),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: List.generate(_buildings.length, (idx) {
                          final b = _buildings[idx];
                          final isSel = _selectedTargetIndex == idx;
                          return ChoiceChip(
                            label: Text(b['name'] as String),
                            selected: isSel,
                            selectedColor: LangHueyColors.deepTeal,
                            labelStyle: TextStyle(color: isSel ? Colors.white : Colors.black87),
                            onSelected: (val) {
                              setState(() => _selectedTargetIndex = idx);
                              _audioService.playClick();
                            },
                          );
                        }),
                      ),
                      const SizedBox(height: 16),
                      Text('2. Position relative & Distance :', style: LangHueyTextStyles.bodySmall),
                      const SizedBox(height: 8),
                      Row(
                        children: List.generate(_distances.length, (idx) {
                          final d = _distances[idx];
                          final isSel = _selectedDistanceIndex == idx;
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: idx == 0 ? 0 : 4, right: idx == 2 ? 0 : 4),
                              child: ChoiceChip(
                                label: Text(d['phrase'] as String, style: const TextStyle(fontSize: 12)),
                                selected: isSel,
                                selectedColor: LangHueyColors.amberGold,
                                labelStyle: TextStyle(color: isSel ? Colors.white : Colors.black87, fontWeight: FontWeight.bold),
                                onSelected: (val) {
                                  setState(() => _selectedDistanceIndex = idx);
                                  _audioService.playClick();
                                },
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 16),
                      Text('3. Bâtiment de Référence :', style: LangHueyTextStyles.bodySmall),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: List.generate(_buildings.length, (idx) {
                          final b = _buildings[idx];
                          final isSel = _selectedRefIndex == idx;
                          return ChoiceChip(
                            label: Text(b['name'] as String),
                            selected: isSel,
                            selectedColor: LangHueyColors.deepTeal,
                            labelStyle: TextStyle(color: isSel ? Colors.white : Colors.black87),
                            onSelected: (val) {
                              setState(() => _selectedRefIndex = idx);
                              _audioService.playClick();
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Right Panel: Sentence & Audio
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
                      Text('Phrase de Localisation', style: LangHueyTextStyles.h3.copyWith(fontSize: 16)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: LangHueyColors.softTeal,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.3)),
                        ),
                        child: Text(
                          '« ${_buildLocationSentence()} »',
                          style: LangHueyTextStyles.frenchHighlight.copyWith(fontSize: 15),
                        ),
                      ),
                      const SizedBox(height: 14),
                      ElevatedButton.icon(
                        onPressed: () {
                          _audioService.playPhrase(dist['audio'] as String, term: 1);
                        },
                        icon: const Icon(Icons.volume_up_rounded, size: 20),
                        label: const Text('Écouter la Localisation'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LangHueyColors.deepTeal,
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
