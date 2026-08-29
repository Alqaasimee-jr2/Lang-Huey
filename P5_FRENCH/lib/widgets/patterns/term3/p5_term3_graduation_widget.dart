import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5Term3GraduationWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5Term3GraduationWidget({super.key, required this.onComplete});

  @override
  State<P5Term3GraduationWidget> createState() => _P5Term3GraduationWidgetState();
}

class _P5Term3GraduationWidgetState extends State<P5Term3GraduationWidget> {
  final P5AudioService _audioService = P5AudioService();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.cream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.teal, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Diplôme d\'Excellence et Passage en 6e Année (Primary 6) :', style: P5Text.subheading(P5Colors.charcoal)),
          const SizedBox(height: 14),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: P5Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: P5Colors.gold, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: P5Colors.gold.withValues(alpha: 0.2),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundColor: P5Colors.teal,
                    child: const Icon(Icons.school_rounded, size: 64, color: P5Colors.gold),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: P5Colors.gold,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'CERTIFICAT DE SUCCÈS • 5E ANNÉE',
                            style: P5Text.caption(P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Félicitations pour votre réussite !',
                          style: P5Text.heading(P5Colors.charcoal).copyWith(fontSize: 24),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Vous avez accompli avec succès tout le programme de français de 5e année (Primary 5) !',
                          style: P5Text.body(P5Colors.teal).copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Bienvenue en 6e année (Primary 6) et excellentes vacances !',
                          style: P5Text.caption(P5Colors.charcoal),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: P5Colors.teal,
                          foregroundColor: P5Colors.gold,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        onPressed: () {
                          _audioService.playPhrase('felicitations_reussite', term: 3);
                        },
                        icon: const Icon(Icons.celebration_rounded),
                        label: const Text('Félicitations !'),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: P5Colors.gold,
                          foregroundColor: P5Colors.charcoal,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        onPressed: () {
                          _audioService.playPhrase('bienvenue_en_6e_annee', term: 3);
                        },
                        icon: const Icon(Icons.flight_takeoff_rounded),
                        label: const Text('Passage en 6e'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: P5Colors.charcoal,
                  foregroundColor: P5Colors.cream,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                onPressed: () {
                  _audioService.playPhrase('excellentes_vacances_a_tous', term: 3);
                },
                icon: const Icon(Icons.beach_access_rounded),
                label: const Text('Excellentes vacances à tous !'),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: P5Colors.teal,
                  foregroundColor: P5Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  _audioService.playCelebrate();
                  widget.onComplete();
                },
                icon: const Icon(Icons.check_circle_rounded),
                label: const Text('Célébrer la Fin d\'Année'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
