import 'dart:math' as math;
import 'package:flutter/material.dart';

/// The official Lang Huey Mascot Head widget.
/// Implements 60fps native animations for:
/// - Swaying antenna with twinkling star
/// - Gentle floating/bobbing motion
/// - Realistic eye blinking cycle
/// - Pulsing glowing cheeks
/// - Animated talking mouth (can be forced active via [isTalking])
class LangHueyMascotHeadWidget extends StatefulWidget {
  final double size;
  final bool isLightHead; // true = cream head (on dark bg), false = teal head (on light bg)
  final bool isTalking;   // true = talking mouth animation actively cycling
  final bool isBobbing;   // true = gentle vertical bobbing

  const LangHueyMascotHeadWidget({
    super.key,
    this.size = 200,
    this.isLightHead = true,
    this.isTalking = false,
    this.isBobbing = true,
  });

  @override
  State<LangHueyMascotHeadWidget> createState() => _LangHueyMascotHeadWidgetState();
}

class _LangHueyMascotHeadWidgetState extends State<LangHueyMascotHeadWidget>
    with TickerProviderStateMixin {
  late AnimationController _bobController;
  late AnimationController _swayController;
  late AnimationController _twinkleController;
  late AnimationController _blinkController;
  late AnimationController _talkController;

  @override
  void initState() {
    super.initState();

    // Bobbing: 2.4s ease-in-out cycle
    _bobController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat(reverse: true);

    // Swaying antenna: 2.4s cycle
    _swayController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat(reverse: true);

    // Twinkle: 1.2s cycle
    _twinkleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    // Blinking: 3.6s cycle with short blink at 95%
    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3600),
    )..repeat();

    // Talking: 320ms cycle when talking
    _talkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );

    if (widget.isTalking) {
      _talkController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant LangHueyMascotHeadWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isTalking != oldWidget.isTalking) {
      if (widget.isTalking) {
        _talkController.repeat(reverse: true);
      } else {
        _talkController.animateTo(0.0);
      }
    }
  }

  @override
  void dispose() {
    _bobController.dispose();
    _swayController.dispose();
    _twinkleController.dispose();
    _blinkController.dispose();
    _talkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _bobController,
        _swayController,
        _twinkleController,
        _blinkController,
        _talkController,
      ]),
      builder: (context, child) {
        // Bob translation & slight tilt
        final bobValue = widget.isBobbing
            ? math.sin(_bobController.value * math.pi) * -8.0
            : 0.0;
        final bobRotate = widget.isBobbing
            ? math.sin(_bobController.value * math.pi) * -0.026
            : 0.0;

        // Sway antenna: -6 deg to +6 deg
        final swayAngle = (math.sin(_swayController.value * math.pi * 2) * 6.0) * (math.pi / 180.0);

        // Twinkle: scale 1.0 to 1.25, opacity 1.0 to 0.7
        final twinkleScale = 1.0 + (_twinkleController.value * 0.25);

        // Blink calculation: normal for most of cycle, quick blink between 0.92 and 0.98
        final blinkProgress = _blinkController.value;
        double blinkScaleY = 1.0;
        if (blinkProgress >= 0.92 && blinkProgress <= 0.98) {
          final t = (blinkProgress - 0.92) / 0.06;
          // Dip down to 0.1 and back
          blinkScaleY = 0.1 + 0.9 * math.pow((2 * t - 1).abs(), 2);
        }

        // Cheek pulse opacity: 0.55 to 0.90
        final cheekOpacity = 0.55 + (_bobController.value * 0.35);

        // Talk mouth scale: 0.0 to 1.0
        final talkOpen = widget.isTalking ? _talkController.value : 0.0;

        return Transform.translate(
          offset: Offset(0, bobValue),
          child: Transform.rotate(
            angle: bobRotate,
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: CustomPaint(
                painter: _MascotHeadPainter(
                  isLightHead: widget.isLightHead,
                  swayAngle: swayAngle,
                  twinkleScale: twinkleScale,
                  blinkScaleY: blinkScaleY,
                  cheekOpacity: cheekOpacity,
                  talkOpen: talkOpen,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MascotHeadPainter extends CustomPainter {
  final bool isLightHead;
  final double swayAngle;
  final double twinkleScale;
  final double blinkScaleY;
  final double cheekOpacity;
  final double talkOpen;

  _MascotHeadPainter({
    required this.isLightHead,
    required this.swayAngle,
    required this.twinkleScale,
    required this.blinkScaleY,
    required this.cheekOpacity,
    required this.talkOpen,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Standard coordinate space is 220 x 220
    final scale = size.width / 220.0;
    canvas.save();
    canvas.scale(scale);

    final headFillColor = isLightHead ? const Color(0xFFF5F0E8) : const Color(0xFF0D7377);
    final innerBorderColor = const Color(0xFF14BDCC);
    final goldColor = const Color(0xFFF4A832);
    final eyeRingColor = isLightHead ? const Color(0xFF0D7377) : const Color(0xFFF5F0E8);
    final charcoalColor = const Color(0xFF1C1C1C);

    // 1. Antenna Group (Sway around (110, 40))
    canvas.save();
    canvas.translate(110, 40);
    canvas.rotate(swayAngle);
    canvas.translate(-110, -40);

    // Antenna line
    final antennaPaint = Paint()
      ..color = isLightHead ? const Color(0xFF083F42) : const Color(0xFF0D7377)
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawLine(const Offset(110, 40), const Offset(110, 18), antennaPaint);

    // Twinkling Star at (110, 20)
    canvas.save();
    canvas.translate(110, 20);
    canvas.scale(twinkleScale);
    canvas.translate(-110, -20);

    final starPath = Path()
      ..moveTo(110, 6)
      ..lineTo(114.5, 15)
      ..lineTo(124.5, 16.4)
      ..lineTo(117.3, 23.2)
      ..lineTo(119.0, 33.0)
      ..lineTo(110, 28.3)
      ..lineTo(101.0, 33.0)
      ..lineTo(102.7, 23.2)
      ..lineTo(95.5, 16.4)
      ..lineTo(105.5, 15)
      ..close();

    final starPaint = Paint()
      ..color = goldColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(starPath, starPaint);
    canvas.restore(); // end star transform

    canvas.restore(); // end antenna sway

    // 2. Head Body: Rounded rectangle (20, 40, 180, 160, rx=55)
    final headRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(20, 40, 180, 160),
      const Radius.circular(55),
    );
    final headPaint = Paint()
      ..color = headFillColor
      ..style = PaintingStyle.fill;
    canvas.drawRRect(headRect, headPaint);

    // Inner glowing border (32, 52, 156, 136, rx=45)
    final innerBorderRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(32, 52, 156, 136),
      const Radius.circular(45),
    );
    final innerBorderPaint = Paint()
      ..color = innerBorderColor.withOpacity(0.85)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    canvas.drawRRect(innerBorderRect, innerBorderPaint);

    // 3. Cheeks: cx=62, 158, cy=130, r=14
    final cheekPaint = Paint()
      ..color = goldColor.withOpacity(cheekOpacity.clamp(0.0, 1.0))
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(62, 130), 14, cheekPaint);
    canvas.drawCircle(const Offset(158, 130), 14, cheekPaint);

    // 4. Eye Sclera / Rings: cx=80, 140, cy=105, r=22
    final eyeRingPaint = Paint()
      ..color = eyeRingColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(80, 105), 22, eyeRingPaint);
    canvas.drawCircle(const Offset(140, 105), 22, eyeRingPaint);

    // 5. Pupils with blink animation: cx=83, 143, cy=107, r=10
    final pupilPaint = Paint()
      ..color = charcoalColor
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.translate(83, 107);
    canvas.scale(1.0, blinkScaleY);
    canvas.translate(-83, -107);
    canvas.drawCircle(const Offset(83, 107), 10, pupilPaint);
    canvas.restore();

    canvas.save();
    canvas.translate(143, 107);
    canvas.scale(1.0, blinkScaleY);
    canvas.translate(-143, -107);
    canvas.drawCircle(const Offset(143, 107), 10, pupilPaint);
    canvas.restore();

    // 6. Eye sparkles: cx=87, 147, cy=102, r=3 (disappears during closed blink)
    if (blinkScaleY > 0.4) {
      final sparklePaint = Paint()
        ..color = const Color(0xFFF5F0E8)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(87, 102), 3, sparklePaint);
      canvas.drawCircle(const Offset(147, 102), 3, sparklePaint);
    }

    // 7. Talking Mouth
    // Rest path: M 82 146 Q 110 168 138 146 Q 110 156 82 146 Z
    // When talking, bottom quadratic curve pulls down further
    final mouthBottomY = 168.0 + (talkOpen * 14.0);
    final mouthTopY = 156.0 - (talkOpen * 4.0);

    final mouthPath = Path()
      ..moveTo(82, 146)
      ..quadraticBezierTo(110, mouthBottomY, 138, 146)
      ..quadraticBezierTo(110, mouthTopY, 82, 146)
      ..close();

    final mouthPaint = Paint()
      ..color = goldColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(mouthPath, mouthPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _MascotHeadPainter oldDelegate) {
    return oldDelegate.isLightHead != isLightHead ||
        oldDelegate.swayAngle != swayAngle ||
        oldDelegate.twinkleScale != twinkleScale ||
        oldDelegate.blinkScaleY != blinkScaleY ||
        oldDelegate.cheekOpacity != cheekOpacity ||
        oldDelegate.talkOpen != talkOpen;
  }
}
