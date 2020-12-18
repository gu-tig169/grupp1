import 'package:flutter/material.dart';

class ScoreItem {
  final String quizNumber;
  final String category;
  final String score;
  final dynamic icon;

  ScoreItem(this.quizNumber, this.category, this.score, this.icon);
}

class ScoreView extends StatelessWidget {
  final List<ScoreItem> scores = [
    ScoreItem('Quiz 1', 'Science & Nature', '10', Icons.star),
    ScoreItem('Quiz 1000', 'Science & Nature', '10', Icons.star),
    ScoreItem('Quiz 1', 'Science & Nature', '1000', Icons.star)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          _image(),
          Container(
              color: Colors.lightGreen[100],
              width: 300,
              height: 116,
              child: Row(
                children: [
                  _userInformationColumn(),
                  _bestCategoryContainer(),
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

  Widget _userInformationColumn() {
    return Column(children: [
      _placeHolderAvatar(),
      Text('Username'),
    ]);
  }

  Widget _bestCategoryContainer() {
    return Container(
      width: 210,
      height: 116,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BEST CATEGORY', style: TextStyle(fontSize: 16)),
            Text('Science & Nature', style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }

  Widget _placeHolderAvatar() {
    //Ta bort sedan!
    return Center(
      child: Image(
        image: AssetImage('assets/logo.png'),
        height: 80,
        width: 80,
      ),
    );
  }

  Widget _scoreList() {
    return Expanded(
      child: ListView.builder(
        itemCount: scores.length,
        itemBuilder: (BuildContext context, int index) =>
            _scoreListItem(context, index),
      ),
    );
  }

  Widget _scoreListItem(BuildContext context, int index) {
    final scoreList = scores[index];
    return Container(
      height: 58,
      child: Card(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 8),
                  color: Colors.green,
                  child: Center(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(scoreList.quizNumber)))),
            ),
            Container(
              color: Colors.green,
              width: 150,
              child: Center(child: Text(scoreList.category)),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 8),
                color: Colors.green,
                child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                      Text(
                        scoreList.score,
                        textAlign: TextAlign.right,
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
