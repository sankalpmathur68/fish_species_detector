/*

Commenting All previously written code and making the signup page similar to the login page with required changes

 */
// //  statefull  or stateless

// import 'dart:developer';

// import 'package:flutter/material.dart';

// class Signuppage extends StatelessWidget {
//   const Signuppage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController emailController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Signuppage"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Image.asset("assets/images/00004.png"),
//             const SizedBox(
//               height: 100,
//             ),
//             const Text("Signup"),
//             TextField(
//               controller: emailController,
//             ),
//             TextField(
//               controller: passwordController,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   log(emailController.text);
//                   log(passwordController.text);
//                 },
//                 child: const Text('signup'))
//           ],
//         ),
//       ),
//     );
//   }
// }

// // logo
// // Login text
// // form(2 inputs, 1 button)
// //extra login options

//  statefull  or stateless

import 'dart:convert';
import 'dart:developer';

import 'package:fish_species_detector/screens/sign_up_screen.dart';
import 'package:fish_species_detector/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          child: SafeArea(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image.asset(
                //   "assets/images/logo.png",
                //   height: 300,
                // ),
                // const SizedBox(
                //   height: 30,
                // ),
                // Adding Style to the * Text Widget * using #.. style: TextStyle(required styling) ..#
                Align(
                  //wrapping the *Text Widget* with * Align Widget * and gave alignment -> centerLeft
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Adding style to Both the * TextField Widget * using #.. decoration: InputDecoration(req styling) ..#
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            labelText: "Email",
                            isDense: true,
                            filled: true,
                            fillColor: Colors.grey.shade300,
                            hoverColor: Colors.grey,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true, //obsecuring text for password
                  decoration: InputDecoration(
                      labelText: "Create Password",
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hoverColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true, //obsecuring text for password
                  decoration: InputDecoration(
                      labelText: "Re-Enter Password",
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hoverColor: Colors.grey,
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
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
                //Adding registration page navigation
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account"),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (BuildContext context) {
                          //   // return const Signuppage();
                          // }));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.blueAccent),
                        )),
                  ],
                ),
                // adding style to the * ElevatedButton * using  #.. style: ElevatedButton.styleFrom(styling..)  ..#
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black, elevation: 3),
                    onPressed: () async {
                      // Authentication().register_user("username", "password");
                      // final response =
                      //     await http.get(Uri.parse("http://18.218.169.6:8000/"));
                      // log(response.statusCode.toString());
                      // final data = jsonDecode(response.body);
                      // setState(() {
                      //   //  final  fact = data;
                      // });
                      // log("$fact");
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
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