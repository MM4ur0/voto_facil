import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class Votoselect extends StatelessWidget {
  final String candidato1;
  final String candidato2;

  Votoselect({required this.candidato1, required this.candidato2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 700, // Ajusta el ancho según tus necesidades
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 340,
                height: 370,
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
                      Icons.info_outline_rounded,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 70,
                    ),
                    const SizedBox(height: 6),
                    const SizedBox(
                      height: 30,
                      child: Text(
                        "Realizar Voto",
                        style: TextStyle(
                          fontFamily: AutofillHints.jobTitle,
                          fontStyle: FontStyle.normal,
                          fontSize: 25,
                          decoration: TextDecoration.none,
                          color: Colors.black, // Color del texto
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(top: 7),
                      child: Text(
                        'Su Voto será para los  Siguientes candidatos. \n\n$candidato1\n $candidato2',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Color(0xff5d5d5d),
                        ),
                      ),
                    )),
                    Text(
                      "Desea continuar?",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ZeroButton.primary(
                          height: 50,
                          width: 133,
                          buttonSizeType: ZeroSizeType.large,
                          buttonRadiusType: ZeroButtonRadiusType.rounded,
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(context, '/home');
                            Navigator.pop(context);
                          },
                          child: const Text("Continuar"),
                        ),
                        ZeroButton.secondary(
                          style: ZeroButtonStyle(
                              backgroundColor:
                                  const Color.fromARGB(255, 204, 204, 204)),
                          height: 50,
                          width: 125,
                          buttonSizeType: ZeroSizeType.large,
                          buttonRadiusType: ZeroButtonRadiusType.rounded,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
