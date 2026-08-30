import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1ClassroomCommandsWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1ClassroomCommandsWidget({super.key, required this.lesson});

  @override
  State<JSS1ClassroomCommandsWidget> createState() => _JSS1ClassroomCommandsWidgetState();
}

class _JSS1ClassroomCommandsWidgetState extends State<JSS1ClassroomCommandsWidget> {
  final JSS1AudioService _audio = JSS1AudioService();
  int _selectedCommandIndex = 0;
  bool _gameMode = false;
  int _gameScore = 0;
  int _currentChallengeIndex = 0;
  bool? _lastAnswerCorrect;

  final List<Map<String, dynamic>> _gameChallenges = [
    {
      'directive': 'Levez-vous !',
      'meaning': 'Stand up!',
      'audio': 'levez_vous',
      'actionIcon': Icons.accessibility_new_rounded,
      'options': ['Sit down', 'Stand up', 'Open books', 'Be quiet'],
      'correct': 1,
    },
    {
      'directive': 'Ouvrez vos livres !',
      'meaning': 'Open your books!',
      'audio': 'ouvrez_vos_livres',
      'actionIcon': Icons.menu_book_rounded,
      'options': ['Close notebooks', 'Look at board', 'Open your books', 'Repeat after me'],
      'correct': 2,
    },
    {
      'directive': 'Silence, s\'il vous plaît !',
      'meaning': 'Silence, please!',
      'audio': 'silence_sil_vous_plait',
      'actionIcon': Icons.volume_off_rounded,
      'options': ['Stand up', 'Silence please', 'May I go out?', 'Listen attentively'],
      'correct': 1,
    },
    {
      'directive': 'Regardez le tableau !',
      'meaning': 'Look at the board!',
      'audio': 'regardez_le_tableau',
      'actionIcon': Icons.tv_rounded,
      'options': ['Look at the board', 'Write the date', 'Sit down', 'Open notebooks'],
      'correct': 0,
    },
    {
      'directive': 'Asseyez-vous !',
      'meaning': 'Sit down!',
      'audio': 'asseyez_vous',
      'actionIcon': Icons.chair_rounded,
      'options': ['Stand up', 'Close books', 'Sit down', 'Listen carefully'],
      'correct': 2,
    },
  ];

