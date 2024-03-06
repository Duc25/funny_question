import 'package:flutter/material.dart';

class QuestionIndex extends StatelessWidget {
  const QuestionIndex(this.index, this.isCorrect, {super.key});
  final int index;
  final bool isCorrect;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCorrect
            ? const Color.fromARGB(255, 50, 192, 239)
            : const Color.fromARGB(255, 101, 2, 140),
      ),
      child: Center(
        child: Text(
          index.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
