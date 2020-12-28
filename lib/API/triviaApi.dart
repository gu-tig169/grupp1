import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:Quiz/Template/questionItem.dart';
import 'package:Quiz/Template/quizList.dart';

const API_URL = 'https://opentdb.com/api.php?amount=10&';
const type = 'type=multiple';

class TriviaApi {
  var category = '17&';
  var difficulty = 'easy&';

  static Future<List<QuizList>> getQuiz(category, difficulty) async {
    var response = await http
        .get('$API_URL/category=/$category&difficulty=$difficulty&$type');
    print(response.body);
    var json = jsonDecode(response.body);

    /* return json.map<QuestionItem>((data) {
      return QuestionItem.fromJson(data);
    }).toList(); */
  }
}
