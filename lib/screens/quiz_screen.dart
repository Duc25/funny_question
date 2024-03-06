import 'package:flutter/material.dart';
import 'package:quizlet/data/questions.dart';
import 'package:quizlet/screens/questions_screen.dart';
import 'package:quizlet/screens/result_screen.dart';
import 'package:quizlet/screens/start_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuizScreen> {
  String nameScreen = 'start_screen';
  List<String> selectedAnswers = [];
  Widget? activeScreen;
  void switchScreen() {
    setState(() {
      nameScreen = 'questions_screen';
    });
  }

  void chooseAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
      if (selectedAnswers.length == questions.length) {
        nameScreen = 'result_screen';
      }
    });
  }

  void restartQuestion() {
    selectedAnswers = [];
    setState(() {
      nameScreen = 'questions_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (nameScreen) {
      case 'questions_screen':
        activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
        break;
      case 'result_screen':
        activeScreen = ResultScreen(
          chooseAnswer: selectedAnswers,
          restart: restartQuestion,
        );
        break;
      default:
        activeScreen = StartScreen(switchScreen);
        break;
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 91, 31, 194),
                  Color.fromARGB(255, 125, 76, 210)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: activeScreen),
      ),
    );
  }
}
