import 'package:Quiz/Template/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Quiz/model.dart';
import 'package:Quiz/Navigation/NavigationBar.dart';
import 'package:Quiz/Template/theme.dart';
import 'package:Quiz/Template/user.dart';

class RegisterView extends StatefulWidget {
  RegisterView();

  @override
  State<StatefulWidget> createState() {
    return RegisterViewState();
  }
}

class RegisterViewState extends State<RegisterView> {
  User user;

  TextEditingController userController;

  RegisterViewState() {
    user = User();

    userController = TextEditingController();

    userController.addListener(() {
      setState(() {
        user.userName = userController.text;
        user.userAvatar = 'assets/default.webp';

        print('${user.userName}');
        print('${user.userAvatar}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(height: 10),
            bigLogo(),
            _header(),
            _usernameField(),
            _save(),
          ],
        ),
      ),
    );
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
          controller: userController,
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavBar(user: user)));
              if (user.userName != null) {
                Provider.of<AppState>(context, listen: false).addUser(user);
              }
            }),
      ],
    );
  }
}
