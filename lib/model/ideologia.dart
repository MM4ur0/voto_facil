class Ideologia {
  int id;
  String idea;
  String idpartido;

  Ideologia({
    required this.id,
    required this.idea,
    required this.idpartido,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idea': idea,
      'idpartido': idpartido,
    };
  }
}
