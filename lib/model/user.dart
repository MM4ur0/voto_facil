class User {
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

  void actualizarVoto(int nuevoVoto) {
    voto = nuevoVoto;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'password': password,
    };
  }
}
