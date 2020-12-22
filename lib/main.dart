//import './Views/SetupQuizView.dart';
import 'package:flutter/material.dart';
import 'Navigation/NavigationBar.dart';
import 'Template/theme.dart';
//import './Views/HomeView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.materialTheme,
      home: BottomNavBar(),
    );
  }
}
