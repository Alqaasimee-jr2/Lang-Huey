import 'package:flutter/material.dart';
import '../../../models/p4_lesson_model.dart';
import '../../../services/p4_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Term 2 Weeks 6, 12 & 13 Pattern: Term 2 Wrap-up, Vacation Celebration & Term 3 Preview
class Term2VacationCelebrationWidget extends StatelessWidget {
  final P4Lesson lesson;

  const Term2VacationCelebrationWidget({super.key, required this.lesson});

  void _playAudio(String key) {
    P4AudioService().playPhrase(key);
  }

  @override
  Widget build(BuildContext context) {
    final isMidTerm = lesson.week == 6;

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isMidTerm ? Icons.beach_access_rounded : Icons.celebration_rounded,
                color: LHColors.gold,
                size: 40,
              ),
              const SizedBox(width: 14),
              Text(
                isMidTerm ? 'Pause de Mi-Trimestre (Rest & Family)' : 'Félicitations ! Deuxième Trimestre Terminé !',
                style: LHText.heading(LHColors.teal).copyWith(fontSize: 26),
              ),
              const SizedBox(width: 10),
              IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                onPressed: () {
                  P4AudioService().playSfx(P4SfxType.celebrate);
                  _playAudio(isMidTerm ? 'bonnes_vacances' : 'felicitations');
                },
              ),
            ],
          ),
          const Divider(),

          Row(
            children: [
              // Left Term 2 Mastery Summary
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: LHColors.cream,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: LHColors.gold.withValues(alpha: 0.5)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isMidTerm ? '🌴 Mid-Term Holiday Break' : '🏆 Term 2 Mastered Skills',
                        style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        isMidTerm
                            ? 'Take time to rest with your family. Practice introducing your parents in French ("Voici mon père / C\'est ma mère") at home!'
                            : '• Family members & possessives (Mon/Ma/Mes)\n• 3-Generation Family Tree (Arbre généalogique)\n• Describing family & Verb Avoir (J\'ai/Tu as/Il a)\n• Classroom items & school facilities\n• Verb Aller (Je vais à la bibliothèque)\n• 7 Days of the week & school timetable\n• Prepositions (Sur, Sous, Dans, Devant, Derrière)\n• 6 Core colors & adjective agreement',
                        style: LHText.body(LHColors.charcoal).copyWith(fontSize: 14, height: 1.45),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 20),

              // Right Term 3 Preview & Vacation Expressions
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: LHColors.teal.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: LHColors.teal.withValues(alpha: 0.3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '🌟 Preview: Term 3 (Troisième Trimestre)',
                        style: LHText.subheading(LHColors.teal).copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Get ready for exciting new themes:\n• Counting 0 to 20 & simple French math (+ and =)\n• Telling time ("Quelle heure est-il?")\n• Daily morning and evening routines\n• Foods, meals, and ordering breakfast & lunch!',
                        style: LHText.body(LHColors.charcoal).copyWith(fontSize: 14, height: 1.45),
                      ),
                      const SizedBox(height: 14),
                      _buildHolidayRow('Bonnes vacances !', 'Have a great holiday !', 'bonnes_vacances'),
                      _buildHolidayRow('À la rentrée !', 'See you when school resumes !', 'a_la_rentree'),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: LHColors.teal.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.school_rounded, color: LHColors.teal),
                const SizedBox(width: 10),
                Text(
                  'Lang Huey: Empowering 21st-Century Polyglots across Africa 🌍',
                  style: LHText.body(LHColors.teal).copyWith(fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHolidayRow(String french, String english, String audioKey) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Material(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => _playAudio(audioKey),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(french, style: LHText.subheading(LHColors.teal).copyWith(fontSize: 15)),
                    Text(english, style: LHText.body(LHColors.grey).copyWith(fontSize: 12)),
                  ],
                ),
                const Icon(Icons.volume_up_rounded, color: LHColors.gold, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
