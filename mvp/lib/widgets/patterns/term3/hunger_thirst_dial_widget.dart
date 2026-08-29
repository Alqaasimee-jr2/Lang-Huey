import 'package:flutter/material.dart';
import '../../../services/p4_audio_service.dart';

/// Bespoke Smartboard Pattern Widget for Week 4: Hunger, Thirst & Preference Dial
class HungerThirstDialWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const HungerThirstDialWidget({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<HungerThirstDialWidget> createState() => _HungerThirstDialWidgetState();
}

class _HungerThirstDialWidgetState extends State<HungerThirstDialWidget> {
  final P4AudioService _audioService = P4AudioService();
  int _activeStateIndex = 0;

  final List<Map<String, dynamic>> _expressions = [
    {
      'title': 'J\'AI FAIM (I AM HUNGRY)',
      'french': 'J\'ai faim ! Je veux manger du riz.',
      'english': 'I am hungry! I want to eat rice.',
      'audioKey': 'jai_faim',
      'actionAudioKey': 'je_veux_manger_du_riz',
      'icon': Icons.restaurant_menu_rounded,
      'color': const Color(0xFFD97706),
      'tip': 'In French, we use verb Avoir: "J\'ai faim" (Not "Je suis faim").',
    },
    {
      'title': 'J\'AI SOIF (I AM THIRSTY)',
      'french': 'J\'ai soif ! Je veux boire de l\'eau.',
      'english': 'I am thirsty! I want to drink water.',
      'audioKey': 'jai_soif',
      'actionAudioKey': 'je_veux_boire_de_leau',
      'icon': Icons.local_drink_rounded,
      'color': const Color(0xFF0284C7),
      'tip': 'Use "Je veux boire..." + drink name (de l\'eau, du lait).',
    },
    {
      'title': 'J\'AIME (I LIKE)',
      'french': 'J\'aime le poulet et le riz.',
      'english': 'I like chicken and rice.',
      'audioKey': 'jaime_le_poulet',
      'actionAudioKey': 'jaime_le_poulet',
      'icon': Icons.favorite_rounded,
      'color': const Color(0xFF10B981),
      'tip': 'Express your favorite foods with "J\'aime le/la/les...".',
    },
    {
      'title': 'JE N\'AIME PAS (I DO NOT LIKE)',
      'french': 'Je n\'aime pas le poisson.',
      'english': 'I do not like fish.',
      'audioKey': 'je_naime_pas_le_poisson',
      'actionAudioKey': 'je_naime_pas_le_poisson',
      'icon': Icons.cancel_rounded,
      'color': const Color(0xFFE11D48),
      'tip': 'Wrap "ne... pas" around "aime": "Je n\'aime pas...".',
    },
    {
      'title': 'BON APPÉTIT & MERCI',
      'french': 'Bon appétit ! Merci pour le repas !',
      'english': 'Enjoy your meal! Thank you for the food!',
      'audioKey': 'bon_appetit',
      'actionAudioKey': 'merci_pour_le_repas',
      'icon': Icons.volunteer_activism_rounded,
      'color': const Color(0xFF0D7377),
      'tip': 'Polite French meal greetings exchanged at the table.',
    },
  ];

  void _playAudio(String key) {
    _audioService.playPhrase(key, term: 3);
  }

  @override
  Widget build(BuildContext context) {
    final activeExpr = _expressions[_activeStateIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0D7377), Color(0xFF14BDCC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.mood_rounded, color: Colors.white, size: 36),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "FAIM, SOIF ET PRÉFÉRENCES · NEEDS & TASTES STUDIO",
                        style: TextStyle(
                          color: Color(0xFFF4A832),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Comment exprimer ses besoins",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Switch between hunger, thirst, likes, and polite table expressions!",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Active Expression Spotlight
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: (activeExpr['color'] as Color).withValues(alpha: 0.3), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: (activeExpr['color'] as Color).withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(activeExpr['icon'] as IconData, color: activeExpr['color'] as Color, size: 44),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: activeExpr['color'] as Color,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          activeExpr['title'] as String,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        activeExpr['french'] as String,
                        style: const TextStyle(
                          color: Color(0xFF1E293B),
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        activeExpr['english'] as String,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "💡 Tip: ${activeExpr['tip']}",
                        style: TextStyle(
                          color: (activeExpr['color'] as Color),
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => _playAudio(activeExpr['audioKey'] as String),
                            icon: const Icon(Icons.volume_up_rounded, size: 20),
                            label: const Text("Listen State"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: activeExpr['color'] as Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () => _playAudio(activeExpr['actionAudioKey'] as String),
                            icon: const Icon(Icons.play_arrow_rounded, size: 20),
                            label: const Text("Listen Full Phrase"),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: activeExpr['color'] as Color,
                              side: BorderSide(color: activeExpr['color'] as Color),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // State Selector Dial
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _expressions.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final expr = _expressions[index];
              final isSelected = index == _activeStateIndex;
              return InkWell(
                onTap: () {
                  setState(() => _activeStateIndex = index);
                  _playAudio(expr['audioKey'] as String);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected ? (expr['color'] as Color) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? (expr['color'] as Color) : const Color(0xFFE2E8F0),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        expr['icon'] as IconData,
                        color: isSelected ? Colors.white : (expr['color'] as Color),
                        size: 24,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        (expr['title'] as String).split('(').first.trim(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isSelected ? Colors.white : const Color(0xFF1E293B),
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          // Completion Button
          ElevatedButton.icon(
            onPressed: () {
              _audioService.playSfx(P4SfxType.correct);
              widget.onComplete();
            },
            icon: const Icon(Icons.check_circle_rounded, size: 22),
            label: const Text("Complete Preference Studio", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
