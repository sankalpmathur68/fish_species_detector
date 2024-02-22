//  statefull  or stateless

import 'dart:convert';
import 'dart:developer';

import 'package:fish_species_detector/screens/sign_up_screen.dart';
import 'package:fish_species_detector/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //  fact = "";

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text("Login Page"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              // Adding Style to the * Text Widget * using #.. style: TextStyle(required styling) ..#
              const Align(
                //wrapping the *Text Widget* with * Align Widget * and gave alignment -> centerLeft
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  // style: GoogleFonts.monda(
                  //     fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Adding style to Both the * TextField Widget * using #.. decoration: InputDecoration(req styling) ..#
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: "Email",
                    isDense: true,
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true, //obsecuring text for password
                decoration: InputDecoration(
                    labelText: "Password",
                    isDense: true,
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),

              const SizedBox(
                height: 30,
              ),
              //Adding registration page navigation
              Row(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do not have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const SignUpPage();
                        }));
                      },
                      child: Text(
                        'Create',
                        style: TextStyle(color: Colors.blueAccent),
                      )),
                ],
              ),
              // adding style to the * ElevatedButton * using  #.. style: ElevatedButton.styleFrom(styling..)  ..#
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black, elevation: 3),
                  onPressed: () async {
                    Authentication().isUserLoggedIn();
                    // final response =
                    //     await http.get(Uri.parse("http://18.218.169.6:8000/"));
                    // log(response.statusCode.toString());
                    // final data = jsonDecode(response.body);
                    // log(data.toString());
                    // setState(() {
                    //   //  final  fact = data;
                    // });
                    // log("$fact");
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ))
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