import 'dart:convert';

import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class PredictionServices {
  late File imageFile;
  final picker = ImagePicker();
  String? token = '';
  Future getImageFromCamera() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();

    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 25);
    token = await storage.read(key: "acceessToke");

    if (pickedFile != null) {
      token = token;
      imageFile = File(pickedFile.path);
      return File(pickedFile.path);
    }
  }

  Future sendImageToAPI() async {
    try {
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://18.218.169.6:8000/predict'),
      );
      // Add image file to the request
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          imageFile.path,
          // contentType:
          // , // Adjust content type if needed
        ),
      );
      // Add authorization token to the request headers
      request.headers['Authorization'] = 'Bearer $token';
      // Send the request
      var response = await request.send();
      // Handle the response
      Map<String, dynamic> responseBody =
          jsonDecode(await response.stream.bytesToString());

      return responseBody;
      // return {'score': "10"};
    } catch (e) {
      return {"detail": e.toString()};
    }
  }
}
