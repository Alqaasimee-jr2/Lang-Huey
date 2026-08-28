import 'package:flutter/material.dart';
import '../../models/lesson.dart';
import '../../services/audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import 'widgets/control_bar.dart';
import 'widgets/vocab_item_view.dart';
import 'widgets/check_question_view.dart';

enum PlayerStepMode {
  vocabItem,
  checkQuestion,
}

class LessonPlayerScreen extends StatefulWidget {
  final Lesson lesson;

  const LessonPlayerScreen({
    super.key,
    required this.lesson,
  });

  @override
  State<LessonPlayerScreen> createState() => _LessonPlayerScreenState();
}

class _LessonPlayerScreenState extends State<LessonPlayerScreen> {
  final AudioService _audioService = AudioService();

  PlayerStepMode _mode = PlayerStepMode.vocabItem;
  int _currentItemIndex = 0;
  int _currentQuizIndex = 0;
  bool _isQuizRevealed = false;
  bool _isAudioPlaying = false;
  int _correctCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _playCurrentAudio();
    });
  }

  void _playCurrentAudio() async {
    if (_mode == PlayerStepMode.vocabItem) {
      setState(() => _isAudioPlaying = true);
      final item = widget.lesson.items[_currentItemIndex];
      await _audioService.playAsset(item.audioPath);
      if (mounted) {
        setState(() => _isAudioPlaying = false);
      }
    }
  }

  void _handleNext() {
    _audioService.stop();

    if (_mode == PlayerStepMode.vocabItem) {
      if (_currentItemIndex < widget.lesson.items.length - 1) {
        setState(() {
          _currentItemIndex++;
        });
        _playCurrentAudio();
      } else {
        // Finished all vocab items → transition to Check Question
        setState(() {
          _mode = PlayerStepMode.checkQuestion;
          _currentQuizIndex = 0;
          _isQuizRevealed = false;
        });
      }
    } else if (_mode == PlayerStepMode.checkQuestion) {
      if (!_isQuizRevealed) {
        // Reveal state
        setState(() {
          _isQuizRevealed = true;
        });
      } else {
        // Next question or navigate to Summary
        if (_currentQuizIndex < widget.lesson.checkQuestions.length - 1) {
          setState(() {
            _currentQuizIndex++;
            _isQuizRevealed = false;
          });
        } else {
          // Finished lesson → Navigate to summary screen
          Navigator.pushReplacementNamed(
            context,
            '/summary',
            arguments: {
              'lesson': widget.lesson,
              'correctCount': _correctCount,
            },
          );
        }
      }
    }
  }

  void _handleBack() {
    _audioService.stop();
    if (_mode == PlayerStepMode.checkQuestion) {
      if (_currentQuizIndex > 0) {
        setState(() {
          _currentQuizIndex--;
          _isQuizRevealed = false;
        });
      } else {
        // Return to last vocab item
        setState(() {
          _mode = PlayerStepMode.vocabItem;
          _currentItemIndex = widget.lesson.items.length - 1;
        });
        _playCurrentAudio();
      }
    } else if (_mode == PlayerStepMode.vocabItem && _currentItemIndex > 0) {
      setState(() {
        _currentItemIndex--;
      });
      _playCurrentAudio();
    } else {
      Navigator.pop(context);
    }
  }

  void _handleAnswered(bool isCorrect) {
    if (isCorrect) {
      _correctCount++;
    }
    setState(() {
      _isQuizRevealed = true;
    });
  }

  @override
  void dispose() {
    _audioService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LHColors.dark,
      body: SafeArea(
        child: Column(
          children: [
            // Top Lesson Header
            Container(
              color: LHColors.dark,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close_rounded,
                              color: LHColors.white, size: 32),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            widget.lesson.title,
                            style: LHText.subheading(LHColors.white).copyWith(
                              fontSize: 24,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: LHColors.teal,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'SMARTBOARD PLAYBACK',
                      style: LHText.label(LHColors.white),
                    ),
                  ),
                ],
              ),
            ),

            // Main Active Content Zone
            Expanded(
              child: _buildMainContent(),
            ),

            // Control Bar (Fixed 100px)
            ControlBar(
              onBack: _handleBack,
              onRepeat: _mode == PlayerStepMode.vocabItem
                  ? _playCurrentAudio
                  : null,
              onNext: _handleNext,
              isQuizState: _mode == PlayerStepMode.checkQuestion,
              nextLabel: _mode == PlayerStepMode.checkQuestion && !_isQuizRevealed
                  ? 'REVEAL ANSWER'
                  : (_mode == PlayerStepMode.checkQuestion &&
                          _currentQuizIndex ==
                              widget.lesson.checkQuestions.length - 1 &&
                          _isQuizRevealed
                      ? 'FINISH LESSON ▶'
                      : 'NEXT ▶'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    switch (_mode) {
      case PlayerStepMode.vocabItem:
        return VocabItemView(
          item: widget.lesson.items[_currentItemIndex],
          currentIndex: _currentItemIndex,
          totalItems: widget.lesson.items.length,
          onPlayAudio: _playCurrentAudio,
          isAudioPlaying: _isAudioPlaying,
        );
      case PlayerStepMode.checkQuestion:
        return CheckQuestionView(
          question: widget.lesson.checkQuestions[_currentQuizIndex],
          onAnswered: _handleAnswered,
          isRevealed: _isQuizRevealed,
        );
    }
  }
}
