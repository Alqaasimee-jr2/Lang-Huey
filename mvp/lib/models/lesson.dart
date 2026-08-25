import 'lesson_item.dart';
import 'check_question.dart';

class Lesson {
  final String id;
  final String title;
  final String teacherIntroCue;
  final List<LessonItem> items;
  final List<CheckQuestion> checkQuestions;

  Lesson({
    required this.id,
    required this.title,
    required this.teacherIntroCue,
    required this.items,
    required this.checkQuestions,
  });
}
