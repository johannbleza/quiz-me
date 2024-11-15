import 'package:flutter/material.dart';
import 'package:quizard/data/question_data.dart';
import 'package:quizard/pages/end_page.dart';
import 'package:quizard/pages/gameover_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String? selectedOption;
  int score = 0;
  bool hasSelected = false;
  ButtonStyle correctAnswer = const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.greenAccent));
  ButtonStyle wrongAnswer = const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.pinkAccent),
      foregroundColor: WidgetStatePropertyAll(Colors.white));

  QuestionData current = QuestionData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 80),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          for (int i = 0; i < current.lives; i++)
                            const Icon(
                              Icons.favorite,
                              color: Colors.pinkAccent,
                            ),
                        ],
                      ),
                    ),
                    Text(
                      "Question ${current.index + 1} out of ${current.questions.length}",
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 360,
                      height: 120,
                      // Question
                      child: Text(
                        current.getQuestion(),
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 280,
                  // Options
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var option in current.getOptions())
                        SizedBox(
                            height: 60,
                            width: 360,
                            child: ElevatedButton(
                              onPressed: () {
                                hasSelected
                                    ? () {}
                                    : setState(() {
                                        selectedOption = option;
                                        hasSelected = true;
                                        if (selectedOption ==
                                            current.getCorrectAnswer()) {
                                          score++;
                                        } else {
                                          current.wrongAnswer();
                                          if (current.lives < 1) {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const GameOverPage()));
                                          }
                                        }
                                      });
                              },
                              style: (selectedOption == option &&
                                      selectedOption ==
                                          current.getCorrectAnswer())
                                  ? correctAnswer
                                  : (selectedOption == option)
                                      ? wrongAnswer
                                      : (hasSelected &&
                                              option ==
                                                  current.getCorrectAnswer())
                                          ? correctAnswer
                                          : const ButtonStyle(),
                              child: Text(option),
                            )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: (hasSelected)
                      ? ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.blue)),
                          onPressed: () {
                            setState(() {
                              if (current.index !=
                                  current.questions.length - 1) {
                                current.nextQuestion();
                                hasSelected = false;
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EndPage(
                                        score: score,
                                        total: current.questions.length)));
                              }
                            });
                          },
                          child: Text(
                            (current.index != current.questions.length - 1)
                                ? "Next Question"
                                : "Finish Quiz",
                            style: const TextStyle(color: Colors.white),
                          ))
                      : Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
