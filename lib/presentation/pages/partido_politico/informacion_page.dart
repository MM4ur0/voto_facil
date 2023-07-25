import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:voto_facil/config/database/voto_database.dart';
import 'package:voto_facil/model/ideologia.dart';
import 'package:voto_facil/model/partidos_politicos.dart';
import 'package:zog_ui/components/chip/zero_chip_filled.dart';

class InformacionPage extends StatefulWidget {
  final String partidoId;
  const InformacionPage({Key? key, required this.partidoId}) : super(key: key);

  @override
  State<InformacionPage> createState() => _InformacionPageState();
}

class _InformacionPageState extends State<InformacionPage> {
  PartidosPoliticos? partido;
  List<Ideologia> ideologia = [];

  @override
  void initState() {
    super.initState();
    _fetchPartidoData();
    _cargarIdeologia();
  }

  _cargarIdeologia() async {
    int partidoId = int.parse(widget.partidoId);
    ideologia = await VotoDataBase.getIdeologia(partidoId);
    setState(() {});
  }

  void _fetchPartidoData() async {
    int partidoId = int.parse(widget.partidoId);

    PartidosPoliticos? partido = await VotoDataBase.getPartidoPorId(partidoId);

    setState(() {
      this.partido = partido;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Comprobar si la lista está vacía
    bool isLoading = ideologia.isEmpty;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: FadeIn(
          duration: const Duration(seconds: 1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${partido?.nombre}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RowInformacion(
                          title: 'Fundación',
                          text: "${partido?.fundacion}",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RowInformacion(
                          title: "Sede",
                          text: "${partido?.sede}",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RowInformacion(
                          title: "País",
                          text: "${partido?.pais}",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RowInformacion(
                          title: "Posición",
                          text: "${partido?.posicion}",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "Ideología",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                // Comprobar si la lista está vacía y mostrar un indicador de carga o una IU alternativa
                                if (isLoading)
                                  const CircularProgressIndicator()
                                else
                                  Row(
                                    children: [
                                      if (ideologia.isNotEmpty)
                                        ZeroChipFilled(
                                          label: ideologia[0].idea,
                                        ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      if (ideologia.length > 1)
                                        ZeroChipFilled(
                                          label: ideologia[1].idea,
                                        ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      if (ideologia.length > 2)
                                        ZeroChipFilled(
                                          label: ideologia[2].idea,
                                        ),
                                    ],
                                  ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    if (ideologia.length > 3)
                                      ZeroChipFilled(
                                        label: ideologia[3].idea,
                                      ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (ideologia.length > 4)
                                      ZeroChipFilled(
                                        label: ideologia[4].idea,
                                      ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (ideologia.length > 5)
                                      ZeroChipFilled(
                                        label: ideologia[5].idea,
                                      ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowInformacion extends StatelessWidget {
  final String title;
  final String text;
  const RowInformacion({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$title: ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
