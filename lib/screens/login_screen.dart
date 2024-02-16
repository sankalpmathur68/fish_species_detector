//  statefull  or stateless

import 'dart:developer';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/00004.png"),
            const SizedBox(
              height: 100,
            ),
            const Text("Login"),
            TextField(
              controller: emailController,
            ),
            TextField(
              controller: passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  log(emailController.text);
                  log(passwordController.text);
                },
                child: const Text('login'))
          ],
        ),
      ),
    );
  }
}

// logo
// Login text
// form(2 inputs, 1 button)
//extra login options