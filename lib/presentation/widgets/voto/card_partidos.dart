import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class cardpartidos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Group5Widget - INSTANCE
    return Container(
      // androidsmall1h8d (127:210)
      padding: EdgeInsets.fromLTRB(32, 141, 19, 141),
      width: double.infinity,
      height: 640,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 230, 230, 230),
      ),
      child: Container(
        // group5U2u (127:204)
        margin: EdgeInsets.fromLTRB(0, 0, 0, 203),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Container(
            width: double.infinity,
            height: 155,
            child: Container(
              // cardvfb (I127:204;101:246)
              padding: EdgeInsets.fromLTRB(41, 14, 38, 23),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                //border: Border.all(),
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0, 3),
                    blurRadius: 4.5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // pxmovimientomaderadeguerrero01 (I127:204;101:247)
                    margin: EdgeInsets.fromLTRB(0, 0, 13, 5),
                    width: 157,
                    height: 94,
                    child: SizedBox(),
                  ),
                  Text(
                    // movimientomaderadeguerreroLcq (I127:204;101:248)
                    'Movimiento Madera de Guerrero',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
