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
            _image(),
            _text(),
            _inputField(),
            _addUser(),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return Center(child: Image(image: AssetImage('assets/logo.png')));
  }

  //Username rubrik
  Widget _text() {
    return Container(
      width: 250,
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Text('Username',
          style:
              TextStyle(fontSize: 20)), //Ändrat storlek, får jag göra det här?
    );
  }

//Textinmatningsfält
  Widget _inputField() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Container(
        width: 250,
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Type your name here...',
          ),
        ),
      ),
    );
  }

  //Add User-knapp
  Widget _addUser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 50),
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Text('Save'),
          onPressed: () {
            Navigator.pushNamed(context, '/HomeView');
          },
        ),
      ],
    );
  }
}
