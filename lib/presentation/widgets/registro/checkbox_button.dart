import 'package:flutter/material.dart';

class CheckboxButton extends StatefulWidget {
  final void Function(bool) onCheckBoxPressed;
  const CheckboxButton({super.key, required this.onCheckBoxPressed});

  @override
  State<CheckboxButton> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.white;
    }

    return Checkbox(
      checkColor: Colors.green,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
        widget.onCheckBoxPressed(isChecked);
      },
    );
  }
}
