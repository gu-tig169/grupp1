import 'package:flutter/material.dart';

import '../model.dart';

class RegisterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterViewState();
  }
}

class RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterView'),
      ),
      body: Center(
        child: Column(
          children: [
            _inputField(),
            _addUser(),
          ],
        ),
      ),
    );
  }

//Textinmatningsfält
  Widget _inputField() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Write username',
        ),
      ),
    );
  }

  //Add User-knapp
  Widget _addUser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 100),
        FlatButton(
          child: Text('Save'),
          onPressed: () {
            Navigator.pushNamed(context, '/HomeView');
          },
        ),
      ],
    );
  }
}
