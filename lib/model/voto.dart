class Voto {
  final int id;
  final int idPartido;
  final int idUsuario;

  Voto({
    required this.id,
    required this.idPartido,
    required this.idUsuario,
  });

Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idPartido':idPartido,
      'idUsuario': idUsuario,
    };
  }
}