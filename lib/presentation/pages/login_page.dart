import 'package:flutter/material.dart';
import 'package:voto_facil/model/user.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:voto_facil/config/database/voto_database.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  bool erroruser = false;
  String user = "";
  String password = "";
  final passw1Controller = TextEditingController();
  final userController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: SizedBox(
          height: 666,
          width: 200, // Ajusta el ancho según tus necesidades
          child: Column(
            //error
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 54,
              ),
              Container(
                  height: 230,
                  child: Stack(
                    children: [
                      Image.asset(
                        'images/design/vb.png',
                        height: 140,
                        width: MediaQuery.of(context).size.width *
                            0.8, // 80% del ancho del dispositivo
                      ),
                      Image.asset(
                        'images/design/logo.png',
                        height: 290,
                        width: MediaQuery.of(context).size.width *
                            0.8, // 80% del ancho del dispositivo
                      ),
                    ],
                  )),
              Container(
                child: Text(
                  "Votar nunca fue tan facil !",
                  style: TextStyle(
                    fontFamily: AutofillHints.birthday, fontSize: 16,
                    fontWeight: FontWeight.bold, // Para negrita
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                          controller: userController,
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
                              return null;
                            }),
                        const SizedBox(
                          height: 5,
                        ),
                        Visibility(
                          visible: erroruser, // Esta sería tu variable booleana
                          child: Text(
                            "usuario o contraseña incorrectos",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        const SizedBox(height: 26),
                        ElevatedButton(
                          onPressed: () async {
                            user = userController.text;
                            password = passw1Controller.text;

                            User? usuarioEncontrado =
                                await VotoDataBase.buscarUsuario(
                                    user, password);

                            if (_formKey.currentState!.validate()) {
                              if (usuarioEncontrado != null) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/home', (route) => false);
                              } else {
                                setState(() {
                                  erroruser = true;
                                });
                              }
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
                style: ZeroButtonStyle(
                    backgroundColor: Color.fromARGB(255, 0, 0, 0)),
                width: 195,
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                child: Text(
                  "Nuevo? Registrate Aqui",
                  style: TextStyle(fontSize: 13),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/registro');
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
