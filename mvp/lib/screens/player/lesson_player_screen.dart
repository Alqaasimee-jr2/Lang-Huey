import 'package:flutter/material.dart';
import '../../models/lesson.dart';
import '../../services/audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import 'widgets/teacher_cue_bar.dart';
import 'widgets/control_bar.dart';
import 'widgets/vocab_item_view.dart';
import 'widgets/check_question_view.dart';

enum PlayerStepMode {
  introCue,
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

  PlayerStepMode _mode = PlayerStepMode.introCue;
  int _currentItemIndex = 0;
  int _currentQuizIndex = 0;
  bool _isQuizRevealed = false;
  bool _isAudioPlaying = false;
  String _activeTeacherCue = '';
  int _correctCount = 0;

  @override
  void initState() {
    super.initState();
    _activeTeacherCue = widget.lesson.teacherIntroCue;
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

    if (_mode == PlayerStepMode.introCue) {
      setState(() {
        _mode = PlayerStepMode.vocabItem;
        _currentItemIndex = 0;
        _activeTeacherCue = widget.lesson.items[0].teacherCue;
      });
      _playCurrentAudio();
    } else if (_mode == PlayerStepMode.vocabItem) {
      if (_currentItemIndex < widget.lesson.items.length - 1) {
        setState(() {
          _currentItemIndex++;
          _activeTeacherCue = widget.lesson.items[_currentItemIndex].teacherCue;
        });
        _playCurrentAudio();
      } else {
        // Finished all vocab items → transition to Check Question
        setState(() {
          _mode = PlayerStepMode.checkQuestion;
          _currentQuizIndex = 0;
          _isQuizRevealed = false;
          _activeTeacherCue =
              widget.lesson.checkQuestions[0].teacherCue;
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
            _activeTeacherCue =
                widget.lesson.checkQuestions[_currentQuizIndex].teacherCue;
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
    if (_mode == PlayerStepMode.vocabItem && _currentItemIndex > 0) {
      setState(() {
        _currentItemIndex--;
        _activeTeacherCue = widget.lesson.items[_currentItemIndex].teacherCue;
      });
      _playCurrentAudio();
    } else if (_mode == PlayerStepMode.checkQuestion && _currentQuizIndex > 0) {
      setState(() {
        _currentQuizIndex--;
        _isQuizRevealed = false;
        _activeTeacherCue =
            widget.lesson.checkQuestions[_currentQuizIndex].teacherCue;
      });
    } else {
      Navigator.pop(context);
    }
  }

  void _handleAnswered(bool isCorrect, String feedbackCue) {
    if (isCorrect) {
      _correctCount++;
    }
    setState(() {
      _isQuizRevealed = true;
      _activeTeacherCue = feedbackCue;
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
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close_rounded,
                            color: LHColors.white, size: 32),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        widget.lesson.title,
                        style: LHText.subheading(LHColors.white).copyWith(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
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

            // Teacher Cue Bar (Fixed 120px)
            TeacherCueBar(cueText: _activeTeacherCue),

            // Control Bar (Fixed 100px)
            ControlBar(
              onBack: _handleBack,
              onRepeat: _mode == PlayerStepMode.vocabItem
                  ? _playCurrentAudio
                  : null,
              onNext: _handleNext,
              isQuizState: _mode == PlayerStepMode.checkQuestion,
              nextLabel: _mode == PlayerStepMode.introCue
                  ? 'START LESSON ▶'
                  : (_mode == PlayerStepMode.checkQuestion && !_isQuizRevealed
                      ? 'REVEAL ANSWER'
                      : 'NEXT ▶'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    switch (_mode) {
      case PlayerStepMode.introCue:
        return _buildIntroCueView();
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

  Widget _buildIntroCueView() {
    return Center(
      child: Container(
        maxWidth: 840,
        padding: const EdgeInsets.all(48),
        decoration: BoxDecoration(
          color: LHColors.teal.withOpacity(0.15),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: LHColors.turquoise.withOpacity(0.4)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.co_present_rounded,
              size: 88,
              color: LHColors.turquoise,
            ),
            const SizedBox(height: 24),
            Text(
              'Teacher Briefing Note',
              style: LHText.subheading(LHColors.turquoise),
            ),
            const SizedBox(height: 16),
            Text(
              widget.lesson.teacherIntroCue,
              textAlign: TextAlign.center,
              style: LHText.heading(LHColors.white).copyWith(
                fontSize: 36,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Press "START LESSON" below when ready to display vocabulary to the class.',
              textAlign: TextAlign.center,
              style: LHText.body(LHColors.white.withOpacity(0.7)),
            ),
          ],
        ),
      ),
    );
  }
}
