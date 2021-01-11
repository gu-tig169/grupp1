import 'package:Quiz/Template/result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '488be9e5-c6fc-42e7-8d26-aa62a543cc3c';

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
