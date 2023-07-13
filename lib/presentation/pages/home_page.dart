import 'dart:async';

import 'package:flutter/material.dart';
import 'package:voto_facil/presentation/widgets/home/card_options_widget.dart';
import 'package:voto_facil/presentation/widgets/home/card_perfil_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: const Text(
                "¡Bienvenido, nos alegra que estés aquí!",
                style: TextStyle(fontSize: 25),
              ),
            ),
            CardPerfil(
              user: "Ramos Mesias Mauro Fabrizio",
              identification: "0931760900",
              zone: "Guayaquil",
              onTap: () {
                Timer(const Duration(milliseconds: 550), () {
                  Navigator.pushNamed(context, '/perfil');
                  setState(() {});
                });
              },
            ),
            CardOptions(
                title: "Partidos políticos",
                subTitle: "Conoce tus candidatos",
                icon: Icons.diversity_3,
                onTap: () {
                  Timer(const Duration(milliseconds: 550), () {
                    Navigator.pushNamed(context, '/list_partidos_politicos');
                    setState(() {});
                  });
                }),
            CardOptions(
                title: "Ejercer mi voto",
                subTitle: "Una desición importante",
                icon: Icons.how_to_vote,
                onTap: () {
                  Timer(const Duration(milliseconds: 550), () {
                    Navigator.pushNamed(context, '/list_partidos_politicos');
                    setState(() {});
                  });
                }),
            CardOptions(
                title: "Ver resultados",
                subTitle: "Mantente informado",
                icon: Icons.bar_chart,
                onTap: () {
                  Timer(const Duration(milliseconds: 550), () {
                    Navigator.pushNamed(context, '/list_partidos_politicos');
                    setState(() {});
                  });
                }),
          ],
        ),
      ),
    );
  }
}
