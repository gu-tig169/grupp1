//import './Views/SetupQuizView.dart';
import 'package:Quiz/model.dart';
import 'package:flutter/material.dart';
import 'Navigation/NavigationBar.dart';
import 'Template/theme.dart';
import 'package:provider/provider.dart';
//import './Views/HomeView.dart';

void main() {
  var state = GlobalAppState();

  runApp(ChangeNotifierProvider(
    create: (context) => state, 
    child:MyApp(),
  ),
 );
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
