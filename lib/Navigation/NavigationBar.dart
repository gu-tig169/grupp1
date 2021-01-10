import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:Quiz/Template/user.dart';
import 'package:Quiz/Views/HomeView.dart';
import 'package:Quiz/Views/ScoreView.dart';

class BottomNavBar extends StatefulWidget {
  final User user;

  BottomNavBar({Key key, this.user}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _pages = [
    HomeView(
      key: PageStorageKey('HomeView'),
    ),
    ScoreView(
      key: PageStorageKey('ScoreView'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: _pages[_selectedIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Color(0xFF4C8C4A),
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Score',
            icon: Icon(Icons.stars),
          ),
        ],
      ),
    );
  }
}
