import 'package:flutter/material.dart';
import '../../../models/lesson_item.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class VocabItemView extends StatelessWidget {
  final LessonItem item;
  final int currentIndex;
  final int totalItems;
  final VoidCallback onPlayAudio;
  final bool isAudioPlaying;

  const VocabItemView({
    super.key,
    required this.item,
    required this.currentIndex,
    required this.totalItems,
    required this.onPlayAudio,
    required this.isAudioPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Bar: Item Counter Progress
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: LHColors.teal.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'VOCABULARY ITEM ${currentIndex + 1} OF $totalItems',
                  style: LHText.label(LHColors.turquoise),
                ),
              ),
              // Step Dots
              Row(
                children: List.generate(
                  totalItems,
                  (i) => Container(
                    margin: const EdgeInsets.only(left: 6),
                    width: i == currentIndex ? 24 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: i == currentIndex
                          ? LHColors.turquoise
                          : LHColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double imageSize = (constraints.maxHeight * 0.85).clamp(240.0, 420.0);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Visual Image Card (Responsive Landscape Sizing)
                    Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: BoxDecoration(
                        color: LHColors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          item.imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: LHColors.teal.withOpacity(0.15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.school_rounded,
                                    size: imageSize * 0.35,
                                    color: LHColors.teal,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    item.word,
                                    style: LHText.subheading(LHColors.teal).copyWith(
                                      fontSize: (imageSize * 0.08).clamp(18.0, 32.0),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(width: 48),

                    // Text Display & Audio Trigger Column
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // French Word Display (Nunito Black 72sp)
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item.word,
                              style: LHText.display(LHColors.white),
                            ),
                          ),

                          const SizedBox(height: 8),

                          // English Translation (Inter Regular 36sp)
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item.translation,
                              style: LHText.body(LHColors.turquoise).copyWith(
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          const SizedBox(height: 28),

                          // Audio Playback Button
                          ElevatedButton.icon(
                            onPressed: onPlayAudio,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isAudioPlaying
                                  ? LHColors.turquoise
                                  : LHColors.teal.withOpacity(0.3),
                              foregroundColor: isAudioPlaying
                                  ? LHColors.charcoal
                                  : LHColors.turquoise,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 36,
                                vertical: 18,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                                side: const BorderSide(
                                  color: LHColors.turquoise,
                                  width: 2,
                                ),
                              ),
                              elevation: isAudioPlaying ? 8 : 0,
                            ),
                            icon: Icon(
                              isAudioPlaying
                                  ? Icons.volume_up_rounded
                                  : Icons.play_arrow_rounded,
                              size: 32,
                            ),
                            label: Text(
                              isAudioPlaying ? 'PLAYING AUDIO...' : 'PLAY AUDIO',
                              style: LHText.label(
                                isAudioPlaying ? LHColors.charcoal : LHColors.turquoise,
                              ).copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
