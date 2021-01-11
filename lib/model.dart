import 'package:flutter/material.dart';

import 'package:Quiz/Api/resultApi.dart';
import 'package:Quiz/Api/userApi.dart';
import 'package:Quiz/Template/result.dart';
import 'package:Quiz/Template/user.dart';

class AppState extends ChangeNotifier {
  User user;
  List<Result> _resultList = [];

  //User get user => _user;
  List<Result> get resultList => _resultList;

  Future getUser() async {
    List<User> listUser = await UserApi.fetchUser();
    if (listUser.isNotEmpty) {
      user = listUser.elementAt(0);
    }
    notifyListeners();
  }

  void addUser(User user) async {
    await UserApi.addUser(user);
    await getUser();
    notifyListeners();
  }

  void updateUser(User user) async {
    await UserApi.updateUser(user);
    await getUser();
    notifyListeners();
  }

  Future getResultList() async {
    List<Result> resultList = await ResultApi.getResult();
    _resultList = resultList;
    notifyListeners();
  }

  void addResult(Result item) async {
    await ResultApi.addResult(item);
    await getResultList();
    notifyListeners();
  }
}
