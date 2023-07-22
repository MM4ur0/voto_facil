import 'package:flutter/material.dart';

class CardOptions extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;

  const CardOptions({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue,
          child: SizedBox(
            width: 340,
            height: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                  child: Icon(icon, size: 75),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      subTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
