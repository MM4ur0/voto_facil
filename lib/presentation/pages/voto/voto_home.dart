import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:zog_ui/zog_ui.dart';

class votohomePage extends StatefulWidget {
  const votohomePage({Key? key}) : super(key: key);

  @override
  State<votohomePage> createState() => _votohomePageState();
}

class _votohomePageState extends State<votohomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: ZeroColors.primary,
        title: const Text(
          'Ejercer mi Voto',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: 200.3,
        color: Colors.amber,
        // Ajusta el ancho según tus necesidades
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 75),
            const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(ZeroIcons.exclamationCircle),
                  Text('ATENCIÓN'),
                ]),
            const SizedBox(height: 16),
            SlideInDown(
                duration: Duration(milliseconds: 700),
                child: Text("Voto es Obligatorio para:7")),
            ZeroButton.primary(
              buttonSizeType: ZeroSizeType.large,
              buttonRadiusType: ZeroButtonRadiusType.rounded,
              onPressed: () {
                Navigator.pushNamed(context, '');
              },
              child: const Text("Votar"),
            ),
          ],
        ),
      ),
    );
  }
}
