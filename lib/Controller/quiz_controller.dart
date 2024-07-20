import 'package:get/get.dart';

import '../Model/quiz_modal.dart';

class QuizController extends GetxController {
  var questionIndex = 0.obs;
  var selectedAnswers = List<int?>.filled(10, -1).obs;

  final List<Question> questions = [
    Question(
      questionText: '1. What is the primary ingredient in a banana smoothie?',
      options: ['Bananas', 'Apple', 'Chocolate', 'Cement'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: "2. What do cows drink?",
      options: ["Milk", "Water", "Soda", "Coffee"],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: '3. Which planet is known as the "Red Planet"?',
      options: ['Mars', 'Snickers', 'KitKat', 'Pluto (the dog)'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: '4. Who is known as the "Father of Computers"?',
      options: ["Steve Jobs", "Bill Gates", "Charles Babbage", "My Grandpa"],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: '5. What is the name of the shape with three sides?',
      options: ['Circle', 'Triangle', 'Square', 'Hexagon'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: "6. Which animal is known for its black and white strips?",
      options: ["Tiger", "Lion", "My Female Friend", "Zebra"],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: '7. What do you call a bear with no teeth?',
      options: ['Fluffy', 'Teddybear', 'Chocolate', 'Cement'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: "8. What do you call a sleeping bull?",
      options: ["Bulldozer", "Nap", "Bullish", "Resting"],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: '9. Why did the tomato turn red?',
      options: ['Ripe', 'Blush', 'Embarrassed', 'Saucy'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: "10. Why did the math book look sad?",
      options: ["Worry", "Problems", "Confused", "Algebra"],
      correctAnswerIndex: 1,
    ),
  ];

  void nextQuestion() {
    if (questionIndex.value < questions.length - 1) {
      questionIndex.value++;
    }
  }

  void previousQuestion() {
    if (questionIndex.value > 0) {
      questionIndex.value--;
    }
  }

  void selectAnswer(int index) {
    selectedAnswers[questionIndex.value] = index;
    selectedAnswers.refresh();
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswerIndex) {
        score++;
      }
    }
    return score;
  }

  void restartQuiz() {
    questionIndex.value = 0;
    selectedAnswers.value = List<int>.filled(questions.length, -1);
  }
}
