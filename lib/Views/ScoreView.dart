import 'package:flutter/material.dart';

class ScoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('ScoreView'),
      ),
      body: Container(
        child: ListView(
          children: [ListTile()],
        ),
      ),
    );
  }
}
