import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/views/splash_view.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: SplashView(),
    );
  }
}
