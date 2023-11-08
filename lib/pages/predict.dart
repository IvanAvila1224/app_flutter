import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:namer_app/services/apiservice.dart';
import 'package:namer_app/services/reservice.dart';
import 'package:namer_app/pages/retrain_screen.dart';

class Predict extends StatefulWidget {
  const Predict({super.key});

  @override
  _PredictState createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  final PredictionService apiService =
      PredictionService(); // Usar la clase PredictionService
  final _formKey = GlobalKey<FormState>();

  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double peso = 0.0;
  double edad = 0.0;
  double altura = 0.0;
  String prediction = '';


  @override
  void initState() {
    super.initState();
    weightController.addListener(() {
      final text = weightController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          setState(() {
            peso = value;
          });
        } catch (e) {
          weightController.text = peso.toString();
        }
      }
    });

    ageController.addListener(() {
      final text = ageController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          setState(() {
            edad = value;
          });
        } catch (e) {
          ageController.text = edad.toString();
        }
      }
    });

    heightController.addListener(() {
      final text = heightController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          setState(() {
            altura = value;
          });
        } catch (e) {
          heightController.text = altura.toString();
        }
      }
    });
  }

 @override
void dispose() {
  weightController.dispose();
  ageController.dispose();
  heightController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Size Clothes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Peso'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Por favor, ingresa un valor.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Edad'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Por favor, ingresa un valor.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Altura'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Por favor, ingresa un valor.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RetrainScreen()),
                  );
                },
                child: const Text('Re entrenar'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    String result =
                       await apiService.predictClothingSize(
                      weight: peso,
                      age: edad,
                      height: altura,
                    );
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return AlertDialog(
                          title: const Text('Datos enviados'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('Peso: $peso'),
                              Text('Edad: $edad'),
                              Text('Altura: $altura'),
                              Text('Predicción: $result'),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(dialogContext).pop();
                              },
                              child: const Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Predecir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}