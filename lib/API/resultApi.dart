import 'package:Quiz/Template/result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = 'd23245d9-4b4e-4d50-b370-c6d68271aebb';

class ResultApi {
//Lägger till ett resultat i api:et
  static Future addResult(Result item) async {
    var json = jsonEncode(Result.toJson(item));
    await http.post('$API_URL/todos?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});
    print('Added $json to api');
  }

//Hämtar ner resultaten från api:et och lägger i en lista.
  static Future<List<Result>> getResult() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    var json = jsonDecode(response.body);
    print('Got result from api: ${json.isNotEmpty}');
    return json.map<Result>((data) {
      return Result.fromJson(data);
    }).toList();
  }
}
