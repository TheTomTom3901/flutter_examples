import 'dart:convert';

import 'package:http/http.dart';
import 'package:users_loading/model/users.dart';

Future<Users> getUsers() async {
  final uri = Uri.https('jsonplaceholder.typicode.com', 'users');
  final response = await get(uri);
  return Users.fromJson(jsonDecode(response.body));
}