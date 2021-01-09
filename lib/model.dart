import 'package:flutter/material.dart';

import 'Api/userApi.dart';
import 'Template/user.dart';

class AppState extends ChangeNotifier {
  List<User> _listUser = [];

  List<User> get listUser => _listUser;

  Future getUser() async {
    List<User> listUser = await UserApi.fetchUser();
    _listUser = listUser;
    notifyListeners();
  }

  void addUser(User user) async {
    await UserApi.addUser(user);
    await getUser();
    notifyListeners();
    print('Added user: ${_listUser.elementAt(0).userName}');
  }

  /*void updateUser(User user) async {
    await UserApi.updateUser(user);
    await getUser();
    notifyListeners();
  }*/

  void updateUser(User user) async {
    //user.userName = userName;
    print('Vi är i model!$user');
    await UserApi.updateUserApi(user);
    await getUser();
    notifyListeners();
  }

  void removeUser(User user) async {
    await UserApi.deleteUser(user.id);
    await getUser();
    notifyListeners();
  }
}
