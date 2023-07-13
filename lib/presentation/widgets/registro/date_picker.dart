import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final void Function(String) onDateSelected;
  const DatePicker({super.key, required this.onDateSelected});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: Colors.blue.shade200,
            )),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  const Text(
                    "Fecha de nacimiento: ",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, right: 2, bottom: 2),
                child: Swing(
                  duration: const Duration(seconds: 5),
                  delay: const Duration(seconds: 2),
                  infinite: true,
                  child: IconButton(
                      onPressed: () async {
                        final DateTime? dateTime = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(1930),
                          lastDate: DateTime(2024),
                          helpText: "¿Cuál es tu fecha de nacimiento?",
                          cancelText: "Cancelar",
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                        );

                        if (dateTime != null) {
                          setState(() {
                            selectedDate = dateTime;
                            widget.onDateSelected(
                                '${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}');
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.blue,
                        size: 15,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
