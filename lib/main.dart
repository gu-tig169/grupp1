import 'package:Quiz/Views/QuizView.dart';
import 'package:Quiz/Views/RegisterView.dart';
import 'package:Quiz/Views/ScoreView.dart';
import 'package:flutter/material.dart';

import 'Views/HomeView.dart';
import 'Views/SetupQuizView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeView(),
        initialRoute: '/HomeView',
        routes: {
          '/RegisterView': (context) => RegisterView(),
          '/HomeView': (context) => HomeView(),
          '/SetupQuizView': (context) => SetupQuizView(),
          '/QuizView': (context) => QuizView(),
          '/ScoreView': (context) => ScoreView(),
        } //Navigator.pushNamed(context, '..')
        );
  }
}
