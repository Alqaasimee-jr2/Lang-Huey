import 'dart:math';
import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1ClockTimeStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1ClockTimeStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1ClockTimeStudioWidget> createState() => _JSS1ClockTimeStudioWidgetState();
}

class _JSS1ClockTimeStudioWidgetState extends State<JSS1ClockTimeStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _hour = 8;
  int _minute = 0; // 0, 15, 30, 45
  String _period = 'matin'; // 'matin', 'apres_midi', 'soir'
  bool _isMidi = false;
  bool _isMinuit = false;

  String _getFrenchTimeExpression() {
    if (_isMidi) return 'Il est midi pile (12h00).';
    if (_isMinuit) return 'Il est minuit pile (00h00).';

    final hourWords = [
      '',
      'une heure',
      'deux heures',
      'trois heures',
      'quatre heures',
      'cinq heures',
      'six heures',
      'sept heures',
      'huit heures',
      'neuf heures',
      'dix heures',
      'onze heures',
      'douze heures',
    ];

    final nextHourWords = [
      '',
      'deux heures',
      'trois heures',
      'quatre heures',
      'cinq heures',
      'six heures',
      'sept heures',
      'huit heures',
      'neuf heures',
      'dix heures',
      'onze heures',
      'douze heures',
      'une heure',
    ];

    String timeStr;
    if (_minute == 0) {
      timeStr = 'Il est ${hourWords[_hour]} pile';
    } else if (_minute == 15) {
      timeStr = 'Il est ${hourWords[_hour]} et quart';
    } else if (_minute == 30) {
      timeStr = 'Il est ${hourWords[_hour]} et demie';
    } else {
      timeStr = 'Il est ${nextHourWords[_hour]} moins le quart';
    }

    if (_period == 'matin') {
      timeStr += ' du matin.';
    } else if (_period == 'apres_midi') {
      timeStr += ' de l\'après-midi.';
    } else {
      timeStr += ' du soir.';
    }

    return timeStr;
  }

  String _getAudioKey() {
    if (_isMidi) return 'il_est_midi';
    if (_isMinuit) return 'il_est_minuit';
    if (_hour == 8 && _minute == 0) return 'il_est_huit_heures_pile';
    if (_hour == 8 && _minute == 15) return 'il_est_huit_heures_et_quart';
    if (_hour == 8 && _minute == 30) return 'il_est_huit_heures_et_demie';
    if (_hour == 8 && _minute == 45) return 'il_est_neuf_heures_moins_le_quart';
    return 'quelle_heure_est_il';
  }

  @override
  Widget build(BuildContext context) {
    final frenchTime = _getFrenchTimeExpression();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Interactive Analog & Digital Clock Stage
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('Cadran Interactif', style: JSS1Text.subheading(JSS1Colors.teal), overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: JSS1Colors.teal,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          _getDigitalDisplay(),
                          style: const TextStyle(
                            color: JSS1Colors.gold,
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            fontFamily: 'Courier',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Analog Clock Canvas
                  CustomPaint(
                    size: const Size(180, 180),
                    painter: _ClockPainter(
                      hour: _isMidi ? 12 : (_isMinuit ? 0 : _hour),
                      minute: (_isMidi || _isMinuit) ? 0 : _minute,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Quick Time Presets
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildPresetChip('8h00 (Pile)', _hour == 8 && _minute == 0 && !_isMidi && !_isMinuit, () {
                        setState(() {
                          _hour = 8;
                          _minute = 0;
                          _isMidi = false;
                          _isMinuit = false;
                        });
                        _audioService.playPhrase('il_est_huit_heures_pile', term: 2);
                      }),
                      _buildPresetChip('8h15 (Et quart)', _hour == 8 && _minute == 15 && !_isMidi && !_isMinuit, () {
                        setState(() {
                          _hour = 8;
                          _minute = 15;
                          _isMidi = false;
                          _isMinuit = false;
                        });
                        _audioService.playPhrase('il_est_huit_heures_et_quart', term: 2);
                      }),
                      _buildPresetChip('8h30 (Et demie)', _hour == 8 && _minute == 30 && !_isMidi && !_isMinuit, () {
                        setState(() {
                          _hour = 8;
                          _minute = 30;
                          _isMidi = false;
                          _isMinuit = false;
                        });
                        _audioService.playPhrase('il_est_huit_heures_et_demie', term: 2);
                      }),
                      _buildPresetChip('8h45 (Moins le quart)', _hour == 8 && _minute == 45 && !_isMidi && !_isMinuit, () {
                        setState(() {
                          _hour = 8;
                          _minute = 45;
                          _isMidi = false;
                          _isMinuit = false;
                        });
                        _audioService.playPhrase('il_est_neuf_heures_moins_le_quart', term: 2);
                      }),
                      _buildPresetChip('Midi (12h00)', _isMidi, () {
                        setState(() {
                          _isMidi = true;
                          _isMinuit = false;
                        });
                        _audioService.playPhrase('il_est_midi', term: 2);
                      }),
                      _buildPresetChip('Minuit (00h00)', _isMinuit, () {
                        setState(() {
                          _isMinuit = true;
                          _isMidi = false;
                        });
                        _audioService.playPhrase('il_est_minuit', term: 2);
                      }),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Hour Slider
                  Row(
                    children: [
                      const Icon(Icons.schedule_rounded, color: JSS1Colors.teal, size: 18),
                      const SizedBox(width: 8),
                      Text('Heure ($_hour h) :', style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                      Expanded(
                        child: Slider(
                          value: _hour.toDouble(),
                          min: 1,
                          max: 12,
                          divisions: 11,
                          activeColor: JSS1Colors.teal,
                          inactiveColor: JSS1Colors.lightGrey,
                          onChanged: (val) {
                            setState(() {
                              _hour = val.toInt();
                              _isMidi = false;
                              _isMinuit = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        // Right Column: French Time Spoken Readout & Period Indicators
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('EXPRESSION ORALE DE L\'HEURE', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.white, size: 28),
                      onPressed: () => _audioService.playPhrase(_getAudioKey(), term: 2),
                    ),
                  ],
                ),

                // Spoken Result Box
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
                      Text('En français, on dit :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(
                        frenchTime,
                        style: JSS1Text.heroHeading(JSS1Colors.charcoal).copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: JSS1Colors.cream,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Question clé : "Quelle heure est-il, s\'il vous plaît ?"',
                          style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

                // Time of Day Period Selector
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Moment de la journée :', style: JSS1Text.caption(JSS1Colors.white).copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildPeriodTab('Matin (du matin)', _period == 'matin', () {
                          setState(() => _period = 'matin');
                          _audioService.playClick();
                        }),
                        const SizedBox(width: 8),
                        _buildPeriodTab('Après-midi', _period == 'apres_midi', () {
                          setState(() => _period = 'apres_midi');
                          _audioService.playClick();
                        }),
                        const SizedBox(width: 8),
                        _buildPeriodTab('Soir (du soir)', _period == 'soir', () {
                          setState(() => _period = 'soir');
                          _audioService.playClick();
                        }),
                      ],
                    ),
                  ],
                ),

                // Question Audio Trigger
                InkWell(
                  onTap: () => _audioService.playPhrase('a_quelle_heure_commence_le_cours', term: 2),
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: JSS1Colors.gold,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.record_voice_over_rounded, color: JSS1Colors.charcoal, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Écouter : "À quelle heure commence le cours ?"',
                          style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900, fontSize: 13),
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

  String _getDigitalDisplay() {
    if (_isMidi) return '12:00';
    if (_isMinuit) return '00:00';
    final minStr = _minute.toString().padLeft(2, '0');
    final hourStr = _hour.toString().padLeft(2, '0');
    return '$hourStr:$minStr';
  }

  Widget _buildPresetChip(String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodTab(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? JSS1Colors.gold : JSS1Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? JSS1Colors.charcoal : JSS1Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}

class _ClockPainter extends CustomPainter {
  final int hour;
  final int minute;

  _ClockPainter({required this.hour, required this.minute});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    // Clock Face Background
    final facePaint = Paint()..color = JSS1Colors.cream;
    canvas.drawCircle(center, radius, facePaint);

    // Clock Rim
    final rimPaint = Paint()
      ..color = JSS1Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawCircle(center, radius, rimPaint);

    // Center Pin
    final centerPin = Paint()..color = JSS1Colors.gold;
    canvas.drawCircle(center, 6, centerPin);

    // Hour Hand
    final hourAngle = (hour % 12 + minute / 60) * (2 * pi / 12) - (pi / 2);
    final hourHandLength = radius * 0.5;
    final hourPaint = Paint()
      ..color = JSS1Colors.charcoal
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      center,
      Offset(center.dx + cos(hourAngle) * hourHandLength, center.dy + sin(hourAngle) * hourHandLength),
      hourPaint,
    );

    // Minute Hand
    final minuteAngle = minute * (2 * pi / 60) - (pi / 2);
    final minuteHandLength = radius * 0.75;
    final minutePaint = Paint()
      ..color = JSS1Colors.teal
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      center,
      Offset(center.dx + cos(minuteAngle) * minuteHandLength, center.dy + sin(minuteAngle) * minuteHandLength),
      minutePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ClockPainter oldDelegate) {
    return oldDelegate.hour != hour || oldDelegate.minute != minute;
  }
}
