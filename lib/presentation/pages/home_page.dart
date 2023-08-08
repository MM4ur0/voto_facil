import 'package:flutter/material.dart';
import 'package:voto_facil/presentation/widgets/home/card_options_widget.dart';
import 'package:voto_facil/presentation/widgets/home/card_perfil_widget.dart';
import 'package:zog_ui/zog_ui.dart';

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
          backgroundColor: Color.fromRGBO(24, 144, 255, 1),
          title: const Text("Inicio", style: TextStyle(color: Colors.white)),
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/design/head.png'),
                fit: BoxFit
                    .cover, // Esto ajusta la imagen para que cubra todo el Container
              ),
            ),
            //color: Colors.amber,
            height: 160,
            width: MediaQuery.of(context).size.width,
            /*child: Image.asset(
                          'images/design/footer.png',
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                        )*/
          ),
          SingleChildScrollView(
              child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*const Text(
                  "¡Bienvenido, nos alegra que estés aquí!",
                  style: TextStyle(fontSize: 25),
                ),*/
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
                    Navigator.pushNamed(context, '/voto_home');
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
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/design/footer.png'),
                      fit: BoxFit
                          .fill, // Esto ajusta la imagen para que cubra todo el Container
                    ),
                  ),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          )),
        ]));
  }
}
