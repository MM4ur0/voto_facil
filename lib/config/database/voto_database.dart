import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:voto_facil/model/partidos_politicos.dart';

class VotoDataBase {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'voto.db'),
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE partidopolitico(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, imagen TEXT, fundacion TEXT, posicion TEXT, sede TEXT, pais TEXT);');

      db.execute(
          "INSERT INTO partidopolitico(nombre, imagen, fundacion, posicion, sede, pais) VALUES "
          "('CLARO QUE SE PUEDE','claro.jpg','15 de Mayo de 2012','Derecha', 'Quito','Ecuador'),"
          "('ACCIÓN DEMOCRÁTICA NACIONAL, ADN','adn.jpg','8 de Marzo de 2012','Derecha', 'Guayaquil','Ecuador'),"
          "('MOVIMIENTO POLÍTICO REVOLUCIÓN CIUDADANA','rc5.jpg','5 de Abril de 2022','Derecha', 'Guayaquil','Ecuador'),"
          "('ALIANZA POR UN PAÍS SIN MIEDO','psc.jpg','13 de Noviembre de 1951','Centro', 'Guayaquil','Ecuador'),"
          "('ACTUEMOS','actuemos.jpg','8 de Marzo de 2012','Centro', 'Guayaquil','Ecuador'),"
          "('MOVIMIENTO AMIGO, ACCIÓN MOVILIZADORA INDEPENDIENTE GENERANDO OPORTUNIDADES','amigo.jpg','8 de Marzo de 2023','Izquierda', 'Quito','Ecuador'),"
          "('MOVIMIENTO CONSTRUYE','construye.jpg','1 de Noviembre de 1995','Izquierda', 'Quito','Ecuador'),"
          "('MOVIMIENTO RENOVACIÓN TOTAL, RETO','reto.jpg','4 de Marzo de 2002','Izquierda', 'Quito','Ecuador')");
    }, version: 1);
  }

  static Future<List<PartidosPoliticos>> partidos() async {
    Database db = await _openDB();
    final List<Map<String, dynamic>> partidosMap =
        await db.query("partidopolitico");
    return List.generate(
        partidosMap.length,
        (i) => PartidosPoliticos(
              id: partidosMap[i]['id'],
              nombre: partidosMap[i]['nombre'],
              imagen: partidosMap[i]['imagen'],
              fundacion: partidosMap[i]['fundacion'],
              posicion: partidosMap[i]['posicion'],
              sede: partidosMap[i]['sede'],
              pais: partidosMap[i]['pais'],
            ));
  }

  static Future<PartidosPoliticos?> getPartidoPorId(int id) async {
    Database db = await _openDB();
    final List<Map<String, dynamic>> partidosMap = await db.query(
      "partidopolitico",
      where: "id = ?",
      whereArgs: [id],
    );

    return PartidosPoliticos(
      id: partidosMap[0]['id'],
      nombre: partidosMap[0]['nombre'],
      imagen: partidosMap[0]['imagen'],
      fundacion: partidosMap[0]['fundacion'],
      posicion: partidosMap[0]['posicion'],
      sede: partidosMap[0]['sede'],
      pais: partidosMap[0]['pais'],
    );
  }
}
