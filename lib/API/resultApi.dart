import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:Quiz/Template/result.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '310a9c70-93e8-477b-8b00-f1dfa109cbbc';

class ResultApi {
  static Future addResult(Result item) async {
    var json = jsonEncode(Result.toJson(item));
    await http.post('$API_URL/todos?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});
    print('Added $json to api');
  }

  static Future<List<Result>> getResult() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    var json = jsonDecode(response.body);
    print('Get result: ${json.isNotEmpty}');
    return json.map<Result>((data) {
      return Result.fromJson(data);
    }).toList();
  }
}
