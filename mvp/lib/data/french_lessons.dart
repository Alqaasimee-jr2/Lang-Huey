import '../models/lesson.dart';
import '../models/lesson_item.dart';
import '../models/check_question.dart';

/// Aligned to Nigerian NERDC / WAEC JSS1 French Curriculum
/// Source: Week-Frenchtopic-Maincontent.csv
final List<Lesson> frenchLessons = [
  // LESSON 1: Greetings & Introductions
  Lesson(
    id: '01',
    title: 'Les expressions de salutation (Greetings)',
    teacherIntroCue: 'Tell the class we are starting French today! Explain that learning greetings is the first step to speaking French.',
    items: [
      LessonItem(
        word: 'Bonjour',
        translation: 'Good morning / Hello',
        imagePath: 'assets/images/bonjour.png',
        audioPath: 'assets/audio/bonjour.mp3',
        teacherCue: 'Play the audio twice. Ask the entire class to repeat "Bonjour" clearly.',
      ),
      LessonItem(
        word: 'Bonsoir',
        translation: 'Good evening',
        imagePath: 'assets/images/bonsoir.png',
        audioPath: 'assets/audio/bonsoir.mp3',
        teacherCue: 'Play the audio. Ask a student to explain when we say "Bonsoir" instead of "Bonjour".',
      ),
      LessonItem(
        word: 'Bonne nuit',
        translation: 'Good night',
        imagePath: 'assets/images/bonne_nuit.png',
        audioPath: 'assets/audio/bonne_nuit.mp3',
        teacherCue: 'Play the audio twice. Tell the class this is said before going to bed.',
      ),
      LessonItem(
        word: 'Salut',
        translation: 'Hi / Bye (Informal)',
        imagePath: 'assets/images/salut.png',
        audioPath: 'assets/audio/salut.mp3',
        teacherCue: 'Play the audio. Ask students to turn to their partner and say "Salut".',
      ),
      LessonItem(
        word: 'Comment vas-tu ?',
        translation: 'How are you? (Informal)',
        imagePath: 'assets/images/comment_vas_tu.png',
        audioPath: 'assets/audio/comment_vas_tu.mp3',
        teacherCue: 'Play the audio. Explain that this is how friends ask each other how they are.',
      ),
      LessonItem(
        word: 'Ça va ?',
        translation: 'How are you? / How is it going?',
        imagePath: 'assets/images/ca_va.png',
        audioPath: 'assets/audio/ca_va.mp3',
        teacherCue: 'Play the audio. Point to the board and ask the class to say "Ça va".',
      ),
      LessonItem(
        word: 'Au revoir',
        translation: 'Goodbye',
        imagePath: 'assets/images/au_revoir.png',
        audioPath: 'assets/audio/au_revoir.mp3',
        teacherCue: 'Play the audio twice. Waves hands to demonstrate leaving and saying goodbye.',
      ),
      LessonItem(
        word: 'À demain',
        translation: 'See you tomorrow',
        imagePath: 'assets/images/a_demain.png',
        audioPath: 'assets/audio/a_demain.mp3',
        teacherCue: 'Play the audio. Ask the class to repeat after the audio.',
      ),
    ],
    checkQuestions: [
      CheckQuestion(
        prompt: 'Which French word means "Good morning"?',
        options: ['Bonjour', 'Bonsoir', 'Au revoir', 'Salut'],
        correctIndex: 0,
        teacherCue: 'Ask a student to come up to the smartboard and tap the correct option.',
        correctTeacherCue: 'Excellent! Ask the whole class to applaud and say "Bonjour" together.',
        incorrectTeacherCue: 'Not quite. The correct answer is Bonjour. Ask the class to repeat it.',
      ),
      CheckQuestion(
        prompt: 'How do you say "Goodbye" in French?',
        options: ['À demain', 'Ça va ?', 'Au revoir', 'Bonne nuit'],
        correctIndex: 2,
        teacherCue: 'Invite another student to tap the board for the answer.',
        correctTeacherCue: 'Well done! Everyone repeat "Au revoir".',
        incorrectTeacherCue: 'The correct answer is Au revoir. Let us say it together.',
      ),
    ],
  ),

  // LESSON 2: Numbers 0 to 20
  Lesson(
    id: '02',
    title: 'Les nombres de 0 à 20 (Numbers 0 to 20)',
    teacherIntroCue: 'Tell the class we are learning how to count from 0 to 20 in French today.',
    items: [
      LessonItem(
        word: 'Un (1)',
        translation: 'One',
        imagePath: 'assets/images/num_1.png',
        audioPath: 'assets/audio/num_1.mp3',
        teacherCue: 'Play audio. Hold up 1 finger and ask the class to repeat "Un".',
      ),
      LessonItem(
        word: 'Deux (2)',
        translation: 'Two',
        imagePath: 'assets/images/num_2.png',
        audioPath: 'assets/audio/num_2.mp3',
        teacherCue: 'Play audio. Hold up 2 fingers and ask class to repeat "Deux".',
      ),
      LessonItem(
        word: 'Trois (3)',
        translation: 'Three',
        imagePath: 'assets/images/num_3.png',
        audioPath: 'assets/audio/num_3.mp3',
        teacherCue: 'Play audio. Ask class to count 1, 2, 3 in French with you.',
      ),
      LessonItem(
        word: 'Quatre (4)',
        translation: 'Four',
        imagePath: 'assets/images/num_4.png',
        audioPath: 'assets/audio/num_4.mp3',
        teacherCue: 'Play audio. Ask the class to repeat "Quatre".',
      ),
      LessonItem(
        word: 'Cinq (5)',
        translation: 'Five',
        imagePath: 'assets/images/num_5.png',
        audioPath: 'assets/audio/num_5.mp3',
        teacherCue: 'Play audio. High-five a student and say "Cinq"!',
      ),
      LessonItem(
        word: 'Dix (10)',
        translation: 'Ten',
        imagePath: 'assets/images/num_10.png',
        audioPath: 'assets/audio/num_10.mp3',
        teacherCue: 'Play audio. Show two full hands (10 fingers) and say "Dix".',
      ),
      LessonItem(
        word: 'Quinze (15)',
        translation: 'Fifteen',
        imagePath: 'assets/images/num_15.png',
        audioPath: 'assets/audio/num_15.mp3',
        teacherCue: 'Play audio twice. Ask class to repeat "Quinze".',
      ),
      LessonItem(
        word: 'Vingt (20)',
        translation: 'Twenty',
        imagePath: 'assets/images/num_20.png',
        audioPath: 'assets/audio/num_20.mp3',
        teacherCue: 'Play audio. Explain that 20 is "Vingt".',
      ),
    ],
    checkQuestions: [
      CheckQuestion(
        prompt: 'What is the French word for the number 3?',
        options: ['Un', 'Deux', 'Trois', 'Quatre'],
        correctIndex: 2,
        teacherCue: 'Ask a student to step up to the board and select the answer.',
        correctTeacherCue: 'Correct! Ask everyone to repeat "Trois".',
        incorrectTeacherCue: 'Not quite. Show option C (Trois) and count together.',
      ),
    ],
  ),

  // LESSON 3: Days of the Week
  Lesson(
    id: '03',
    title: 'Les jours de la semaine (Days of the week)',
    teacherIntroCue: 'Tell the class we are learning the 7 days of the week in French.',
    items: [
      LessonItem(
        word: 'Lundi',
        translation: 'Monday',
        imagePath: 'assets/images/lundi.png',
        audioPath: 'assets/audio/lundi.mp3',
        teacherCue: 'Play audio. Ask class to clap once and say "Lundi".',
      ),
      LessonItem(
        word: 'Mardi',
        translation: 'Tuesday',
        imagePath: 'assets/images/mardi.png',
        audioPath: 'assets/audio/mardi.mp3',
        teacherCue: 'Play audio. Repeat after the recording.',
      ),
      LessonItem(
        word: 'Mercredi',
        translation: 'Wednesday',
        imagePath: 'assets/images/mercredi.png',
        audioPath: 'assets/audio/mercredi.mp3',
        teacherCue: 'Play audio twice. Emphasize the three syllables: Mer-cre-di.',
      ),
      LessonItem(
        word: 'Jeudi',
        translation: 'Thursday',
        imagePath: 'assets/images/jeudi.png',
        audioPath: 'assets/audio/jeudi.mp3',
        teacherCue: 'Play audio. Ask class to repeat.',
      ),
      LessonItem(
        word: 'Vendredi',
        translation: 'Friday',
        imagePath: 'assets/images/vendredi.png',
        audioPath: 'assets/audio/vendredi.mp3',
        teacherCue: 'Play audio. Ask class: "Which day of the week is Vendredi?"',
      ),
      LessonItem(
        word: 'Samedi',
        translation: 'Saturday',
        imagePath: 'assets/images/samedi.png',
        audioPath: 'assets/audio/samedi.mp3',
        teacherCue: 'Play audio. Explain that Samedi is the start of the weekend.',
      ),
      LessonItem(
        word: 'Dimanche',
        translation: 'Sunday',
        imagePath: 'assets/images/dimanche.png',
        audioPath: 'assets/audio/dimanche.mp3',
        teacherCue: 'Play audio twice. Ask class to recite Lundi through Dimanche.',
      ),
    ],
    checkQuestions: [
      CheckQuestion(
        prompt: 'Which French day comes right after Lundi (Monday)?',
        options: ['Mardi', 'Mercredi', 'Vendredi', 'Dimanche'],
        correctIndex: 0,
        teacherCue: 'Ask a student to tap the board.',
        correctTeacherCue: 'Spot on! Mardi is Tuesday.',
        incorrectTeacherCue: 'The correct day is Mardi. Let us say it together.',
      ),
    ],
  ),

  // LESSON 4: Colours
  Lesson(
    id: '04',
    title: 'Les couleurs (Colours)',
    teacherIntroCue: 'Tell the class we are learning colours in French. We will point to objects in the classroom!',
    items: [
      LessonItem(
        word: 'Rouge',
        translation: 'Red',
        imagePath: 'assets/images/rouge.png',
        audioPath: 'assets/audio/rouge.mp3',
        teacherCue: 'Play audio. Ask students to point to something red in the room.',
      ),
      LessonItem(
        word: 'Bleu',
        translation: 'Blue',
        imagePath: 'assets/images/bleu.png',
        audioPath: 'assets/audio/bleu.mp3',
        teacherCue: 'Play audio. Point to a blue item or uniform.',
      ),
      LessonItem(
        word: 'Jaune',
        translation: 'Yellow',
        imagePath: 'assets/images/jaune.png',
        audioPath: 'assets/audio/jaune.mp3',
        teacherCue: 'Play audio. Ask class to repeat "Jaune".',
      ),
      LessonItem(
        word: 'Vert',
        translation: 'Green',
        imagePath: 'assets/images/vert.png',
        audioPath: 'assets/audio/vert.mp3',
        teacherCue: 'Play audio. Ask students to repeat after the recording.',
      ),
      LessonItem(
        word: 'Noir',
        translation: 'Black',
        imagePath: 'assets/images/noir.png',
        audioPath: 'assets/audio/noir.mp3',
        teacherCue: 'Play audio. Point to the board frame or dark shoes.',
      ),
      LessonItem(
        word: 'Blanc',
        translation: 'White',
        imagePath: 'assets/images/blanc.png',
        audioPath: 'assets/audio/blanc.mp3',
        teacherCue: 'Play audio. Point to a sheet of paper or shirt.',
      ),
    ],
    checkQuestions: [
      CheckQuestion(
        prompt: 'Which French word means "Red"?',
        options: ['Bleu', 'Rouge', 'Jaune', 'Vert'],
        correctIndex: 1,
        teacherCue: 'Ask a student to step to the smartboard and tap the correct color word.',
        correctTeacherCue: 'Wonderful! Rouge is Red.',
        incorrectTeacherCue: 'The correct answer is Rouge.',
      ),
    ],
  ),
];
