import 'package:flutter/material.dart';

import 'package:Quiz/Template/result.dart';
import 'package:Quiz/Template/theme.dart';

class ResultList extends StatelessWidget {
  final List<Result> list;

  ResultList(this.list);

  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) =>
              _listItem(context, index)),
    );
  }

  Widget _listItem(BuildContext context, int index) {
    final result = list[index++];

    return Container(
      height: 58,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _quizIndex(context, index),
            _resultAndCategory(context, result),
            _score(context, result)
          ],
        ),
      ),
    );
  }

  Widget _quizIndex(context, index) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 8),
        child: Center(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Quiz $index',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: AppTheme.smallFontSize)),
          ),
        ),
      ),
    );
  }

  Widget _resultAndCategory(context, result) {
    return Container(
      width: 150,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('${result.category}'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontSize: AppTheme.smallFontSize)),
          Text('${result.difficulty}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: AppTheme.smallFontSize)),
        ]),
      ),
    );
  }

  Widget _score(context, result) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(right: 8),
        child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            '${result.score}/${result.possibleScore}',
            textAlign: TextAlign.right,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontSize: AppTheme.smallFontSize),
          ),
          Icon(Icons.star_border_rounded)
        ])),
      ),
    );
  }
}
