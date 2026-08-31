import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1WeatherAndSeasonsStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1WeatherAndSeasonsStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1WeatherAndSeasonsStudioWidget> createState() => _JSS1WeatherAndSeasonsStudioWidgetState();
}

class _JSS1WeatherAndSeasonsStudioWidgetState extends State<JSS1WeatherAndSeasonsStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedWeatherIndex = 0;
  int _selectedSeasonRegion = 0; // 0: Nigeria (2 saisons), 1: France (4 saisons)
  double _temperatureCelsius = 30.0;

  final List<Map<String, dynamic>> _weatherPresets = [
    {
      'title': 'Beau & Chaud (Sunny)',
      'phrase': 'Aujourd\'hui, il fait beau et il fait chaud.',
      'formula': 'Il fait + beau / chaud',
      'icon': Icons.wb_sunny_rounded,
      'color': JSS1Colors.gold,
      'audio': 'il_fait_beau_il_fait_chaud',
      'cityExample': 'À Abuja et Kano, le soleil brille.',
    },
    {
      'title': 'Pluvieux (Rainy)',
      'phrase': 'Il pleut abondamment et le ciel est gris.',
      'formula': 'Il pleut / Il y a de la pluie',
      'icon': Icons.umbrella_rounded,
      'color': JSS1Colors.teal,
      'audio': 'il_pleut_il_y_a_de_la_pluie',
      'cityExample': 'À Lagos et Port Harcourt, prenez un parapluie !',
    },
    {
      'title': 'Froid & Harmattan (Cool)',
      'phrase': 'Pendant l\'harmattan, il fait frais le matin.',
      'formula': 'Il fait frais / froid',
      'icon': Icons.ac_unit_rounded,
      'color': const Color(0xFF5C6BC0),
      'audio': 'il_fait_froid_il_fait_frais',
      'cityExample': 'À Jos et Kaduna, portez un pull chaud.',
    },
    {
      'title': 'Venteux (Windy)',
      'phrase': 'Il y a beaucoup de vent cet après-midi.',
      'formula': 'Il y a du + vent',
      'icon': Icons.air_rounded,
      'color': const Color(0xFF26A69A),
      'audio': 'il_y_a_du_vent_il_y_a_du_soleil',
      'cityExample': 'Le vent souffle fort sur les côtes.',
    },
  ];

  final List<Map<String, dynamic>> _nigerianSeasons = [
    {
      'name': 'La Saison des Pluies',
      'period': 'Avril – Octobre',
      'desc': 'Climat humide, pluies abondantes et végétation verdoyante.',
      'icon': Icons.water_drop_rounded,
      'audio': 'la_saison_des_pluies',
    },
    {
      'name': 'La Saison Sèche & Harmattan',
      'period': 'Novembre – Mars',
      'desc': 'Temps sec, soleil ardent et brume de poussière du Sahara.',
      'icon': Icons.wb_twilight_rounded,
      'audio': 'la_saison_seche_l_harmattan',
    },
  ];

  final List<Map<String, dynamic>> _frenchSeasons = [
    {'name': 'Le Printemps', 'period': 'Mars – Juin', 'desc': 'Les fleurs éclosent, temps doux.', 'icon': Icons.local_florist_rounded},
    {'name': 'L\'Été', 'period': 'Juin – Septembre', 'desc': 'Grandes vacances, journées longues et chaudes.', 'icon': Icons.beach_access_rounded},
    {'name': 'L\'Automne', 'period': 'Septembre – Décembre', 'desc': 'Les feuilles tombent, temps pluvieux.', 'icon': Icons.eco_rounded},
    {'name': 'L\'Hiver', 'period': 'Décembre – Mars', 'desc': 'Il fait très froid, il neige.', 'icon': Icons.snowboarding_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    final activeWeather = _weatherPresets[_selectedWeatherIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Weather Barometer & Seasons Explorer
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.charcoal.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('Baromètre Météo Interactif', style: JSS1Text.subheading(JSS1Colors.teal), overflow: TextOverflow.ellipsis),
                      ),
                      IconButton(
                        icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal),
                        onPressed: () => _audioService.playPhrase('quel_temps_fait_il', term: 3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Weather Presets Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _weatherPresets.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2.2,
                    ),
                    itemBuilder: (context, idx) {
                      final w = _weatherPresets[idx];
                      final isSelected = _selectedWeatherIndex == idx;
                      return InkWell(
                        onTap: () {
                          setState(() => _selectedWeatherIndex = idx);
                          _audioService.playPhrase(w['audio'] as String, term: 3);
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(w['icon'] as IconData, color: isSelected ? JSS1Colors.gold : JSS1Colors.teal, size: 24),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  w['title'] as String,
                                  style: TextStyle(
                                    color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 10),

                  // Temperature Thermometer Slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Thermomètre (°C) :', style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: _temperatureCelsius > 28 ? JSS1Colors.gold : JSS1Colors.teal,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${_temperatureCelsius.round()}°C',
                          style: const TextStyle(color: JSS1Colors.charcoal, fontWeight: FontWeight.w900, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: _temperatureCelsius,
                    min: 10,
                    max: 42,
                    divisions: 32,
                    activeColor: JSS1Colors.teal,
                    inactiveColor: JSS1Colors.cream,
                    onChanged: (val) => setState(() => _temperatureCelsius = val),
                  ),

                  const SizedBox(height: 12),

                  // Seasons Tab Selector (Nigeria vs France)
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => setState(() => _selectedSeasonRegion = 0),
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: _selectedSeasonRegion == 0 ? JSS1Colors.teal : JSS1Colors.cream,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '🇳🇬 Saisons au Nigeria (2)',
                              style: TextStyle(
                                color: _selectedSeasonRegion == 0 ? JSS1Colors.white : JSS1Colors.charcoal,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: InkWell(
                          onTap: () => setState(() => _selectedSeasonRegion = 1),
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: _selectedSeasonRegion == 1 ? JSS1Colors.teal : JSS1Colors.cream,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '🇫🇷 Saisons en France (4)',
                              style: TextStyle(
                                color: _selectedSeasonRegion == 1 ? JSS1Colors.white : JSS1Colors.charcoal,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Display selected region seasons
                  if (_selectedSeasonRegion == 0)
                    ...List.generate(_nigerianSeasons.length, (sIdx) {
                      final s = _nigerianSeasons[sIdx];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: JSS1Colors.cream,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(s['icon'] as IconData, color: JSS1Colors.teal, size: 20),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(s['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                    Text('${s['period']} — ${s['desc']}', style: JSS1Text.caption(JSS1Colors.grey).copyWith(fontSize: 10)),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.volume_up_rounded, size: 18, color: JSS1Colors.teal),
                                onPressed: () => _audioService.playPhrase(s['audio'] as String, term: 3),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                  else
                    ...List.generate(_frenchSeasons.length, (sIdx) {
                      final s = _frenchSeasons[sIdx];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: JSS1Colors.cream,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(s['icon'] as IconData, color: JSS1Colors.teal, size: 20),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(s['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                    Text('${s['period']} — ${s['desc']}', style: JSS1Text.caption(JSS1Colors.grey).copyWith(fontSize: 10)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        // Right Column: Live Spoken Weather Forecast Studio
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: JSS1Colors.teal,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.teal.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('STUDIO BULLETIN MÉTÉO', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1.2), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.white, size: 28),
                      onPressed: () => _audioService.playPhrase(activeWeather['audio'] as String, term: 3),
                    ),
                  ],
                ),

                // Center Animated Icon
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: JSS1Colors.white.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(activeWeather['icon'] as IconData, size: 72, color: JSS1Colors.gold),
                  ),
                ),

                // Spoken Forecast Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: JSS1Colors.teal,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                activeWeather['formula'] as String,
                                style: const TextStyle(color: JSS1Colors.gold, fontWeight: FontWeight.bold, fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('${_temperatureCelsius.round()}°C mesurés', style: JSS1Text.caption(JSS1Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        activeWeather['phrase'] as String,
                        style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        activeWeather['cityExample'] as String,
                        style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                // Trigger Button
                InkWell(
                  onTap: () => _audioService.playPhrase('quel_temps_fait_il', term: 3),
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: JSS1Colors.gold,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.record_voice_over_rounded, color: JSS1Colors.charcoal, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Poser la question : "Quel temps fait-il ?"',
                          style: TextStyle(color: JSS1Colors.charcoal, fontWeight: FontWeight.w900, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
