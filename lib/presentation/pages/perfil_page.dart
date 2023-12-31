import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:voto_facil/model/user.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    User userDB = User.instance;
    bool vvisible = false;
    if (userDB.voto != null) {
      if (userDB.voto == 1) {
        vvisible = true;
      }
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF1890FF),
        title: const Text(
          'Perfil',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Aquí puedes manejar la selección de elementos del menú
              if (value == 'opcion1') {
                Navigator.pushReplacementNamed(context, "/");
              } else if (value == 'opcion2') {
                // Realizar acción para la opción 2
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'opcion1',
                child: Text('Cerrar Sesión'),
              ),
              /*PopupMenuItem<String>(
                value: 'opcion2',
                child: Text('Opción 2'),
              ),*/
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/design/perfilheader.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(150, 0, 113, 22),
                  padding: EdgeInsets.fromLTRB(21, 20, 20, 20),
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Center(
                    // accountcirclemNF (145:174)
                    child: SizedBox(
                      width: 61,
                      height: 62,
                      child: Icon(size: 55, Icons.account_circle_rounded),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 21, 9, 57),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: 60,
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(0, 10, 7, 8),
                              child: Center(
                                  child: Text(
                                userDB.nombre +
                                    "  " +
                                    (userDB.apellidos ?? '---------'),
                                style: GoogleFonts.inter(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2125,
                                  color: Color(0xff000000),
                                ),
                              )),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 160, 160, 160)),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
                              width: double.infinity,
                              height: 47,
                              child: Center(
                                child: Text(
                                  "Cedula : " + (userDB.cedula ?? '00000000'),
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              // correogmailcomYZM (145:190)
                              margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: Center(
                                child: Text(
                                  userDB.correo ?? '---------',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 160, 160, 160)),
                                  bottom: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 160, 160, 160)),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              // correogmailcomYZM (145:190)
                              margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: Center(
                                  child: Text(
                                "Genero : " + (userDB.genero ?? '00000000'),
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125,
                                  color: Color(0xff000000),
                                ),
                              )),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              // correogmailcomYZM (145:190)
                              margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: Center(
                                  child: Text(
                                "Región : " + (userDB.region ?? '00000000'),
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125,
                                  color: Color(0xff000000),
                                ),
                              )),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 160, 160, 160)),
                                  bottom: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 160, 160, 160)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: vvisible,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(26, 39, 25, 51),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 27, 141, 235),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(1, 0, 0, 14),
                                  child: Text(
                                    'Certificado virtual Temporal',
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      height: 1.2125,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(45, 16, 26, 11),
                                  width: 300,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3f000000),
                                        offset: Offset(0, 4),
                                        blurRadius: 5.5,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 10, 5),
                                        width: 186,
                                        height: 160,
                                        child: Icon(size: 122, Icons.qr_code),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 20),
                                        child: Text(
                                          'Este certificado acredita que Sufrago ',
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2125,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // codigoqrdevalidacino1R (145:180)
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 18, 0),
                                        child: Text(
                                          'Codigo QR de validación',
                                          style: GoogleFonts.inter(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2125,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
