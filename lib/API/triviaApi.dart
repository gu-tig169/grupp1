import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:Quiz/Template/questionItem.dart';

const API_URL = 'https://opentdb.com/api.php?amount=10';
const TYPE = 'type=multiple';

//hämtar frågor från Trivia API, mappar om dem till QuestionsItems och returnerar dessa i en lista.
class TriviaApi {
  static Future<List<QuestionItem>> getQuiz(category, difficulty) async {
    var response = await http
        .get('$API_URL&category=$category&difficulty=$difficulty&$TYPE');
    var json = jsonDecode(response.body);
    return json['results'].map<QuestionItem>((data) {
      return QuestionItem.fromJson(data);
    }).toList();
  }
}
