import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: const Text("Iniciar sesión"),
          ),
          FadeIn(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registro');
              },
              child: const Text("Registrar"),
            ),
          ),
        ],
      ),
    );
  }
}
