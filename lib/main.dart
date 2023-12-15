import 'package:flutter/material.dart';
import 'package:namer_app/pages/home.dart';
import 'package:namer_app/pages/signin.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/services/auth_service.dart';
import 'package:namer_app/services/apiservice.dart';
import 'package:namer_app/pages/predict.dart';
import 'package:namer_app/services/reservice.dart';
import 'package:namer_app/pages/retrain_screen.dart';
import 'package:namer_app/services/lonlat_service.dart';
import 'package:namer_app/pages/maps.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => PredictionService()),
        ChangeNotifierProvider(create: (_) => FitService()),
        ChangeNotifierProvider(create: (_) => MapService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) =>  Home(),
        '/home': (context) => Predict(),
        '/signIn': (context) => Signin(),
         '/retrain': (context) => RetrainScreen(),

        
      },
    );
  }
}