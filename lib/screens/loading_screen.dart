import 'dart:async';

import 'package:fish_species_detector/main.dart';
import 'package:flutter/material.dart';

class loadingScreen extends StatefulWidget {
  final Function? task;
  const loadingScreen({super.key, this.task});

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    main();
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.pop(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator()],
      )),
    );
  }
}
