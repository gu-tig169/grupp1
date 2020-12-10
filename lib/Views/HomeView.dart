import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/RegisterView');
            },
          ),
          IconButton(
            icon: Icon(Icons.leaderboard),
            onPressed: () {
              Navigator.pushNamed(context, '/SetupQuizView');
            },
          ),
          IconButton(
            icon: Icon(Icons.flag),
            onPressed: () {
              Navigator.pushNamed(context, '/QuizView');
            },
          ),
          IconButton(
            icon: Icon(Icons.grade),
            onPressed: () {
              Navigator.pushNamed(context, '/ScoreView');
            },
          ),
        ],
      ),
    );
  }
}
