class Candidatos {
  int id;
  String imagen;
  String nombre;
  String cargo;
  String idPartido;

  Candidatos({
    required this.id,
    required this.imagen,
    required this.nombre,
    required this.cargo,
    required this.idPartido,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagen': imagen,
      'nombre': nombre,
      'cargo': cargo,
      'idPartido': idPartido,
    };
  }
}
