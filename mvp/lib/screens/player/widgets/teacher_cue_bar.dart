import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// The Core Innovation of Lang Huey
/// Scripts non-specialist supervising staff in plain English on smartboard.
class TeacherCueBar extends StatelessWidget {
  final String cueText;

  const TeacherCueBar({
    super.key,
    required this.cueText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      color: LHColors.teal,
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
      child: Row(
        children: [
          // Teacher Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: LHColors.turquoise.withOpacity(0.25),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: LHColors.turquoise.withOpacity(0.4)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.record_voice_over_rounded,
                  color: LHColors.turquoise,
                  size: 28,
                ),
                const SizedBox(width: 10),
                Text(
                  'TEACHER CUE',
                  style: LHText.label(LHColors.turquoise).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 28),

          // Cue Instructions Text
          Expanded(
            child: Text(
              cueText,
              style: LHText.cue(LHColors.white).copyWith(
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
