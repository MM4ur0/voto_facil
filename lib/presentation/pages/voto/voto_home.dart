import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:voto_facil/presentation/widgets/voto/usuario_valido_popup.dart';

class votohomePage extends StatefulWidget {
  const votohomePage({Key? key}) : super(key: key);

  @override
  State<votohomePage> createState() => _votohomePageState();
}

class _votohomePageState extends State<votohomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ZeroColors.primary,
        title: const Text(
          'Ejercer Voto',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              // group24XxM (1:62)
              margin: const EdgeInsets.fromLTRB(95, 0, 99, 37),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Icon(size: 40, Icons.info_outline_rounded),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                      // atencinyZT (1:63)
                      margin: const EdgeInsets.fromLTRB(5, 1, 0, 0),
                      child: Text(
                          style: GoogleFonts.inter(
                            fontSize: 35, // 20*ffem
                            fontWeight: FontWeight.w400,
                            height: 1.2125, // 1.2125*ffem/fem
                            color: const Color.fromARGB(
                                255, 0, 0, 0), // Color(0xffffffff)
                          ),
                          'Atención')),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            Container(
              // autogroupe2wttyF (JprCYBygDmBxbM4DNGe2wT)
              margin: EdgeInsets.fromLTRB(25, 0, 9, 10),
              width: double.infinity,
              height: 450,
              child: Stack(
                children: [
                  Positioned(
                    // group19v9F (1:42)
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 301,
                      height: 336,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // noobligatorioS7b (1:43)
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                            width: double.infinity,
                            child: RichText(
                              text: TextSpan(
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'El voto ',
                                  ),
                                  TextSpan(
                                    text: 'Obligatorio',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' para :',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // autogrouppkqmAJV (JprCj6qAPsnPKRtTJYpKQm)
                            margin: EdgeInsets.fromLTRB(1, 0, 0, 20),
                            width: 300,
                            height: 201,
                            child: Stack(
                              children: [
                                Positioned(
                                  // personasentre16y18aosdeedadper (1:44)
                                  left: 11,
                                  top: 0,
                                  child: Align(
                                    child: SizedBox(
                                      width: 289,
                                      height: 201,
                                      child: Text(
                                        style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2125,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        ),
                                        '- Personas entre 16 y 18 años de edad.',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    // verificarelegibilidadparavotar (1:41)
                    left: 50,
                    top: 360,
                    child: Align(
                      child: SizedBox(
                        width: 235,
                        height: 20,
                        child: Text(
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                          'Verificar elegibilidad para votar',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group19v9F (1:42)
                    left: 0,
                    top: 90,
                    bottom: 50,
                    child: Container(
                      width: 301,
                      height: 336,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // noobligatorioS7b (1:43)
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
                            width: double.infinity,
                            child: RichText(
                              text: TextSpan(
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'El voto es',
                                  ),
                                  TextSpan(
                                    text: ' No',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' obligatorio para :',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // autogrouppkqmAJV (JprCj6qAPsnPKRtTJYpKQm)
                            margin: EdgeInsets.fromLTRB(1, 0, 0, 20),
                            width: 300,
                            height: 201,
                            child: Stack(
                              children: [
                                Positioned(
                                  // personasentre16y18aosdeedadper (1:44)
                                  left: 11,
                                  top: 0,
                                  child: Align(
                                    child: SizedBox(
                                      width: 289,
                                      height: 201,
                                      child: Text(
                                        '- Personas entre 16 y 18 años de edad. \n\n- Personas mayores de 65 años. \n\n- Ecuatorian@s que habitan en el exterior\n\n- Integrantes de las Fuerzas Armadas' +
                                            '\n\n- Policía Nacional.\n\n- Personas con discapacidad.',
                                        style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2125,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // line18uX (1:55)
                                  left: 0,
                                  top: 180,
                                  child: Align(
                                    child: SizedBox(
                                      width: 290,
                                      height: 1,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 158, 156, 156),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ZeroButton.primary(
              buttonRadiusType: ZeroButtonRadiusType.rounded,
              width: 150,
              height: 50,
              child: Text(
                "Verificar",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PopupUser_valido();
                  },
                );
              },
            ),
            Container(
              // group23JBj (1:57)
              margin: EdgeInsets.fromLTRB(5, 20, 270, 11),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      // quiz27j (1:59)

                      ),
                  Container(
                    // faqYbs (1:58)
                    margin: EdgeInsets.fromLTRB(25, 0, 0, 11),
                    child: Text(
                      'FAQ ',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              // group21gTB (1:49)
              onPressed: () {
                Navigator.pushNamed(context, "/faq1");
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                width: 390,
                height: 49,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xffbdbdbd)),
                ),
                child: const Center(
                  child: Text(
                    'Quiénes no pueden ejercer Voto? ',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              // group21gTB (1:49)
              onPressed: () {
                Navigator.pushNamed(context, '/list_partidos_politicos');
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                width: 390,
                height: 49,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xffbdbdbd)),
                ),
                child: const Center(
                  child: Text(
                    'Cuáles son los candidatos ?',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        )),
      ),
    );
  }
}
