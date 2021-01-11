import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Quiz/Misc/logo.dart';
import 'package:Quiz/model.dart';
import 'package:Quiz/Template/result.dart';
import 'package:Quiz/Template/theme.dart';
import 'package:Quiz/Views/editUserView.dart';
import 'setupQuizView.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Provider.of<AppState>(context, listen: false).user;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 10),
          bigLogo(),
          _currentHighScore(context),
          Container(height: 20),
          Consumer<AppState>(
              builder: (context, state, child) =>
                  _userItem(context, state.user)),
          _playButton(context),
        ],
      ),
    );
  }

//displays current HighScore
  Widget _currentHighScore(context) {
    String title;
    String text;
    if (Provider.of<AppState>(context, listen: false).resultList.isEmpty) {
      text = 'No result yet, \n play a quiz!';
      title = '';
    } else {
      List<Result> resultList = [];
      resultList = Provider.of<AppState>(context, listen: false).resultList;
      Result bestResult = resultList[0];
      for (var i = 0; i < resultList.length; i++) {
        if (resultList[i].score > bestResult.score) {
          bestResult = resultList[i];
        }
      }
      text = '${bestResult.category}\n${bestResult.score} points';
      title = 'High score:';
    }
    return Container(
      padding: EdgeInsetsDirectional.only(top: 10.0),
      height: 120,
      width: 314,
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
          color: Color(0xFF4C8C4A), borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          Text(title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: AppTheme.normalFontSize)),
          Text(text,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontSize: AppTheme.largeHeaderFontSize))
        ],
      ),
    );
  }

  Widget _userItem(context, user) {
    //User _user = Provider.of<AppState>(context, listen: false).user;
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
            backgroundImage: AssetImage(user.userAvatar),
          ),
        ),
        title: Text(
          user.userName != null ? user.userName : 'Username',
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

//Playbutton, sends the user to SetupQuizView
  Widget _playButton(context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      height: 80,
      width: 314,
      child: RaisedButton(
        child: Text('PLAY', style: Theme.of(context).textTheme.subtitle1),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SetupQuizView()));
        },
      ),
    );
  }
}
