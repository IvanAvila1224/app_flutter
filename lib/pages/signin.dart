import 'package:flutter/material.dart';
import 'package:namer_app/components/my_button.dart';
import 'package:namer_app/components/my_textfield.dart';
import 'package:namer_app/components/square_tile.dart';
import 'package:namer_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class Signin extends StatelessWidget {
  Signin({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void enterUser(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }

  void logIn(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              // logo
              Text(
                'SignIn',
                style: TextStyle(
                  color: const Color.fromARGB(255, 14, 22, 28),
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                '¡Bienvenido!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // sign in button
              ElevatedButton(
                onPressed: () async {
                  final email = emailController.text;
                  final username = usernameController.text;
                  final password = passwordController.text;

                  final loginOk = await authService.register(email ,username, password);

                  print(loginOk);

                  if (loginOk) {
                    
                    Navigator.pushNamed(context, '/home');
                  } else {
                   
                    print('El inicio de sesión ha fallado');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Color de fondo del botón
                  onPrimary: Colors.white, // Color del texto del botón
                ),
                child: Text('Register'), // Puedes personalizar el texto aquí
              ),

              const SizedBox(height: 30),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  SquareTile(imagePath: 'lib/images/google.png'),
                ],
              ),

              const SizedBox(height: 25),

              InkWell(
                onTap: () {
                  logIn(context);
                },
                child: Row(
                  // a member? register now
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'LogIn',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}