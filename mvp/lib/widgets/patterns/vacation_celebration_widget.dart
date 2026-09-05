import 'package:flutter/material.dart';
import '../../models/p4_lesson_model.dart';
import '../../services/p4_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

/// Weeks 6, 12 & 13 Pattern: Term Wrap-up, Rest & Vacation Celebration
class VacationCelebrationWidget extends StatelessWidget {
  final P4Lesson lesson;

  const VacationCelebrationWidget({super.key, required this.lesson});

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
                isMidTerm ? 'Pause de Mi-Trimestre (Rest & Recharge)' : 'Félicitations ! Premier Trimestre Terminé !',
                style: LHText.heading(LHColors.teal).copyWith(fontSize: 28),
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
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: LHColors.cream,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: LHColors.gold.withValues(alpha: 0.5)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isMidTerm ? '🌴 Mid-Term Holiday Break' : '🏆 Term 1 Mastered Skills',
                        style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 22),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        isMidTerm
                            ? 'Take time to rest with your family. Review French greetings like "Bonjour" and "Merci" with your parents at home!'
                            : '• 4 Francophone neighbors of Nigeria\n• French Alphabet (A–E)\n• Formal vs Informal Greetings\n• "Les Mots Magiques" Courtesy Words\n• Name, Nationality & Pronouns\n• French Numbers 1 to 20 & Stating Age\n• Complete "Carte d\'Identité" Presentation',
                        style: LHText.body(LHColors.charcoal).copyWith(fontSize: 16, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: LHColors.teal.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: LHColors.teal.withValues(alpha: 0.3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '🇫🇷 French Vacation Expressions',
                        style: LHText.subheading(LHColors.teal).copyWith(fontSize: 22),
                      ),
                      const SizedBox(height: 16),
                      _buildHolidayRow('Bonnes vacances !', 'Have a great holiday !', 'bonnes_vacances'),
                      _buildHolidayRow('À bientôt !', 'See you soon !', 'a_bientot'),
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
                  'Next Term: Ma Famille (Family Members) & Mon École (School & Classroom Objects)',
                  style: LHText.body(LHColors.teal).copyWith(fontWeight: FontWeight.w700, fontSize: 16),
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
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _playAudio(audioKey),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      french,
                      style: LHText.subheading(LHColors.teal).copyWith(fontSize: 17),
                    ),
                    Text(
                      english,
                      style: LHText.body(LHColors.grey).copyWith(fontSize: 13),
                    ),
                  ],
                ),
                const Icon(Icons.volume_up_rounded, color: LHColors.gold, size: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
