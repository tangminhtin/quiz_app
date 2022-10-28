import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _numCorrect = 0;
  bool _isPass = false;
  static const _questions = [
    {
      'question':
          'If you need to_______ the teacher’s attention, just put up your hand.',
      'answers': [
        {
          'answer': 'attract',
          'isTrue': true,
        },
        {
          'answer': 'pay',
          'isTrue': false,
        },
        {
          'answer': 'take',
          'isTrue': false,
        },
        {
          'answer': 'pull',
          'isTrue': false,
        },
      ],
    },
    {
      'question':
          'I did six hours of _______ for the test, but I still failed.',
      'answers': [
        {
          'answer': 'education',
          'isTrue': false,
        },
        {
          'answer': 'revision',
          'isTrue': true,
        },
        {
          'answer': 'survey',
          'isTrue': false,
        },
        {
          'answer': 'training',
          'isTrue': false,
        },
      ],
    },
    {
      'question':
          'Please, don’t forget _______ your essays during Friday’s lesson.',
      'answers': [
        {
          'answer': 'hand in',
          'isTrue': false,
        },
        {
          'answer': 'to hand in',
          'isTrue': true,
        },
        {
          'answer': 'handing in',
          'isTrue': false,
        },
        {
          'answer': 'to handing in',
          'isTrue': false,
        },
      ],
    },
    {
      'question':
          'If’s my ______ ceremony next week; I think my parents are looking forward to it more than I am.',
      'answers': [
        {
          'answer': 'graduation',
          'isTrue': true,
        },
        {
          'answer': 'graduating',
          'isTrue': false,
        },
        {
          'answer': 'graduate',
          'isTrue': false,
        },
        {
          'answer': 'graduates',
          'isTrue': false,
        },
      ],
    },
    {
      'question':
          'Going to university is expensive because in addition to the tuition______ , there are expenses for accommodation, books, living costs, etc.',
      'answers': [
        {
          'answer': 'grants',
          'isTrue': false,
        },
        {
          'answer': 'fares',
          'isTrue': false,
        },
        {
          'answer': 'fees',
          'isTrue': true,
        },
        {
          'answer': 'scholarships',
          'isTrue': false,
        },
      ],
    },
    {
      'question':
          'When I got to 16, some of my friends left school to get a job, but most _______.',
      'answers': [
        {
          'answer': 'dropped out',
          'isTrue': false,
        },
        {
          'answer': 'got in',
          'isTrue': false,
        },
        {
          'answer': 'moved back',
          'isTrue': false,
        },
        {
          'answer': 'stayed on',
          'isTrue': true,
        },
      ],
    },
    {
      'question':
          'The more ______ you have, the more chance you have of finding a better job.',
      'answers': [
        {
          'answer': 'courses',
          'isTrue': false,
        },
        {
          'answer': 'qualifications',
          'isTrue': true,
        },
        {
          'answer': 'contributions',
          'isTrue': false,
        },
        {
          'answer': 'qualities',
          'isTrue': false,
        },
      ],
    },
    {
      'question':
          'Next year, I have to decide which area of medicine I want to _________ in.',
      'answers': [
        {
          'answer': 'come',
          'isTrue': false,
        },
        {
          'answer': 'hand',
          'isTrue': false,
        },
        {
          'answer': 'focus',
          'isTrue': false,
        },
        {
          'answer': 'specialize',
          'isTrue': true,
        },
      ],
    },
    {
      'question':
          'I got a diploma in business administration, but still sometimes wish I had been able to go to university and get a _________.',
      'answers': [
        {
          'answer': 'certificate',
          'isTrue': false,
        },
        {
          'answer': 'degree',
          'isTrue': true,
        },
        {
          'answer': 'diploma',
          'isTrue': false,
        },
        {
          'answer': 'scholarship',
          'isTrue': false,
        },
      ],
    },
    {
      'question':
          'She spent a lot of time preparing for the interview,___________ was quite unnecessary.',
      'answers': [
        {
          'answer': 'which i thought',
          'isTrue': true,
        },
        {
          'answer': 'but which i thought',
          'isTrue': false,
        },
        {
          'answer': 'which i thought it',
          'isTrue': false,
        },
        {
          'answer': 'and i thought she',
          'isTrue': false,
        },
      ],
    },
  ];

  void _nextQuestion(bool isTrue) {
    setState(() {
      _questionIndex++;
      if (isTrue) {
        _numCorrect++;
      }
      if (_numCorrect >= (_questions.length / 2).ceil()) {
        _isPass = true;
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _numCorrect = 0;
      _isPass = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Minh Tin",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Column(
                children: [
                  Question(
                    question:
                        "${_questionIndex + 1}. ${_questions[_questionIndex]['question']}",
                  ),
                  ...(_questions[_questionIndex]['answers'] as List)
                      .map((answer) {
                    return Answer(
                        answer: answer['answer'],
                        nextQuestion: () => _nextQuestion(answer['isTrue']));
                  }).toList(),
                ],
              )
            : Result(
                result: '$_numCorrect/${_questions.length}',
                isPass: _isPass,
                resetQuiz: _resetQuiz),
      ),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
