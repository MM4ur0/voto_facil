import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Asegúrate de tener esta importación
import 'package:zog_ui/zog_ui.dart';
import 'package:voto_facil/presentation/widgets/voto/timer_widget.dart';
import 'package:voto_facil/presentation/widgets/voto/card_partidos.dart';
import 'package:voto_facil/presentation/widgets/voto/voto_nulo.dart';

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
                            height: 65,
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(255, 177, 177, 177),
                                      width: 2.0)),
                            ),
                            child: Center(
                              child: Row(children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(size: 32, Icons.contact_page),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Papeletas',
                                  style: GoogleFonts.inter(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125,
                                    color: Color(0xff5d5d5d),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(top: 7),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Color.fromARGB(255, 44, 44, 44),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Tiene un Tiempo Limite de ',
                          ),
                          TextSpan(
                            text: '10 min',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .black, // Puedes ajustar el color si lo deseas
                            ),
                          ),
                          TextSpan(
                            text: ' para realizar el proceso de votacion',
                          ),
                        ],
                      ),
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 12.5),
                          width: 81.5,
                          height: 60.5,
                          child: SizedBox(width: 83, height: 104),
                        ),
                      ],
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      //p(context);
                      Navigator.pushNamed(context, "/papeleta");
                    },
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //SizedBox(height: 20), // Espaciado
                            Icon(size: 80, Icons.contact_page),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 65),
                                Text(
                                  'Papeleta de Presidente',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Se elige un Binomio Presidencial',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125,
                                    color: Color(0xff5d5d5d),
                                  ),
                                ),
                              ],
                            )
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                margin: EdgeInsets.only(right: 30, top: 7),
                                width: 24,
                                height: 24,
                                child:
                                    Icon(size: 30, Icons.info_outline_rounded),
                              ),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.only(top: 7),
                                child: Text(
                                  'Recuerda que son las mismas Papeletas de Siempre ahora digitales',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125,
                                    color: Color.fromARGB(255, 44, 44, 44),
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset(
                    'images/voto/pape.png',
                    height: 220,
                    width: MediaQuery.of(context).size.width *
                        0.8, // 80% del ancho del dispositivo
                  ),
                ])));
  }
}
