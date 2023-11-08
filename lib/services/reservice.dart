import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FitService with ChangeNotifier {
  final String baseUrl = 'https://api.github.com/repos/IvanAvila1224/clothes-size/dispatches';

  Future<void> retrainModel() async {
    final Uri url = Uri.parse(baseUrl);
    print(url);

    final dataseturl =
        "https://firebasestorage.googleapis.com/v0/b/size-clothes.appspot.com/o/final_test_50.csv?alt=media&token=f452ccd6-0e94-4bef-8173-e27cb2d82f8c";

    final requestBody = {
      "event_type": "ml_ci_cd",
      "client_payload": {
        "dataseturl": dataseturl,
        "sha": "iva" // Puedes usar un valor único aquí
      }
    };
    print(jsonEncode(requestBody));

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer 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', // Asegúrate de que el token sea correcto
        'Accept': 'application/vnd.github.v3+json',
        'Content-type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 204) {
      print("Evento enviado con éxito");
    } else {
      print("Error al enviar el evento: ${response.statusCode}");
    }
  }
}
