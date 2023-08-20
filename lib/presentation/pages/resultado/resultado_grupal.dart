import 'package:flutter/material.dart';
import 'package:voto_facil/presentation/pages/resultado/resultado_graficas.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:voto_facil/model/partidos_politicos.dart';
import 'package:voto_facil/config/database/voto_database.dart'; 
import 'package:flutter_charts/flutter_charts.dart' as charts;

class ListadoFiltradoPartidos extends StatelessWidget {
  final List<PartidosPoliticos> partidos;

  ListadoFiltradoPartidos({required this.partidos});
  
  @override
  Widget build(BuildContext context) {
    final List<Color> cardColors = [
      ZeroColors.sunriseYellow,
      ZeroColors.lime,
      ZeroColors.dustRed,
      ZeroColors.sunsetOrange,
      ZeroColors.goldenPurple,
      ZeroColors.calendulaGold,
      ZeroColors.vocano,
      ZeroColors.geekBlue,
      ZeroColors.magenta,
      ZeroColors.neutral,
    ];
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ZeroColors.primary,
        title: const Text(
          "Resultados",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: VotoDataBase.resumenVotosPorPartidoFiltrado(partidos),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No hay datos disponibles');
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Text(
                          'Resultados',
                          style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Icon(
                          Icons.summarize,
                          size: 48,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 8),
                        FutureBuilder<int>(
                          future: VotoDataBase.contarVotosSinPartido(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Text('Votos nulos: Cargando...');
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              final votosSinPartido = snapshot.data ?? 0;
                              return Text(
                                'Votos nulos: $votosSinPartido',
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final partidoResumen = snapshot.data![index];
                        final idPartido = partidoResumen['idpartido'];

                        final partidoActual = partidos.firstWhere(
                          (partido) => partido.id == idPartido,
                          orElse: () => PartidosPoliticos(
                            id: -1, // Un ID inválido o diferente
                            nombre: partidoResumen['nombre'],
                            imagen: partidoResumen['imagen'], // Usar la imagen del resumen
                            fundacion: '',
                            posicion: '',
                            sede: '',
                            pais: '',
                          ),
                        );

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                            width: double.infinity,
                            child: ZeroCard(
                              style: const ZeroCardElevatedStyle(
                                elevation: 8,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    color: cardColors[index % cardColors.length],
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage('images/partidos/${partidoActual.imagen}'),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            partidoActual.nombre,
                                            style: Theme.of(context).textTheme.headline6?.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Cantidad de Votos: ${partidoResumen['cantidad_votos']}',
                                          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          'Porcentaje: ${partidoResumen['porcentaje'].toStringAsFixed(2)}%',
                                          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: 
                    ZeroButton.primary(
                      child: const Text('Mostrar Graficos Estadísticos'),
                      onPressed: () {
                        if (snapshot.data != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GraficoBarrasPage(resultados: snapshot.data!),
                          ),
                        );
                      }
                      },
                      buttonRadiusType: ZeroButtonRadiusType.rounded,
                    ), 
                  ),
                  const SizedBox(height: 16),
                  ZeroButton.primary(
                child: const Text('Regresar'),
                onPressed: () {                  
                    Navigator.pop(context);
                },
                buttonRadiusType: ZeroButtonRadiusType.rounded,
              ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

