import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Asegúrate de tener esta importación
import 'package:zog_ui/zog_ui.dart';
import 'package:voto_facil/presentation/widgets/voto/usuario_valido_popup.dart';

class votovotarPage extends StatefulWidget {
  const votovotarPage({Key? key}) : super(key: key);

  @override
  State<votovotarPage> createState() => _votovotarPageState();
}

class _votovotarPageState extends State<votovotarPage> {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 32),
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 177, 177, 177),
                              width: 2.0)),
                    ),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 1.2125,
                            color: Color(0xff000000),
                          ),
                          children: [
                            TextSpan(
                              text: 'Tiempo Disponible',
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 1.2125,
                                color: Color(0xff5d5d5d),
                              ),
                            ),
                            TextSpan(
                              text: '  ',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 12.5),
                          width: 81.5,
                          height: 77.5,
                          child: SizedBox(width: 83, height: 104),
                        ),
                        Text(
                          '10:00 min',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 1.2125,
                            color: Color(0xff000000),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                width: double.infinity,
                height: 211,
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 16), // Espaciado
                      Text(
                        'Papeleta de Presidente',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Color(0xff000000),
                        ),
                      ),
                      Text(
                        'Se elige un Binomio Presidencial',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Color(0xff5d5d5d),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 60), // Espaciado
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              width: double.infinity,
              height: 116,
              child: Container(
                padding: EdgeInsets.all(16),
                width: 250,
                height: 333,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Color.fromARGB(255, 177, 177, 177),
                          width: 2.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ZeroButton.primary(
                      buttonRadiusType: ZeroButtonRadiusType.rounded,
                      style: ZeroButtonStyle(backgroundColor: Colors.black),
                      width: 180,
                      height: 40,
                      child: Text(
                        'Declarar Voto Nulo',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Color(0xffffffff),
                        ),
                      ),
                      onPressed: () {},
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                          margin: EdgeInsets.only(right: 5),
                          width: 24,
                          height: 24,
                          child: Icon(size: 20, Icons.info_outline_rounded),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(top: 7),
                          child: Text(
                            'Al presionar el botón, declarará Todas las papeletas como voto nulo',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.2125,
                              color: Color(0xff5d5d5d),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
