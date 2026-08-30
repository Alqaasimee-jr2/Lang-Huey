import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1GreetingStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1GreetingStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1GreetingStudioWidget> createState() => _JSS1GreetingStudioWidgetState();
}

class _JSS1GreetingStudioWidgetState extends State<JSS1GreetingStudioWidget> {
  final JSS1AudioService _audio = JSS1AudioService();
  int _timeOfDayIndex = 0; // 0: Matin (Morning), 1: Après-midi (Afternoon), 2: Soir (Evening)

  final List<Map<String, dynamic>> _dialogueScenarios = [
    {
      'title': 'Le Matin à l\'École (Formal: Student to Teacher)',
      'time': '08:00',
      'lines': [
        {'speaker': 'Élève', 'text': 'Bonjour, Madame ! Comment allez-vous ?', 'audio': 'bonjour_monsieur_madame'},
        {'speaker': 'Professeur', 'text': 'Bonjour ! Très bien, merci. Et toi ?', 'audio': 'tres_bien_merci_et_vous'},
        {'speaker': 'Élève', 'text': 'Ça va très bien, merci beaucoup !', 'audio': 'tres_bien_merci_et_vous'},
      ],
    },
    {
      'title': 'Dans la Cour de Récréation (Informal: Friend to Friend)',
      'time': '12:30',
      'lines': [
        {'speaker': 'Kola', 'text': 'Salut Tunde ! Comment vas-tu ?', 'audio': 'comment_vas_tu'},
        {'speaker': 'Tunde', 'text': 'Salut ! Ça va super bien, et toi ?', 'audio': 'salut'},
        {'speaker': 'Kola', 'text': 'Enchanté de te voir aujourd\'hui !', 'audio': 'enchante'},
      ],
    },
    {
      'title': 'Fin des Cours (Farewells & Politeness)',
      'time': '16:00',
      'lines': [
        {'speaker': 'Élève', 'text': 'Merci pour la leçon, Madame ! S\'il vous plaît, à demain !', 'audio': 'sil_vous_plait_de_rien'},
        {'speaker': 'Professeur', 'text': 'De rien ! Au revoir et à demain !', 'audio': 'au_revoir_et_a_demain'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final scenario = _dialogueScenarios[_timeOfDayIndex];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: JSS1Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: JSS1Colors.charcoal.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Bar
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: JSS1Colors.gold.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.waving_hand_rounded, color: JSS1Colors.gold, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Studio de Salutations & Politesse', style: JSS1Text.heading(JSS1Colors.teal)),
                    Text(
                      'Explorez les registres formel vs informel et écoutez les dialogues en situation réelle.',
                      style: JSS1Text.caption(JSS1Colors.grey),
                    ),
                  ],
                ),
              ),
              // Category Segmented Bar
              Container(
                decoration: BoxDecoration(
                  color: JSS1Colors.cream,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    _buildTabButton(0, 'Matin (Formal)', Icons.wb_sunny_rounded),
                    _buildTabButton(1, 'Midi (Informal)', Icons.people_rounded),
                    _buildTabButton(2, 'Soir (Départ)', Icons.nightlight_round),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Main View: 2 Columns
          Expanded(
            child: Row(
              children: [
                // Left Column: Vocabulary Quick Grid
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expressions Clés de la Semaine', style: JSS1Text.subheading(JSS1Colors.charcoal)),
                      const SizedBox(height: 12),
                      Expanded(
                        child: ListView.separated(
                          itemCount: widget.lesson.vocabItems.length,
                          separatorBuilder: (c, i) => const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final item = widget.lesson.vocabItems[index];
                            return InkWell(
                              onTap: () => _audio.playPhrase(item.audioKey, term: 1),
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  color: JSS1Colors.cream,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: JSS1Colors.lightGrey),
                                ),
                                child: Row(
                                  children: [
                                    Icon(item.icon, color: JSS1Colors.teal, size: 22),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(item.french, style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800)),
                                          Text(item.english, style: JSS1Text.caption(JSS1Colors.grey)),
                                        ],
                                      ),
                                    ),
                                    const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal, size: 20),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 24),

                // Right Column: Interactive Roleplay Simulator
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: JSS1Colors.cream,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: JSS1Colors.lightGrey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                scenario['title'] as String,
                                style: JSS1Text.subheading(JSS1Colors.teal),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: JSS1Colors.gold,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(scenario['time'] as String, style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/jss1_term1/jss1_greetings_dialogue.jpg',
                            height: 85,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (c, e, s) => const SizedBox.shrink(),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: ListView.separated(
                            itemCount: (scenario['lines'] as List).length,
                            separatorBuilder: (c, i) => const SizedBox(height: 12),
                            itemBuilder: (context, idx) {
                              final line = scenario['lines'][idx] as Map<String, dynamic>;
                              final isTeacher = line['speaker'] == 'Professeur';

                              return Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: isTeacher ? JSS1Colors.teal : JSS1Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: JSS1Colors.charcoal.withValues(alpha: 0.04),
                                      blurRadius: 6,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: isTeacher ? JSS1Colors.gold : JSS1Colors.teal.withValues(alpha: 0.1),
                                      foregroundColor: isTeacher ? JSS1Colors.charcoal : JSS1Colors.teal,
                                      child: Text(
                                        (line['speaker'] as String)[0],
                                        style: const TextStyle(fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            line['speaker'] as String,
                                            style: JSS1Text.caption(isTeacher ? JSS1Colors.gold : JSS1Colors.teal).copyWith(fontWeight: FontWeight.w800),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            line['text'] as String,
                                            style: JSS1Text.body(isTeacher ? JSS1Colors.white : JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => _audio.playPhrase(line['audio'] as String, term: 1),
                                      icon: Icon(
                                        Icons.volume_up_rounded,
                                        color: isTeacher ? JSS1Colors.gold : JSS1Colors.teal,
                                      ),
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
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index, String label, IconData icon) {
    final isSelected = _timeOfDayIndex == index;
    return InkWell(
      onTap: () {
        setState(() => _timeOfDayIndex = index);
        _audio.playClick();
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? JSS1Colors.teal : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: isSelected ? JSS1Colors.white : JSS1Colors.grey),
            const SizedBox(width: 6),
            Text(
              label,
              style: JSS1Text.caption(isSelected ? JSS1Colors.white : JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
