import 'package:flutter/material.dart';
import '../../../services/p4_audio_service.dart';

/// Bespoke Smartboard Pattern Widget for Week 2: Daily Routine Sequencer
class DailyRoutineSequencerWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const DailyRoutineSequencerWidget({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<DailyRoutineSequencerWidget> createState() => _DailyRoutineSequencerWidgetState();
}

class _DailyRoutineSequencerWidgetState extends State<DailyRoutineSequencerWidget> {
  final P4AudioService _audioService = P4AudioService();
  int _activeStepIndex = 0;

  final List<Map<String, dynamic>> _routineSteps = [
    {
      'time': '6:00 AM',
      'hourFrench': 'À six heures',
      'french': 'Je me réveille et je me lave',
      'english': 'I wake up and wash myself',
      'audioKey': 'je_me_reveille',
      'icon': Icons.alarm_rounded,
      'color': const Color(0xFF0D7377),
    },
    {
      'time': '7:00 AM',
      'hourFrench': 'À sept heures',
      'french': 'Je prends le petit déjeuner',
      'english': 'I eat breakfast',
      'audioKey': 'je_prends_le_petit_dejeuner',
      'icon': Icons.free_breakfast_rounded,
      'color': const Color(0xFF0284C7),
    },
    {
      'time': '8:00 AM',
      'hourFrench': 'À huit heures',
      'french': 'Je vais à l\'école',
      'english': 'I go to school',
      'audioKey': 'je_vais_a_lecole',
      'icon': Icons.school_rounded,
      'color': const Color(0xFF10B981),
    },
    {
      'time': '10:00 AM',
      'hourFrench': 'À dix heures',
      'french': 'J\'étudie en classe',
      'english': 'I study in class',
      'audioKey': 'jetudie_en_classe',
      'icon': Icons.menu_book_rounded,
      'color': const Color(0xFFD97706),
    },
    {
      'time': '2:00 PM',
      'hourFrench': 'À deux heures de l\'après-midi',
      'french': 'Je joue avec mes amis',
      'english': 'I play with my friends',
      'audioKey': 'je_joue_avec_mes_amis',
      'icon': Icons.sports_soccer_rounded,
      'color': const Color(0xFFF4A832),
    },
    {
      'time': '8:00 PM',
      'hourFrench': 'À huit heures du soir',
      'french': 'Je dîne et je me couche',
      'english': 'I eat dinner and go to bed',
      'audioKey': 'je_me_couche',
      'icon': Icons.bedtime_rounded,
      'color': const Color(0xFF6366F1),
    },
  ];

  void _playAudio(String key) {
    _audioService.playPhrase(key, term: 3);
  }

  @override
  Widget build(BuildContext context) {
    final activeStep = _routineSteps[_activeStepIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
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
                  child: const Icon(Icons.schedule_rounded, color: Colors.white, size: 36),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "MA ROUTINE QUOTIDIENNE · DAILY HABITS & SCHEDULE",
                        style: TextStyle(
                          color: Color(0xFFF4A832),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "De 6h00 du matin jusqu'au coucher",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Follow each stage of the daily routine and practice speaking with time stamps!",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Active Step Spotlight Box
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: (activeStep['color'] as Color).withValues(alpha: 0.3), width: 2),
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
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: (activeStep['color'] as Color).withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(activeStep['icon'] as IconData, color: activeStep['color'] as Color, size: 48),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: activeStep['color'] as Color,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              activeStep['time'] as String,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            activeStep['hourFrench'] as String,
                            style: TextStyle(
                              color: activeStep['color'] as Color,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        activeStep['french'] as String,
                        style: const TextStyle(
                          color: Color(0xFF1E293B),
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        activeStep['english'] as String,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () => _playAudio(activeStep['audioKey'] as String),
                        icon: const Icon(Icons.volume_up_rounded, size: 20),
                        label: const Text("Listen Pronunciation (Écouter)"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: activeStep['color'] as Color,
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

          // Horizontal Timeline Card Row
          const Text(
            "TAP A ROUTINE MILESTONE:",
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
            itemCount: _routineSteps.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final step = _routineSteps[index];
              final isSelected = index == _activeStepIndex;
              return InkWell(
                onTap: () {
                  setState(() => _activeStepIndex = index);
                  _playAudio(step['audioKey'] as String);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? (step['color'] as Color) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? (step['color'] as Color) : const Color(0xFFE2E8F0),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        step['icon'] as IconData,
                        color: isSelected ? Colors.white : (step['color'] as Color),
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              step['time'] as String,
                              style: TextStyle(
                                color: isSelected ? Colors.white : const Color(0xFF1E293B),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              step['french'] as String,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: isSelected ? Colors.white.withValues(alpha: 0.9) : const Color(0xFF64748B),
                                fontSize: 11,
                              ),
                            ),
                          ],
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
            label: const Text("Complete Routine Lab & Proceed", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
