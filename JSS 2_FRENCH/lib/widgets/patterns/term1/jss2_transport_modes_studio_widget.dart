import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2TransportModesStudioWidget extends StatefulWidget {
  final JSS2Lesson lesson;

  const JSS2TransportModesStudioWidget({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  @override
  State<JSS2TransportModesStudioWidget> createState() =>
      _JSS2TransportModesStudioWidgetState();
}

class _JSS2TransportModesStudioWidgetState
    extends State<JSS2TransportModesStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();

  int _selectedCategoryIndex = 0;
  int _selectedTransportIndex = 0;

  // Preposition EN vs À interactive game state
  int _gameScore = 0;
  int _gameIndex = 0;
  String? _gameFeedback;

  final List<Map<String, dynamic>> _categories = [
    {
      'name': 'Terrestre (Land)',
      'icon': Icons.directions_bus_rounded,
      'items': [
        {'name': 'Le bus', 'prep': 'EN', 'icon': Icons.directions_bus_rounded, 'audio': 'le_bus_et_le_taxi', 'sentence': 'Je voyage en bus.'},
        {'name': 'La voiture', 'prep': 'EN', 'icon': Icons.directions_car_rounded, 'audio': 'la_voiture_et_le_camion', 'sentence': 'Je voyage en voiture.'},
        {'name': 'Le train', 'prep': 'EN', 'icon': Icons.train_rounded, 'audio': 'le_train_express', 'sentence': 'Je voyage en train.'},
        {'name': 'Le taxi', 'prep': 'EN', 'icon': Icons.local_taxi_rounded, 'audio': 'le_bus_et_le_taxi', 'sentence': 'Je voyage en taxi.'},
        {'name': 'Le camion', 'prep': 'EN', 'icon': Icons.local_shipping_rounded, 'audio': 'la_voiture_et_le_camion', 'sentence': 'Le transport de marchandises se fait en camion.'},
      ],
    },
    {
      'name': 'Aérien (Air)',
      'icon': Icons.flight_rounded,
      'items': [
        {'name': 'L\'avion', 'prep': 'EN', 'icon': Icons.flight_rounded, 'audio': 'lavion_et_lhelicoptere', 'sentence': 'Je voyage à l\'étranger en avion.'},
        {'name': 'L\'hélicoptère', 'prep': 'EN', 'icon': Icons.airplanemode_active_rounded, 'audio': 'lavion_et_lhelicoptere', 'sentence': 'Le président voyage en hélicoptère.'},
      ],
    },
    {
      'name': 'Maritime / Fluvial (Water)',
      'icon': Icons.directions_boat_rounded,
      'items': [
        {'name': 'Le bateau', 'prep': 'EN', 'icon': Icons.directions_boat_rounded, 'audio': 'le_bateau_et_la_pirogue', 'sentence': 'On traverse la lagune en bateau.'},
        {'name': 'La pirogue', 'prep': 'EN', 'icon': Icons.sailing_rounded, 'audio': 'le_bateau_et_la_pirogue', 'sentence': 'Les pêcheurs naviguent en pirogue.'},
      ],
    },
    {
      'name': 'Deux-Roues & Actif (Open/Active)',
      'icon': Icons.pedal_bike_rounded,
      'items': [
        {'name': 'À pied (Walking)', 'prep': 'À', 'icon': Icons.directions_walk_rounded, 'audio': 'je_vais_a_pied', 'sentence': 'Je vais à l\'école à pied.'},
        {'name': 'Le vélo', 'prep': 'À', 'icon': Icons.pedal_bike_rounded, 'audio': 'je_me_deplace_a_velo', 'sentence': 'Je me déplace à vélo.'},
        {'name': 'La moto (Okada)', 'prep': 'À', 'icon': Icons.two_wheeler_rounded, 'audio': 'le_velo_et_la_moto', 'sentence': 'Il va au marché à moto.'},
      ],
    },
  ];

  final List<Map<String, dynamic>> _gameChallenges = [
    {'transport': 'L\'avion', 'correctPrep': 'EN', 'reason': 'Véhicule fermé dans lequel on entre.'},
    {'transport': 'Le vélo', 'correctPrep': 'À', 'reason': 'Véhicule ouvert sur lequel on monte.'},
    {'transport': 'Le train', 'correctPrep': 'EN', 'reason': 'Véhicule fermé dans lequel on entre.'},
    {'transport': 'Pied (Marcher)', 'correctPrep': 'À', 'reason': 'Déplacement physique à pied.'},
    {'transport': 'La moto', 'correctPrep': 'À', 'reason': 'Véhicule deux-roues ouvert.'},
    {'transport': 'La voiture', 'correctPrep': 'EN', 'reason': 'Véhicule fermé dans lequel on entre.'},
  ];

  void _submitGameAnswer(String chosenPrep) {
    final challenge = _gameChallenges[_gameIndex];
    if (chosenPrep == challenge['correctPrep']) {
      _audioService.playSfx(JSS2SfxType.correct);
      setState(() {
        _gameScore += 10;
        _gameFeedback = '✅ Exact ! On dit "${challenge['correctPrep']} ${challenge['transport']}". ${challenge['reason']}';
        _gameIndex = (_gameIndex + 1) % _gameChallenges.length;
      });
    } else {
      _audioService.playSfx(JSS2SfxType.incorrect);
      setState(() {
        _gameFeedback = '❌ Attention ! On dit "${challenge['correctPrep']} ${challenge['transport']}". ${challenge['reason']}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentCat = _categories[_selectedCategoryIndex];
    final items = currentCat['items'] as List<Map<String, dynamic>>;
    final challenge = _gameChallenges[_gameIndex];

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
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.commute_rounded, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Garage des Transports : Règle d\'Or EN vs À',
                        style: LangHueyTextStyles.h3.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Explorez les 4 catégories de transports et maîtrisez l\'usage des prépositions "EN" et "À".',
                        style: LangHueyTextStyles.bodyMedium.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // EN vs À Visual Rule Bar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0F1E24),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LangHueyColors.turquoise.withOpacity(0.4)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: LangHueyColors.deepTeal.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: LangHueyColors.turquoise),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('📦 PRÉPOSITION "EN"', style: LangHueyTextStyles.badge.copyWith(color: LangHueyColors.turquoise, fontSize: 13)),
                        const SizedBox(height: 4),
                        const Text(
                          'Véhicules FERMÉS dans lesquels on entre :\n• En bus, en voiture, en train, en avion, en bateau.',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: LangHueyColors.amberGold),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('🚲 PRÉPOSITION "À"', style: LangHueyTextStyles.badge.copyWith(color: LangHueyColors.amberGold, fontSize: 13)),
                        const SizedBox(height: 4),
                        const Text(
                          'Moyens OUVERTS ou déplacement PHYSIQUE :\n• À pied, à vélo, à bicyclette, à moto, à cheval.',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Interactive EN vs À Quiz Arena
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: LangHueyColors.warmCream),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Défi Express : "EN" ou "À" ?', style: LangHueyTextStyles.h3),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: LangHueyColors.softTeal,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('Score : $_gameScore pts', style: const TextStyle(fontWeight: FontWeight.bold, color: LangHueyColors.deepTeal)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: LangHueyColors.softAmber,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    'Complétez : « Je voyage ___ ${challenge['transport']} »',
                    style: LangHueyTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold, color: LangHueyColors.charcoal),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _submitGameAnswer('EN'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LangHueyColors.deepTeal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('EN (Fermé)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _submitGameAnswer('À'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LangHueyColors.amberGold,
                          foregroundColor: LangHueyColors.charcoal,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('À (Ouvert / À pied)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                if (_gameFeedback != null) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: _gameFeedback!.startsWith('✅') ? Colors.green.shade50 : Colors.red.shade50,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: _gameFeedback!.startsWith('✅') ? Colors.green : Colors.red),
                    ),
                    child: Text(
                      _gameFeedback!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _gameFeedback!.startsWith('✅') ? Colors.green.shade800 : Colors.red.shade800,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Categories Selector
          Text('Catégories des Moyens de Transport :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_categories.length, (index) {
                final cat = _categories[index];
                final isSelected = _selectedCategoryIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ChoiceChip(
                    avatar: Icon(cat['icon'] as IconData, size: 18, color: isSelected ? Colors.white : LangHueyColors.deepTeal),
                    label: Text(cat['name'] as String),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _selectedCategoryIndex = index;
                          _selectedTransportIndex = 0;
                        });
                      }
                    },
                    selectedColor: LangHueyColors.deepTeal,
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : LangHueyColors.charcoal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 16),

          // Transport Item Cards Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2.2,
            ),
            itemBuilder: (context, index) {
              final itm = items[index];
              final isSelected = _selectedTransportIndex == index;
              return GestureDetector(
                onTap: () {
                  _audioService.playSfx(JSS2SfxType.click);
                  _audioService.playPhrase(itm['audio'] as String, term: 1);
                  setState(() => _selectedTransportIndex = index);
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected ? LangHueyColors.deepTeal : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isSelected ? LangHueyColors.amberGold : Colors.black12,
                      width: isSelected ? 2 : 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(itm['icon'] as IconData, size: 30, color: isSelected ? Colors.white : LangHueyColors.deepTeal),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              itm['name'] as String,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : LangHueyColors.charcoal,
                                fontSize: 13,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 2),
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.white24 : LangHueyColors.softAmber,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '${itm['prep']} ${itm['name'].toString().toLowerCase()}',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : Colors.brown,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.volume_up_rounded, size: 20, color: isSelected ? Colors.white : LangHueyColors.deepTeal),
                        onPressed: () {
                          _audioService.playPhrase(itm['audio'] as String, term: 1);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
