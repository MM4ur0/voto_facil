import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts; 
import 'package:zog_ui/zog_ui.dart';

class GraficoBarrasPage extends StatelessWidget {
  final List<Map<String, dynamic>> resultados;

  GraficoBarrasPage({required this.resultados});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<PartidoData, String>> seriesList = [
      charts.Series<PartidoData, String>(
        id: 'Partidos',
        domainFn: (PartidoData data, _) =>
            _truncateText(data.nombre, 3), // Truncate the name
        measureFn: (PartidoData data, _) => data.cantidadVotos,
        colorFn: (_, index) => charts.MaterialPalette.blue
            .makeShades(resultados.length)[index ?? 0],
        data: resultados
            .map((partidoResumen) => PartidoData(
                  nombre: partidoResumen['nombre'],
                  cantidadVotos: partidoResumen['cantidad_votos'],
                ))
            .toList(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ZeroColors.primary,
        title: const Text(
          "Gráfico de Barras",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Gráfico de Barras',
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: charts.BarChart(
                seriesList,
                animate: true,
                vertical: true,
                behaviors: [charts.SeriesLegend()],
                barRendererDecorator: charts.BarLabelDecorator<
                    String>(), // Show labels on the bars
                domainAxis: charts.OrdinalAxisSpec(
                  renderSpec: charts.SmallTickRendererSpec(
                      labelRotation: 45), // Rotate x-axis labels
                ),
                defaultRenderer: charts.BarRendererConfig(
                  strokeWidthPx: 4, // Increase bar width
                ),
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
        ),
      ),
    );
  }

  String _truncateText(String text, int maxWords) {
    final words = text.split(' ');
    if (words.length > maxWords) {
      return words.sublist(0, maxWords).join(' ') + '...';
    }
    return text;
  }
}

class PartidoData {
  final String nombre;
  final int cantidadVotos;

  PartidoData({required this.nombre, required this.cantidadVotos});
}

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
