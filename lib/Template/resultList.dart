import 'package:Quiz/Template/result.dart';
import 'package:Quiz/Template/theme.dart';
import 'package:flutter/material.dart';

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
    String possibleScore;
    if (result.difficulty == 'hard') {
      possibleScore = '30';
    }
    if (result.difficulty == 'medium') {
      possibleScore = '20';
    }
    if (result.difficulty == 'easy') {
      possibleScore = '10';
    }
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
                          child: Text('Quiz $index',
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
                '${result.category}\n(${result.difficulty})',
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
                        '${result.score}/$possibleScore',
                        textAlign: TextAlign.right,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontSize: AppTheme.smallFontSize),
                      ),
                      Icon(Icons.star_border_rounded)
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
