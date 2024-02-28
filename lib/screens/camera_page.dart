import 'dart:developer';
import 'dart:io';
import 'package:fish_species_detector/services/auth.dart';
import 'package:fish_species_detector/services/prediction.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _imageFile;
  String? token = '';
  bool clicked = false;
  int score = 0;
  Authentication auth = Authentication()..isUserLoggedIn();
  PredictionServices predictionServices = PredictionServices();
  int temp_score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Send Image to API'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              score != 0
                  ? Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "+$score",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    )
                  : _imageFile == null
                      ? const Text('No image for preview',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20))
                      : AspectRatio(
                          aspectRatio: 1, child: Image.file(_imageFile!)),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  final response =
                      await predictionServices.getImageFromCamera();
                  log(response.toString());
                  if (response != null) {
                    setState(() {
                      score = 0;
                      _imageFile = response;
                    });
                  }
                },
                child: const Text(
                  'Take Picture',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  if (_imageFile != null) {
                    setState(() {
                      clicked = true;
                    });
                    final response = await predictionServices.sendImageToAPI();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${response['score']}+ score added"),
                      backgroundColor: Colors.green,
                    ));

                    setState(() {
                      _imageFile = null;
                      score =
                          response != null ? int.parse(response['score']) : 0;
                      temp_score += score;
                      clicked = false;
                    });
                    if (response != null) {
                      auth.updatescore(score);
                    }
                  }
                },
                child: clicked
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                    : const Text('Send Image to API',
                        style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(
                height: 100,
              ),
              Text("score: $temp_score",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}
