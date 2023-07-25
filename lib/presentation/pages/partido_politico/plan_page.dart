import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

  void _launchURL() async {
    Uri uri = Uri(
        scheme: 'https',
        host: 'conocetucandidato.cne.gob.ec',
        path: '/binomios_presidenciales');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'No se pudo abrir el enlace ${uri.toString()}';
    }
  }

  static double miCalificacion = 0;
  static double calificado = 0;
  static double calificacionActual = 8;
  double ratingValue = 0;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(seconds: 1),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
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
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            child: Image.asset(
                              'images/partidos/${partido!.imagen}',
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              _launchURL();
                            }, // Usamos la función _launchURL para abrir el enlace
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.picture_as_pdf_outlined,
                                  size: 50,
                                ),
                                SizedBox(width: 8),
                                Text('Ver plan de trabajo'),
                              ],
                            ),
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Deja tu calificaicón"),
                const SizedBox(
                  height: 15,
                ),
                ZeroRating(
                  sizeType: ZeroSizeType.large,
                  initialValue: ratingValue,
                  isDisabled: flag,
                  onRatingUpdate: (value) {
                    miCalificacion = value;
                    ratingValue = value;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                ZeroButton.primary(
                  buttonSizeType: ZeroSizeType.large,
                  buttonRadiusType: ZeroButtonRadiusType.rounded,
                  isDisabled: flag,
                  onPressed: () {
                    miCalificacion = ratingValue;
                    setState(() {
                      flag = true;
                      calificado = calificacionActual + ((miCalificacion / 10));
                      if (calificado == 10) {
                        calificado = 10;
                      } else {
                        calificacionActual = calificado;
                      }
                    });
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
                      child: Text(
                        '${calificado == 0 ? '$calificacionActual' : calificacionActual >= 10 ? '10' : '$calificado'}  / 10',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
