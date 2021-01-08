import 'package:Quiz/Template/result.dart';
import 'package:Quiz/Template/resultList.dart';
import 'package:Quiz/model.dart';
import 'package:flutter/material.dart';
import 'package:Quiz/Template/theme.dart';
import 'package:provider/provider.dart';

class ScoreView extends StatelessWidget {
  ScoreView({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<AppState>(context, listen: false)
        .getResultList(); //flytta till main
    return Scaffold(
      body: Center(
        child: Column(children: [
          _image(),
          Container(
              decoration: BoxDecoration(
                color: Color(0xFF4C8C4A),
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 314,
              height: 116,
              child: Row(
                children: [
                  _userInformationColumn(context),
                  _latestQuizContainer(context),
                ],
              )),
          Container(height: 10),
          Consumer<AppState>(
              builder: (context, state, child) => ResultList(state.resultList))
        ]),
      ),
    );
  }

  Widget _image() {
    return Center(child: Image(image: AssetImage('assets/logo.png')));
  }

  Widget _userInformationColumn(context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      _placeHolderAvatar(),
      Text(
        'Username',
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: AppTheme.smallFontSize),
      ),
    ]);
  }

  Widget _latestQuizContainer(context) {
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
    //Nedan följer koden till HomeView, ropa på _bestResult.score för att få ut poängen.
    /*List<Result> _resultList = [];
    _resultList = Provider.of<AppState>(context, listen: false).resultList;
    Result _bestResult = _resultList[0];
    for (var i = 0; i < _resultList.length; i++) {
      if (_resultList[i].score > _bestResult.score) {
        _bestResult = _resultList[i];
      }
    }*/

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
        Text(
          '${_latestResult.category}'.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontSize: AppTheme.normalHeaderFontSize),
        ),
        Text(
          '${_latestResult.score}/$possibleScore points',
          textAlign: TextAlign.right,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontSize: AppTheme.normalHeaderFontSize),
        ),
        Icon(Icons.star_border_rounded)
      ])),
    );
  }

  Widget _placeHolderAvatar() {
    return Center(
      child: Container(
        height: 80,
        width: 80,
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/avatar1.png'),
          radius: 30,
        ),
      ),
    );
  }
}
