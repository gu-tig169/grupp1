import 'package:Quiz/Template/result.dart';
import 'package:flutter/material.dart';

import 'Api/userApi.dart';
import 'Template/user.dart';
import 'Api/resultApi.dart';

class AppState extends ChangeNotifier {
  List<User> _listUser = [];
  List<Result> _resultList = [];

  List<User> get listUser => _listUser;
  List<Result> get resultList => _resultList;

  Future getUser() async {
    List<User> listUser = await UserApi.fetchUser();
    _listUser = listUser;
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
