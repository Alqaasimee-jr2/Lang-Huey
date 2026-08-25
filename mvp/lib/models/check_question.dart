class CheckQuestion {
  final String prompt;
  final List<String> options;
  final int correctIndex;
  final String teacherCue;
  final String correctTeacherCue;
  final String incorrectTeacherCue;

  CheckQuestion({
    required this.prompt,
    required this.options,
    required this.correctIndex,
    required this.teacherCue,
    required this.correctTeacherCue,
    required this.incorrectTeacherCue,
  });
}