  void _handleGameAnswer(int optionIndex) {
    final challenge = _gameChallenges[_currentChallengeIndex];
    final isCorrect = optionIndex == challenge['correct'];

    setState(() {
      _lastAnswerCorrect = isCorrect;
      if (isCorrect) {
        _gameScore += 20;
        _audio.playCorrect();
      } else {
        _audio.playIncorrect();
      }
    });

    Future.delayed(const Duration(milliseconds: 1400), () {
      if (!mounted) return;
      setState(() {
        _lastAnswerCorrect = null;
        if (_currentChallengeIndex < _gameChallenges.length - 1) {
          _currentChallengeIndex++;
        } else {
          _audio.playCelebrate();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  color: JSS1Colors.teal.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.school_rounded, color: JSS1Colors.teal, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Studio des Ordres de Classe', style: JSS1Text.heading(JSS1Colors.teal)),
                    Text(
                      _gameMode
                          ? 'Jeu "Le Maître Dit" (Simon Says) — Agissez vite !'
                          : 'Cliquez sur une commande pour écouter la prononciation et tester le geste.',
                      style: JSS1Text.caption(JSS1Colors.grey),
                    ),
                  ],
                ),
              ),
              // Mode Toggle
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _gameMode = !_gameMode;
                    _currentChallengeIndex = 0;
                    _gameScore = 0;
                    _lastAnswerCorrect = null;
                  });
                  _audio.playClick();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _gameMode ? JSS1Colors.teal : JSS1Colors.gold,
                  foregroundColor: JSS1Colors.charcoal,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                icon: Icon(_gameMode ? Icons.view_carousel_rounded : Icons.sports_esports_rounded),
                label: Text(
                  _gameMode ? 'Mode Tableau' : 'Lancer le Jeu',
                  style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Main Interactive Area
          Expanded(
            child: _gameMode ? _buildGameView() : _buildExplorerView(),
          ),
        ],
      ),
    );
  }

  Widget _buildExplorerView() {
    final commands = widget.lesson.vocabItems;
    final activeItem = commands.isNotEmpty ? commands[_selectedCommandIndex % commands.length] : null;

    return Row(
      children: [
        // Left Column: Command Cards Grid
        Expanded(
          flex: 6,
          child: GridView.builder(
            itemCount: commands.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final item = commands[index];
              final isSelected = index == _selectedCommandIndex;

              return InkWell(
                onTap: () {
                  setState(() => _selectedCommandIndex = index);
                  _audio.playPhrase(item.audioKey, term: 1);
                },
                borderRadius: BorderRadius.circular(16),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isSelected ? JSS1Colors.white.withValues(alpha: 0.2) : JSS1Colors.teal.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          item.icon,
                          color: isSelected ? JSS1Colors.white : JSS1Colors.teal,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.french,
                              style: JSS1Text.body(isSelected ? JSS1Colors.white : JSS1Colors.charcoal).copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              item.english,
                              style: JSS1Text.caption(isSelected ? JSS1Colors.gold : JSS1Colors.grey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.volume_up_rounded,
                        color: isSelected ? JSS1Colors.gold : JSS1Colors.teal,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(width: 20),

        // Right Column: Live Directive Spotlight Display
        if (activeItem != null)
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [JSS1Colors.teal, Color(0xFF064E52)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/jss1_term1/jss1_classroom_hero.jpg',
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: JSS1Colors.gold.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(activeItem.icon, color: JSS1Colors.gold, size: 40),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    activeItem.french,
                    style: JSS1Text.heading(JSS1Colors.white).copyWith(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '/${activeItem.phonetics}/',
                    style: JSS1Text.phonetic(JSS1Colors.gold).copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    activeItem.english,
                    style: JSS1Text.subheading(JSS1Colors.cream).copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: JSS1Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      activeItem.usageNote,
                      style: JSS1Text.caption(JSS1Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => _audio.playPhrase(activeItem.audioKey, term: 1),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: JSS1Colors.gold,
                      foregroundColor: JSS1Colors.charcoal,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    icon: const Icon(Icons.volume_up_rounded, size: 24),
                    label: Text(
                      'Écouter Prononciation',
                      style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGameView() {
    final challenge = _gameChallenges[_currentChallengeIndex];

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: JSS1Colors.cream,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: JSS1Colors.lightGrey),
      ),
      child: Column(
        children: [
          // Score and Progress Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Défi ${_currentChallengeIndex + 1} / ${_gameChallenges.length}',
                style: JSS1Text.subheading(JSS1Colors.teal),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: JSS1Colors.gold,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.emoji_events_rounded, color: JSS1Colors.charcoal, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Score: $_gameScore pts',
                      style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Central Teacher Command Prompt
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.charcoal.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(challenge['actionIcon'] as IconData, size: 40, color: JSS1Colors.teal),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Le Maître dit :',
                      style: JSS1Text.caption(JSS1Colors.grey).copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      challenge['directive'] as String,
                      style: JSS1Text.heading(JSS1Colors.charcoal).copyWith(fontSize: 28),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                IconButton.filled(
                  onPressed: () => _audio.playPhrase(challenge['audio'] as String, term: 1),
                  icon: const Icon(Icons.volume_up_rounded, size: 28),
                  style: IconButton.styleFrom(
                    backgroundColor: JSS1Colors.teal,
                    foregroundColor: JSS1Colors.white,
                    padding: const EdgeInsets.all(14),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Interactive 4 Options Grid
          Expanded(
            child: GridView.builder(
              itemCount: (challenge['options'] as List).length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final optionText = challenge['options'][index] as String;
                Color btnBg = JSS1Colors.white;
                Color textColor = JSS1Colors.charcoal;

                if (_lastAnswerCorrect != null) {
                  if (index == challenge['correct']) {
                    btnBg = JSS1Colors.green;
                    textColor = JSS1Colors.white;
                  } else {
                    btnBg = JSS1Colors.lightGrey;
                    textColor = JSS1Colors.grey;
                  }
                }

                return ElevatedButton(
                  onPressed: _lastAnswerCorrect != null ? null : () => _handleGameAnswer(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: btnBg,
                    foregroundColor: textColor,
                    elevation: 0,
                    side: BorderSide(
                      color: _lastAnswerCorrect != null && index == challenge['correct']
                          ? JSS1Colors.green
                          : JSS1Colors.lightGrey,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text(
                    optionText,
                    style: JSS1Text.subheading(textColor).copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
