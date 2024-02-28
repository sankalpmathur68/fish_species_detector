//  statefull  or stateless


import 'package:fish_species_detector/main.dart';
import 'package:fish_species_detector/screens/sign_up_screen.dart';
import 'package:fish_species_detector/services/auth.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
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
              Align(
                //wrapping the *Text Widget* with * Align Widget * and gave alignment -> centerLeft
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Color(int.parse("0XFF265073")),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  // style: GoogleFonts.monda(
                  //     fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Adding style to Both the * TextField Widget * using #.. decoration: InputDecoration(req styling) ..#
              TextField(
                cursorColor: Colors.black,
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle:
                        TextStyle(color: Color(int.parse("0XFF265073"))),
                    isDense: true,
                    filled: true,
                    fillColor: Colors.grey.shade300,
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
                cursorColor: Colors.black,
                controller: _passwordController,
                obscureText: true, //obsecuring text for password
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle:
                        TextStyle(color: Color(int.parse("0XFF265073"))),
                    isDense: true,
                    filled: true,
                    fillColor: Colors.grey.shade300,
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
                height: 30,
              ),
              //Adding registration page navigation
              Row(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do not have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const SignUpPage();
                        }));
                      },
                      child: const Text(
                        'Create',
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
                    final response = await Authentication()
                        .login_with_username_and_password(
                            _usernameController.text,
                            _passwordController.text,
                            context);
                    if (!response) {
                      setState(() {
                        clicked = false;
                      });
                    } else {
                      main();
                    }
                  },
                  child: clicked
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
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