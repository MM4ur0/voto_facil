import 'dart:async';
import 'package:flutter/material.dart';

class MyTimerWidget extends StatefulWidget {
  @override
  _MyTimerWidgetState createState() => _MyTimerWidgetState();
}

class _MyTimerWidgetState extends State<MyTimerWidget> {
  int _secondsRemaining = 300; // 5 minutos (5 * 60 segundos)
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          Navigator.pop(context);
          // Aquí puedes mostrar un mensaje flotante o realizar otra acción al finalizar el contador.
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;

    return Text(
      '$minutes:${seconds.toString().padLeft(2, '0')}' + " min",
      style: TextStyle(fontSize: 24),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

// Uso del widget
// En tu pantalla, puedes usar el contador así:
// MyTimerWidget()
