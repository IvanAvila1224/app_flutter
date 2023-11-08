import 'package:flutter/material.dart';
import 'package:namer_app/services/reservice.dart';

 class RetrainScreen extends StatelessWidget {
  final FitService fitService = FitService(); // Crear una instancia de FitService

  final List<String> datasetUrls = [
    "https://firebasestorage.googleapis.com/v0/b/size-clothes.appspot.com/o/final_test_50.csv?alt=media&token=f452ccd6-0e94-4bef-8173-e27cb2d82f8c",
    "https://firebasestorage.googleapis.com/v0/b/size-clothes.appspot.com/o/final_test.csv?alt=media&token=8303e9c8-31e2-4200-beef-34800d0ed187",
    "https://firebasestorage.googleapis.com/v0/b/size-clothes.appspot.com/o/final_test_15.csv?alt=media&token=8ffab7c6-e04e-428a-b799-a553d1226468",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrain Model'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < datasetUrls.length; i++)
              Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _retrainModel(datasetUrls[i]);
                    },
                    child: Text('Reentrenar Modelo ${i + 1}'),
                  ),
                  SizedBox(height: 16.0), // Espacio vertical entre los botones
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _retrainModel(String datasetUrl) async {
    await fitService.retrainModel(datasetUrl);
    // Puedes agregar lógica adicional aquí, como mostrar un mensaje de éxito.
  }
 }
