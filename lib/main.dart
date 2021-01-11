import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Quiz/model.dart';
import 'package:Quiz/Navigation/NavigationBar.dart';
import 'package:Quiz/Template/theme.dart';
import 'package:Quiz/Views/RegisterView.dart';

void main() async {
  var state = AppState();

  await state.getUser();
  await state.getResultList();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(state),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppState state;

  MyApp(this.state);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.materialTheme,
        home: _getScreen());
  }

  Widget _getScreen() {
    if (state.user == null) {
      return RegisterView();
    } else {
      return BottomNavBar();
    }
  }
}
