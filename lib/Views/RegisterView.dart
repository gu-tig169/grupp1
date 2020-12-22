import 'package:flutter/material.dart';
import 'package:Quiz/Template/theme.dart';

//import '../model.dart';
//import 'package:Quiz/theme.dart';

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
      body: Center(
        child: Column(
          children: [
            _logo(),
            Container(height: 50),
            _header(),
            _usernameField(),
            _save(),
          ],
        ),
      ),
    );
  }

  //logo
  Widget _logo() {
    return Center(child: Image(image: AssetImage('assets/logo.png')));
  }

  //Header username
  Widget _header() {
    return Container(
        width: 250,
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Text('Username',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: AppTheme.normalFontSize)));
  }

  //a textfield for typing a username
  Widget _usernameField() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(width: 3, color: AppTheme.secondaryTextColor),
      ),
      color: Colors.white,
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

  //Save button, saves a username and creates a user
  Widget _save() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 50),
        RaisedButton(
          child: Text(
            'SAVE',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontSize: AppTheme.normalFontSize),
            //subtitle1
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/HomeView');
          },
        ),
      ],
    );
  }
}
