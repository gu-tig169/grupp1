import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'dart:async';
import 'package:Quiz/Template/user.dart';
import '../Template/theme.dart';
import '../Template/user.dart';
import 'package:Quiz/model.dart';

class EditUserView extends StatefulWidget {
  final User user;
  EditUserView(
    this.user, {
    Key key,
  }) : super(key: key);

  @override
  EditUserViewState createState() {
    return EditUserViewState(user);
  }
}

class EditUserViewState extends State<EditUserView> {
  User user;
  String userName;
  String userAvatar;

  //bool _selectedAvatar = false;

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

//_avatarList.insert(0, 'assets/AvatarM1.jpg');

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
                Container(
                  height: 35.0,
                ),
                _avatarHeader(),
                Container(
                  height: 12.0,
                ),
                _avatarGridView(context),
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
        //textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: '${user.userName}',
        ),
        controller: updateUserController,
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
              if (userName != null) {
                user.userAvatar = userAvatar;
                user.userName = userName;
                Provider.of<AppState>(context, listen: false).updateUser(user);
              }
              //state.updateUser(user);
              print('navigator user!!${user.userName}');

              Navigator.pop(context);
            }

            // Navigator.pop(context, User(userName: userName));

            ));
  }

  /*editUserProfile() async {
    await state.getUser();
    print('You should have an instance of a user (in EditUserView) ${state.listUser}');
    Navigator.pop(context, User(userName: userName));
  }*/

//the header choose avatar
  Widget _avatarHeader() {
    return Container(
      child: Text(
        'Choose avatar',
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: AppTheme.normalFontSize),
      ),
    );
  }
  /*class Grid4 extends StatelessWidget {
  void tapped(int index){
    if(index == 1){
      print("huray 1");
    } else {
      print("not the one :(");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        color: Colors.orange,
        child: GridView.builder(
          itemCount: 25,
          itemBuilder: (context, index) =>
              GestureDetector(
                  onTap: () => tapped(index),
                  child: Container(decoration: BoxDecoration(
                          color: Colors.white70, shape: BoxShape.circle))),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 40,
            crossAxisSpacing: 50,*/

//Shows the different avatars the user can choose from

  Widget _avatarGridView(context) {
    bool _selectedAvatar = false;
    return Expanded(
      child: Container(
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.only(left: 15, right: 15),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: _avatarList
              .map((item) => Card(
                    shape: _selectedAvatar
                        ? RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(4.0))
                        : RoundedRectangleBorder(
                            side: BorderSide(
                                color: AppTheme.primaryColor, width: 2.0),
                            borderRadius: BorderRadius.circular(4.0)),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            userAvatar = '$item';
                            /* if (user.userAvatar == '$item') {
                              _selectedAvatar = true;
                            } */
                          });

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
}
