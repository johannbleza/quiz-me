import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizard/pages/quiz_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Quiz me",
                style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Level Up Your Trivia Game with Quiz Me",
                style: TextStyle(
                  color: Colors.white60,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 320, child: SvgPicture.asset("assets/intro.svg")),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 52,
                width: 160,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const QuizPage()));
                    },
                    child: const Text(
                      "Start Quiz",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
