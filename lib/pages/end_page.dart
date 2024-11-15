import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizard/pages/intro_page.dart';

class EndPage extends StatelessWidget {
  const EndPage({super.key, required this.score, required this.total});
  final int score;
  final int total;

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Congrats!",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Text(
                "YOUR SCORE",
                style: TextStyle(fontSize: 24, color: Colors.white60),
              ),
              Text(
                "$score/$total ",
                style: const TextStyle(
                    fontSize: 52,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(height: 240, child: SvgPicture.asset('assets/end.svg')),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const IntroPage()));
                  },
                  child: const Text(
                    "Play again",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
