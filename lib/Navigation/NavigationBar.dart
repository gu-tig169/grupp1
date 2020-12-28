
import 'package:Quiz/Views/HomeView.dart';
import 'package:Quiz/Views/ScoreView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class BottomNavBar extends StatefulWidget {

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _pages = [HomeView(
    key: PageStorageKey('HomeView'),),
    ScoreView(
    key: PageStorageKey('ScoreView'),
    ),
  ];

final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;



  _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
      child:_pages[_selectedIndex],
      bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Color(0xFF4C8C4A),
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Score',
            icon: Icon(Icons.four_k),
          ),
        ],
      ),
    );
  }
}
