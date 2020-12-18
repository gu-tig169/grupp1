import 'package:flutter/material.dart';

class SetupQuizView extends StatefulWidget {
  @override
  _SetupQuizViewState createState() => _SetupQuizViewState();
}

class _SetupQuizViewState extends State<SetupQuizView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('SetupQuizView'),
      ),
    );
  }
}
