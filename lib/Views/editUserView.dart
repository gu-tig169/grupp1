import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Quiz/Template/user.dart';
import '../Template/theme.dart';
import '../Template/user.dart';
import 'package:Quiz/model.dart';

class EditUserView extends StatefulWidget {
  final User user;
  EditUserView(this.user);

  @override
  EditUserViewState createState() {
    return EditUserViewState(user);
  }
}

class EditUserViewState extends State<EditUserView> {
  User user;
  String userName;
  String userAvatar;

  TextEditingController updateUserController;

  EditUserViewState(this.user) {
    userName = user.userName;
    userAvatar = user.userAvatar;
    updateUserController = TextEditingController();
    updateUserController.addListener(() {
      setState(() {
        userName = updateUserController.text;
      });
    });
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
    return WillPopScope(
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
                _avatarHeader(),
                _avatarGridView(context),
              ],
            ),
          ),
          floatingActionButton: _saveButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        ));
  }

//Visar dialogrutan om användaren vill gå tillbaka utan att göra ändringar.
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Wanna go back?'),
            content: Text('Go back without saving changes'),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

//titeln Edit username
  Widget _usernameHeader() {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(
        'Edit username',
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: AppTheme.normalFontSize),
      ),
    );
  }

//Textfältet för att ändra username
  Widget _changeUsernameField() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(width: 3, color: AppTheme.secondaryTextColor),
      ),
      color: Colors.white,
      child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10),
              hintText: '${user.userName}'),
          controller: updateUserController),
    );
  }

//Titeln choose avatar
  Widget _avatarHeader() {
    return Container(
      padding: EdgeInsets.only(top: 30.0, bottom: 12.0),
      child: Text(
        'Choose avatar',
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: AppTheme.normalFontSize),
      ),
    );
  }

//Visar avatarerna & markerar den valda avataren och sparar den som userAvatar
  Widget _avatarGridView(context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.iconColor,
            borderRadius: BorderRadius.circular(10.0)),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.only(left: 15, right: 15),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: _avatarList
              .map((item) => Card(
                    shape: userAvatar == item
                        ? RoundedRectangleBorder(
                            side: BorderSide(
                                color: AppTheme.primaryColor, width: 2.5),
                            borderRadius: BorderRadius.circular(4.0))
                        : RoundedRectangleBorder(
                            side: BorderSide(
                                color: AppTheme.iconColor, width: 2.0),
                            borderRadius: BorderRadius.circular(4.0)),
                    child: InkWell(
                        onTap: () {
                          if (userAvatar != item) {
                            setState(() {
                              userAvatar = item;
                            });
                          } else {
                            setState(() {
                              userAvatar = user.userAvatar;
                            });
                          }
                          print('$userAvatar');
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

  //Savebutton, knapp som sparar ändringarna till api:et
  Widget _saveButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: FloatingActionButton(
          backgroundColor: AppTheme.buttonColor,
          child: Text(
            'SAVE',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontSize: AppTheme.normalFontSize),
          ),
          onPressed: () {
            if (userName != null) {
              user.userAvatar = userAvatar;
              user.userName = userName;
              Provider.of<AppState>(context, listen: false).updateUser(user);
            }
            Navigator.pop(context);
          }),
    );
  }
}
