import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _questionIndex = 0;
  int _score = 0;

  List<Map<String, Object>> _questions = [
    {
      'questionText': 'Flutter is developed by Google.',
      'answer': true,
    },
    {
      'questionText': 'Dart is a compiled language.',
      'answer': true,
    },
    {
      'questionText': 'Widgets in Flutter are immutable.',
      'answer': true,
    },
    {
      'questionText': 'Flutter uses Java for app development.',
      'answer': false,
    },
  ];

  void _answerQuestion(bool userAnswer) {
    bool correctAnswer = _questions[_questionIndex]['answer'] as bool;

    setState(() {
      if (userAnswer == correctAnswer) {
        _score++;
      }

      if (_questionIndex < _questions.length - 1) {
        _questionIndex++;
      } else {
        // Quiz completed
        _showQuizResult();
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  void _showQuizResult() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Completed'),
          content: Text('Your score: $_score/${_questions.length}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetQuiz();
              },
              child: Text('Restart Quiz'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Quiz App',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _questions[_questionIndex]['questionText'] as String,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _answerQuestion(true),
                child: Text('True'),
              ),
              ElevatedButton(
                onPressed: () => _answerQuestion(false),
                child: Text('False'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
