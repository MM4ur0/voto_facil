import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:zog_ui/zog_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final String user = "1";
  final String password = "1";
  final passw1Controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200, // Ajusta el ancho según tus necesidades
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/design/logo.png',
                height: 220,
                width: MediaQuery.of(context).size.width *
                    0.8, // 80% del ancho del dispositivo
              ),
              Form(
                key: _formKey,
                child: Center(
                  child: SizedBox(
                    width: 200, // Ajusta el ancho según tus necesidades
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)),
                          decoration: const InputDecoration(
                            labelText: 'Usuario',
                            hintText: 'Ingresar usuario',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 109, 109,
                                    109)), // Color del texto de etiqueta
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 109, 109,
                                    109)), // Color del texto del hintText
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 17, 61,
                                      255)), // Color del borde cuando el campo tiene foco
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 109, 109,
                                      109)), // Color del borde cuando el campo está habilitado pero no tiene foco
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .cyanAccent), // Color del borde por defecto
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingresa tu Usuario';
                            }
                            if (value != user) {
                              return "Usuario no encontrado";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            obscureText: _isObscure,
                            controller: passw1Controller,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              labelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0,
                                      0)), // Color del texto de etiqueta
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 17, 17,
                                      17)), // Color del texto del hintText
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 17, 61,
                                        255)), // Color del borde cuando el campo tiene foco
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 109, 109,
                                        109)), // Color del borde cuando el campo está habilitado pero no tiene foco
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 90, 90,
                                        90)), // Color del borde por defecto
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  color: Color.fromARGB(255, 97, 97, 97),
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Ingresa tu contraseña";
                              }
                              if (value != password) {
                                return "Constraseña no válida";
                              }

                              return null;
                            }),
                        const SizedBox(
                          height: 25,
                        ),
                        const SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacementNamed(context, '/home');
                            }
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  Colors.blue, // Color de fondo del botón
                              textStyle: const TextStyle(
                                  fontSize: 18), // Estilo del texto del botón
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12), // Padding del botón
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Radio de borde del botón
                              )),
                          child: const Text(
                            "Iniciar sesión",
                            selectionColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ZeroButton.primary(
                width: 135,
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                child: Text(
                  "Registrarse",
                  style: TextStyle(fontSize: 17),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/registro');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
