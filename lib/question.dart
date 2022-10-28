import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  const Question({
    required this.question,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        question,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.green,
          fontSize: 20,
        ),
      ),
    );
  }
}
