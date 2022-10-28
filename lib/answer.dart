import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final VoidCallback nextQuestion;

  const Answer({
    required this.answer,
    required this.nextQuestion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: nextQuestion,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(5)),
        child: Text(answer),
      ),
    );
  }
}
