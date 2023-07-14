import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:zog_ui/zog_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200, // Ajusta el ancho según tus necesidades
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZeroButton.primary(
                buttonSizeType: ZeroSizeType.large,
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text("Iniciar sesión"),
              ),
              const SizedBox(height: 16),
              FadeIn(
                child: ZeroButton.primary(
                  buttonSizeType: ZeroSizeType.large,
                  buttonRadiusType: ZeroButtonRadiusType.rounded,
                  onPressed: () {
                    Navigator.pushNamed(context, '/registro');
                  },
                  child: const Text("Registrar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
