import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'Navigation/NavigationBar.dart';
import 'package:Quiz/model.dart';
import 'package:Quiz/Views/RegisterView.dart';
import 'Template/theme.dart';
import 'model.dart';

void main() async {
  var state = AppState();

  await state.getUser();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(state),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppState state;

  MyApp(
    this.state,
  );

  @override
  Widget build(BuildContext context) {
    print('det här är listUser i buildern: ${state.listUser}');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.materialTheme,
      home: _getScreen(),
    );
  }

  Widget _getScreen() {
    print('det här är listUser i widgeten: ${state.listUser}');
    if (state.listUser.isEmpty) {
      return RegisterView();
    } else {
      return BottomNavBar();
    }
  }
}
