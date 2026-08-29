import 'package:flutter/material.dart';
import '../../../services/p4_audio_service.dart';

/// Bespoke Smartboard Pattern Widget for Week 10: Weather & Seasons Studio
class WeatherStudioWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const WeatherStudioWidget({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<WeatherStudioWidget> createState() => _WeatherStudioWidgetState();
}

class _WeatherStudioWidgetState extends State<WeatherStudioWidget> {
  final P4AudioService _audioService = P4AudioService();
  int _activeConditionIndex = 0;

  final List<Map<String, dynamic>> _weatherConditions = [
    {
      'french': 'Il fait beau',
      'english': 'The weather is fine / beautiful',
      'season': 'Ensoleillé (Sunny)',
      'audioKey': 'il_fait_beau',
      'icon': Icons.wb_sunny_rounded,
      'color': const Color(0xFFF4A832),
    },
    {
      'french': 'Il fait chaud',
      'english': 'It is hot',
      'season': 'La saison sèche (Dry season)',
      'audioKey': 'il_fait_chaud',
      'icon': Icons.whatshot_rounded,
      'color': const Color(0xFFD97706),
    },
    {
      'french': 'Il fait froid',
      'english': 'It is cold',
      'season': 'L\'harmattan / L\'hiver',
      'audioKey': 'il_fait_froid',
      'icon': Icons.ac_unit_rounded,
      'color': const Color(0xFF0284C7),
    },
    {
      'french': 'Il pleut',
      'english': 'It is raining',
      'season': 'La saison des pluies (Rainy season)',
      'audioKey': 'il_pleut',
      'icon': Icons.beach_access_rounded,
      'color': const Color(0xFF0D7377),
    },
    {
      'french': 'Il fait du vent',
      'english': 'It is windy',
      'season': 'L\'harmattan',
      'audioKey': 'il_fait_du_vent',
      'icon': Icons.air_rounded,
      'color': const Color(0xFF6366F1),
    },
  ];

  void _playAudio(String key) {
    _audioService.playPhrase(key, term: 3);
  }

  @override
  Widget build(BuildContext context) {
    final activeCond = _weatherConditions[_activeConditionIndex];

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
                  child: const Icon(Icons.cloud_rounded, color: Colors.white, size: 36),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "LE TEMPS ET LES SAISONS · WEATHER & CLIMATE STUDIO",
                        style: TextStyle(
                          color: Color(0xFFF4A832),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Quel temps fait-il ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Explore weather conditions and compare Nigerian harmattan & rainy seasons with French climate!",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _playAudio('quel_temps_fait_il'),
                  icon: const Icon(Icons.volume_up_rounded, size: 20),
                  label: const Text("Listen Question"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF4A832),
                    foregroundColor: const Color(0xFF1C1C1C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Active Weather Spotlight Stage
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: (activeCond['color'] as Color).withValues(alpha: 0.3), width: 2),
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
                    color: (activeCond['color'] as Color).withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(activeCond['icon'] as IconData, color: activeCond['color'] as Color, size: 48),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: activeCond['color'] as Color,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          activeCond['season'] as String,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        activeCond['french'] as String,
                        style: const TextStyle(
                          color: Color(0xFF1E293B),
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        activeCond['english'] as String,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () => _playAudio(activeCond['audioKey'] as String),
                        icon: const Icon(Icons.volume_up_rounded, size: 20),
                        label: const Text("Listen Weather Phrase"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: activeCond['color'] as Color,
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

          // Weather Condition Dial
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _weatherConditions.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final cond = _weatherConditions[index];
              final isSelected = index == _activeConditionIndex;
              return InkWell(
                onTap: () {
                  setState(() => _activeConditionIndex = index);
                  _playAudio(cond['audioKey'] as String);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected ? (cond['color'] as Color) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? (cond['color'] as Color) : const Color(0xFFE2E8F0),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        cond['icon'] as IconData,
                        color: isSelected ? Colors.white : (cond['color'] as Color),
                        size: 26,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        cond['french'] as String,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isSelected ? Colors.white : const Color(0xFF1E293B),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
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
            label: const Text("Complete Weather Studio & Proceed", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
