
import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  // const Result({Key key}) : super(key: key);

  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore,this.resetHandler);

  String get resultPhrase{
    var resultText;
    print(resultScore);

    if(resultScore <= 8){
      resultText = "You are awesome and innocent!";
    } else if(resultScore <= 16){
      resultText = "Pretty likeable!";
    } else if(resultScore <= 29){
      resultText = "You are ... strange!";
    } else {
      resultText = "You are so bad!";
    }

    return resultText;
  }
  
 @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            child: Text(
              'Restart Quiz!',
            ),
            
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}