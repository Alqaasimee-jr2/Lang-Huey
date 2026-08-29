import 'package:flutter/material.dart';
import '../../../services/p4_audio_service.dart';

/// Bespoke Smartboard Pattern Widget for Week 6 (Mid-term break) & Week 13 (Year-End Graduation)
class Term3GraduationCelebrationWidget extends StatelessWidget {
  final int weekNumber;
  final VoidCallback onComplete;

  const Term3GraduationCelebrationWidget({
    Key? key,
    required this.weekNumber,
    required this.onComplete,
  }) : super(key: key);

  void _playAudio(String key) {
    P4AudioService().playPhrase(key, term: 3);
  }

  @override
  Widget build(BuildContext context) {
    final isGraduation = weekNumber == 13;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isGraduation
                    ? [const Color(0xFF0D7377), const Color(0xFFF4A832)]
                    : [const Color(0xFF0D7377), const Color(0xFF14BDCC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF0D7377).withValues(alpha: 0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isGraduation ? Icons.workspace_premium_rounded : Icons.beach_access_rounded,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isGraduation
                            ? "GRAND DIPLÔME DE 4E ANNÉE · PRIMARY 4 GRADUATION"
                            : "PAUSE DU MI-TRIMESTRE · MID-TERM INTERMISSION",
                        style: const TextStyle(
                          color: Color(0xFFF4A832),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        isGraduation
                            ? "Félicitations pour la 4e Année !"
                            : "Bonnes Vacances et Bonne Pause !",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isGraduation
                            ? "You have successfully completed the entire Primary 4 French curriculum! Bienvenue en 5e année !"
                            : "Enjoy your mid-term break, practice dining etiquette at home, and get ready for the second half of Term 3!",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _playAudio(isGraduation ? 'felicitations_p4' : 'bonnes_vacances'),
                  icon: const Icon(Icons.volume_up_rounded, size: 22),
                  label: Text(isGraduation ? "Écouter Félicitations" : "Écouter Vacances"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF4A832),
                    foregroundColor: const Color(0xFF1C1C1C),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Certificate / Diploma Box (for Week 13) or Cultural Table Etiquette (for Week 6)
          if (isGraduation)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFF4A832), width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(Icons.school_rounded, color: Color(0xFF0D7377), size: 48),
                  const SizedBox(height: 8),
                  const Text(
                    "DIPLÔME DE MAÎTRISE EN FRANÇAIS",
                    style: TextStyle(
                      color: Color(0xFF0D7377),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "PRIMARY 4 FRENCH LANGUAGE CERTIFICATE OF EXCELLENCE",
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(height: 32, thickness: 1.5),
                  const Text(
                    "Decerned to all Primary 4 pupils for mastering Greetings, Numbers 1-20, Family, School Life, Telling Time, Daily Habits, Food, Health & Anatomy, Clothes, and Weather in French!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1E293B),
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      ActionChip(
                        avatar: const Icon(Icons.volume_up_rounded, size: 16, color: Color(0xFF0D7377)),
                        label: const Text("1. Bonnes vacances à tous !"),
                        onPressed: () => _playAudio('bonnes_vacances_a_tous'),
                      ),
                      ActionChip(
                        avatar: const Icon(Icons.volume_up_rounded, size: 16, color: Color(0xFF0D7377)),
                        label: const Text("2. Bienvenue en 5e année !"),
                        onPressed: () => _playAudio('bienvenue_en_p5'),
                      ),
                      ActionChip(
                        avatar: const Icon(Icons.volume_up_rounded, size: 16, color: Color(0xFF0D7377)),
                        label: const Text("3. Vive le français !"),
                        onPressed: () => _playAudio('vive_le_francais'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          else
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFF14BDCC).withValues(alpha: 0.3), width: 2),
              ),
              child: Column(
                children: [
                  const Icon(Icons.table_restaurant_rounded, color: Color(0xFF0D7377), size: 44),
                  const SizedBox(height: 8),
                  const Text(
                    "LE SAVOIR-VIVRE À TABLE",
                    style: TextStyle(
                      color: Color(0xFF0D7377),
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "During the break, remember polite meal expressions: \"À table !\", \"Passe-moi le pain, s'il te plaît\", \"Merci pour le repas\" and \"Bon appétit !\".",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    children: [
                      ActionChip(
                        avatar: const Icon(Icons.volume_up_rounded, size: 16),
                        label: const Text("À table !"),
                        onPressed: () => _playAudio('a_table'),
                      ),
                      ActionChip(
                        avatar: const Icon(Icons.volume_up_rounded, size: 16),
                        label: const Text("Passe-moi le pain"),
                        onPressed: () => _playAudio('passe_moi_le_pain'),
                      ),
                      ActionChip(
                        avatar: const Icon(Icons.volume_up_rounded, size: 16),
                        label: const Text("C'est très bon !"),
                        onPressed: () => _playAudio('cest_tres_bon'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          const SizedBox(height: 24),

          // Final Action
          ElevatedButton.icon(
            onPressed: () {
              P4AudioService().playSfx(P4SfxType.celebrate);
              onComplete();
            },
            icon: const Icon(Icons.celebration_rounded, size: 22),
            label: Text(
              isGraduation ? "Complete Primary 4 French 🎉" : "Continue to Next Section",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0D7377),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }
}
