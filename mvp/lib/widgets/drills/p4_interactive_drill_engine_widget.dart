import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/p4_lesson_model.dart';
import '../../services/p4_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class P4InteractiveDrillEngineWidget extends StatefulWidget {
  final List<P4InteractiveExercise> drills;
  final int term;
  final VoidCallback onComplete;

  const P4InteractiveDrillEngineWidget({
    super.key,
    required this.drills,
    required this.term,
    required this.onComplete,
  });

  @override
  State<P4InteractiveDrillEngineWidget> createState() => _P4InteractiveDrillEngineWidgetState();
}

class _P4InteractiveDrillEngineWidgetState extends State<P4InteractiveDrillEngineWidget> {
  final P4AudioService _audioService = P4AudioService();
  int _currentDrillIndex = 0;
  int _score = 0;

  // Single choice / True-False / Tap Translation state
  int? _selectedOptionIndex;

  // Pair match state
  String? _selectedFrenchPair;
  String? _selectedEnglishPair;
  final Set<String> _matchedPairs = {};
  List<String> _shuffledEnglishPairs = [];

  // Fill Gap state
  String? _selectedGapWord;

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
    _hasChecked = false;
    _isAnswerCorrect = false;

    if (_currentDrillIndex < widget.drills.length) {
      final drill = widget.drills[_currentDrillIndex];

      if (drill.type == DrillType.pairMatch && drill.pairs != null && drill.pairs!.isNotEmpty) {
        _shuffledEnglishPairs = drill.pairs!.map((p) => p.english).toList()..shuffle(Random());
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
      case DrillType.tapTranslation:
        correct = _selectedOptionIndex == drill.correctOptionIndex;
        break;
      case DrillType.pairMatch:
        correct = drill.pairs != null && _matchedPairs.length == drill.pairs!.length;
        break;
      case DrillType.fillGap:
        correct = _selectedGapWord != null &&
            _selectedGapWord == drill.correctGapWord;
        break;
    }

    setState(() {
      _hasChecked = true;
      _isAnswerCorrect = correct;
      if (correct) {
        _score++;
        _audioService.playSfx(P4SfxType.correct);
      } else {
        _audioService.playSfx(P4SfxType.incorrect);
      }
    });
  }

