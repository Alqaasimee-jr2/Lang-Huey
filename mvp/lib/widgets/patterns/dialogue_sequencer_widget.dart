import 'package:flutter/material.dart';
import '../../models/p4_lesson_model.dart';
import '../../services/p4_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

/// Week 9 Pattern: Step-by-Step Complete French Conversation Flow Builder
class DialogueSequencerWidget extends StatefulWidget {
  final P4Lesson lesson;

  const DialogueSequencerWidget({super.key, required this.lesson});

  @override
  State<DialogueSequencerWidget> createState() => _DialogueSequencerWidgetState();
}

class _DialogueSequencerWidgetState extends State<DialogueSequencerWidget> {
  int _activeStepIndex = 0;

  final List<Map<String, dynamic>> _steps = [
    {
      'step': 1,
      'title': '1. Polite Greeting (Saluer)',
      'speakerA': 'Kofi: "Bonjour, Amina !"',
      'speakerB': 'Amina: "Bonjour, Kofi ! Comment ça va ?"',
      'meaning': 'Start with a friendly, respectful greeting and inquire about well-being.',
      'badge': 'Start of Conversation',
      'icon': Icons.waving_hand_rounded,
      'audio': 'bonjour',
    },
    {
      'step': 2,
      'title': '2. Response & Exchange (Échanger)',
      'speakerA': 'Kofi: "Ça va très bien, merci. Et toi ?"',
      'speakerB': 'Amina: "Moi aussi, ça va bien !"',
      'meaning': 'Reply with gratitude ("merci") and ask about the other person.',
      'badge': 'Well-being Exchange',
      'icon': Icons.forum_rounded,
      'audio': 'tres_bien_merci',
    },
    {
      'step': 3,
      'title': '3. Gratitude on Departure (Remercier)',
      'speakerA': 'Kofi: "Je dois partir. Merci beaucoup pour ton aide !"',
      'speakerB': 'Amina: "De rien, mon ami !"',
      'meaning': 'State reason for leaving and express sincere gratitude ("Merci beaucoup !").',
      'badge': 'Gratitude & Departure',
      'icon': Icons.volunteer_activism_rounded,
      'audio': 'merci_pour_tout',
    },
    {
      'step': 4,
      'title': '4. Farewell & Well-Wish (Prendre congé)',
      'speakerA': 'Kofi: "Au revoir et bonne journée !"',
      'speakerB': 'Amina: "À demain, Kofi ! Bon après-midi !"',
      'meaning': 'Conclude with a clear goodbye and a warm wish for the day.',
      'badge': 'Final Farewell',
      'icon': Icons.sentiment_satisfied_alt_rounded,
      'audio': 'bonne_journee',
    },
  ];

  void _playAudio(String? key) {
    if (key != null && key.isNotEmpty) {
      P4AudioService().playPhrase(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    final active = _steps[_activeStepIndex];

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Conversation Sequencer',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Follow the 4-step sequence from greeting to departure gratitude and farewell',
                    style: LHText.body(LHColors.grey).copyWith(fontSize: 15),
                  ),
                ],
              ),
              IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                onPressed: () => _playAudio(active['audio'] as String?),
              ),
            ],
          ),

          const Divider(height: 20),

          // 4 Stepper Tabs
          Row(
            children: List.generate(_steps.length, (idx) {
              final s = _steps[idx];
              final isCurrent = idx == _activeStepIndex;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: idx < _steps.length - 1 ? 12 : 0),
                  child: Material(
                    color: isCurrent ? LHColors.teal : LHColors.cream,
                    borderRadius: BorderRadius.circular(14),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        setState(() => _activeStepIndex = idx);
                        _playAudio(s['audio'] as String?);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Center(
                          child: Text(
                            s['title'] as String,
                            style: LHText.body(isCurrent ? LHColors.white : LHColors.charcoal).copyWith(
                              fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w600,
                              fontSize: 13,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 20),

          // Main Step Stage
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: LHColors.cream,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: LHColors.teal.withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: LHColors.teal,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'STAGE ${active['step']} · ${(active['badge'] as String).toUpperCase()}',
                          style: LHText.label(LHColors.white).copyWith(fontSize: 12),
                        ),
                      ),
                      Text(
                        active['meaning'] as String,
                        style: LHText.body(LHColors.charcoal).copyWith(fontSize: 14, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),

                  // Speaker A Dialogue Bubble
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: LHColors.turquoise, width: 2),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: LHColors.teal,
                          child: Text('K', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            active['speakerA'] as String,
                            style: LHText.heading(LHColors.teal).copyWith(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Speaker B Dialogue Bubble
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: LHColors.gold, width: 2),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: LHColors.gold,
                          child: Text('A', style: TextStyle(color: LHColors.charcoal, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            active['speakerB'] as String,
                            style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Stepper Navigation Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        icon: const Icon(Icons.arrow_back_rounded, color: LHColors.teal),
                        label: Text('Previous Step', style: LHText.body(LHColors.teal).copyWith(fontWeight: FontWeight.bold)),
                        onPressed: _activeStepIndex > 0
                            ? () {
                                setState(() => _activeStepIndex--);
                                _playAudio(_steps[_activeStepIndex]['audio'] as String?);
                              }
                            : null,
                      ),
                      Material(
                        color: LHColors.gold,
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: _activeStepIndex < _steps.length - 1
                              ? () {
                                  setState(() => _activeStepIndex++);
                                  _playAudio(_steps[_activeStepIndex]['audio'] as String?);
                                }
                              : null,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Row(
                              children: [
                                Text(
                                  _activeStepIndex < _steps.length - 1 ? 'Next Step' : 'Sequence Complete',
                                  style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 15, fontWeight: FontWeight.w800),
                                ),
                                const SizedBox(width: 6),
                                const Icon(Icons.arrow_forward_rounded, color: LHColors.charcoal, size: 18),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
