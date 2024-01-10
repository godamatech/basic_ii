import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key}); //this.startQuiz,

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 50),
        const Text(
          'Learn flutter the fun way!',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(200, 255, 255, 255),
            foregroundColor: const Color.fromARGB(255, 193, 43, 219),
          ),
          label: Text('Start Quiz'),
          icon: Icon(Icons.arrow_right_alt),
        ),
      ],
    );
  }
}
