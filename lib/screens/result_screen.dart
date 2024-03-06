import 'package:flutter/material.dart';
import 'package:quizlet/components/questions_summary.dart';
import 'package:quizlet/components/styled_text.dart';
import 'package:quizlet/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chooseAnswer, required this.restart});
  final List<String> chooseAnswer;
  final void Function() restart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> data = [];
    for (var i = 0; i < questions.length; i++) {
      data.add({
        'questions_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseAnswer[i]
      });
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final numberTotalQuestions = questions.length;
    final numberCorrectQuestions = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledText(
                text:
                    'You answered $numberCorrectQuestions out of $numberTotalQuestions questions correctly'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
                icon: const Icon(Icons.refresh),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: restart,
                label: const Text(
                  'Restart',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
