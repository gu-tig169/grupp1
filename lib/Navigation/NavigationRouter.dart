import 'package:Quiz/Views/HomeView.dart';
import 'package:Quiz/Views/QuizView.dart';
import 'package:Quiz/Views/RegisterView.dart';
import 'package:Quiz/Views/ScoreView.dart';
import 'package:flutter/material.dart';

//Vi behöver ha våra children som Navigators, denna klassen tar
//GlobalKey av NavigatorState och en String som representerar den nyckeln.
class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const TabNavigator({Key key, this.navigatorKey, this.tabItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;

//För att veta vilken Widget vi har kan vi bara querya vilken nyckel vi har.

    if (tabItem == 'Home')
      child = HomeView();
    else if (tabItem == 'Quiz')
      child = QuizView();
    //else if (tabItem == 'Setup')
    // child = SetupQuizView();
    else if (tabItem == 'Score')
      child = ScoreView();
    else if (tabItem == 'Register') child = RegisterView();

//Ger tillbaka en Navigator med keyproperty som är satt till keyklass variabeln
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        //returnerar sedan en materialpageroute på sidan vi är på.
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
