import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Asegúrate de tener esta importación
import 'package:zog_ui/zog_ui.dart';
import 'package:voto_facil/presentation/widgets/voto/timer_widget.dart';
import 'package:voto_facil/presentation/widgets/voto/card_partidos.dart';
import 'package:voto_facil/presentation/widgets/voto/voto_nulo.dart';

class PapeletaPage extends StatefulWidget {
  const PapeletaPage({Key? key}) : super(key: key);

  @override
  State<PapeletaPage> createState() => _PapeletaPageState();
}

class _PapeletaPageState extends State<PapeletaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: ZeroColors.primary,
          title: const Text(
            'Proceso de Votación',
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
                                Text(
                                  'Tiempo Disponible : ',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125,
                                    color: Color(0xff5d5d5d),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(size: 32, Icons.timer),
                                SizedBox(
                                  width: 10,
                                ),
                                MyTimerWidget(),
                              ]),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 32),
                    width: double.infinity,
                    height: 45,
                    child: Center(
                      child: Row(children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(size: 55, Icons.contact_page),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Papeleta de Presidente',
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
                            style:
                                ZeroButtonStyle(backgroundColor: Colors.black),
                            width: 180,
                            height: 40,
                            child: Text(
                              'Declarar Voto Nulo',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1.2125,
                                color: Color(0xffffffff),
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Votonuloselect();
                                },
                              );
                            },
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                margin: EdgeInsets.only(right: 4),
                                width: 24,
                                height: 24,
                                child:
                                    Icon(size: 25, Icons.info_outline_rounded),
                              ),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.only(top: 7),
                                child: Text(
                                  'Al presionar el botón, \ndeclarará su Voto como voto nulo',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
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
                  cardpartidos(),
                  SizedBox(
                    height: 60,
                  ),
                  cardpartidos(),
                  SizedBox(
                    height: 60,
                  ),
                  cardpartidos(),
                  SizedBox(
                    height: 60,
                  )
                ])));
  }
}
