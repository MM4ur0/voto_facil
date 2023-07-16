import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ListadoPartidosPoliticos extends StatefulWidget {
  const ListadoPartidosPoliticos({super.key});

  @override
  State<ListadoPartidosPoliticos> createState() => _PartidosPoliticosState();
}

class _PartidosPoliticosState extends State<ListadoPartidosPoliticos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Partidos politicos"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              ZeroDropdown(onChanged: (value) {}, items: List.empty()),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/partido_politico');
                },
                child: const Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Row(
                      children: [
                        ZeroAvatar.url(
                            "https://play-lh.googleusercontent.com/qbeCduZblOk80GaY164lw47gIRjXq9QIzSmgFwqQj1PyhNhTWxYR0OqPzm8BumnmJQ"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Nombre del partido político",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
