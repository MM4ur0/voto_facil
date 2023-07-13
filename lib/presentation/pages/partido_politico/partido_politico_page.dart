import 'package:flutter/material.dart';
import 'package:voto_facil/presentation/pages/partido_politico/candidatos_page.dart';
import 'package:voto_facil/presentation/pages/partido_politico/informacion_page.dart';
import 'package:voto_facil/presentation/pages/partido_politico/plan_page.dart';

class PartidoPolitico extends StatefulWidget {
  const PartidoPolitico({super.key});

  @override
  State<PartidoPolitico> createState() => _PartidoPoliticoState();
}

class _PartidoPoliticoState extends State<PartidoPolitico> {
  int _paginaActual = 0;
  final List<Widget> _paginas = [
    const InformacionPage(),
    const CandidatosPage(),
    const PlanPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("Nombre partido politico seleccionado"),
      ),
      body: _paginas[_paginaActual],
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
