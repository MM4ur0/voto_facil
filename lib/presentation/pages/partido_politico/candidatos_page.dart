import 'package:flutter/material.dart';
import 'package:voto_facil/config/database/voto_database.dart';
import 'package:voto_facil/model/candidatos.dart';
import 'package:voto_facil/model/partidos_politicos.dart';
import 'package:zog_ui/components/card/zero_card.dart';

class CandidatosPage extends StatefulWidget {
  final String partidoId;
  const CandidatosPage({super.key, required this.partidoId});

  @override
  State<CandidatosPage> createState() => _CandidatosPageState();
}

class _CandidatosPageState extends State<CandidatosPage> {
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
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                partido?.nombre ??
                    'Cargando...', // Mostrar 'Cargando...' si partido es null
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              partido == null
                  ? Container(
                      height: 150,
                      color: Colors.grey.shade100,
                    )
                  : SizedBox(
                      height: 150,
                      child: Image.asset(
                        'images/partidos/${partido!.imagen}',
                        fit: BoxFit.contain,
                      ),
                    ),
              const SizedBox(
                height: 15,
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
                                  height: 150,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  candidatos[0].nombre,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
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
              const SizedBox(
                height: 15,
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
                                  height: 150,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  candidatos[1].nombre,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
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
            ],
          ),
        ),
      ),
    );
  }
}
