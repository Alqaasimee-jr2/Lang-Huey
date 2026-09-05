import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/p5_lesson_model.dart';
import '../../services/p5_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class P5InteractiveDrillEngineWidget extends StatefulWidget {
  final List<P5InteractiveExercise> drills;
  final int term;
  final VoidCallback onComplete;

  const P5InteractiveDrillEngineWidget({
    super.key,
    required this.drills,
    required this.term,
    required this.onComplete,
  });

  @override
  State<P5InteractiveDrillEngineWidget> createState() => _P5InteractiveDrillEngineWidgetState();
}

class _P5InteractiveDrillEngineWidgetState extends State<P5InteractiveDrillEngineWidget> {
  final P5AudioService _audioService = P5AudioService();
  int _currentDrillIndex = 0;
  int _score = 0;

  // Single choice / True-False / Story state
  int? _selectedOptionIndex;

  // Pair match state
  String? _selectedFrenchPair;
  String? _selectedEnglishPair;
  final Set<String> _matchedPairs = {};
  List<String> _shuffledEnglishPairs = [];

  // Fill Gap state
  String? _selectedGapWord;

  // Sentence builder state
  List<String> _sentenceTray = [];
  List<String> _availableWords = [];

  // Status
  bool _hasChecked = false;
  bool _isAnswerCorrect = false;

  @override
  void initState() {
    super.initState();
    _initDrillState();
  }

  void _initDrillState() {
    _selectedOptionIndex = null;
    _selectedFrenchPair = null;
    _selectedEnglishPair = null;
    _matchedPairs.clear();
    _selectedGapWord = null;
    _sentenceTray.clear();
    _availableWords.clear();
    _hasChecked = false;
    _isAnswerCorrect = false;

    if (_currentDrillIndex < widget.drills.length) {
      final drill = widget.drills[_currentDrillIndex];

      // Play audio cue if present
      if (drill.audioKey != null && drill.audioKey!.isNotEmpty) {
        _audioService.playPhrase(drill.audioKey!, term: widget.term);
      }

      if (drill.type == DrillType.pairMatch && drill.pairs != null && drill.pairs!.isNotEmpty) {
        _shuffledEnglishPairs = drill.pairs!.map((p) => p.english).toList()..shuffle(Random());
      } else if (drill.type == DrillType.sentenceBuilder && drill.wordBank != null) {
        _availableWords = List<String>.from(drill.wordBank!)..shuffle(Random());
      }
    }
  }

  void _checkAnswer() {
    if (_hasChecked) return;
    final drill = widget.drills[_currentDrillIndex];
    bool correct = false;

    switch (drill.type) {
      case DrillType.singleChoice:
      case DrillType.trueFalse:
      case DrillType.storyComprehension:
      case DrillType.listenAudio:
        correct = _selectedOptionIndex == drill.correctOptionIndex;
        break;
      case DrillType.pairMatch:
        correct = drill.pairs != null && _matchedPairs.length == drill.pairs!.length;
        break;
      case DrillType.fillGap:
        correct = _selectedGapWord != null && _selectedGapWord == drill.correctWord;
        break;
      case DrillType.sentenceBuilder:
        if (drill.correctSentenceOrder != null) {
          correct = _sentenceTray.join(' ') == drill.correctSentenceOrder!.join(' ');
        }
        break;
    }

    setState(() {
      _hasChecked = true;
      _isAnswerCorrect = correct;
      if (correct) _score++;
    });

    _audioService.playSfx(correct ? P5SfxType.correct : P5SfxType.incorrect);
  }

