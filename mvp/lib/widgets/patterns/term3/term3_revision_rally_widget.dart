import 'package:flutter/material.dart';
import '../../../services/p4_audio_service.dart';

/// Bespoke Smartboard Pattern Widget for Weeks 5, 11 & 12: Term 3 Master Revision Rally
class Term3RevisionRallyWidget extends StatefulWidget {
  final int weekNumber;
  final VoidCallback onComplete;

  const Term3RevisionRallyWidget({
    Key? key,
    required this.weekNumber,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<Term3RevisionRallyWidget> createState() => _Term3RevisionRallyWidgetState();
}

class _Term3RevisionRallyWidgetState extends State<Term3RevisionRallyWidget> {
  final P4AudioService _audioService = P4AudioService();
  int _selectedCategoryIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {
      'title': '1. L\'HEURE ET LA ROUTINE',
      'subtitle': 'Telling Time & Daily Routine',
      'color': const Color(0xFF0D7377),
      'icon': Icons.access_time_filled_rounded,
      'questions': [
        {'q': 'Quelle heure est-il à 1:00 ?', 'a': 'Il est une heure.', 'audioKey': 'il_est_une_heure'},
        {'q': 'Comment dit-on 12:00 PM ?', 'a': 'Il est midi.', 'audioKey': 'il_est_midi'},
        {'q': 'À quelle heure te réveilles-tu ?', 'a': 'À six heures, je me réveille.', 'audioKey': 'je_me_reveille'},
      ],
    },
    {
      'title': '2. LES REPAS ET LA FAIM',
      'subtitle': 'Food, Meals & Hunger',
      'color': const Color(0xFFD97706),
      'icon': Icons.restaurant_rounded,
      'questions': [
        {'q': 'Quels sont les 3 repas ?', 'a': 'Le petit déjeuner, le déjeuner, et le dîner.', 'audioKey': 'le_repas'},
        {'q': 'Comment dit-on "I am hungry" ?', 'a': 'J\'ai faim !', 'audioKey': 'jai_faim'},
        {'q': 'Comment dit-on "I am thirsty" ?', 'a': 'J\'ai soif !', 'audioKey': 'jai_soif'},
      ],
    },
    {
      'title': '3. LE CORPS ET LA SANTÉ',
      'subtitle': 'Body Anatomy & Health',
      'color': const Color(0xFFE11D48),
      'icon': Icons.accessibility_new_rounded,
      'questions': [
        {'q': 'Comment dit-on "The head" ?', 'a': 'La tête.', 'audioKey': 'la_tete'},
        {'q': 'Comment dit-on "The eyes" ?', 'a': 'Les yeux (singulier: l\'œil).', 'audioKey': 'les_yeux'},
        {'q': 'Où as-tu mal si la tête te fait mal ?', 'a': 'J\'ai mal à la tête.', 'audioKey': 'jai_mal_a_la_tete'},
      ],
    },
    {
      'title': '4. LES HABITS ET LA MÉTÉO',
      'subtitle': 'Clothes, Weather & Seasons',
      'color': const Color(0xFF0284C7),
      'icon': Icons.cloud_rounded,
      'questions': [
        {'q': 'Que portes-tu aujourd\'hui ?', 'a': 'Je porte une chemise et un pantalon.', 'audioKey': 'une_chemise_blanche'},
        {'q': 'Quel temps fait-il s\'il y a du soleil ?', 'a': 'Il fait beau / Il fait chaud.', 'audioKey': 'il_fait_beau'},
        {'q': 'Comment dit-on "It is raining" ?', 'a': 'Il pleut.', 'audioKey': 'il_pleut'},
      ],
    },
  ];

  void _playAudio(String key) {
    _audioService.playPhrase(key, term: 3);
  }

  @override
  Widget build(BuildContext context) {
    final activeCat = _categories[_selectedCategoryIndex];
    final questions = activeCat['questions'] as List<Map<String, dynamic>>;

    final rallyTitle = widget.weekNumber == 5
        ? "RÉVISION DU MI-TRIMESTRE · WEEKS 1–4 RECAP"
        : widget.weekNumber == 11
            ? "GRANDE RÉVISION ANNUELLE · TERMS 1, 2 & 3"
            : "BILAN ANNUEL ET ÉVALUATION ORALE";

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Card
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
                  child: const Icon(Icons.flash_on_rounded, color: Colors.white, size: 36),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rallyTitle,
                        style: const TextStyle(
                          color: Color(0xFFF4A832),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Rallye Oral de Révision",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Tap each category to run fast-paced oral speed drills with the whole class!",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _playAudio('bonne_chance'),
                  icon: const Icon(Icons.volume_up_rounded, size: 20),
                  label: const Text("Bonne chance !"),
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

          // Category Bar
          Row(
            children: List.generate(_categories.length, (index) {
              final cat = _categories[index];
              final isSelected = index == _selectedCategoryIndex;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: index < _categories.length - 1 ? 10 : 0),
                  child: InkWell(
                    onTap: () => setState(() => _selectedCategoryIndex = index),
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? (cat['color'] as Color) : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected ? (cat['color'] as Color) : const Color(0xFFE2E8F0),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            cat['icon'] as IconData,
                            color: isSelected ? Colors.white : (cat['color'] as Color),
                            size: 24,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cat['title'] as String,
                            textAlign: TextAlign.center,
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
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),

          // Questions List in Active Category
          Column(
            children: List.generate(questions.length, (qIndex) {
              final item = questions[qIndex];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: (activeCat['color'] as Color).withValues(alpha: 0.25), width: 1.5),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: (activeCat['color'] as Color).withValues(alpha: 0.12),
                      child: Text(
                        "${qIndex + 1}",
                        style: TextStyle(
                          color: activeCat['color'] as Color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['q'] as String,
                            style: const TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['a'] as String,
                            style: const TextStyle(
                              color: Color(0xFF1E293B),
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => _playAudio(item['audioKey'] as String),
                      icon: Icon(Icons.volume_up_rounded, color: activeCat['color'] as Color),
                      tooltip: "Listen Answer",
                    ),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(height: 20),

          // Completion Button
          ElevatedButton.icon(
            onPressed: () {
              _audioService.playSfx(P4SfxType.celebrate);
              widget.onComplete();
            },
            icon: const Icon(Icons.check_circle_rounded, size: 22),
            label: const Text("Complete Oral Rally & Continue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
