import 'package:flutter/material.dart';
import '../../../services/p4_audio_service.dart';

/// Bespoke Smartboard Pattern Widget for Week 1: Clock & Time Explorer
class ClockTimeExplorerWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const ClockTimeExplorerWidget({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<ClockTimeExplorerWidget> createState() => _ClockTimeExplorerWidgetState();
}

class _ClockTimeExplorerWidgetState extends State<ClockTimeExplorerWidget> {
  final P4AudioService _audioService = P4AudioService();
  int _selectedHourIndex = 0;

  final List<Map<String, dynamic>> _hours = [
    {
      'digital': '1:00',
      'label': 'Une heure',
      'french': 'Il est une heure',
      'english': "It is one o'clock",
      'period': '1:00 PM / 1:00 AM',
      'audioKey': 'il_est_une_heure',
      'icon': Icons.looks_one_rounded,
      'color': const Color(0xFF0D7377),
    },
    {
      'digital': '2:00',
      'label': 'Deux heures',
      'french': 'Il est deux heures',
      'english': "It is two o'clock",
      'period': '2:00 PM / 2:00 AM',
      'audioKey': 'il_est_deux_heures',
      'icon': Icons.looks_two_rounded,
      'color': const Color(0xFF0284C7),
    },
    {
      'digital': '3:00',
      'label': 'Trois heures',
      'french': 'Il est trois heures',
      'english': "It is three o'clock",
      'period': '3:00 PM / 3:00 AM',
      'audioKey': 'il_est_trois_heures',
      'icon': Icons.looks_3_rounded,
      'color': const Color(0xFF10B981),
    },
    {
      'digital': '6:00',
      'label': 'Six heures',
      'french': 'Il est six heures',
      'english': "It is six o'clock",
      'period': '6:00 PM / 6:00 AM',
      'audioKey': 'il_est_six_heures',
      'icon': Icons.looks_6_rounded,
      'color': const Color(0xFFD97706),
    },
    {
      'digital': '12:00 PM',
      'label': 'Midi',
      'french': 'Il est midi',
      'english': 'It is noon / midday',
      'period': '12:00 PM (Midday)',
      'audioKey': 'il_est_midi',
      'icon': Icons.wb_sunny_rounded,
      'color': const Color(0xFFF4A832),
    },
    {
      'digital': '12:00 AM',
      'label': 'Minuit',
      'french': 'Il est minuit',
      'english': 'It is midnight',
      'period': '12:00 AM (Midnight)',
      'audioKey': 'il_est_minuit',
      'icon': Icons.nightlight_round,
      'color': const Color(0xFF6366F1),
    },
  ];

  void _playAudio(String key) {
    _audioService.playPhrase(key, term: 3);
  }

  @override
  Widget build(BuildContext context) {
    final activeHour = _hours[_selectedHourIndex];

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
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF0D7377).withValues(alpha: 0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.access_time_filled_rounded, color: Colors.white, size: 36),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "L'HORLOGE INTERACTIVE · TELLING THE TIME",
                        style: TextStyle(
                          color: Color(0xFFF4A832),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Quelle heure est-il ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Tap the hour dials below to explore time statements and pronunciation in French!",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _playAudio('quelle_heure_est_il'),
                  icon: const Icon(Icons.volume_up_rounded, size: 20),
                  label: const Text("Listen Prompt"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF4A832),
                    foregroundColor: const Color(0xFF1C1C1C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Main Clock Spotlight Stage
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: (activeHour['color'] as Color).withValues(alpha: 0.3), width: 2),
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
                // Digital LED Clock Display
                Container(
                  width: 220,
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: (activeHour['color'] as Color), width: 2.5),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(activeHour['icon'] as IconData, color: activeHour['color'] as Color, size: 48),
                      const SizedBox(height: 12),
                      Text(
                        activeHour['digital'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2.0,
                          fontFamily: 'monospace',
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        activeHour['period'] as String,
                        style: TextStyle(
                          color: (activeHour['color'] as Color).withValues(alpha: 0.9),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),

                // Spoken French Spotlight Box
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: (activeHour['color'] as Color).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "HEURE SÉLECTIONNÉE: ${activeHour['label'].toString().toUpperCase()}",
                          style: TextStyle(
                            color: activeHour['color'] as Color,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        activeHour['french'] as String,
                        style: const TextStyle(
                          color: Color(0xFF1E293B),
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        activeHour['english'] as String,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => _playAudio(activeHour['audioKey'] as String),
                            icon: const Icon(Icons.volume_up_rounded, size: 22),
                            label: const Text("Listen Time (Écouter)", style: TextStyle(fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: activeHour['color'] as Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Hour Selection Dial Bar
          const Text(
            "SELECT AN HOUR TO PRACTICE:",
            style: TextStyle(
              color: Color(0xFF64748B),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _hours.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              childAspectRatio: 1.3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final h = _hours[index];
              final isSelected = index == _selectedHourIndex;
              return InkWell(
                onTap: () {
                  setState(() => _selectedHourIndex = index);
                  _playAudio(h['audioKey'] as String);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected ? (h['color'] as Color) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? (h['color'] as Color) : const Color(0xFFE2E8F0),
                      width: 2,
                    ),
                    boxShadow: [
                      if (isSelected)
                        BoxShadow(
                          color: (h['color'] as Color).withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        h['digital'] as String,
                        style: TextStyle(
                          color: isSelected ? Colors.white : const Color(0xFF1E293B),
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        h['label'] as String,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isSelected ? Colors.white.withValues(alpha: 0.9) : const Color(0xFF64748B),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
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
            label: const Text("Continue to Classwork Drills", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
