import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:voto_facil/model/candidatos.dart';
import 'package:voto_facil/model/partidos_politicos.dart';

class VotoDataBase {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'voto.db'),
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE partidopolitico(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, imagen TEXT, fundacion TEXT, posicion TEXT, sede TEXT, pais TEXT);');
      db.execute(
          'CREATE TABLE ideologia(id INTEGER PRIMARY KEY AUTOINCREMENT, idea TEXT, idpartido TEXT);');
      db.execute(
          'CREATE TABLE candidato(id INTEGER PRIMARY KEY AUTOINCREMENT, imagen TEXT, nombre TEXT, cargo TEXT, idpartido TEXT);');
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
      db.execute("INSERT INTO ideologia(idea, idpartido) VALUES"
          "('Autonomismo', '1'), ('Liberalismo', '1'), ('Conservadurismo', '1'),"
          "('Atrapalo todo','2'), ('Liberalismo económico', '2'), ('Democracia Liberal', '2'),"
          "('Socila Democracia', '3'), ('SocioLiberalismo', '3'), ('Atrapalo todo', '3'),"
          "('Neoliberalismo', '4'), ('Democracia Cristiana', '4'), ('Conservadurismo social', '4'),"
          "('Indigenismo', '5'), ('Ecologísmo Radical', '5'), ('Plurinacionalismo', '5'),"
          "('Populismo', '6'), ('Personalismo', '6'), ('Atrapalo todo', '6');");
      db.execute(
          "INSERT INTO candidato(imagen, nombre, cargo, idPartido) VALUES"
          "('yaku.jpg', 'Yaku Perez', 'Presidente', '1'),"
          "('nory.jpg', 'Nory Pinela', 'Vicepresidente', '1'),"
          "('noboa.jpg', 'Daniel Noboa Azin', 'Preseidente', '2'),"
          "('veronica.jpg', 'Veronica Abad', 'Vicepresidente', '2'),"
          "('luisa.jpg', 'Luida Gonzales', 'Presidente', '3'),"
          "('arauz.jpg', 'Andres Arauz', 'Vicepresidente', '3'),"
          "('jan.jpg', 'Jan Topic', 'Presidente', '4'),"
          "('diana.jpg', 'Diana Jacome', 'Vicepresidente', '4'),"
          "('otto.jpg', 'Otto Sonnenholzner', 'Presidente', '5'),"
          "('erika.jpg', 'Erika Paredes', 'Vicepresidente', '5'),"
          "('bolivar.jpg', 'Bolivar Armijos', 'Presidente', '6'),"
          "('linda.jpg', 'Linda Romero', 'Vicepresidente', '6'),"
          "('fernando.jpg', 'Fernando Villavicencio', 'Presidente', '7'),"
          "('andrea.jpg', 'Andrea Gonzalez Nader', 'Vicepresidente', '7'),"
          "('xavier.jpg', 'Xavier Hervas', 'Presidente', '8'),"
          "('luz.jpg', 'Luz Marina Vega', 'Vicepresidente', '8')");
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

  static Future<List<Candidatos>> getCandidatos(int id) async {
    Database db = await _openDB();
    final List<Map<String, dynamic>> canditatosMap = await db.query(
      "candidato",
      where: 'idPartido = ?',
      whereArgs: [id],
    );
    return List.generate(
        canditatosMap.length,
        (i) => Candidatos(
              id: canditatosMap[i]['id'],
              imagen: canditatosMap[i]['imagen'],
              nombre: canditatosMap[i]['nombre'],
              cargo: canditatosMap[i]['cargo'],
              idPartido: canditatosMap[i]['idpartido'],
            ));
  }
}
