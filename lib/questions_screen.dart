import 'package:basic_ii/answer_button.dart';
import 'package:basic_ii/data/questions.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var curQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      curQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    var curQuestion = questions[curQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              curQuestion.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 210, 137, 223),
                fontSize: 24,
              ),
            ),
            SizedBox(height: 30),
            ...curQuestion.getShuffledAnswers().map(
                  (answer) => AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
  //
}
