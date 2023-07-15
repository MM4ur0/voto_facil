import 'package:flutter/material.dart';
import 'package:zog_ui/components/chip/zero_chip_filled.dart';

class InformacionPage extends StatelessWidget {
  const InformacionPage({super.key});

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
            const Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RowInformacion(
                      title: "Fundación",
                      text: "5 de Abril",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RowInformacion(
                      title: "Sede",
                      text: "Guayaquil",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RowInformacion(
                      title: "País",
                      text: "Guayaquil",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RowInformacion(
                      title: "Posición",
                      text: "Derecha",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Ideología",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                ZeroChipFilled(
                                  label: "ideología",
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                ZeroChipFilled(
                                  label: "ideología",
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                ZeroChipFilled(
                                  label: "ideología",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                ZeroChipFilled(
                                  label: "ideología",
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                ZeroChipFilled(
                                  label: "ideología",
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                ZeroChipFilled(
                                  label: "ideología",
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RowInformacion extends StatefulWidget {
  final String title;
  final String text;
  const RowInformacion({super.key, required this.title, required this.text});

  @override
  State<RowInformacion> createState() => _RowInformacionState();
}

class _RowInformacionState extends State<RowInformacion> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${widget.title}: ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          "${widget.text}.",
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
