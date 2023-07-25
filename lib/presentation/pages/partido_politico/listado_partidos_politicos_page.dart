import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:voto_facil/config/database/voto_database.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:voto_facil/model/partidos_politicos.dart';

class ListadoPartidosPoliticos extends StatefulWidget {
  const ListadoPartidosPoliticos({super.key});

  @override
  State<ListadoPartidosPoliticos> createState() => _PartidosPoliticosState();
}

class _PartidosPoliticosState extends State<ListadoPartidosPoliticos> {
  List<PartidosPoliticos> partido = [];
  List<String> pos = ['Derecha', 'Centro', 'Izquierda', 'Ver todos'];
  String selectedPosition = '-Seleccionar-';

  cargarPartidos() async {
    List<PartidosPoliticos> auxPartido =
        (await VotoDataBase.partidos()).cast<PartidosPoliticos>();

    setState(() {
      partido = auxPartido;
    });
  }

  List<PartidosPoliticos> getFilteredPartidos() {
    if (selectedPosition == 'Ver todos' ||
        selectedPosition == '-Seleccionar-') {
      return partido;
    } else {
      return partido
          .where((partido) => partido.posicion == selectedPosition)
          .toList();
    }
  }

  @override
  void initState() {
    super.initState();
    cargarPartidos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Partidos políticos"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              ZeroDropdown(
                value: selectedPosition,
                hintText: 'Seleccionar un posición política',
                onChanged: (value) {
                  setState(() {
                    selectedPosition = value;
                  });
                },
                items: List.from(pos),
                labelStyle:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: getFilteredPartidos().length,
                  itemBuilder: (BuildContext context, int index) {
                    final partidoActual = getFilteredPartidos()[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/partido_politico',
                          arguments: '${partidoActual.id}',
                        );
                      },
                      child: FadeIn(
                        duration: const Duration(seconds: 3),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: Row(
                              children: <Widget>[
                                ZeroAvatar.asset(
                                    'images/partidos/${partidoActual.imagen}'),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        partidoActual.nombre,
                                        style: const TextStyle(fontSize: 20),
                                        // Asegura que el texto se expanda verticalmente si es necesario
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
