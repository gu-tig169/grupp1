import 'package:Quiz/Template/logo.dart';
import 'package:Quiz/Template/result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Quiz/Template/theme.dart';
import 'package:Quiz/Template/user.dart';
import 'package:Quiz/model.dart';
import 'setupQuizView.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 10),
          bigLogo(),
          _currentHighScore(context),
          Stack(
            children: [
              _userListItem(),
            ],
          ),
          _playButton(context),
        ],
      ),
    );
  }

//displays current HighScore
  Widget _currentHighScore(context) {
    String text;
    if (Provider.of<AppState>(context, listen: false).resultList.isEmpty) {
      text = 'No result yet, \n play a quiz!';
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
          Text('Highscore:',
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

  Widget _userListItem() {
    return Consumer<AppState>(
        builder: (context, state, child) => UserList(state.listUser));
  }

//Playbutton, sends the user to SetupQuizView
  Widget _playButton(context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      height: 80,
      width: 314,
      child: RaisedButton(
        child: Text('PLAY', style: Theme.of(context).textTheme.subtitle1),
        //copyWith(fontSize: 24),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SetupQuizView()));
        },
      ),
    );
  }
}
