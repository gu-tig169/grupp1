import 'package:Quiz/Template/logo.dart';
import 'package:Quiz/Template/result.dart';
import 'package:Quiz/Template/resultList.dart';
import 'package:Quiz/Template/user.dart';
import 'package:Quiz/model.dart';
import 'package:flutter/material.dart';

import 'package:Quiz/Template/theme.dart';
import 'package:provider/provider.dart';

class ScoreView extends StatelessWidget {
  ScoreView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Container(height: 10),
          bigLogo(),
          _userAndQuiz(context),
          Container(height: 10),
          Consumer<AppState>(
              builder: (context, state, child) => ResultList(state.resultList)),
        ]),
      ),
    );
  }

  Widget _userAndQuiz(context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFF4C8C4A),
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: 314,
        height: 116,
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.only(left: 5),
                child: _userInformationColumn(context)),
            _latestQuizContainer(context),
          ],
        ));
  }

  Widget _userInformationColumn(context) {
    User _user =
        Provider.of<AppState>(context, listen: false).listUser.elementAt(0);

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: 80,
        width: 80,
        child: CircleAvatar(
          backgroundImage: AssetImage(_user.userAvatar),
          radius: 35.0,
        ),
      ),
      Text(
        '${_user.userName}',
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: AppTheme.smallFontSize),
      ),
    ]);
  }

  Widget _latestQuizContainer(context) {
    return Container(
      width: 210,
      height: 116,
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(height: 5),
        Text(
          'Latest quiz:',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontSize: AppTheme.normalFontSize),
        ),
        Container(height: 5),
        _latestResult(context),
      ])),
    );
  }

  Widget _latestResult(context) {
    if (Provider.of<AppState>(context, listen: false).resultList.isEmpty) {
      return Text(
        'No results yet!',
        style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(fontSize: AppTheme.normalHeaderFontSize),
      );
    } else {
      Result _latestResult =
          Provider.of<AppState>(context, listen: false).resultList.last;
      String possibleScore;
      if (_latestResult.difficulty == 'hard') {
        possibleScore = '30';
      }
      if (_latestResult.difficulty == 'medium') {
        possibleScore = '20';
      }
      if (_latestResult.difficulty == 'easy') {
        possibleScore = '10';
      }

      return Column(children: [
        Text(
          '${_latestResult.category}'.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontSize: AppTheme.normalFontSize),
        ),
        Text(
          '${_latestResult.score}/$possibleScore points',
          textAlign: TextAlign.right,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontSize: AppTheme.normalHeaderFontSize),
        )
      ]);
    }
  }
}
