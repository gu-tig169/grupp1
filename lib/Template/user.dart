import 'package:Quiz/Template/theme.dart';
import 'package:Quiz/Views/editUserView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Quiz/model.dart';

class UserList extends StatelessWidget {
  final List<User> list;

  UserList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: list.map((user) => userItem(context, user)).toList());
  }

  Widget userItem(context, user) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.0,
      ),
      child: ListTile(
        trailing: Container(
          child: Transform.translate(
            offset: Offset(45, -38),
            child: IconButton(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                icon: Icon(Icons.edit, color: AppTheme.primaryTextColor),
                iconSize: 20,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditUserView(user)));
                }),
          ),
        ),
        leading: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
            radius: 35.0,
            backgroundColor: Colors.amber,
            backgroundImage: AssetImage(user.userAvatar != 'Default'
                ? user.userAvatar
                : user.userAvatar), //[0].toUpperCase()),
          ),
        ),
        title: Text(
          user.userName != null ? user.userName : '',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontSize: AppTheme.normalFontSize),
        ),
      ),
      height: 80,
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Color(0xFF4C8C4A),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class User {
  String id;
  String userName;
  String userAvatar;
  List<String> listNameAndAvatar = [];

  User({
    this.id,
    this.userName,
    this.userAvatar,
    this.listNameAndAvatar,
  });

  static Map<String, dynamic> toJson(User user) {
    return {
      'title':
          user.listNameAndAvatar = ['${user.userName}', '${user.userAvatar}'],
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    var listNameAndAvatar = json['title'].cast<String>();
    String _userName = listNameAndAvatar.elementAt(0);
    String _userAvatar = listNameAndAvatar.elementAt(1);
    return User(
      id: json['id'],
      userName: _userName,
      userAvatar: _userAvatar,
    );
  }
}
