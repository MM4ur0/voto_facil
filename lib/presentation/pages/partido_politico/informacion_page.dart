import 'package:flutter/material.dart';
import 'package:zog_ui/components/chip/zero_chip_filled.dart';

class InformacionPage extends StatelessWidget {
  const InformacionPage({super.key});

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
            const Card(
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RowText(
                      title: "Fundación",
                      text: "5 de Abril",
                    ),
                    RowText(
                      title: "Sede",
                      text: "Guayaquil",
                    ),
                    RowText(
                      title: "País",
                      text: "Guayaquil",
                    ),
                    RowText(
                      title: "Posición",
                      text: "Derecha",
                    ),
                    Column(
                      children: [
                        Text("Ideología"),
                        SizedBox(
                          height: 5,
                        ),
                        ZeroChipFilled(
                          label: "ideología",
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ZeroChipFilled(
                          label: "ideología",
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ZeroChipFilled(
                          label: "ideología",
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ZeroChipFilled(
                          label: "ideología",
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ZeroChipFilled(
                          label: "ideología",
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ZeroChipFilled(
                          label: "ideología",
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    )
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

class RowText extends StatefulWidget {
  final String title;
  final String text;
  const RowText({super.key, required this.title, required this.text});

  @override
  State<RowText> createState() => _RowTextState();
}

class _RowTextState extends State<RowText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("${widget.title} :"), Text("${widget.text}.")],
    );
  }
}
