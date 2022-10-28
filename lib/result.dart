import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String result;
  final bool isPass;
  final VoidCallback resetQuiz;

  const Result({
    required this.result,
    required this.isPass,
    required this.resetQuiz,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Center(
        child: Column(
          children: [
            Icon(
              isPass ? Icons.mood : Icons.sentiment_dissatisfied,
              size: 100,
              color: isPass ? Colors.green : Colors.red,
            ),
            Text(
              result,
              style: TextStyle(
                fontSize: 25,
                color: isPass ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              isPass ? "Passed" : "Failed",
              style: TextStyle(
                  color: isPass ? Colors.green : Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: resetQuiz,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: isPass ? Colors.green : Colors.red,
                ),
                child: const Text('Reset'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
