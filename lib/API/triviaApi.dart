import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:Quiz/Template/questionItem.dart';

const API_URL = 'https://opentdb.com/api.php?amount=10';
const TYPE = 'type=multiple';

//Hämtar frågor från Trivia API, mappar om dem till QuestionsItems och returnerar dessa i en lista.
class TriviaApi {
  static Future<List<QuestionItem>> getQuiz(category, difficulty) async {
    var response = await http
        .get('$API_URL&category=$category&difficulty=$difficulty&$TYPE');
    String responseBody = response.body;
    responseBody = responseBody
        .replaceAll('Entertainment:', '')
        .replaceAll('Science:', '')
        .replaceAll('General Knowledge', 'Random')
        .replaceAll('&rsquo;', '\'')
        .replaceAll('&quot;', '”')
        .replaceAll('&#039;', '\'')
        .replaceAll('&anp;', '&');
    var json = jsonDecode(responseBody);
    return json['results'].map<QuestionItem>((data) {
      return QuestionItem.fromJson(data);
    }).toList();
  }
}
