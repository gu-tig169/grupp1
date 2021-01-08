import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:Quiz/Template/user.dart';

const KEY =
    'caa837ae-6da1-4103-a93a-04f8c9f98d57'; //'cc2ae553-1905-47f9-82b7-fcea7d6925fc';
const URL = 'https://todoapp-api-vldfm.ondigitalocean.app';

class UserApi {
  static Future addUser(User user) async {
    print(user);
    Map<String, dynamic> json = User.toJson(user);
    var bodyString = jsonEncode(json);
    print(json);
    await http.post(
      '$URL/todos?key=$KEY',
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    print('Added');
  }

  /*static Future updateUserApi(User user) async {
    var json = jsonEncode(User.toJson(user));
    String userId = user.id;
    await http.put(
      '$URL/todos/$userId?key=$KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
    print('Updated: new user is here!${user.userName}');
  }*/

  static Future updateUserApi(User user) async {
    var json = jsonEncode(User.toJson(user));
    String userId = user.id;
    var response = await http.put(
      '$URL/todos/$userId?key=$KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
    print('Updated: new user is here!${user.userName}');
    print(response.body);
    print(userId);
  }

//Ta bort sen.
  static Future deleteUser(String userId) async {
    http.Response response = await http.delete('$URL/todos/$userId?key=$KEY');
    print(response.body);
    print('Removed');
  }

  static Future<List<User>> fetchUser() async {
    var response = await http.get('$URL/todos?key=$KEY');
    var json = jsonDecode(response.body);
    print(json);
    return json.map<User>((data) {
      return User.fromJson(data);
    }).toList();
  }
}
