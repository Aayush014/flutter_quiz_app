import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/Views/result_screen.dart';
import 'package:get/get.dart';

import '../Controller/quiz_controller.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuizController quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        actions: const [
          Icon(
            CupertinoIcons.bookmark,
            size: 30,
          ),
          SizedBox(
            width: 10,
          )
        ],
        centerTitle: true,
      ),
      body: Obx(
        () {
          final question =
              quizController.questions[quizController.questionIndex.value];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinearProgressIndicator(
                minHeight: 5,
                color: Colors.blue.withOpacity(0.5),
                backgroundColor: Colors.blue.withOpacity(0.2),
                value: (quizController.questionIndex.value + 1) /
                    quizController.questions.length,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  question.questionText,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: question.options.length,
                    itemBuilder: (context, index) {
                      return CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          quizController.selectAnswer(index);
                        },
                        child: Obx(
                          () => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: quizController.selectedAnswers[
                                              quizController
                                                  .questionIndex.value] ==
                                          index
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: quizController.selectedAnswers[
                                            quizController
                                                .questionIndex.value] ==
                                        index
                                    ? Colors.blue.withOpacity(0.2)
                                    : Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                textAlign: TextAlign.center,
                                question.options[index],
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: quizController.previousQuestion,
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.blue),
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          CupertinoIcons.backward_fill,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Get.to(() => const ResultScreen());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 90,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.blue),
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          CupertinoIcons.checkmark_alt,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: quizController.nextQuestion,
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.blue),
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          CupertinoIcons.forward_fill,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
