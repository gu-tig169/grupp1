import 'package:Quiz/Template/result.dart';
import 'package:flutter/material.dart';

//import 'Api/userApi.dart';
import 'Template/user.dart';

class AppState extends ChangeNotifier {
  List<User> _listUser = [];
  List<Result> _resultList = [];

  List<User> get listUser => _listUser;
  List<Result> get resultList => _resultList;

  /*void addItem(Result item) async {
    await resultApi.addItem(item);
    await getList(); 
  }*/
}
