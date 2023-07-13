import 'dart:async';

import 'package:flutter/material.dart';

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
      body: Center(
        child: Card(
          // clipBehavior is necessary because, without it, the InkWell's animation
          // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
          // This comes with a small performance cost, and you should not set [clipBehavior]
          // unless you need it.
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Timer(const Duration(milliseconds: 550), () {
                Navigator.pushNamed(context, '/partido_politico');
                setState(() {});
              });
            },
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Text('Partido politico'),
            ),
          ),
        ),
      ),
    );
  }
}
