import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:voto_facil/config/database/voto_database.dart';
import 'package:voto_facil/model/candidatos.dart';
import 'package:voto_facil/model/partidos_politicos.dart';
import 'package:voto_facil/presentation/widgets/voto/voto_ok.dart';

class Cardp extends StatefulWidget {
  final String partidoId;
  const Cardp({super.key, required this.partidoId});

  @override
  State<Cardp> createState() => CardpState();
}

class CardpState extends State<Cardp> {
  PartidosPoliticos? partido;
  List<Candidatos> candidatos = [];

  @override
  void initState() {
    super.initState();
    _cargarCandidatos();
    _fetchPartidoData();
  }

  void _fetchPartidoData() async {
    int partidoId = int.parse(widget.partidoId);

    PartidosPoliticos? partido = await VotoDataBase.getPartidoPorId(partidoId);

    setState(() {
      this.partido = partido;
    });
  }

  _cargarCandidatos() async {
    int partidoId = int.parse(widget.partidoId);
    candidatos = await VotoDataBase.getCandidatos(partidoId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Group5Widget - INSTANCE
    return Container(
        // androidsmall1h8d (127:210)
        padding: EdgeInsets.fromLTRB(32, 40, 19, 25),
        width: double.infinity,
        height: 640,
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 177, 177, 177), width: 2.0)),
          color: Color.fromARGB(255, 253, 253, 253),
        ),
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              partido?.nombre ??
                  'Cargando...', // Mostrar 'Cargando...' si partido es null
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            partido == null
                ? Container(
                    height: 50,
                    color: const Color.fromARGB(255, 46, 43, 43),
                  )
                : SizedBox(
                    height: 50,
                    child: Image.asset(
                      'images/partidos/${partido!.imagen}',
                      fit: BoxFit.contain,
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            candidatos.isEmpty
                ? const CircularProgressIndicator()
                : ZeroCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'images/candidatos/${candidatos[0].imagen}',
                                height: 100,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                candidatos[0].nombre,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                candidatos[0].cargo,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            candidatos.length >= 2
                ? ZeroCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'images/candidatos/${candidatos[1].imagen}',
                                height: 100,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                candidatos[1].nombre,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                candidatos[1].cargo,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(
              height: 25,
            ),
          ],
        ));
  }
}
