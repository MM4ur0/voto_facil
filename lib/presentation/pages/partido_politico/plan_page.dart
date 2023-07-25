import 'package:flutter/material.dart';
import 'package:voto_facil/config/database/voto_database.dart';
import 'package:voto_facil/model/partidos_politicos.dart';
import 'package:zog_ui/zog_ui.dart';

class PlanPage extends StatefulWidget {
  final String partidoId;
  const PlanPage({super.key, required this.partidoId});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${partido?.nombre}",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
              const Text("Plan de trabajo"),
              const SizedBox(
                height: 15,
              ),
              const Text("Deja tu calificaicón"),
              const SizedBox(
                height: 15,
              ),
              const ZeroRating(sizeType: ZeroSizeType.large),
              const SizedBox(
                height: 15,
              ),
              ZeroButton.primary(
                buttonSizeType: ZeroSizeType.large,
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                onPressed: () {
                  Navigator.pushNamed(context, '/registro');
                },
                child: const Text("Enviar calificación"),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green, width: 5),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "10 / 10",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("Aceptación",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ZeroButton.primary(
                buttonSizeType: ZeroSizeType.large,
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                onPressed: () {
                  Navigator.pushNamed(context, '/cometarios');
                },
                child: const Text("Ver comentarios"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
