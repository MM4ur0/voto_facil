import 'package:flutter/material.dart';
import 'package:voto_facil/presentation/pages/partido_politico/candidatos_page.dart';
import 'package:voto_facil/presentation/pages/partido_politico/informacion_page.dart';
import 'package:voto_facil/presentation/pages/partido_politico/plan_page.dart';
import 'package:voto_facil/presentation/widgets/resultado/cardp.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class Resultado extends StatefulWidget {
  const Resultado({super.key});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  late String partidoId;
  int _paginaActual = 0;

  @override
  Widget build(BuildContext context) {
    partidoId = ModalRoute.of(context)?.settings.arguments as String;

    final List<Widget> paginas = [
      InformacionPage(partidoId: partidoId),
      CandidatosPage(partidoId: partidoId),
      PlanPage(partidoId: partidoId),
    ];

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Resultados",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: ZeroColors.primary,
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
                          children: [])),
                  Expanded(
                    child: Cardp(partidoId: partidoId),
                  ),

                  // Espaciado
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                          margin: EdgeInsets.only(left: 50, top: 7),
                          width: 24,
                          height: 24,
                          child: Icon(size: 30, Icons.inventory_2_rounded),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(top: 7),
                          child: Text(
                            '\t\t\t\t Resultado de Votos',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              height: 1.2125,
                              color: Color.fromARGB(255, 44, 44, 44),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    width: double.infinity,
                    height: 146,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 180,
                                margin: EdgeInsets.only(top: 7),
                                child: Text(
                                  '\t Votos a Favor',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2125,
                                    color: Color.fromARGB(255, 44, 44, 44),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.green, width: 5),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  '10',
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    width: double.infinity,
                    height: 146,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 180,
                                margin: EdgeInsets.only(top: 7),
                                child: Text(
                                  '\t Votos Nulos',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2125,
                                    color: Color.fromARGB(255, 44, 44, 44),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color.fromARGB(255, 105, 95, 95),
                                      width: 5),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  '55',
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ])));
  }
}
