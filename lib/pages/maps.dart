import 'package:flutter/material.dart';
import 'package:namer_app/services/lonlat_service.dart';

class LocationPredictorScreen extends StatefulWidget {
  @override
  _LocationPredictorScreenState createState() => _LocationPredictorScreenState();
}

class _LocationPredictorScreenState extends State<LocationPredictorScreen> {
  final MapService mapService = MapService();

  TextEditingController londonLatController = TextEditingController();
  TextEditingController londonLonController = TextEditingController();
  TextEditingController vegasLatController = TextEditingController();
  TextEditingController vegasLonController = TextEditingController();

  String londonPrediction = '';
  String vegasPrediction = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Points Maps'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Coordenadas para Londres'),
            TextField(
              controller: londonLatController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Latitud de Londres'),
            ),
            TextField(
              controller: londonLonController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Longitud de Londres'),
            ),
            SizedBox(height: 16),
            Text('Coordenadas para Las Vegas'),
            TextField(
              controller: vegasLatController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Latitud de Las Vegas'),
            ),
            TextField(
              controller: vegasLonController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Longitud de Las Vegas'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                makePredictions();
              },
              child: Text('Predecir'),
            ),
            SizedBox(height: 16),
            Text('Predicciones para Londres: $londonPrediction'),
            Text('Predicciones para Las Vegas: $vegasPrediction'),
          ],
        ),
      ),
    );
  }

  void makePredictions() async {
    try {
      final londonLat = double.parse(londonLatController.text);
      final londonLon = double.parse(londonLonController.text);
      final vegasLat = double.parse(vegasLatController.text);
      final vegasLon = double.parse(vegasLonController.text);

      final inputs = [
        [londonLon, londonLat],
        [vegasLon, vegasLat]
      ];

      final predictions = await mapService.makePrediction(inputs);

      setState(() {
        londonPrediction = predictions['predictions'][0].toString();
        vegasPrediction = predictions['predictions'][1].toString();
      });
    } catch (e) {
      print('Error making predictions: $e');
    }
  }
}
