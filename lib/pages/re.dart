import 'package:flutter/material.dart';
import 'package:namer_app/services/reservice.dart';

class RetrainModelButton extends StatefulWidget {
  @override
  _RetrainModelButtonState createState() => _RetrainModelButtonState();
}

class _RetrainModelButtonState extends State<RetrainModelButton> {
  final FitService fitService = FitService();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await fitService.retrainModel();
        // Puedes mostrar un mensaje de éxito o realizar otras acciones después del reentrenamiento.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Modelo reentrenado con éxito"),
          ),
        );
      },
      child: const Text('Reentrenar Modelo'),
    );
  }
}
