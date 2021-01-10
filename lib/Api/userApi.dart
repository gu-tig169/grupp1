import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:Quiz/Template/user.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '90e45cd1-24e2-41bf-a10e-5b316b571373';

class UserApi {
  static Future addUser(User user) async {
    print(user);
    Map<String, dynamic> json = User.toJson(user);
    var bodyString = jsonEncode(json);
    print(json);
    await http.post(
      '$API_URL/todos?key=$API_KEY',
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    print('Added');
  }

  static Future updateUserApi(User user) async {
    var json = jsonEncode(User.toJson(user));
    String userId = user.id;
    var response = await http.put(
      '$API_URL/todos/$userId?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
    print('Updated: new user is here!${user.userName}');
    print(response.body);
    print(userId);
  }

//Ta bort sen.
  static Future deleteUser(String userId) async {
    http.Response response =
        await http.delete('$API_URL/todos/$userId?key=$API_KEY');
    print(response.body);
    print('Removed');
  }

  static Future<List<User>> fetchUser() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    var json = jsonDecode(response.body);
    print(json);
    return json.map<User>((data) {
      return User.fromJson(data);
    }).toList();
  }
}
