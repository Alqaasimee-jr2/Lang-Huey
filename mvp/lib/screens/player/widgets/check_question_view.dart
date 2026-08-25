import 'package:flutter/material.dart';
import '../../../models/check_question.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class CheckQuestionView extends StatefulWidget {
  final CheckQuestion question;
  final Function(bool isCorrect, String feedbackCue) onAnswered;
  final bool isRevealed;

  const CheckQuestionView({
    super.key,
    required this.question,
    required this.onAnswered,
    required this.isRevealed,
  });

  @override
  State<CheckQuestionView> createState() => _CheckQuestionViewState();
}

class _CheckQuestionViewState extends State<CheckQuestionView> {
  int? _selectedIndex;

  void _handleOptionTap(int index) {
    if (widget.isRevealed) return;
    setState(() {
      _selectedIndex = index;
    });

    final bool isCorrect = index == widget.question.correctIndex;
    final String feedbackCue = isCorrect
        ? widget.question.correctTeacherCue
        : widget.question.incorrectTeacherCue;

    widget.onAnswered(isCorrect, feedbackCue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question Header Tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: LHColors.gold.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.help_outline_rounded, color: LHColors.gold, size: 24),
                const SizedBox(width: 8),
                Text(
                  'CHECK QUESTION · TOUCH THE SMARTBOARD TO ANSWER',
                  style: LHText.label(LHColors.gold).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Question Prompt Text (Nunito Bold 48-52sp)
          Text(
            widget.question.prompt,
            style: LHText.heading(LHColors.white).copyWith(
              fontSize: 48,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 36),

          // 2x2 Option Grid
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
              ),
              itemCount: widget.question.options.length,
              itemBuilder: (context, index) {
                return _buildOptionCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(int index) {
    final optionText = widget.question.options[index];
    final isSelected = _selectedIndex == index;
    final isCorrectOption = index == widget.question.correctIndex;

    Color bgColor = LHColors.white;
    Color textColor = LHColors.charcoal;
    BorderSide borderSide = BorderSide.none;

    if (widget.isRevealed) {
      if (isCorrectOption) {
        bgColor = LHColors.correct;
        textColor = LHColors.white;
      } else if (isSelected && !isCorrectOption) {
        bgColor = LHColors.incorrect;
        textColor = LHColors.white;
      }
    } else if (isSelected) {
      borderSide = const BorderSide(color: LHColors.turquoise, width: 4);
    }

    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => _handleOptionTap(index),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.fromBorderSide(borderSide),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              // Option letter badge (A, B, C, D)
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: (widget.isRevealed && (isCorrectOption || isSelected))
                      ? LHColors.white.withOpacity(0.2)
                      : LHColors.teal.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    String.fromCharCode(65 + index), // A, B, C, D
                    style: LHText.subheading(textColor).copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Text(
                  optionText,
                  style: LHText.subheading(textColor).copyWith(
                    fontSize: 28,
                  ),
                ),
              ),

              if (widget.isRevealed && isCorrectOption)
                const Icon(Icons.check_circle_rounded, color: LHColors.white, size: 36),
              if (widget.isRevealed && isSelected && !isCorrectOption)
                const Icon(Icons.cancel_rounded, color: LHColors.white, size: 36),
            ],
          ),
        ),
      ),
    );
  }
}
