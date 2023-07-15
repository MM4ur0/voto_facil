import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const Text("Plan de trabajo"),
            const SizedBox(
              height: 15,
            ),
            const Text("Deja tu calificaicón"),
            const SizedBox(
              height: 15,
            ),
            const ZeroRating(sizeType: ZeroSizeType.large),
            const SizedBox(
              height: 15,
            ),
            ZeroButton.primary(
              buttonSizeType: ZeroSizeType.large,
              buttonRadiusType: ZeroButtonRadiusType.rounded,
              onPressed: () {
                Navigator.pushNamed(context, '/registro');
              },
              child: const Text("Enviar calificación"),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 5),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "10 / 10",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text("Aceptación",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey)),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ZeroButton.primary(
              buttonSizeType: ZeroSizeType.large,
              buttonRadiusType: ZeroButtonRadiusType.rounded,
              onPressed: () {
                Navigator.pushNamed(context, '/registro');
              },
              child: const Text("Ver comentarios"),
            ),
          ],
        ),
      ),
    );
  }
}
