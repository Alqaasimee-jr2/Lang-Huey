import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class ControlBar extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback? onRepeat;
  final VoidCallback onNext;
  final String nextLabel;
  final bool isQuizState;

  const ControlBar({
    super.key,
    required this.onBack,
    this.onRepeat,
    required this.onNext,
    this.nextLabel = 'NEXT ▶',
    this.isQuizState = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: LHColors.nearBlack,
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button
          ElevatedButton.icon(
            onPressed: onBack,
            style: ElevatedButton.styleFrom(
              backgroundColor: LHColors.white.withOpacity(0.12),
              foregroundColor: LHColors.white,
              minimumSize: const Size(180, 64),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            icon: const Icon(Icons.arrow_back_rounded, size: 28),
            label: Text('BACK', style: LHText.label(LHColors.white)),
          ),

          // Center Actions (Repeat Button in Vocab State)
          if (!isQuizState && onRepeat != null)
            ElevatedButton.icon(
              onPressed: onRepeat,
              style: ElevatedButton.styleFrom(
                backgroundColor: LHColors.turquoise.withOpacity(0.2),
                foregroundColor: LHColors.turquoise,
                minimumSize: const Size(220, 64),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                  side: const BorderSide(color: LHColors.turquoise, width: 2),
                ),
              ),
              icon: const Icon(Icons.replay_rounded, size: 28),
              label: Text('REPEAT AUDIO', style: LHText.label(LHColors.turquoise)),
            ),

          // Next / Reveal Gold Button
          ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: LHColors.gold,
              foregroundColor: LHColors.charcoal,
              minimumSize: const Size(240, 64),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  nextLabel,
                  style: LHText.label(LHColors.charcoal).copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_rounded, color: LHColors.charcoal, size: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
