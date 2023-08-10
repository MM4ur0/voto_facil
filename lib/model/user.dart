class User {
  //INTEGER PRIMARY KEY AUTOINCREMENT, cedula TEXT,nombres TEXT,apellidos TEXT,region TEXT,genero TEXT,fechaN TEXT,correo TEXT, password TEXT, voto INTEGER);
  int id;
  String? cedula;
  String password;
  String nombre;
  String? apellidos;
  String? region;
  String? genero;
  String? fechaN;
  String? correo;
  int? voto;

  User(
      {required this.id,
      required this.cedula,
      required this.password,
      required this.nombre,
      required this.apellidos,
      required this.region,
      required this.genero,
      required this.fechaN,
      required this.correo,
      required this.voto});

  static User? _instance;

  static User get instance {
    if (_instance == null) {
      throw Exception("User instance has not been initialized.");
    }
    return _instance!;
  }

  static setInstance(User user) {
    _instance = user;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'password': password,
    };
  }
}
