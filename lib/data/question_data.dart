import 'package:quizard/models/question_model.dart';

class QuestionData {
  int index = 0;
  int lives = 5;

  final List<Question> questions = [
    Question(
      questionText: 'What is the capital of France?',
      options: ['London', 'Paris', 'Berlin', 'Madrid'],
      correctAnswer: 'Paris',
    ),
    Question(
      questionText: 'Which planet is known as the Red Planet?',
      options: ['Mars', 'Venus', 'Jupiter', 'Saturn'],
      correctAnswer: 'Mars',
    ),
    Question(
      questionText: 'What is the largest country in the world by land area?',
      options: ['Russia', 'Canada', 'China', 'United States'],
      correctAnswer: 'Russia',
    ),
    Question(
      questionText: 'Which animal is the national animal of India?',
      options: ['Tiger', 'Lion', 'Elephant', 'Peacock'],
      correctAnswer: 'Tiger',
    ),
    Question(
      questionText: 'What is the chemical symbol for gold?',
      options: ['Ag', 'Au', 'Fe', 'Cu'],
      correctAnswer: 'Au',
    ),
    Question(
      questionText: 'Who was the first president of the United States?',
      options: [
        'George Washington',
        'Thomas Jefferson',
        'Abraham Lincoln',
        'Benjamin Franklin'
      ],
      correctAnswer: 'George Washington',
    ),
    Question(
      questionText: 'What is the largest organ in the human body?',
      options: ['Heart', 'Liver', 'Skin', 'Lungs'],
      correctAnswer: 'Skin',
    ),
    Question(
      questionText: 'What is the highest mountain in the world?',
      options: ['Mount Everest', 'K2', 'Kangchenjunga', 'Lhotse'],
      correctAnswer: 'Mount Everest',
    ),
    Question(
      questionText: 'Who wrote the play "Romeo and Juliet"?',
      options: [
        'William Shakespeare',
        'Jane Austen',
        'Charles Dickens',
        'Mark Twain'
      ],
      correctAnswer: 'William Shakespeare',
    ),
    Question(
      questionText: 'What is the most famous painting by Leonardo da Vinci?',
      options: ['Mona Lisa', 'The Last Supper', 'The Birth of Venus', 'David'],
      correctAnswer: 'Mona Lisa',
    ),
  ];

  QuestionData() {
    questions.shuffle();
  }

  String getQuestion() {
    return questions[index].questionText;
  }

  List getOptions() {
    return questions[index].options;
  }

  String getCorrectAnswer() {
    return questions[index].correctAnswer;
  }

  void nextQuestion() {
    if (index < questions.length - 1) {
      index++;
    }
  }

  void wrongAnswer() {
    lives--;
  }
}
