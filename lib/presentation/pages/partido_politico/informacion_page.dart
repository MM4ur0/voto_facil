import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:voto_facil/config/database/voto_database.dart';
import 'package:voto_facil/model/partidos_politicos.dart';
import 'package:zog_ui/components/chip/zero_chip_filled.dart';

class InformacionPage extends StatefulWidget {
  final String partidoId;
  const InformacionPage({super.key, required this.partidoId});

  @override
  State<InformacionPage> createState() => _InformacionPageState();
}

class _InformacionPageState extends State<InformacionPage> {
  PartidosPoliticos? partido;
  @override
  void initState() {
    super.initState();
    _fetchPartidoData();
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: FadeIn(
          duration: Duration(seconds: 1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "${partido?.nombre}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
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
                          title: 'fundación',
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Ideología",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    ZeroChipFilled(
                                      label: "ideología",
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    ZeroChipFilled(
                                      label: "ideología",
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    ZeroChipFilled(
                                      label: "ideología",
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    ZeroChipFilled(
                                      label: "ideología",
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    ZeroChipFilled(
                                      label: "ideología",
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    ZeroChipFilled(
                                      label: "ideología",
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowInformacion extends StatefulWidget {
  final String title;
  final String text;
  const RowInformacion({super.key, required this.title, required this.text});

  @override
  State<RowInformacion> createState() => _RowInformacionState();
}

class _RowInformacionState extends State<RowInformacion> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${widget.title}: ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          "${widget.text}.",
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
