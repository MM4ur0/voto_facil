import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_box/flutter_text_box.dart';
import 'package:voto_facil/presentation/widgets/registro/checkbox_button.dart';
import 'package:voto_facil/presentation/widgets/registro/date_picker.dart';
import 'package:voto_facil/presentation/widgets/registro/radio_button.dart';
import 'package:zog_ui/zog_ui.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  String cedula = "";
  String apellidos = "";
  String nombres = "";
  String genero = "Masculino";
  String fechaNac = "Defecto";
  String correo = "";
  String contrasena = "";
  String rcontrasena = "";
  bool checkTerminos = false;
  bool apellidosError = false;
  bool nombresError = false;
  bool cedulaError = false;
  bool correoError = false;
  bool passw1Error = false;
  bool passw2Error = false;
  bool mostrarError = false;
  final key = GlobalKey<FormState>();
  final apellidosController = TextEditingController();
  final nombresController = TextEditingController();
  final correoController = TextEditingController();
  final cedulaController = TextEditingController();
  final passw1Controller = TextEditingController();
  final passw2Controller = TextEditingController();

  @override
  void dispose() {
    apellidosController.dispose(); // Liberar el controlador de apellidos
    nombresController.dispose(); // Liberar el controlador de nombres
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Registro de usuario"),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 15),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInLeft(
                    child: Column(
                      children: [
                        const Text(
                          "Datos personales",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        ZeroTextField.outline(
                            suffixIcon: const Icon(
                              ZeroIcons.idcard,
                              color: Colors.blueAccent,
                              size: 17,
                            ),
                            inputType: TextInputType.number,
                            controller: cedulaController,
                            labelText: 'Cédula de identidad',
                            hintText: 'Ingresa tu número de cédula',
                            errorText: cedulaError
                                ? 'Este campo es requerido !'
                                : null,
                            onSaved: (value) {
                              cedula = value ?? '';
                              cedulaError = true;
                              mostrarError = true;
                            },
                            onChanged: (value) {
                              setState(() {
                                cedula = value;
                                mostrarError = true;
                                //apellidosError = true;
                              });
                            }),
                        const SizedBox(height: 15),
                        ZeroTextField(
                          suffixIcon: const Icon(
                            ZeroIcons.form,
                            color: Colors.blueAccent,
                            size: 17,
                          ),
                          labelText: "Apellidos",
                          hintText: 'Ingresa tus Apellidos aquí',
                          errorText: apellidosError
                              ? 'Este campo es requerido !'
                              : null,
                          controller: apellidosController,
                          decoration: const InputDecoration(filled: true),
                          onSaved: (value) {
                            apellidos = value ?? '';
                            apellidosError = true;
                            mostrarError = true;
                          },
                          onChanged: (value) {
                            setState(() {
                              apellidos = value;
                              mostrarError = true;
                              //apellidosError = true;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        ZeroTextField(
                            suffixIcon: const Icon(
                              ZeroIcons.form,
                              color: Colors.blueAccent,
                              size: 17,
                            ),
                            labelText: "Nombres",
                            hintText: 'Ingresa tus nombres aquí',
                            controller: nombresController,
                            decoration: const InputDecoration(filled: true),
                            errorText: nombresError
                                ? 'Este campo es requerido !'
                                : null,
                            onSaved: (value) {
                              apellidos = value ?? '';
                              nombresError = true;
                              mostrarError = true;
                            },
                            onChanged: (value) {
                              setState(() {
                                nombres = value;
                                mostrarError = true;
                                //apellidosError = true;
                              });
                            }),
                        const SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue.shade200,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Género",
                                  style: TextStyle(fontSize: 15),
                                ),
                                RadioButton(
                                  onGenderSelected: (value) {
                                    setState(() {
                                      genero = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        DatePicker(
                          onDateSelected: (value) {
                            setState(() {
                              fechaNac = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  FadeInRight(
                      child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        "Información de acceso",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      ZeroTextField(
                          suffixIcon: const Icon(
                            ZeroIcons.mail,
                            color: Colors.blueAccent,
                            size: 17,
                          ),
                          labelText: 'Correo Eletrónico',
                          hintText: 'ejemplo@email.com',
                          controller: correoController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(filled: true),
                          errorText:
                              correoError ? 'Este campo es requerido !' : null,
                          onSaved: (value) {
                            correo = value ?? '';
                            correoError = true;
                            mostrarError = true;
                          },
                          onChanged: (value) {
                            setState(() {
                              correo = value;
                              mostrarError = true;
                              //apellidosError = true;
                            });
                          }),
                      const SizedBox(height: 15),
                      ZeroTextField(
                          suffixIcon: const Icon(
                            ZeroIcons.lock,
                            color: Colors.blueAccent,
                            size: 17,
                          ),
                          labelText: 'Contraseña',
                          hintText: 'Ingresa la contraseña para el acceso',
                          controller: passw1Controller,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(filled: true),
                          errorText:
                              passw1Error ? 'Este campo es requerido !' : null,
                          onSaved: (value) {
                            contrasena = value ?? '';
                            passw1Error = true;
                            mostrarError = true;
                          },
                          onChanged: (value) {
                            setState(() {
                              contrasena = value;
                              mostrarError = true;
                              //apellidosError = true;
                            });
                          }),
                      const SizedBox(height: 15),
                      ZeroTextField(
                          suffixIcon: const Icon(
                            ZeroIcons.lock,
                            color: Colors.blueAccent,
                            size: 17,
                          ),
                          labelText: 'Repetir contraseña',
                          hintText: 'Repite la contraseña para el acceso',
                          controller: passw2Controller,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(filled: true),
                          errorText:
                              passw2Error ? 'Este campo es requerido !' : null,
                          onSaved: (value) {
                            rcontrasena = value ?? '';
                            passw2Error = true;
                            mostrarError = true;
                          },
                          onChanged: (value) {
                            setState(() {
                              rcontrasena = value;
                              mostrarError = true;
                              //apellidosError = true;
                            });
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CheckboxButton(
                            onCheckBoxPressed: (value) {
                              checkTerminos = value;
                            },
                          ),
                          const Text(
                            "Estoy de acuerdo, acepto los terminos y condiciones",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  )),
                  FadeIn(
                    duration: const Duration(seconds: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ZeroButton.primary(
                            buttonSizeType: ZeroSizeType.large,
                            buttonRadiusType: ZeroButtonRadiusType.rounded,
                            onPressed: () => submitForm(),
                            child: const Text('Enviar')),
                        ZeroButton.primary(
                            buttonSizeType: ZeroSizeType.large,
                            buttonRadiusType: ZeroButtonRadiusType.rounded,
                            style: const ZeroButtonStyle(
                                backgroundColor: ZeroColors.dustRed),
                            onPressed: () => limpiar(),
                            child: const Text(
                              'Limpiar formularios',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  submitForm() {
    final state = key.currentState;
    if (state!.validate() &&
        !apellidosError &&
        !nombresError &&
        !cedulaError &&
        !correoError &&
        !passw1Error &&
        !passw2Error) {
      state.save();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Registro exitoso",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            content: Text(
                "¡La validación del formulario se ha realizado correctamente!\n"
                "Cedula: $cedula \n"
                "Nombres: $nombres \n"
                "Apellidos: $apellidos \n"
                "Género: $genero \n"
                "Nace: $fechaNac \n"
                "Correo: $correo \n"
                "Contraseña: $contrasena\n"
                "Contraseña: $rcontrasena\n"
                "Checkbox: $checkTerminos"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cerrar la ventana emergente
                  limpiar();
                },
                child: const Text("Cerrar"),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        apellidosError = apellidos.isEmpty;
        nombresError = nombres.isEmpty;
        cedulaError = cedula.isEmpty;
        correoError = correo.isEmpty;
        passw1Error = contrasena.isEmpty;
        passw2Error = rcontrasena.isEmpty;
      });
    }
  }

  limpiar() {
    nombresController.clear();
    apellidosController.clear();
    correoController.clear();
    passw1Controller.clear();
    passw2Controller.clear();
    cedulaController.clear();
    setState(() {
      apellidosError = apellidos.isEmpty;
      nombresError = nombres.isEmpty;
      cedulaError = cedula.isEmpty;
      correoError = correo.isEmpty;
      passw1Error = contrasena.isEmpty;
      passw2Error = rcontrasena.isEmpty;
    });
  }
}
