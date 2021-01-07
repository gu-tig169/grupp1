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
}
