import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sec_me/manager/user_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  final String baseUrl = 'http://10.0.2.2:3000';

  Future<User?> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['access_token'];
        User user =
            User(name: email, email: email, password: password, token: token);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(user.toJson()));
        return user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<User?> register(String email, String password) async {
    final url = Uri.parse('$baseUrl/register');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        User user =
            User(name: email, email: email, password: password, token: token);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(user.toJson()));
        return user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('user');

    if (userData != null) {
      Map<String, dynamic> userMap = jsonDecode(userData);
      return User.fromJson(userMap);
    }
    return null;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }
}
