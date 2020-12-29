import 'package:flutter/material.dart';

import 'API/triviaApi.dart';
import 'Template/questionItem.dart';

class AppState extends ChangeNotifier {
  List<QuestionItem> _list = [];

  List<QuestionItem> get list => _list;

/*  Future getQuizList() async {
    List<QuestionItem> quizList = await TriviaApi.getQuiz();
    _list = list;
    notifyListeners();
  } */
}
