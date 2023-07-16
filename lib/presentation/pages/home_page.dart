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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "¡Bienvenido, nos alegra que estés aquí!",
                style: TextStyle(fontSize: 25),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/perfil');
                },
                child: const CardPerfil(
                  user: "Ramos Mesias Mauro Fabrizio",
                  identification: "0931760900",
                  zone: "Guayaquil",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/list_partidos_politicos');
                },
                child: const CardOptions(
                  title: "Partidos políticos",
                  subTitle: "Conoce tus candidatos",
                  icon: Icons.diversity_3,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/list_partidos_politicos');
                },
                child: const CardOptions(
                  title: "Ejercer mi voto",
                  subTitle: "Una desición importante",
                  icon: Icons.how_to_vote,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/list_partidos_politicos');
                },
                child: const CardOptions(
                  title: "Ver resultados",
                  subTitle: "Mantente informado",
                  icon: Icons.bar_chart,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
