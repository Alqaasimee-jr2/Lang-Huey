import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2TransportModesStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2TransportModesStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2TransportModesStudioWidget> createState() => _JSS2TransportModesStudioWidgetState();
}

class _JSS2TransportModesStudioWidgetState extends State<JSS2TransportModesStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();

  int _selectedVehicleIndex = 0;

  final List<Map<String, dynamic>> _vehicles = [
    {
      'name': 'La voiture',
      'prep': 'en voiture',
      'icon': Icons.directions_car_rounded,
      'audio': 'en_voiture',
      'rule': 'Véhicule fermé avec habitacle (EN)',
    },
    {
      'name': 'L\'autobus / Danfo',
      'prep': 'en bus',
      'icon': Icons.directions_bus_rounded,
      'audio': 'en_bus',
      'rule': 'Transport en commun fermé (EN)',
    },
    {
      'name': 'Le train / Métro',
      'prep': 'en train',
      'icon': Icons.train_rounded,
      'audio': 'en_train',
      'rule': 'Transport ferré fermé (EN)',
    },
    {
      'name': 'L\'avion',
      'prep': 'en avion',
      'icon': Icons.airplanemode_active_rounded,
      'audio': 'en_avion',
      'rule': 'Aéronef fermé (EN)',
    },
    {
      'name': 'La moto / Okada',
      'prep': 'à moto',
      'icon': Icons.two_wheeler_rounded,
      'audio': 'a_moto',
      'rule': 'Deux-roues sans habitacle (À)',
    },
    {
      'name': 'Le vélo / Bicyclette',
      'prep': 'à vélo',
      'icon': Icons.pedal_bike_rounded,
      'audio': 'a_velo',
      'rule': 'Deux-roues à pédales (À)',
    },
    {
      'name': 'À pied (Marche)',
      'prep': 'à pied',
      'icon': Icons.directions_walk_rounded,
      'audio': 'a_pied',
      'rule': 'Locomotion humaine sans véhicule (À)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final v = _vehicles[_selectedVehicleIndex];

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
                const Icon(Icons.directions_transit_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Studio des Moyens de Transport : Prépositions EN vs À',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Distinguez les véhicules fermés (EN voiture/bus/train) et les modes à l\'air libre (À moto/vélo/pied).',
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
              // Left Panel: Transport Grid
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
                      Text('Sélectionnez un mode de transport :', style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                      const SizedBox(height: 12),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: _vehicles.length,
                        itemBuilder: (context, idx) {
                          final item = _vehicles[idx];
                          final isSel = _selectedVehicleIndex == idx;

                          return InkWell(
                            onTap: () {
                              setState(() => _selectedVehicleIndex = idx);
                              _audioService.playPhrase(item['audio'] as String, term: 1);
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isSel ? LangHueyColors.deepTeal : Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSel ? LangHueyColors.deepTeal : Colors.black12,
                                  width: isSel ? 2 : 1,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    item['icon'] as IconData,
                                    color: isSel ? Colors.white : LangHueyColors.deepTeal,
                                    size: 26,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item['prep'] as String,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: isSel ? Colors.white : LangHueyColors.charcoal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Right Panel: Explanation & Sentence
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
                      Text('Expression du Déplacement', style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: LangHueyColors.softTeal,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '« Je vais à l\'école ${v['prep']}. »',
                          style: LangHueyTextStyles.frenchHighlight.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 14),
                      ElevatedButton.icon(
                        onPressed: () {
                          _audioService.playPhrase(v['audio'] as String, term: 1);
                        },
                        icon: const Icon(Icons.volume_up_rounded, size: 20),
                        label: const Text('Écouter l\'Expression'),
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
                          'Règle grammaticale : ${v['rule']}.',
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
