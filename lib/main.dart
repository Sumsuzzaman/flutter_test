
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';


// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
    "answers": [{"text":"Black", "score": 10},{ "text" : "Red", "score":5}, {"text" : "Green", "score": 3}, {"text" : "White", "score": 1}],
    },
    {
      "questionText": "What's your favorite animel?",
      "answers": [{"text" : "Rabbit", "score": 3}, {"text" : "Snake", "score": 11}, {"text" : "Deer", "score":5}, {"text":"Lion", "score": 9}],
    },
    {
      "questionText": "Who is Rupkotha?",
      "answers": [{"text" :"Student", "score": 10}, {"text":"Teacher", "score":15}, {"text" : "Doctor", "score": 8}, {"text":"Eng.", "score": 9}],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

 void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
