import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Asegúrate de tener esta importación
import 'package:zog_ui/zog_ui.dart';
import 'package:voto_facil/presentation/widgets/voto/timer_widget.dart';
import 'package:voto_facil/presentation/widgets/voto/card_partidos.dart';
import 'package:voto_facil/presentation/widgets/voto/voto_nulo.dart';

class Faq1Page extends StatefulWidget {
  const Faq1Page({Key? key}) : super(key: key);

  @override
  State<Faq1Page> createState() => _Faq1PageState();
}

class _Faq1PageState extends State<Faq1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: ZeroColors.primary,
          title: const Text(
            'FAQ',
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
                            margin: EdgeInsets.only(bottom: 12),
                            width: double.infinity,
                            height: 195,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 13, 180, 231),
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(255, 177, 177, 177),
                                      width: 2.0)),
                            ),
                            child: Image.asset(
                              'images/design/faq.jpg',
                              height: 320,
                              width: MediaQuery.of(context).size.width *
                                  0.9, // 80% del ancho del dispositivo
                            ),
                          ),
                        ]),
                  ),

                  SizedBox(height: 5), // Espaciado
                  Container(
                    padding: EdgeInsets.all(16),
                    width: 250,
                    height: 83,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 177, 177, 177),
                              width: 2.0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(top: 7),
                          child: Text(
                            'Preguntas Frecuentes',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              height: 1.2125,
                              color: Color.fromARGB(255, 32, 32, 32),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Para ser parte del proceso electoral ya sea para ser elegido o votar es necesario estar en goce de los derechos políticos o de participación. El artículo 14 del Código de la Democracia establece que se suspenderán estos derechos cuando exista:",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "• Interdicción judicial, mientras ésta subsista, salvo en caso de insolvencia o quiebra que no haya sido declarada fraudulenta.",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "• Sentencia ejecutoriada que sancione con pena privativa de libertad, mientras esta subsista; ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "• Cuando el Tribunal Contencioso Electoral haya declarado en sentencia ejecutoriada la responsabilidad por el cometimiento de alguna infracción de las tipificadas en esta ley con esa sanción.",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ])));
  }
}
