import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

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
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      border: Border.all(color: Colors.green),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 25),
                      child: Text("aceptación"),
                    ))
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
