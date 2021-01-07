import 'package:Quiz/Template/result.dart';
import 'package:flutter/material.dart';

//import 'Api/userApi.dart';
import 'API/resultApi.dart';

class AppState extends ChangeNotifier {
  List<Result> _resultList = [];

  List<Result> get resultList => _resultList;

  Future getResultList() async {
    List<Result> resultList = await ResultApi.getResult();
    _resultList = resultList;
    notifyListeners();
  }

  void addResult(Result item) async {
    await ResultApi.addResult(item);
    await getResultList();
  }
}
