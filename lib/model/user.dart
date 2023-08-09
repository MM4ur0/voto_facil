class User {
  int id;
  String password;
  String nombre;

  User({
    required this.id,
    required this.password,
    required this.nombre,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'password': password,
    };
  }
}
