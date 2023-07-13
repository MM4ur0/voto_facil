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
  final key = GlobalKey<FormState>();
  final textController = TextEditingController();
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
                        TextBoxIcon(
                          icon: Icons.badge_outlined,
                          inputType: TextInputType.number,
                          label: 'Cédula de identidad',
                          hint: 'Ingresa tu número de cédula',
                          errorText: 'Este campo es requerido !',
                          onSaved: (String value) {
                            cedula = value;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextBoxLabel(
                          label: 'Apellidos',
                          hint: 'Ingresa tus apellidos aquí',
                          errorText: 'Este campo es requerido !',
                          onSaved: (String value) {
                            apellidos = value;
                          },
                          radius: 50,
                        ),
                        const SizedBox(height: 15),
                        TextBoxLabel(
                          label: 'Nombres',
                          hint: 'Ingresa tus nombres aquí',
                          errorText: 'Este campo es requerido !',
                          onSaved: (String value) {
                            nombres = value;
                          },
                        ),
                        ZeroTextField(
                          hintText: 'Search Component',
                          controller: textController,
                          decoration: const InputDecoration(filled: true),
                          onChanged: (v) {},
                        ),
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
                      TextBoxIcon(
                        icon: Icons.email_outlined,
                        inputType: TextInputType.emailAddress,
                        label: 'Correo Eletrónico',
                        hint: 'ejemplo@email.com',
                        errorText: 'Este campo es requerido !',
                        onSaved: (String value) {
                          correo = value;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextBoxIcon(
                          icon: Icons.lock_outlined,
                          inputType: TextInputType.number,
                          obscure: true,
                          label: 'Contraseña',
                          hint: 'Ingresa la contraseña para el acceso',
                          errorText: 'Este campo es requerido !',
                          onSaved: (String value) {
                            contrasena = value;
                          }),
                      const SizedBox(height: 15),
                      TextBoxIcon(
                          icon: Icons.lock_outlined,
                          inputType: TextInputType.number,
                          obscure: true,
                          label: 'Repetir contraseña',
                          hint: 'Repite la contraseña para el acceso',
                          errorText: 'Este campo es requerido !',
                          onSaved: (String value) {
                            rcontrasena = value;
                          }),
                      const SizedBox(height: 15),
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
                        ElevatedButton(
                            onPressed: () => submitForm(),
                            child: const Text('Enviar')),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red)),
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
    if (state!.validate()) {
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
                "Nombres: $nombres \n"
                "Apellidos: $apellidos \n"
                "Genero: $genero \n"
                "Nace: $fechaNac \n"
                "Correo: $correo \n"
                "Contraseña: $contrasena\n"
                "Contraseña: $rcontrasena\n"
                "Checkbox: $checkTerminos"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cerrar la ventana emergente
                },
                child: const Text("Cerrar"),
              ),
            ],
          );
        },
      );
    }
  }

  limpiar() {
    textController.clear();
  }
}
