import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Authentication {
  isUserLoggedIn() async {
    log("checking token");

    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    String? token = await secureStorage.read(key: "accessToken");
    if (token != null) {
      login_with_token(token);
      return true;
    } else {
      log("returning with no token");

      return false;
    }
  }

  register_user(User user) async {
    String url = 'http://18.218.169.6:8000/register';
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'content-type': 'application/json'},
          body: jsonEncode(
            <String, String>{
              "username": "sankalpmathur71",
              "first_name": "sankalp",
              "last_name": "mathur",
              "email": "sankalpmathur71@gmail.com",
              "password": 'pass@123',
              "phone": "7877008773",
              "country": "india",
              "city": "udaipur",
              "state": "rajasthan"
            },
          ));
      if (response.statusCode == 200) {
        Uri token_api = Uri.parse("http://18.218.169.6:8000/token");
        final token_response = await http.post(token_api,
            headers: {'content-type': 'application/x-www-form-urlencoded'},
            body: {'username': "sankalpmathur71", 'password': 'pass@123'});
        // log(response.body.toString());
        // log(token_response.body.toString());
        Map<String, dynamic> responseData = json.decode(token_response.body);
        String? accessToken = responseData['access_token'];
        // log(accessToken.toString());
        await secureStorage.write(key: 'accessToken', value: accessToken);
        return accessToken;
      } else {
        throw Exception('${jsonDecode(response.body)['detail']}');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  login_with_token(token) async {
    log("loging in with token");
    Uri uri = Uri.parse("http://18.218.169.6:8000/login_with_token");
    final response = await http
        .get(uri, headers: <String, String>{"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log(data.toString());
    } else {
      log("returning with response_code: ${response.body}");
    }
  }
}

class User {
  final String id;
  final String username;
  final String email;
  final String first_name;
  final String last_name;
  final String phone;
  final String country;
  final String state;
  final String city;
  User(this.id, this.username, this.city, this.country, this.email,
      this.first_name, this.last_name, this.phone, this.state);
}
