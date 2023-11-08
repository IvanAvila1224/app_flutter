import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PredictionService with ChangeNotifier {
  final String baseUrl = 'https://sizefastapi-service-ivanavila1224.cloud.okteto.net';

  Future<String> predictClothingSize(
      {required double weight,
      required double age,
      required double height}) async {
    final Uri url = Uri.parse('$baseUrl/predict');

    print(url);


    final Map<String, dynamic> requestBody = {
      'weight': weight,
      'age': age,
      'height': height,
    };
    print(jsonEncode(requestBody));

    final response = await http.post(
      url,
      headers: {
        'Content-type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );
    print(response.body);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['size'];
    } else {
      throw Exception('Error al consumir la API de predicción');
    }
  }
}
