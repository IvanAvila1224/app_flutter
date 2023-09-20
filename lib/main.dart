import 'package:flutter/material.dart';
import 'package:namer_app/pages/home.dart';
import 'package:namer_app/pages/login.dart';
import 'package:namer_app/pages/signin.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/', // Esta es la ruta inicial
    routes: {
      '/': (context) => Login(), // Ruta para login.dart
      '/home': (context) => Home(), // Ruta para home.dart
      //Cuando esté bien hecha / será index que verá si esta logeado o no
      '/signin': (context) => Signin(),
    },
  ));
}