import 'dart:convert';
import 'dart:developer';


import 'package:fish_species_detector/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Authentication {
  late User user;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  isUserLoggedIn() async {
    log("checking token");
    String? token = await secureStorage.read(key: "accessToken");
    if (token != null) {
      final isLoggedin = login_with_token(token);
      return isLoggedin;
    } else {
      return null;
    }
  }

  signOut() async {
    await secureStorage.delete(key: 'accessToken');
  }

//register user
  register_user(User user, context) async {
    log("registraion going on");
    String url = 'http://18.218.169.6:8000/register';
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'content-type': 'application/json'},
          body: jsonEncode(
            <String, String>{
              "username": user.username,
              "first_name": user.first_name,
              "last_name": user.last_name,
              "email": user.email,
              "password": user.password,
              "phone": user.phone,
              "country": user.country,
              "city": user.city,
              "state": user.state,
              "confirm_pass": user.confirm_pass
            },
          ));
      if (response.statusCode == 200) {
        await generate_store_token(user.username, user.password);
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("${jsonDecode(response.body)['detail']}")));
        // throw Exception('${jsonDecode(response.body)['detail']}');
        return false;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text("$e")));
      return false;
    }
  }

//login using token
  login_with_token(token) async {
    log("loging in with token");
    try {
      Uri uri = Uri.parse("http://18.218.169.6:8000/login_with_token");
      final response = await http.get(uri,
          headers: <String, String>{"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log(data.toString());
        user = User(
            score: data["score"].toString(),
            username: data["username"].toString(),
            password: data["password"].toString(),
            city: data["city"].toString(),
            confirm_pass: data["confirm_pass"].toString(),
            country: data["country"].toString(),
            email: data["email"].toString(),
            first_name: data["first_name"].toString(),
            last_name: data["last_name"].toString(),
            phone: data["phone"].toString(),
            state: data["state"].toString());

        return user;
      } else {
        log("returning with response_code: ${response.body}");
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
// login using username and password

  login_with_username_and_password(username, password, context) async {
    try {
      Uri uri = Uri.parse("http://18.218.169.6:8000/login");
      final response = await http.post(uri,
          headers: <String, String>{"content-type": "application/json"},
          body: jsonEncode({"username": username, "password": password}));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'][0];
        user = User(
            score: data["score"].toString(),
            username: data["username"].toString(),
            password: data["password"].toString(),
            city: data["city"].toString(),
            confirm_pass: data["confirm_pass"].toString(),
            country: data["country"].toString(),
            email: data["email"].toString(),
            first_name: data["first_name"].toString(),
            last_name: data["last_name"].toString(),
            phone: data["phone"].toString(),
            state: data["state"].toString());
        await generate_store_token(username, password);
        main();
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("${jsonDecode(response.body)['detail']}")));

        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<void> updatescore(score) async {
    log('updating score');
    int userScore = int.parse(user.score);
    int updatedScore = userScore + int.parse(score.toString());
    log(updatedScore.toString());
    Uri userUpdateApi =
        Uri.parse("http://18.218.169.6:8000/?username=${user.username}");
    final response = await http.put(userUpdateApi,
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode({"score": "$updatedScore"}));
    log(response.body);
  }

// generating and storing token in secure storage
  generate_store_token(username, password) async {
    Uri tokenApi = Uri.parse("http://18.218.169.6:8000/token");
    final tokenResponse = await http.post(tokenApi,
        headers: {'content-type': 'application/x-www-form-urlencoded'},
        body: {'username': username, 'password': password});
    // log(response.body.toString());
    // log(token_response.body.toString());
    Map<String, dynamic> responseData = json.decode(tokenResponse.body);
    String? accessToken = responseData['access_token'];
    // log(accessToken.toString());

    await secureStorage.write(key: 'accessToken', value: accessToken);
  }
}

class User {
  final String? id;
  final String username;
  final String password;
  final String email;
  final String first_name;
  final String last_name;
  final String phone;
  final String country;
  final String state;
  final String city;
  final String confirm_pass;
  final String score;
  User(
      {this.id,
      required this.username,
      required this.score,
      required this.password,
      required this.city,
      required this.confirm_pass,
      required this.country,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.phone,
      required this.state});
}
