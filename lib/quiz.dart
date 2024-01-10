import 'package:basic_ii/data/questions.dart';
import 'package:basic_ii/questions_screen.dart';
import 'package:basic_ii/result_screen.dart';
import 'package:basic_ii/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var currScreen = 'start-screen';
  Widget? currWidget;

  void switchScreen() {
    setState(() {
      currScreen = 'questions-screen';
    });
  }

  void refresh() {
    setState(() {
      _selectedAnswers = [];
      currScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        currScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    if (currScreen == 'start-screen') {
      currWidget = StartScreen(switchScreen);
    } else if (currScreen == 'questions-screen') {
      currWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    } else if (currScreen == 'result-screen') {
      currWidget = ResultScreen(
        choosenAnswers: _selectedAnswers,
        restartQuiz: refresh,
      );
    } else {
      StartScreen(switchScreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple, Colors.deepPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Center(
            child: currWidget,
          ),
        ),
      ),
    );
  }
}
