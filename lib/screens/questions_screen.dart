import 'package:flutter/material.dart';
import 'package:quizlet/components/answer_button.dart';
import 'package:quizlet/components/styled_text.dart';
import 'package:quizlet/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});
  final void Function(String answer) onSelectedAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsScreen> {
  var index = 0;
  void nextQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      if (index < questions.length) {
        index++;
      } else {
        index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[index];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(text: currentQuestion.question),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffleAnswers().map((answer) {
              return AnswerButton(
                  text: answer,
                  onTap: () {
                    nextQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
