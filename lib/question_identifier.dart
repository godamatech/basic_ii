import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final bool isCorrectAnswer;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    final int indexNo = questionIndex;

    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? Color.fromARGB(255, 120, 171, 212)
            : Color.fromARGB(255, 241, 56, 170),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(indexNo.toString()),
    );
  }
}
