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
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Visual Image Card (Smartboard 400x400)
                Container(
                  width: 400,
                  height: 380,
                  decoration: BoxDecoration(
                    color: LHColors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback illustrative card when image asset is loading
                        return Container(
                          color: LHColors.teal.withOpacity(0.15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.school_rounded,
                                size: 100,
                                color: LHColors.teal,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                item.word,
                                style: LHText.subheading(LHColors.teal),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 64),

                // Text Display & Audio Trigger Column
                SizedBox(
                  width: 580,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // French Word Display (Nunito Black 72sp)
                      Text(
                        item.word,
                        style: LHText.display(LHColors.white),
                      ),

                      const SizedBox(height: 12),

                      // English Translation (Inter Regular 36sp)
                      Text(
                        item.translation,
                        style: LHText.body(LHColors.turquoise).copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 40),

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
                            vertical: 20,
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
                          size: 36,
                        ),
                        label: Text(
                          isAudioPlaying ? 'PLAYING AUDIO...' : 'PLAY AUDIO',
                          style: LHText.label(
                            isAudioPlaying ? LHColors.charcoal : LHColors.turquoise,
                          ).copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
