/*import 'package:Quiz/Template/result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '246cd50a-592b-4bba-938c-305483daee95';

class ResultApi {
  static Future addResult(Result item) async {
    var json = jsonEncode(Result.toJson(item));
    await http.post("$API_URL/todos?key=$API_KEY",
        body: json, headers: {"Content-Type": "application/json"});
    print("done");
  }
} //class ResultApi*/
