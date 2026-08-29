import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5Term1VacationWidget extends StatefulWidget {
  final int weekNumber;
  final VoidCallback onComplete;

  const P5Term1VacationWidget({
    super.key,
    required this.weekNumber,
    required this.onComplete,
  });

  @override
  State<P5Term1VacationWidget> createState() => _P5Term1VacationWidgetState();
}

class _P5Term1VacationWidgetState extends State<P5Term1VacationWidget> {
  final P5AudioService _audioService = P5AudioService();

  @override
  void initState() {
    super.initState();
    _audioService.playSfx(P5SfxType.celebrate);
  }

  @override
  Widget build(BuildContext context) {
    final isYearEnd = widget.weekNumber == 13;
    final title = isYearEnd
        ? 'Félicitations ! Term 1 French Curriculum Completed !'
        : 'Bon Repos ! Congé de Mi-Trimestre';
    final subtitle = isYearEnd
        ? 'You have successfully mastered French Greetings, Numbers 1–60, Introducing Others, and Body Anatomy !'
        : 'Enjoy a restful mid-term break with family and French cultural songs !';

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: P5Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.gold.withOpacity(0.5), width: 3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 46,
            backgroundColor: P5Colors.gold.withOpacity(0.2),
            child: Icon(
              isYearEnd ? Icons.school_rounded : Icons.beach_access_rounded,
              color: P5Colors.gold,
              size: 54,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: P5Text.heroHeading(P5Colors.teal).copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              subtitle,
              style: P5Text.body(P5Colors.charcoal).copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),

          // Vacation Wishes Cards
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildWishCard('Bonnes vacances !', 'Happy holidays / vacation!', 'bonnes_vacances'),
              const SizedBox(width: 16),
              _buildWishCard('À la rentrée !', 'See you next term!', 'a_la_rentree'),
              const SizedBox(width: 16),
              _buildWishCard('Félicitations !', 'Congratulations!', 'felicitations'),
            ],
          ),
          const SizedBox(height: 28),

          ElevatedButton.icon(
            onPressed: widget.onComplete,
            icon: const Icon(Icons.check_circle_rounded, color: P5Colors.white),
            label: Text(
              isYearEnd ? 'Finish Term 1 & Return to Roadmaps' : 'Resume Lesson Flow',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: P5Colors.green,
              foregroundColor: P5Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWishCard(String french, String english, String audioKey) {
    return Material(
      color: P5Colors.cream,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => _audioService.playPhrase(audioKey, term: 1),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: P5Colors.turquoise.withOpacity(0.5)),
          ),
          child: Column(
            children: [
              Text(french, style: P5Text.frenchPhrase(P5Colors.teal).copyWith(fontSize: 17)),
              const SizedBox(height: 4),
              Text(english, style: P5Text.caption(P5Colors.charcoal)),
              const SizedBox(height: 6),
              const Icon(Icons.volume_up_rounded, color: P5Colors.teal, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
