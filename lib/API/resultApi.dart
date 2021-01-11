import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:Quiz/Template/result.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '863680eb-7f80-4793-96ac-9bc39ff7eb3d';

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
