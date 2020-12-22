import 'package:flutter/material.dart';
import '../Template/theme.dart';

class EditUser extends StatefulWidget {
  @override
  _EditUser createState() => _EditUser();
}

class _EditUser extends State<EditUser> {
  final TextEditingController customController = TextEditingController();

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
    return Scaffold(
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
    );
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
          onPressed: () {}
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
