import 'package:Quiz/Template/result.dart';
import 'package:Quiz/Template/theme.dart';
import 'package:flutter/material.dart';

class ResultList extends StatelessWidget {
  final List<Result> list;
  //int resultIndex = 0;

  ResultList(this.list);

  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) =>
              _scoreListItem(context, index)),
    );
  }

  Widget _scoreListItem(BuildContext context, int index) {
    final scoreList = list[index];
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
                        '${scoreList.score}',
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
