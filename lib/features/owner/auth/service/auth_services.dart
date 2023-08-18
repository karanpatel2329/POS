import 'dart:convert';

import 'package:pos_app/core/constants/api_url.dart';
import 'package:http/http.dart' as http;

class AuthService {
  

  // SIGN UP
    static Future<http.Response> signUp(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(ApiUrl.signUp),
          body: json.encode(
            {
              "email": email,
              "password": password,
            },
          ),
          headers: {'Content-Type': 'application/json'});
      return response;
    } catch (e) {
      throw e;
    }
  }

}