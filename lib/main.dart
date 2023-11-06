import 'package:flutter/material.dart';
import 'package:namer_app/pages/home.dart';
import 'package:namer_app/pages/login.dart';
import 'package:namer_app/pages/signin.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/services/auth_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()), // Define el Provider de AuthService
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
        '/': (context) => Login(),
        '/home': (context) => Home(),
        '/signIn': (context) => Signin(),
      },
    );
  }
}