  void _nextDrill() {
    if (_currentDrillIndex < widget.drills.length - 1) {
      setState(() {
        _currentDrillIndex++;
        _initDrillState();
      });
    } else {
      _audioService.playSfx(P5SfxType.celebrate);
      widget.onComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.drills.isEmpty) {
      return Center(
        child: Text('No interactive drills available.', style: P5Text.body(P5Colors.charcoal)),
      );
    }

    final drill = widget.drills[_currentDrillIndex];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: P5Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Drill Navigation Bar
          _buildDrillHeader(drill),
          const Divider(height: 20),

          // Main Drill Body
          Expanded(
            child: _buildDrillContent(drill),
          ),

          // Bottom Validation Bar
          _buildBottomFeedbackBar(drill),
        ],
      ),
    );
  }

  Widget _buildDrillHeader(P5InteractiveExercise drill) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: P5Colors.teal,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Drill ${_currentDrillIndex + 1} of ${widget.drills.length}',
                style: const TextStyle(color: P5Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: P5Colors.gold.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: P5Colors.gold),
              ),
              child: Text(
                _getDrillTypeLabel(drill.type),
                style: const TextStyle(color: P5Colors.charcoal, fontWeight: FontWeight.w800, fontSize: 12),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.star_rounded, color: P5Colors.gold, size: 22),
            const SizedBox(width: 4),
            Text(
              'Score: $_score / ${_currentDrillIndex + (_hasChecked && _isAnswerCorrect ? 0 : (_hasChecked ? 1 : 0))}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: P5Colors.charcoal),
            ),
          ],
        ),
      ],
    );
  }

  String _getDrillTypeLabel(DrillType type) {
    switch (type) {
      case DrillType.singleChoice:
        return 'Tap Translation';
      case DrillType.pairMatch:
        return 'Match the Pairs';
      case DrillType.fillGap:
        return 'Fill in the Blank';
      case DrillType.sentenceBuilder:
        return 'Sentence Builder';
      case DrillType.trueFalse:
        return 'True or False';
      case DrillType.storyComprehension:
        return 'Story Comprehension';
      case DrillType.listenAudio:
        return 'Listen & Choose';
    }
  }

  Widget _buildDrillContent(P5InteractiveExercise drill) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // English Prompt
        Text(
          drill.prompt,
          style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),

        // French Stimulus card (if present)
        if (drill.frenchStimulus != null && drill.frenchStimulus!.isNotEmpty) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: P5Colors.cream,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: P5Colors.turquoise.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (drill.audioKey != null && drill.audioKey!.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.volume_up_rounded, color: P5Colors.teal, size: 24),
                    onPressed: () => _audioService.playPhrase(drill.audioKey!, term: widget.term),
                  ),
                Flexible(
                  child: Text(
                    drill.frenchStimulus!,
                    style: P5Text.frenchPhrase(P5Colors.teal).copyWith(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
        ],

        // Specific Drill Mechanics View
        Expanded(
          child: _buildDrillSpecificInteractiveView(drill),
        ),
      ],
    );
  }

  Widget _buildDrillSpecificInteractiveView(P5InteractiveExercise drill) {
    switch (drill.type) {
      case DrillType.singleChoice:
      case DrillType.trueFalse:
      case DrillType.storyComprehension:
      case DrillType.listenAudio:
        return _buildOptionsList(drill);
      case DrillType.pairMatch:
        return _buildPairMatchView(drill);
      case DrillType.fillGap:
        return _buildFillGapView(drill);
      case DrillType.sentenceBuilder:
        return _buildSentenceBuilderView(drill);
    }
  }

  Widget _buildOptionsList(P5InteractiveExercise drill) {
    return ListView.builder(
      itemCount: drill.options.length,
      itemBuilder: (context, index) {
        final isSelected = _selectedOptionIndex == index;
        final isCorrect = index == drill.correctOptionIndex;

        Color bg = P5Colors.cream;
        Color borderColor = P5Colors.lightGrey;
        if (_hasChecked) {
          if (isCorrect) {
            bg = P5Colors.green.withOpacity(0.2);
            borderColor = P5Colors.green;
          } else if (isSelected) {
            bg = P5Colors.red.withOpacity(0.2);
            borderColor = P5Colors.red;
          }
        } else if (isSelected) {
          bg = P5Colors.turquoise.withOpacity(0.25);
          borderColor = P5Colors.teal;
        }

        return Card(
          color: bg,
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: borderColor, width: 1.8),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: _hasChecked
                ? null
                : () {
                    setState(() => _selectedOptionIndex = index);
                    _audioService.playSfx(P5SfxType.click);
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: isSelected ? P5Colors.teal : P5Colors.white,
                    child: Text(
                      String.fromCharCode(65 + index),
                      style: TextStyle(
                        color: isSelected ? P5Colors.white : P5Colors.charcoal,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      drill.options[index],
                      style: P5Text.body(P5Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  if (_hasChecked && isCorrect)
                    const Icon(Icons.check_circle_rounded, color: P5Colors.green, size: 22)
                  else if (_hasChecked && isSelected && !isCorrect)
                    const Icon(Icons.cancel_rounded, color: P5Colors.red, size: 22),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPairMatchView(P5InteractiveExercise drill) {
    if (drill.pairs == null || drill.pairs!.isEmpty) return const SizedBox.shrink();

    return Row(
      children: [
        // French Column
        Expanded(
          child: ListView.builder(
            itemCount: drill.pairs!.length,
            itemBuilder: (context, index) {
              final pair = drill.pairs![index];
              final isMatched = _matchedPairs.contains(pair.french);
              final isSelected = _selectedFrenchPair == pair.french;

              Color bg = P5Colors.cream;
              Color border = P5Colors.lightGrey;
              if (isMatched) {
                bg = P5Colors.green.withOpacity(0.2);
                border = P5Colors.green;
              } else if (isSelected) {
                bg = P5Colors.turquoise.withOpacity(0.3);
                border = P5Colors.teal;
              }

              return Card(
                color: bg,
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: border, width: 1.5),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: isMatched
                      ? null
                      : () {
                          setState(() {
                            _selectedFrenchPair = pair.french;
                            _evalPairSelection(drill);
                          });
                          _audioService.playSfx(P5SfxType.click);
                        },
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(pair.french, style: P5Text.frenchPhrase(P5Colors.teal).copyWith(fontSize: 16)),
                        if (isMatched)
                          const Icon(Icons.check_rounded, color: P5Colors.green, size: 20),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 20),

        // English Column (Shuffled)
        Expanded(
          child: ListView.builder(
            itemCount: _shuffledEnglishPairs.length,
            itemBuilder: (context, index) {
              final english = _shuffledEnglishPairs[index];
              final matchingPair = drill.pairs!.firstWhere((p) => p.english == english);
              final isMatched = _matchedPairs.contains(matchingPair.french);
              final isSelected = _selectedEnglishPair == english;

              Color bg = P5Colors.cream;
              Color border = P5Colors.lightGrey;
              if (isMatched) {
                bg = P5Colors.green.withOpacity(0.2);
                border = P5Colors.green;
              } else if (isSelected) {
                bg = P5Colors.gold.withOpacity(0.3);
                border = P5Colors.gold;
              }

              return Card(
                color: bg,
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: border, width: 1.5),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: isMatched
                      ? null
                      : () {
                          setState(() {
                            _selectedEnglishPair = english;
                            _evalPairSelection(drill);
                          });
                          _audioService.playSfx(P5SfxType.click);
                        },
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(english, style: P5Text.body(P5Colors.charcoal).copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
                        if (isMatched)
                          const Icon(Icons.check_rounded, color: P5Colors.green, size: 20),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _evalPairSelection(P5InteractiveExercise drill) {
    if (_selectedFrenchPair != null && _selectedEnglishPair != null) {
      final pair = drill.pairs!.firstWhere((p) => p.french == _selectedFrenchPair);
      if (pair.english == _selectedEnglishPair) {
        _matchedPairs.add(_selectedFrenchPair!);
        _audioService.playSfx(P5SfxType.correct);
        if (_matchedPairs.length == drill.pairs!.length) {
          _checkAnswer();
        }
      } else {
        _audioService.playSfx(P5SfxType.incorrect);
      }
      _selectedFrenchPair = null;
      _selectedEnglishPair = null;
    }
  }

  Widget _buildFillGapView(P5InteractiveExercise drill) {
    final template = drill.sentenceTemplate ?? '___';
    final parts = template.split('___');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sentence with interactive blank
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: P5Colors.cream,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: P5Colors.teal.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (parts.isNotEmpty)
                Text(parts[0], style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 18)),
              const SizedBox(width: 8),
              InkWell(
                onTap: _hasChecked || _selectedGapWord == null
                    ? null
                    : () {
                        setState(() => _selectedGapWord = null);
                      },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: _selectedGapWord != null ? P5Colors.teal : P5Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: P5Colors.teal, width: 2),
                  ),
                  child: Text(
                    _selectedGapWord ?? ' [ Tap Word Below ] ',
                    style: TextStyle(
                      color: _selectedGapWord != null ? P5Colors.white : P5Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (parts.length > 1)
                Text(parts[1], style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 18)),
            ],
          ),
        ),
        const SizedBox(height: 24),

        Text('Word Bank (Tap to select):', style: P5Text.caption(P5Colors.teal).copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: (drill.wordBank ?? []).map((word) {
            final isSelected = _selectedGapWord == word;
            return ActionChip(
              backgroundColor: isSelected ? P5Colors.teal : P5Colors.cream,
              label: Text(
                word,
                style: TextStyle(
                  color: isSelected ? P5Colors.white : P5Colors.charcoal,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onPressed: _hasChecked
                  ? null
                  : () {
                      setState(() => _selectedGapWord = word);
                      _audioService.playSfx(P5SfxType.click);
                    },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSentenceBuilderView(P5InteractiveExercise drill) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Construction Tray
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 70),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: P5Colors.cream,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: P5Colors.teal, width: 1.5),
          ),
          child: _sentenceTray.isEmpty
              ? Center(
                  child: Text(
                    'Tap word tiles below in the correct order',
                    style: P5Text.caption(P5Colors.grey).copyWith(fontSize: 14),
                  ),
                )
              : Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _sentenceTray.map((w) {
                    return InputChip(
                      backgroundColor: P5Colors.teal,
                      label: Text(w, style: const TextStyle(color: P5Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                      onDeleted: _hasChecked
                          ? null
                          : () {
                              setState(() {
                                _sentenceTray.remove(w);
                                _availableWords.add(w);
                              });
                              _audioService.playSfx(P5SfxType.click);
                            },
                    );
                  }).toList(),
                ),
        ),
        const SizedBox(height: 20),

        Text('Available Words:', style: P5Text.caption(P5Colors.teal).copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _availableWords.map((w) {
            return ActionChip(
              backgroundColor: P5Colors.white,
              side: const BorderSide(color: P5Colors.turquoise, width: 1.5),
              label: Text(w, style: const TextStyle(color: P5Colors.charcoal, fontWeight: FontWeight.bold, fontSize: 16)),
              onPressed: _hasChecked
                  ? null
                  : () {
                      setState(() {
                        _availableWords.remove(w);
                        _sentenceTray.add(w);
                      });
                      _audioService.playSfx(P5SfxType.click);
                    },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBottomFeedbackBar(P5InteractiveExercise drill) {
    bool canCheck = false;
    switch (drill.type) {
      case DrillType.singleChoice:
      case DrillType.trueFalse:
      case DrillType.storyComprehension:
      case DrillType.listenAudio:
        canCheck = _selectedOptionIndex != null;
        break;
      case DrillType.pairMatch:
        canCheck = drill.pairs != null && _matchedPairs.length == drill.pairs!.length;
        break;
      case DrillType.fillGap:
        canCheck = _selectedGapWord != null;
        break;
      case DrillType.sentenceBuilder:
        canCheck = _sentenceTray.isNotEmpty;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _hasChecked
            ? (_isAnswerCorrect ? P5Colors.green.withOpacity(0.12) : P5Colors.red.withOpacity(0.12))
            : P5Colors.cream,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _hasChecked ? (_isAnswerCorrect ? P5Colors.green : P5Colors.red) : P5Colors.lightGrey,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _hasChecked
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            _isAnswerCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
                            color: _isAnswerCorrect ? P5Colors.green : P5Colors.red,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _isAnswerCorrect ? 'Correct! Excellent job.' : 'Not quite. Keep going!',
                            style: TextStyle(
                              color: _isAnswerCorrect ? P5Colors.green : P5Colors.red,
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        drill.explanation,
                        style: P5Text.caption(P5Colors.charcoal).copyWith(fontSize: 13),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                : Text(
                    'Select your answer and press Check Answer.',
                    style: P5Text.caption(P5Colors.grey).copyWith(fontSize: 13),
                  ),
          ),
          const SizedBox(width: 16),
          if (!_hasChecked)
            ElevatedButton.icon(
              onPressed: canCheck ? _checkAnswer : null,
              icon: const Icon(Icons.check_rounded, size: 18),
              label: const Text('Check Answer', style: TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: P5Colors.teal,
                foregroundColor: P5Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            )
          else
            ElevatedButton.icon(
              onPressed: _nextDrill,
              icon: Icon(
                _currentDrillIndex == widget.drills.length - 1 ? Icons.celebration_rounded : Icons.arrow_forward_rounded,
                size: 18,
              ),
              label: Text(
                _currentDrillIndex == widget.drills.length - 1 ? 'Finish Drills' : 'Next Drill',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _isAnswerCorrect ? P5Colors.green : P5Colors.teal,
                foregroundColor: P5Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
        ],
      ),
    );
  }
}