  void _nextDrill() {
    _audioService.playSfx(P4SfxType.click);
    if (_currentDrillIndex + 1 < widget.drills.length) {
      setState(() {
        _currentDrillIndex++;
        _initDrillState();
      });
    } else {
      _audioService.playSfx(P4SfxType.celebrate);
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: LHColors.teal.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.emoji_events_rounded, color: LHColors.teal, size: 36),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Drills Completed!', style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 20)),
                  Text('Score: $_score / ${widget.drills.length}',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: LHColors.teal)),
                ],
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _score == widget.drills.length
                  ? 'Outstanding performance! Full mastery achieved on this topic.'
                  : _score >= (widget.drills.length / 2)
                      ? 'Great effort! Review the vocabulary soundboard to lock in 100% mastery.'
                      : 'Keep practicing! Repetition and active drill practice build fluency.',
              style: LHText.body(LHColors.charcoal),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: widget.drills.isNotEmpty ? _score / widget.drills.length : 1.0,
                minHeight: 10,
                backgroundColor: LHColors.softTeal,
                valueColor: const AlwaysStoppedAnimation<Color>(LHColors.teal),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(() {
                _currentDrillIndex = 0;
                _score = 0;
                _initDrillState();
              });
            },
            child: const Text('Try Again', style: TextStyle(color: LHColors.grey, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: LHColors.teal,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              Navigator.pop(ctx);
              widget.onComplete();
            },
            child: const Text('Next Phase: Summary', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.drills.isEmpty) {
      return Center(
        child: Text('No interactive drills available for this topic.', style: LHText.body(LHColors.charcoal)),
      );
    }

    final drill = widget.drills[_currentDrillIndex];
    final progress = (_currentDrillIndex + 1) / widget.drills.length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Progress & Score Bar
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DRILL ${_currentDrillIndex + 1} OF ${widget.drills.length}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.1,
                            color: LHColors.teal,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: LHColors.gold.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star_rounded, size: 16, color: LHColors.gold),
                              const SizedBox(width: 4),
                              Text(
                                'Score: $_score',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: LHColors.charcoal),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 8,
                        backgroundColor: LHColors.softTeal,
                        valueColor: const AlwaysStoppedAnimation<Color>(LHColors.teal),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Drill Type Badge & Prompt
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: LHColors.teal.withValues(alpha: 0.2)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getBadgeColor(drill.type).withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _getBadgeLabel(drill.type),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: _getBadgeColor(drill.type),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  drill.prompt,
                  style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 18, height: 1.3),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Drill Content Area
          _buildDrillBody(drill),
          const SizedBox(height: 20),

          // Feedback Banner when checked
          if (_hasChecked) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isAnswerCorrect ? LHColors.green.withValues(alpha: 0.1) : LHColors.red.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _isAnswerCorrect ? LHColors.green : LHColors.red,
                  width: 1.5,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    _isAnswerCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
                    color: _isAnswerCorrect ? LHColors.green : LHColors.red,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _isAnswerCorrect ? 'Correct! Excellent travail!' : 'Not quite! Revois la règle :',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: _isAnswerCorrect ? LHColors.green : LHColors.red,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          drill.explanation,
                          style: LHText.body(LHColors.charcoal).copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],

          // Action Button (Check Answer / Next Drill)
          SizedBox(
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _hasChecked
                    ? (_isAnswerCorrect ? LHColors.green : LHColors.teal)
                    : LHColors.teal,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 2,
              ),
              onPressed: _hasChecked ? _nextDrill : (_canCheck() ? _checkAnswer : null),
              child: Text(
                _hasChecked
                    ? (_currentDrillIndex + 1 == widget.drills.length ? 'Finish Drills' : 'Next Drill →')
                    : 'Check Answer',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _canCheck() {
    final drill = widget.drills[_currentDrillIndex];
    switch (drill.type) {
      case DrillType.singleChoice:
      case DrillType.trueFalse:
      case DrillType.tapTranslation:
        return _selectedOptionIndex != null;
      case DrillType.pairMatch:
        return drill.pairs != null && _matchedPairs.length == drill.pairs!.length;
      case DrillType.fillGap:
        return _selectedGapWord != null;
    }
  }

  Color _getBadgeColor(DrillType type) {
    switch (type) {
      case DrillType.singleChoice:
        return LHColors.teal;
      case DrillType.pairMatch:
        return LHColors.turquoise;
      case DrillType.fillGap:
        return LHColors.teal;
      case DrillType.trueFalse:
        return LHColors.gold;
      case DrillType.tapTranslation:
        return LHColors.charcoal;
    }
  }

  String _getBadgeLabel(DrillType type) {
    switch (type) {
      case DrillType.singleChoice:
        return 'MULTIPLE CHOICE';
      case DrillType.pairMatch:
        return 'MATCH THE PAIRS';
      case DrillType.fillGap:
        return 'FILL IN THE GAP';
      case DrillType.trueFalse:
        return 'TRUE OR FALSE';
      case DrillType.tapTranslation:
        return 'TAP TRANSLATION';
    }
  }

  Widget _buildDrillBody(P4InteractiveExercise drill) {
    switch (drill.type) {
      case DrillType.singleChoice:
      case DrillType.trueFalse:
      case DrillType.tapTranslation:
        return _buildOptionsList(drill);
      case DrillType.pairMatch:
        return _buildPairMatch(drill);
      case DrillType.fillGap:
        return _buildFillGap(drill);
    }
  }

  Widget _buildOptionsList(P4InteractiveExercise drill) {
    return Column(
      children: List.generate(drill.options.length, (index) {
        final option = drill.options[index];
        final isSelected = _selectedOptionIndex == index;
        final isCorrect = index == drill.correctOptionIndex;

        Color borderColor = Colors.black12;
        Color bgColor = Colors.white;
        Color textColor = LHColors.charcoal;

        if (_hasChecked) {
          if (isCorrect) {
            borderColor = LHColors.green;
            bgColor = LHColors.green.withValues(alpha: 0.08);
            textColor = LHColors.green;
          } else if (isSelected) {
            borderColor = LHColors.red;
            bgColor = LHColors.red.withValues(alpha: 0.08);
            textColor = LHColors.red;
          }
        } else if (isSelected) {
          borderColor = LHColors.teal;
          bgColor = LHColors.softTeal;
          textColor = LHColors.teal;
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: _hasChecked
                ? null
                : () {
                    _audioService.playSfx(P4SfxType.click);
                    setState(() {
                      _selectedOptionIndex = index;
                    });
                  },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              constraints: const BoxConstraints(minHeight: 62),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor, width: isSelected || (_hasChecked && isCorrect) ? 2 : 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? (_hasChecked
                              ? (isCorrect ? LHColors.green : LHColors.red)
                              : LHColors.teal)
                          : LHColors.lightGrey,
                    ),
                    child: Center(
                      child: Text(
                        String.fromCharCode(65 + index), // A, B, C, D
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                  ),
                  if (_hasChecked && isCorrect)
                    const Icon(Icons.check_circle_rounded, color: LHColors.green, size: 22)
                  else if (_hasChecked && isSelected)
                    const Icon(Icons.cancel_rounded, color: LHColors.red, size: 22),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildPairMatch(P4InteractiveExercise drill) {
    if (drill.pairs == null || drill.pairs!.isEmpty) return const SizedBox();

    return Column(
      children: [
        Text(
          'Tap a French term on the left, then tap its matching English meaning on the right.',
          style: LHText.caption(LHColors.grey).copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left column: French terms
            Expanded(
              child: Column(
                children: drill.pairs!.map((pair) {
                  final isMatched = _matchedPairs.contains(pair.french);
                  final isSelected = _selectedFrenchPair == pair.french;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: isMatched
                          ? null
                          : () {
                              _audioService.playSfx(P4SfxType.click);
                              setState(() {
                                _selectedFrenchPair = pair.french;
                                _checkPairMatch(drill);
                              });
                            },
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        constraints: const BoxConstraints(minHeight: 56),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                        decoration: BoxDecoration(
                          color: isMatched
                              ? LHColors.green.withValues(alpha: 0.1)
                              : isSelected
                                  ? LHColors.softTeal
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isMatched
                                ? LHColors.green
                                : isSelected
                                    ? LHColors.teal
                                    : Colors.black12,
                            width: isSelected || isMatched ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                pair.french,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: isMatched
                                      ? LHColors.green
                                      : isSelected
                                          ? LHColors.teal
                                          : LHColors.charcoal,
                                ),
                              ),
                            ),
                            if (isMatched) const Icon(Icons.check_rounded, color: LHColors.green, size: 18),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 14),
            // Right column: English translations
            Expanded(
              child: Column(
                children: _shuffledEnglishPairs.map((eng) {
                  final isMatched = drill.pairs!.any((p) => p.english == eng && _matchedPairs.contains(p.french));
                  final isSelected = _selectedEnglishPair == eng;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: isMatched
                          ? null
                          : () {
                              _audioService.playSfx(P4SfxType.click);
                              setState(() {
                                _selectedEnglishPair = eng;
                                _checkPairMatch(drill);
                              });
                            },
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        constraints: const BoxConstraints(minHeight: 56),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                        decoration: BoxDecoration(
                          color: isMatched
                              ? LHColors.green.withValues(alpha: 0.1)
                              : isSelected
                                  ? LHColors.softTeal
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isMatched
                                ? LHColors.green
                                : isSelected
                                    ? LHColors.teal
                                    : Colors.black12,
                            width: isSelected || isMatched ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                eng,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: isMatched
                                      ? LHColors.green
                                      : isSelected
                                          ? LHColors.teal
                                          : LHColors.charcoal,
                                ),
                              ),
                            ),
                            if (isMatched) const Icon(Icons.check_rounded, color: LHColors.green, size: 18),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _checkPairMatch(P4InteractiveExercise drill) {
    if (_selectedFrenchPair != null && _selectedEnglishPair != null) {
      final pair = drill.pairs!.firstWhere(
        (p) => p.french == _selectedFrenchPair,
        orElse: () => const DrillPair(french: '', english: ''),
      );

      if (pair.english == _selectedEnglishPair) {
        _audioService.playSfx(P4SfxType.correct);
        _matchedPairs.add(_selectedFrenchPair!);
        _selectedFrenchPair = null;
        _selectedEnglishPair = null;

        if (_matchedPairs.length == drill.pairs!.length) {
          _checkAnswer();
        }
      } else {
        _audioService.playSfx(P4SfxType.incorrect);
        _selectedFrenchPair = null;
        _selectedEnglishPair = null;
      }
    }
  }

  Widget _buildFillGap(P4InteractiveExercise drill) {
    final sentence = drill.sentenceWithGap ?? drill.prompt;
    final parts = sentence.split('___');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Sentence with gap display
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: LHColors.softTeal.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: LHColors.teal.withValues(alpha: 0.2)),
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              if (parts.isNotEmpty)
                Text(parts[0], style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 18)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: _selectedGapWord != null ? LHColors.teal : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: LHColors.teal, width: 2),
                ),
                child: Text(
                  _selectedGapWord ?? ' [ ? ] ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _selectedGapWord != null ? Colors.white : LHColors.teal,
                  ),
                ),
              ),
              if (parts.length > 1)
                Text(parts[1], style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 18)),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Choose the word that fits correctly:',
          style: LHText.caption(LHColors.charcoal).copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        // Word Bank Chips
        if (drill.wordBank != null)
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: drill.wordBank!.map((word) {
              final isSelected = _selectedGapWord == word;
              return InkWell(
                onTap: _hasChecked
                    ? null
                    : () {
                        _audioService.playSfx(P4SfxType.click);
                        setState(() {
                          _selectedGapWord = word;
                        });
                      },
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  constraints: const BoxConstraints(minHeight: 60),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? LHColors.teal : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isSelected ? LHColors.teal : Colors.black26,
                      width: isSelected ? 2 : 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    word,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : LHColors.charcoal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
