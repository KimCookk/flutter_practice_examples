import 'package:flutter_practice_examples/examples/13_http/user_list/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UserService {
  static const String baseURL = 'jsonplaceholder.typicode.com';
  static const String endPoint = '/users';

  Future<List<User>> fetch() async {
    var url = Uri.http(baseURL, endPoint);
    var response = await http.get(url);
    List<User> fetchUsers = [];

    await Future.delayed(Duration(seconds: 5));

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      for (Map<String, dynamic> json in jsonResponse) {
        var user = User.fromJson(json);
        fetchUsers.add(user);
      }
      return fetchUsers;
    } else {
      throw Exception('Failed to fetch users: ${response.statusCode}');
    }
  }
}
