import 'package:flutter/material.dart';

class CandidatosPage extends StatelessWidget {
  const CandidatosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          right: 15,
          bottom: 15,
          left: 15,
        ),
        child: Column(
          children: [
            const Text(
              "Nombre del partido político",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(height: 150, color: Colors.blue),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
