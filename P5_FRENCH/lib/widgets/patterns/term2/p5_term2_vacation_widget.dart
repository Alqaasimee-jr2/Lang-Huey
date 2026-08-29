import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5Term2VacationWidget extends StatelessWidget {
  final VoidCallback onComplete;

  const P5Term2VacationWidget({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    final P5AudioService audioService = P5AudioService();

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.cream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.gold, width: 3.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: P5Colors.teal,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: P5Colors.gold, width: 2),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: P5Colors.gold,
                  child: Icon(Icons.celebration_rounded, color: P5Colors.charcoal, size: 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CERTIFICAT DU DEUXIÈME TRIMESTRE', style: P5Text.heading(P5Colors.white).copyWith(fontSize: 22)),
                      Text('Primary 5 French Language • Félicitations et Bonnes Vacances !', style: P5Text.body(P5Colors.gold)),
                    ],
                  ),
                ),
                IconButton.filled(
                  style: IconButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                  onPressed: () {
                    audioService.playPhrase('felicitations', term: 2);
                  },
                  icon: const Icon(Icons.volume_up_rounded),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Main Showcase Banner
          Expanded(
            child: Row(
              children: [
                // Left: Certificate Badge & Skills
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: P5Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: P5Colors.teal.withValues(alpha: 0.3)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 36,
                          backgroundColor: P5Colors.gold,
                          child: Icon(Icons.military_tech_rounded, size: 44, color: P5Colors.charcoal),
                        ),
                        const SizedBox(height: 10),
                        Text('Compétences Validées T2 :', style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16)),
                        const SizedBox(height: 8),
                        Text('• La Grande Famille & l\'Arbre Généalogique', style: P5Text.caption(P5Colors.teal)),
                        Text('• Les Voisins & le Quartier (Aider & Partager)', style: P5Text.caption(P5Colors.teal)),
                        Text('• La Politesse (Merci, Je vous en prie)', style: P5Text.caption(P5Colors.teal)),
                        Text('• Les 7 Jours de la Semaine & l\'Emploi du Temps', style: P5Text.caption(P5Colors.teal)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Right: Term 3 Roadmap Preview
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: P5Colors.teal,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: P5Colors.gold, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.flight_takeoff_rounded, color: P5Colors.gold),
                            const SizedBox(width: 8),
                            Text('Aperçu du 3e Trimestre :', style: P5Text.subheading(P5Colors.gold).copyWith(fontSize: 16)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text('1. Routine Quotidienne (Matin & Soir)', style: P5Text.body(P5Colors.white).copyWith(fontSize: 13)),
                        Text('2. Sports, Loisirs et Invitations', style: P5Text.body(P5Colors.white).copyWith(fontSize: 13)),
                        Text('3. Matières Scolaires & Prêt en Classe', style: P5Text.body(P5Colors.white).copyWith(fontSize: 13)),
                        Text('4. Métiers du Futur & Repas Gastronomiques', style: P5Text.body(P5Colors.white).copyWith(fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // Action Buttons
          Row(
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: P5Colors.gold, foregroundColor: P5Colors.charcoal),
                onPressed: () {
                  audioService.playPhrase('bonnes_vacances', term: 2);
                },
                icon: const Icon(Icons.beach_access_rounded),
                label: const Text('Bonnes Vacances !'),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: P5Colors.teal, foregroundColor: P5Colors.white),
                onPressed: () {
                  audioService.playPhrase('a_la_rentree_3e_trimestre', term: 2);
                },
                icon: const Icon(Icons.school_rounded),
                label: const Text('À la rentrée pour le 3e Trimestre !'),
              ),
              const Spacer(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: P5Colors.gold,
                  foregroundColor: P5Colors.charcoal,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                onPressed: () {
                  audioService.playCelebrate();
                  onComplete();
                },
                icon: const Icon(Icons.check_circle_rounded),
                label: const Text('Clôturer le 2e Trimestre'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
