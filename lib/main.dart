
import 'package:fish_species_detector/screens/home_page.dart';
import 'package:fish_species_detector/services/auth.dart';

import 'screens/login_screen.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        ColorScheme,
        Colors,
        MaterialApp,
        StatelessWidget,
        ThemeData,
        Widget,
        WidgetsFlutterBinding,
        runApp;
//import 'screens/sign_up_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final user = await Authentication().isUserLoggedIn();
  runApp(MyApp(
    user: user,
  ));
}

class MyApp extends StatelessWidget {
  final user;
  const MyApp({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fish Species Detector',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: user != null
          ? Homepage(
              user: user,
            )
          : const LoginPage(),
    );
    return materialApp;
  }
}
