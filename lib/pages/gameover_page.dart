import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizard/pages/intro_page.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({
    super.key,
  });

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
                "Game Over!",
                style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Text(
                "YOU RAN OUT OF LIVES",
                style: TextStyle(fontSize: 16, color: Colors.white60),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  height: 240, child: SvgPicture.asset('assets/gameover.svg')),
              const SizedBox(
                height: 32,
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
