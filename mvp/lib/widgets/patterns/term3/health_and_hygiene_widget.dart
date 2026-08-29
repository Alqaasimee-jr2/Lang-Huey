import 'package:flutter/material.dart';
import '../../../services/p4_audio_service.dart';

/// Bespoke Smartboard Pattern Widget for Week 8: Health & Hygiene Doctor Clinic
class HealthAndHygieneWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const HealthAndHygieneWidget({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<HealthAndHygieneWidget> createState() => _HealthAndHygieneWidgetState();
}

class _HealthAndHygieneWidgetState extends State<HealthAndHygieneWidget> {
  final P4AudioService _audioService = P4AudioService();
  int _activeCategoryIndex = 0; // 0: Ailments (Où as-tu mal?), 1: Hygiene (L'hygiène)

  final List<Map<String, dynamic>> _ailments = [
    {
      'symptom': 'J\'ai mal à la tête',
      'english': 'I have a headache',
      'contraction': 'à + la tête -> à la tête',
      'audioKey': 'jai_mal_a_la_tete',
      'icon': Icons.sick_rounded,
      'color': const Color(0xFFE11D48),
    },
    {
      'symptom': 'J\'ai mal aux dents',
      'english': 'I have a toothache',
      'contraction': 'à + les dents -> aux dents',
      'audioKey': 'jai_mal_aux_dents',
      'icon': Icons.sentiment_very_dissatisfied_rounded,
      'color': const Color(0xFFD97706),
    },
    {
      'symptom': 'J\'ai mal au ventre',
      'english': 'I have a stomachache',
      'contraction': 'à + le ventre -> au ventre',
      'audioKey': 'jai_mal_au_ventre',
      'icon': Icons.healing_rounded,
      'color': const Color(0xFF0D7377),
    },
    {
      'symptom': 'J\'ai mal au pied',
      'english': 'My foot hurts',
      'contraction': 'à + le pied -> au pied',
      'audioKey': 'jai_mal_au_pied',
      'icon': Icons.do_not_step_rounded,
      'color': const Color(0xFF0284C7),
    },
  ];

  final List<Map<String, dynamic>> _hygieneHabits = [
    {
      'habit': 'Se laver les mains',
      'english': 'To wash one\'s hands',
      'advice': 'Avant chaque repas et après les jeux',
      'audioKey': 'se_laver_les_mains',
      'icon': Icons.wash_rounded,
      'color': const Color(0xFF10B981),
    },
    {
      'habit': 'Se brosser les dents',
      'english': 'To brush one\'s teeth',
      'advice': 'Deux fois par jour (Matin et soir)',
      'audioKey': 'se_brosser_les_dents',
      'icon': Icons.clean_hands_rounded,
      'color': const Color(0xFF14BDCC),
    },
    {
      'habit': 'En bonne santé',
      'english': 'In good health / Healthy',
      'advice': 'Manger des fruits et boire de l\'eau',
      'audioKey': 'en_bonne_sante',
      'icon': Icons.favorite_rounded,
      'color': const Color(0xFFD97706),
    },
    {
      'habit': 'Soigne-toi bien !',
      'english': 'Get well soon!',
      'advice': 'Parole d\'encouragement du docteur',
      'audioKey': 'soigne_toi_bien',
      'icon': Icons.medical_services_rounded,
      'color': const Color(0xFF6366F1),
    },
  ];

  void _playAudio(String key) {
    _audioService.playPhrase(key, term: 3);
  }

  @override
  Widget build(BuildContext context) {
    final activeList = _activeCategoryIndex == 0 ? _ailments : _hygieneHabits;

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
                  child: const Icon(Icons.medical_services_rounded, color: Colors.white, size: 36),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "LA SANTÉ ET L'HYGIÈNE · DOCTOR CLINIC & WELL-BEING",
                        style: TextStyle(
                          color: Color(0xFFF4A832),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Chez le Docteur",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Learn to express physical pain (\"J'ai mal à...\") and practice healthy hygiene routines!",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _playAudio('ou_as_tu_mal'),
                  icon: const Icon(Icons.volume_up_rounded, size: 20),
                  label: const Text("Doctor: \"Où as-tu mal ?\""),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF4A832),
                    foregroundColor: const Color(0xFF1C1C1C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Category Toggle Switch
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => setState(() => _activeCategoryIndex = 0),
                  icon: const Icon(Icons.sick_rounded),
                  label: const Text("1. Exprimer la Douleur (Aches & Pain)", style: TextStyle(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _activeCategoryIndex == 0 ? const Color(0xFF0D7377) : Colors.white,
                    foregroundColor: _activeCategoryIndex == 0 ? Colors.white : const Color(0xFF1E293B),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(
                      color: _activeCategoryIndex == 0 ? const Color(0xFF0D7377) : const Color(0xFFE2E8F0),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => setState(() => _activeCategoryIndex = 1),
                  icon: const Icon(Icons.clean_hands_rounded),
                  label: const Text("2. Habitudes d'Hygiène (Hygiene Habits)", style: TextStyle(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _activeCategoryIndex == 1 ? const Color(0xFF0D7377) : Colors.white,
                    foregroundColor: _activeCategoryIndex == 1 ? Colors.white : const Color(0xFF1E293B),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(
                      color: _activeCategoryIndex == 1 ? const Color(0xFF0D7377) : const Color(0xFFE2E8F0),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Cards Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: activeList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
            ),
            itemBuilder: (context, index) {
              final card = activeList[index];
              final mainText = _activeCategoryIndex == 0 ? card['symptom'] as String : card['habit'] as String;
              final subText = _activeCategoryIndex == 0 ? card['contraction'] as String : card['advice'] as String;

              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: (card['color'] as Color).withValues(alpha: 0.25), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: (card['color'] as Color).withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(card['icon'] as IconData, color: card['color'] as Color, size: 28),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            mainText,
                            style: const TextStyle(
                              color: Color(0xFF1E293B),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            card['english'] as String,
                            style: const TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subText,
                            style: TextStyle(
                              color: card['color'] as Color,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => _playAudio(card['audioKey'] as String),
                      icon: Icon(Icons.volume_up_rounded, color: card['color'] as Color),
                      tooltip: "Listen Audio",
                    ),
                  ],
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
            label: const Text("Complete Clinic Lab & Proceed", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
