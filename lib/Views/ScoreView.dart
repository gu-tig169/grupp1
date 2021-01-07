import 'package:flutter/material.dart';

import 'package:Quiz/Template/theme.dart';

class ScoreItem {
  final String quizNumber;
  final String category;
  final String score;
  final dynamic icon;

  ScoreItem(this.quizNumber, this.category, this.score, this.icon);
}

class ScoreView extends StatelessWidget {
  ScoreView({
    Key key,
  }) : super(key: key);
  final List<ScoreItem> scores = [
    ScoreItem('Quiz 1', 'Science & Nature', '10', Icons.star_border_rounded),
    ScoreItem('Quiz 1000', 'Science & Nature', '10', Icons.star_border_rounded),
    ScoreItem('Quiz 1', 'Science & Nature', '1000', Icons.star_border_rounded)
  ];

  @override
  Widget build(BuildContext context) {
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
                  _bestCategoryContainer(context),
                ],
              )),
          Container(height: 10),
          _scoreList(),
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

  Widget _bestCategoryContainer(context) {
    return Container(
      width: 210,
      height: 116,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BEST CATEGORY',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontSize: AppTheme.normalHeaderFontSize),
            ),
            Text(
              'Science & Nature',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: AppTheme.normalFontSize),
            ),
          ],
        ),
      ),
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

  Widget _scoreList() {
    return Expanded(
      child: ListView.builder(
          itemCount: scores.length,
          itemBuilder: (BuildContext context, int index) =>
              _scoreListItem(context, index)),
    );
  }

  Widget _scoreListItem(BuildContext context, int index) {
    final scoreList = scores[index];
    return Container(
      height: 58,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Center(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(scoreList.quizNumber,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      fontSize: AppTheme.smallFontSize))))),
            ),
            Container(
              width: 150,
              child: Center(
                  child: Text(
                scoreList.category,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: AppTheme.smallFontSize),
              )),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 8),
                child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                      Text(
                        scoreList.score,
                        textAlign: TextAlign.right,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontSize: AppTheme.smallFontSize),
                      ),
                      Icon(
                        scoreList.icon,
                      )
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
