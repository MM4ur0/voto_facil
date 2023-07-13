import 'package:flutter/material.dart';

class CardPerfil extends StatelessWidget {
  final String user;
  final String identification;
  final String zone;
  final GestureTapCallback onTap;

  const CardPerfil({
    super.key,
    required this.user,
    required this.identification,
    required this.zone,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      child: Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue,
          onTap: onTap,
          child: SizedBox(
            width: 370,
            height: 150,
            child: Row(children: [
              const Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                child: CircleAvatar(radius: 50),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      user,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      identification,
                      style: const TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                  ),
                  Center(
                    child: Text(
                      zone,
                      style: const TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
