import 'package:flutter/material.dart';
import '../Template/theme.dart';
import 'dart:async';


class EditUser extends StatefulWidget {
  //final User user;

  final String userName;
  final dynamic userAvatar;

  EditUser({Key key, this.userName, this.userAvatar}) : super(key: key);

  @override
  _EditUser createState() {
    return _EditUser();
  }
}

class _EditUser extends State<EditUser> {
  dynamic avatar;
  var customController = new TextEditingController();


  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Wanna go back?'),
            content: new Text('Go back without saving changes'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  final List<String> _avatarList = [
    'assets/AvatarM1.jpg',
    'assets/AvatarM2.jpg',
    'assets/AvatarM3.jpg',
    'assets/AvatarM4.jpg',
    'assets/AvatarM5.jpg',
    'assets/AvatarM6.jpg',
    'assets/AvatarM7.jpg',
    'assets/AvatarM8.jpg',
    'assets/AvatarM9.jpg',
    'assets/AvatarW1.jpg',
    'assets/AvatarW2.jpg',
    'assets/AvatarW3.jpg',
    'assets/AvatarW4.jpg',
    'assets/AvatarW5.jpg',
    'assets/AvatarW6.jpg',
    'assets/AvatarW7.jpg',
    'assets/AvatarW8.jpg',
    'assets/AvatarW9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Color(0xFF1B5E20),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _usernameHeader(),
                _changeUsernameField(),
                _submitButton(),
                _avatarHeader(),
                _avatarScrollList(),
              ],
            ),
          ),
        ));
  }

//the header Edit username
  Widget _usernameHeader() {
    return Container(
      padding: EdgeInsets.only(top: 50.0, bottom: 10.0),
      child: Text(
        'Edit username',
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: AppTheme.normalFontSize),
      ),
    );
  }

//the textfild for changeing username
  Widget _changeUsernameField() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(width: 3, color: AppTheme.secondaryTextColor),
      ),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          hintText: ' Type your new name...',
        ),
        controller: customController,
      ),
    );
  }

//Submitbutton, saves the new username
  Widget _submitButton() {
    return Center(
      child: RaisedButton(
          child: Text(
            'SUBMIT',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontSize: AppTheme.normalFontSize),
          ),
          onPressed: () {
            Navigator.pop(context, customController.text);
            /*var route = new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new HomeView(userName: customController.text));*/
            /*Navigator.of(context).push(route);*/
          }
          // => _submit(context),
          // Navigator.of(context, $username).pop(customController.text.toString());
          ),
    );
  }

//the header choose avat
  Widget _avatarHeader() {
    return Container(
      padding: EdgeInsets.only(top: 50.0, bottom: 10.0),
      child: Text(
        'Choose avatar',
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: AppTheme.normalFontSize),
      ),
    );
  }

//Shows the different avatars the user can choose from
  Widget _avatarScrollList() {
    return Expanded(
      child: Container(
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.only(left: 15, right: 15),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: _avatarList
              .map((item) => Card(
                    elevation: 0,
                    child: InkWell(
                        onTap: () {
                          //Will use some onTap function for selecting and saving "Avatar". (setState/Provider/Consumer req..)
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(item), fit: BoxFit.cover),
                          ),
                        )),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
