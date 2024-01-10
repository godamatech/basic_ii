import 'package:basic_ii/data/questions.dart';
import 'package:basic_ii/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswers, required this.restartQuiz});

  final List<String> choosenAnswers;

  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final totalNoQuestions = questions.length;
    final totalNoCorrectAnswered = summaryData.where(
        (element) => element['user_answer'] == element['correct_answer']).length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You have answered $totalNoCorrectAnswered out of $totalNoQuestions Questions Correctly!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 233, 177, 243),
          ),
        ),
        SizedBox(height: 30),
        QuestionsSummary(summaryData),
        SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: restartQuiz,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          label: Text('Restart Quiz'),
          icon: Icon(Icons.refresh),
        ),
        
      ],
    );
  }
}
