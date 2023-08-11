import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:voto_facil/model/candidatos.dart';
import 'package:voto_facil/model/ideologia.dart';
import 'package:voto_facil/model/partidos_politicos.dart';
import 'package:voto_facil/model/user.dart';

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
          'CREATE TABLE usuario(id INTEGER PRIMARY KEY AUTOINCREMENT, cedula TEXT,nombres TEXT,apellidos TEXT,region TEXT,genero TEXT,fechaN TEXT,correo TEXT, password TEXT, voto INTEGER);');
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
          "('Populismo', '1'), ('Nacionalismo', '1'), ('Marxismo', '1'),"
          "('Socialdemocracia', '1'), ('Socialismo', '1'), ('Centrismo', '1'),"
          "('Progresismo', '2'), ('Antineoliberalismo', '2'), ('Soberanismo', '2'),"
          "('Bolivarianismo', '2'), ('Ecologismo', '2'), ('Progresismo', '2'),"
          "('Progresismo', '3'), ('Antineoliberalismo', '3'), ('Soberanismo', '3'),"
          "('Latinoamericanismo', '3'), ('Antiimperialismo', '3'), ('Socialismo', '3'),"
          "('Neoliberalismo', '4'), ('Conservadurismo', '4'), ('Democracia cristiana', '4'),"
          "('Populismo', '4'), ('Personalismo', '4'), ('Militarismo', '4'),"
          "('Socialdemocracia', '5'), ('Socioliberalismo', '5'), ('Liberalismo económico', '5'),"
          "('Atrapalotodo', '5'), ('Democracia liberal', '5'), ('Ecologismo', '5'),"
          "('Liberalismo', '6'), ('Democracia liberal', '6'), ('Ecologismo', '6'),"
          "('Populismo', '6'), ('Personalismo', '6'), ('Atrapalo todo', '6'),"
          "('Pluralismo', '7'), ('Democracia liberal', '7'), ('Populismo', '7'),"
          "('Progesismo', '7'), ('Personalismo', '7'), ('Soberanismo', '7'),"
          "('Personalismo', '8'), ('Partido atrapalotodo', '8'), ('Liberalismo', '8'),"
          "('Socialismo', '8'), ('Centrismo', '8'), ('Ecologismo', '8');");
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

      db.execute("INSERT INTO usuario(nombres, password) VALUES"
          "('jesus', 'p1'),"
          "('paul', 'p2')");
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
      where: 'idpartido = ?',
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

  static Future<List<Ideologia>> getIdeologia(int id) async {
    Database db = await _openDB();
    final List<Map<String, dynamic>> ideologiaMap = await db.query(
      "ideologia",
      where: 'idpartido = ?',
      whereArgs: [id],
    );
    return List.generate(
        ideologiaMap.length,
        (i) => Ideologia(
              id: ideologiaMap[i]['id'],
              idea: ideologiaMap[i]['idea'],
              idpartido: ideologiaMap[i]['idpartido'],
            ));
  }

  static Future<User?> buscarUsuario(String nombre, String password) async {
    Database db = await _openDB();

    final List<Map<String, dynamic>> maps = await db.query(
      'usuario',
      where: 'nombres = ? AND password = ?',
      whereArgs: [nombre, password],
    );

    if (maps.isNotEmpty) {
      return User(
        id: maps[0]['id'],
        cedula: maps[0]['cedula'],
        nombre: maps[0]['nombres'],
        apellidos: maps[0]['apellidos'],
        correo: maps[0]['correo'],
        password: maps[0]['password'],
        region: maps[0]['region'],
        genero: maps[0]['genero'],
        fechaN: maps[0]['fechaN'],
        voto: maps[0]['voto'],
      );
    }

    return null;
  }

//Guardar Usuario
  static Future<void> insertarUsuario(Map<String, dynamic> usuario) async {
    final Database db = await _openDB();
    await db.insert(
      'usuario',
      usuario,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

//Guardar Voto
  static Future<void> actualizarVoto(int idUsuario, int nuevoVoto) async {
    final Database db = await _openDB();
    await db.update(
      'usuario',
      {'voto': nuevoVoto},
      where: 'id = ?',
      whereArgs: [idUsuario],
    );
  }
}
