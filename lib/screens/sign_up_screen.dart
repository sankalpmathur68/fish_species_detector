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

// import 'dart:convert';
// import 'dart:developer';

// import 'package:fish_species_detector/screens/sign_up_screen.dart';
// import 'package:fish_species_detector/services/auth.dart';

import 'package:fish_species_detector/main.dart';
import 'package:fish_species_detector/services/auth.dart';
import 'package:flutter/material.dart';
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:http/http.dart' as http;
// import "package:country_picker/country_picker.dart";

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //  fact = "";
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
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
                // Adding Style to the * Text Widget * using #.. style: TextStyle(required styling) ..#
                Align(
                  //wrapping the *Text Widget* with * Align Widget * and gave alignment -> centerLeft
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Color(int.parse("0XFF265073")),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Adding style to Both the * TextField Widget * using #.. decoration: InputDecoration(req styling) ..#
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                            labelText: "First Name",
                            labelStyle: TextStyle(
                                color: Color(int.parse("0XFF265073"))),
                            isDense: true,
                            filled: true,
                            fillColor: Colors.grey.shade300,
                            hoverColor: Colors.grey,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.teal, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                            labelText: "Last Name",
                            labelStyle: TextStyle(
                                color: Color(int.parse("0XFF265073"))),
                            isDense: true,
                            filled: true,
                            fillColor: Colors.grey.shade300,
                            hoverColor: Colors.grey,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.teal, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle:
                          TextStyle(color: Color(int.parse("0XFF265073"))),
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hoverColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2.0),
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
                  controller: _usernameController,
                  decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle:
                          TextStyle(color: Color(int.parse("0XFF265073"))),
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hoverColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2.0),
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
                  controller: _phoneController,
                  decoration: InputDecoration(
                      labelText: "Phone",
                      labelStyle:
                          TextStyle(color: Color(int.parse("0XFF265073"))),
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hoverColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2.0),
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
                  controller: _countryController,
                  decoration: InputDecoration(
                      labelText: "Country",
                      labelStyle:
                          TextStyle(color: Color(int.parse("0XFF265073"))),
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hoverColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2.0),
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
                  controller: _stateController,
                  decoration: InputDecoration(
                      labelText: "State",
                      labelStyle:
                          TextStyle(color: Color(int.parse("0XFF265073"))),
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hoverColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2.0),
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
                  controller: _cityController,
                  decoration: InputDecoration(
                      labelText: "City",
                      labelStyle:
                          TextStyle(color: Color(int.parse("0XFF265073"))),
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hoverColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2.0),
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
                      labelText: "Create Password",
                      labelStyle:
                          TextStyle(color: Color(int.parse("0XFF265073"))),
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hoverColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2.0),
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
                  controller: _rePasswordController,
                  obscureText: true, //obsecuring text for password
                  decoration: InputDecoration(
                      labelText: "Re-Enter Password",
                      labelStyle:
                          TextStyle(color: Color(int.parse("0XFF265073"))),
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hoverColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Adding registration page navigation
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account"),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.teal),
                        )),
                  ],
                ),
                // adding style to the * ElevatedButton * using  #.. style: ElevatedButton.styleFrom(styling..)  ..#
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        shadowColor: Colors.teal,
                        elevation: 3),
                    onPressed: () async {
                      setState(() {
                        clicked = true;
                      });
                      User user = User(
                          score: '0',
                          username: _usernameController.text,
                          password: _passwordController.text,
                          city: _cityController.text,
                          confirm_pass: _rePasswordController.text,
                          country: _countryController.text,
                          email: _emailController.text,
                          first_name: _firstNameController.text,
                          last_name: _lastNameController.text,
                          phone: _phoneController.text,
                          state: _stateController.text);
                      final bool response =
                          await Authentication().register_user(user, context);
                      if (!response) {
                        setState(() {
                          clicked = false;
                        });
                      } else {
                        await main();
                        Navigator.pop(context);
                      }
                    },
                    child: clicked
                        ? const CircularProgressIndicator()
                        : const Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
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