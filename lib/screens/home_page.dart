
import 'package:fish_species_detector/main.dart';
import 'package:fish_species_detector/screens/camera_page.dart';
import 'package:fish_species_detector/services/auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final User user;
  const Homepage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Fish Species Detector",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
                onPressed: () {
                  Authentication().signOut();
                  main();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Score ${user.score} ",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    ElevatedButton(
                        onPressed: () {
                          main();
                        },
                        child: Icon(
                          Icons.refresh,
                          color: Color(int.parse("0XFF265073")),
                        ))
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const CameraScreen();
              }));
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(30)),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
                  Text(
                    "Start",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
