import 'package:flutter/material.dart';
import 'package:voto_facil/presentation/pages/partido_politico/candidatos_page.dart';
import 'package:voto_facil/presentation/pages/partido_politico/informacion_page.dart';
import 'package:voto_facil/presentation/pages/partido_politico/plan_page.dart';
import 'package:zog_ui/zog_ui.dart';

class PartidoPolitico extends StatefulWidget {
  const PartidoPolitico({super.key});

  @override
  State<PartidoPolitico> createState() => _PartidoPoliticoState();
}

class _PartidoPoliticoState extends State<PartidoPolitico> {
  late String partidoId;
  int _paginaActual = 0;

  @override
  Widget build(BuildContext context) {
    partidoId = ModalRoute.of(context)?.settings.arguments as String;

    final List<Widget> paginas = [
      InformacionPage(partidoId: partidoId),
      CandidatosPage(partidoId: partidoId),
      PlanPage(partidoId: partidoId),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Partido político",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ZeroColors.primary,
      ),
      body: paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.badge), label: "Info. Partido"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Candidatos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.group), label: "Plan de trabajo")
        ],
      ),
    );
  }
}
