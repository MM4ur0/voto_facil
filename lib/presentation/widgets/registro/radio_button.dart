import 'package:flutter/material.dart';

enum SingingCharacter { masculino, femenino }

class RadioButton extends StatefulWidget {
  final void Function(String) onGenderSelected;
  const RadioButton({Key? key, required this.onGenderSelected})
      : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  SingingCharacter? _character = SingingCharacter.masculino;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          width: 160,
          child: ListTile(
            horizontalTitleGap: -10,
            title: const Text('Masculino'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.masculino,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                  widget.onGenderSelected('Masculino');
                });
              },
            ),
          ),
        ),
        SizedBox(
          width: 160,
          child: ListTile(
            horizontalTitleGap: -10,
            title: const Text('Femenino'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.femenino,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                  widget.onGenderSelected("Femenino");
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
