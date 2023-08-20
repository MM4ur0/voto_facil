import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:voto_facil/config/database/voto_database.dart';
import 'package:voto_facil/presentation/pages/partido_politico/candidatos_page.dart';
import 'package:voto_facil/presentation/pages/partido_politico/informacion_page.dart';
import 'package:voto_facil/presentation/pages/partido_politico/plan_page.dart';
import 'package:voto_facil/presentation/widgets/resultado/cardp.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class Resultados extends StatefulWidget {
  final String partidoId; // Receive partidoId from the previous page
  const Resultados({required this.partidoId, super.key});

  @override
  State<Resultados> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultados> {
  List<Map<String, dynamic>> resumenMap = [];

  @override
  void initState() {
    super.initState();
    _fetchResumenVotos();
  }

  void _fetchResumenVotos() async {
    // Fetch the resumen data using the provided method
    resumenMap = await VotoDataBase.resumenVotosPorPartidoEspecifico(
        int.parse(widget.partidoId));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> paginas = [
      InformacionPage(partidoId: widget.partidoId),
      CandidatosPage(partidoId: widget.partidoId),
      PlanPage(partidoId: widget.partidoId),
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
                    width: double.minPositive,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [],
                    ),
                  ),
                  Expanded(
                    child: Cardp(partidoId: widget.partidoId),
                  ),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    width: double.infinity,
                    height: 146,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        width: 250,
                        height: 333,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Color.fromARGB(255, 177, 177, 177),
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Votos a Favor', // Displayed once at the top
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                height: 1.2125,
                                color: Color.fromARGB(255, 44, 44, 44),
                              ),
                            ),
                            for (var item
                                in resumenMap) // Loop through the fetched data
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 180,
                                    margin: EdgeInsets.only(top: 7),
                                    child: Text(
                                      '\t Votos a Favor', // Use data from the fetched map
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
                                          color: Colors.green, width: 5),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${item['cantidad_votos']}',
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${item['porcentaje']}%', // Add percentage value
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                ])));
  }
}
