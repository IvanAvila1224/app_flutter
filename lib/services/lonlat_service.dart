import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapService with ChangeNotifier {
  final String baseUrl = 'https://linear-model-service-ivanmaps-ivanavila1224.cloud.okteto.net/v1/models/linear-model:predict';

  Future<Map<String, dynamic>> makePrediction(List<List<double>> inputs) async {
    final predictRequest = {'instances': inputs};
    final response = await http.post(
      Uri.parse(baseUrl),
      body: jsonEncode(predictRequest),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> prediction = jsonDecode(response.body);
      return prediction;
    } else {
      throw Exception('Failed to get predictions: ${response.statusCode}');
    }
  }
}