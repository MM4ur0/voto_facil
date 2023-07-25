class PartidosPoliticos {
  int id;
  String nombre;
  String imagen;
  String fundacion;
  String posicion;
  String sede;
  String pais;

  PartidosPoliticos({
    required this.id,
    required this.nombre,
    required this.imagen,
    required this.fundacion,
    required this.posicion,
    required this.sede,
    required this.pais,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'imagen': imagen,
      'fundacion': fundacion,
      'posicion': posicion,
      'sede': sede,
      'pais': pais
    };
  }
}
