import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:Quiz/Template/questionItem.dart';

const API_URL = 'https://opentdb.com/api.php?amount=10';
const type = 'type=multiple';

class TriviaApi {
  static Future<List<QuestionItem>> getQuiz(category, difficulty) async {
    var response = await http
        .get('$API_URL&category=$category&difficulty=$difficulty&$type');
    //print(response.body);
    var json = jsonDecode(response.body);
    return json['results'].map<QuestionItem>((data) {
      return QuestionItem.fromJson(data);
    }).toList(); // ska returnera en lista med QuestionItems
  }
}
