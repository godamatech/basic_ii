import 'package:basic_ii/question_identifier.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (data) => Row(
                  children: [
                    QuestionIdentifier(
                      isCorrectAnswer:
                          data['user_answer'] == data['correct_answer'],
                      questionIndex: ((data['question_index'] as int) + 1),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color.fromARGB(221, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            data['user_answer'] as String,
                            style: TextStyle(
                              color: Color.fromARGB(255, 199, 95, 176),
                            ),
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: TextStyle(
                              color: Color.fromARGB(255, 120, 171, 212),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
