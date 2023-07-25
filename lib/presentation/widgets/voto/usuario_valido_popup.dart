import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class PopupUser_valido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator PopupUser_valido - FRAME
    return Center(
      child: SizedBox(
        width: 600, // Ajusta el ancho según tus necesidades
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 0.922),
                  border: Border.all(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 70,
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(
                      height: 30,
                      child: Text(
                        "Verificado para Votar",
                        style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.black, // Color del texto
                        ),
                      ),
                    ),
                    ZeroButton.primary(
                      height: 50,
                      width: 120,
                      buttonSizeType: ZeroSizeType.large,
                      buttonRadiusType: ZeroButtonRadiusType.rounded,
                      onPressed: () {
                        //Navigator.pushNamed(context, '/registro');
                      },
                      child: const Text("Aceptar"),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
