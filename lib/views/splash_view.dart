import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/views/quiz_view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> QuizView()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeInImage(
          fadeInCurve: Curves.easeInBack,
          fadeInDuration: Duration(seconds: 1),
          placeholder: AssetImage('assets/images/logo.jpg'),
          image: AssetImage('assets/images/logo.jpg'),
        ),
      ),
    );
  }
}
