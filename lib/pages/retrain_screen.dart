import 'package:flutter/material.dart';
import 'package:namer_app/services/reservice.dart';

class RetrainScreen extends StatelessWidget {
  final FitService fitService = FitService();

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
            ElevatedButton(
              onPressed: () {
                _retrainModel();
              },
              child: const Text('Reentrenar Modelo'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _retrainModel() async {
    await fitService.retrainModel();
    // Puedes agregar lógica adicional aquí, como mostrar un mensaje de éxito.
  }
}
