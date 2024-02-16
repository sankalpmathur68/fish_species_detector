//  statefull  or stateless

import 'dart:convert';
import 'dart:developer';

import 'package:fish_species_detector/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String fact = "";

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/00004.png"),
              const SizedBox(
                height: 100,
              ),
              Text("Login"),
              TextField(
                controller: _emailController,
              ),
              TextField(
                controller: _passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Cat Fact: ${fact.toUpperCase()} "),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    // final response =
                    //     await http.get(Uri.parse("https://catfact.ninja/fact"));
                    // final data = jsonDecode(response.body);
                    // setState(() {
                    //   fact = data['fact'];
                    // });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const Signuppage();
                    }));
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}

// logo
// Login text
// form(2 inputs, 1 button)
//extra login options