import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5Term1RevisionRallyWidget extends StatefulWidget {
  final int weekNumber;
  final VoidCallback onComplete;

  const P5Term1RevisionRallyWidget({
    super.key,
    required this.weekNumber,
    required this.onComplete,
  });

  @override
  State<P5Term1RevisionRallyWidget> createState() => _P5Term1RevisionRallyWidgetState();
}

class _P5Term1RevisionRallyWidgetState extends State<P5Term1RevisionRallyWidget> {
  final P5AudioService _audioService = P5AudioService();
  int _activeStation = 0;

  final List<Map<String, dynamic>> _stations = [
    {
      'title': 'Station 1: Alphabet & Salutations',
      'icon': Icons.record_voice_over_rounded,
      'color': P5Colors.teal,
      'summary': 'Pronounce French alphabet letter names and exchange time-of-day greetings.',
      'questions': [
        'How do you say "Good morning" and "Good evening" in French?',
        'Spell your first name using authentic French alphabet sounds.',
        'Say "I am doing very well, thank you" in French.',
      ],
      'audio': 'bonjour',
    },
    {
      'title': 'Station 2: Nombres 1 à 60 & Math',
      'icon': Icons.calculate_rounded,
      'color': P5Colors.gold,
      'summary': 'Recite the six tens (10, 20, 30, 40, 50, 60) and solve simple sums.',
      'questions': [
        'Count out loud from 21 to 30 in French.',
        'Solve: Vingt plus cinq font... ?',
        'Solve: Soixante moins dix font... ?',
      ],
      'audio': 'num_60',
    },
    {
      'title': 'Station 3: Présenter les Autres',
      'icon': Icons.people_alt_rounded,
      'color': P5Colors.indigo,
      'summary': 'Introduce your classmate stating name, age, nationality, and personality.',
      'questions': [
        'Introduce a friend: "Voici mon ami(e)..."',
        'State their nationality: "Il/Elle est nigérian(e)"',
        'Describe their character: "Il/Elle est gentil(le)"',
      ],
      'audio': 'il_est_nigerian',
    },
    {
      'title': 'Station 4: Le Corps Humain & La Santé',
      'icon': Icons.local_hospital_rounded,
      'color': P5Colors.green,
      'summary': 'Identify body nodes and express pain using "J\'ai mal à..." contractions.',
      'questions': [
        'Name 4 parts of the head in French.',
        'Doctor asks: "Où avez-vous mal ?" -> Reply with a stomach ache or toothache.',
        'What is the difference between "le bras" and "la jambe"?',
      ],
      'audio': 'jai_mal_au_ventre',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isFinalAssessment = widget.weekNumber == 12;
    final headerTitle = isFinalAssessment
        ? 'Évaluation Orale et Bilan du Premier Trimestre (Week 12)'
        : widget.weekNumber == 5
            ? 'Rallye de Mi-Trimestre (Weeks 1 to 4 Review)'
            : 'Grand Rallye de Révision Générale (Weeks 1 to 10 Review)';

    final currentStation = _stations[_activeStation];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.emoji_events_rounded, color: P5Colors.gold, size: 30),
                  const SizedBox(width: 10),
                  Text(
                    headerTitle,
                    style: P5Text.heading(P5Colors.teal).copyWith(fontSize: 20),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _audioService.playSfx(P5SfxType.celebrate);
                  widget.onComplete();
                },
                icon: const Icon(Icons.star_rounded, color: P5Colors.white),
                label: const Text('Complete Rally', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: P5Colors.green,
                  foregroundColor: P5Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ],
          ),
          const Divider(height: 20),

          // Station Tabs
          Row(
            children: List.generate(_stations.length, (index) {
              final isSel = _activeStation == index;
              final st = _stations[index];
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InkWell(
                    onTap: () {
                      setState(() => _activeStation = index);
                      _audioService.playSfx(P5SfxType.click);
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isSel ? (st['color'] as Color) : P5Colors.cream,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(st['icon'] as IconData, size: 18, color: isSel ? P5Colors.white : P5Colors.charcoal),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              'Station ${index + 1}',
                              style: TextStyle(
                                color: isSel ? P5Colors.white : P5Colors.charcoal,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
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
          const SizedBox(height: 16),

          // Active Station Card
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: (currentStation['color'] as Color).withOpacity(0.08),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: currentStation['color'] as Color, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: currentStation['color'] as Color,
                        child: Icon(currentStation['icon'] as IconData, color: P5Colors.white, size: 24),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentStation['title'] as String, style: P5Text.heading(currentStation['color'] as Color).copyWith(fontSize: 20)),
                            Text(currentStation['summary'] as String, style: P5Text.caption(P5Colors.charcoal).copyWith(fontSize: 13)),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => _audioService.playPhrase(currentStation['audio'] as String, term: 1),
                        icon: const Icon(Icons.volume_up_rounded),
                        label: const Text('Audio Cue'),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Text('Oral Speaking & Assessment Challenges:', style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16)),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: (currentStation['questions'] as List<String>).length,
                      itemBuilder: (context, qIdx) {
                        final q = (currentStation['questions'] as List<String>)[qIdx];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: currentStation['color'] as Color,
                                child: Text('${qIdx + 1}', style: const TextStyle(color: P5Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(q, style: P5Text.body(P5Colors.charcoal).copyWith(fontSize: 15, fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
