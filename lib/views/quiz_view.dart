import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/quizBrain/dummy_data.dart';
import 'package:quiz_app/views/splash_view.dart';

class QuizView extends StatefulWidget {
  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  QuizBrain _quizBrain = QuizBrain();
  int questionIndex = 0;

  void onAnswer(int index) {
    if (_quizBrain.rightAnswers[questionIndex] ==
        _quizBrain.answers[questionIndex][index]) {
      print('right');
      _quizBrain.scoreKeeper.add(0);
    } else {
      print('error');
    }

    if (questionIndex < _quizBrain.question.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      // showDialog
      quizDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Page'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(25),
            child: Text(
              _quizBrain.question[questionIndex],
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30)),
            height: sizeFromHeight(context, 3),
          ),
          Wrap(
            direction: Axis.horizontal,
            children: _quizBrain.answers[questionIndex]
                .map(
                  (element) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(element),
                      onPressed: () => onAnswer(
                          _quizBrain.answers[questionIndex].indexOf(element)),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  void quizDialog() {
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Text('Congrats!'),
              content: Text(
                  '${_quizBrain.scoreKeeper.length} / ${_quizBrain.question.length}'),
              actions: <Widget>[
                FlatButton(
                  onPressed: ()=> exit(0),
                  // onPressed: () => Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(builder: (_) => SplashView())),
                  child: Text('Close App'),
                ),
              ],
            ));
  }
}
