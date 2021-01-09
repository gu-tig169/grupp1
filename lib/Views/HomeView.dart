import 'package:Quiz/Template/result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Quiz/Views/editUserView.dart';
import 'package:Quiz/Template/theme.dart';
import 'package:Quiz/Template/user.dart';
import 'package:Quiz/model.dart';
import 'setupQuizView.dart';
import 'package:Quiz/main.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _logo(),
          Container(height: 32),
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

  //logo
  Widget _logo() {
    return Center(
      child: Image(image: AssetImage('assets/logo.png')),
    );
  }

//displays current HighScore
  Widget _currentHighScore(context) {
    String _text;
    if (Provider.of<AppState>(context, listen: false).resultList.isEmpty) {
      _text = 'No result yet, \n play a quiz!';
    } else {
      List<Result> _resultList = [];
      _resultList = Provider.of<AppState>(context, listen: false).resultList;
      Result _bestResult = _resultList[0];
      for (var i = 0; i < _resultList.length; i++) {
        if (_resultList[i].score > _bestResult.score) {
          _bestResult = _resultList[i];
        }
      }
      _text = 'Highscore\n${_bestResult.category}: ${_bestResult.score}p';
    }
    return Container(
      padding: EdgeInsetsDirectional.only(top: 10.0),
      child: Text(_text,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontSize: AppTheme.largeHeaderFontSize)),
      height: 100,
      width: 314,
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: Color(0xFF4C8C4A),
        borderRadius: BorderRadius.circular(10.0),
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
