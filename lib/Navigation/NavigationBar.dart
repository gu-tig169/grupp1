//import 'package:Quiz/Views/RegisterView.dart';
//import 'package:Quiz/Views/ScoreView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'NavigationRouter.dart';
//import 'package:custom_navigator/custom_navigator.dart';

//import 'package:Quiz/Views/HomeView.dart';
//import 'package:Quiz/Views/QuizView.dart';
//import 'package:Quiz/Views/SetupQuizView.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  //Vilken sida vi står på.
  String _currentPage;

  //Vilket vårt nuvarande index är, te.x.. HomeView = 0.
  int _selectedIndex = 0;

//Lista med Strings, våra sidonycklar.
  List<String> pageKeys = [
    'Home',
    'Quiz',
    // 'Setup',
    'Score',
    'Register',
  ];

  //Map objekt med Strings och globalkeys.
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    'Home': GlobalKey<NavigatorState>(),
    'Quiz': GlobalKey<NavigatorState>(),
    // 'Setup': GlobalKey<NavigatorState>(),
    'Score': GlobalKey<NavigatorState>(),
    'Register': GlobalKey<NavigatorState>(),
  };

//Funktion som tar nyckeln av vår nuvarande sida och en int av vårt index.
//setState av currentPage sätts till att vara den Stringparametern, och selectedIndex till index parametern.
  void _selectTab(String tabItem, int index) {
    //Kollar ifall vår currentPage är samma som den vi klickar på.
    //om den är det, popar vi alla sidor tills vi når botten av stacken.
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
      //Annars sätts state som vanligt.
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

//Returnerar en offstagewidget, tar en stringnyckel.
//"Offstage Widget is a widget that lays the child out as if it was in the tree,
//but without painting anything, without making the child available for hit-testing,
//and without taking any room in the parent".
  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //willpop är till för att se till så vi inte flyger av appen,
    // den kollar om ifall vi popar den första skärmen
    //tar den då oss av appen?
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != 'Home') {
            _selectTab('Home', 1);

            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        //Vi behöver Stack för att hålla våra sidor vid liv när vi går ifrån dom,
        //alltså bibehålla State. Varje child är en offstagewidget.
        //Offstage-->Navigator-->CorrectPage.
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator('Home'),
            _buildOffstageNavigator('Quiz'),
            //_buildOffstageNavigator('Setup'),
            _buildOffstageNavigator('Score'),
            _buildOffstageNavigator('Register'),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF003300),
          selectedItemColor: Colors.amber,
          unselectedItemColor: Color(0xFF4C8C4A),
          //Triggar selectTab funktion som passar nuvarande nyckel och dess index.
          onTap: (int index) {
            _selectTab(pageKeys[index], index);
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.looks_one), label: 'Home'),
            BottomNavigationBarItem(
                icon: new Icon(Icons.looks_two), label: 'Quiz'),
            // BottomNavigationBarItem(
            //   icon: new Icon(Icons.looks_3), label: 'Setup'),
            BottomNavigationBarItem(
                icon: new Icon(Icons.looks_4), label: 'Score'),
            BottomNavigationBarItem(
                icon: new Icon(Icons.looks_5), label: 'Register'),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
