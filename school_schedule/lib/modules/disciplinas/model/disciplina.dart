import 'dart:convert';

class Disciplina {
  String? id;
  String? userId;
  String? nomeDisciplina;
  String? nomeProfessor;
  int? numeroDeFaltas;
  String? sala;

  Disciplina({
    this.id,
    this.userId,
    this.nomeDisciplina,
    this.nomeProfessor,
    this.numeroDeFaltas,
    this.sala,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': userId,
      'nomeDisciplina': nomeDisciplina,
      'nomeProfessor': nomeDisciplina,
      'numeroDeFaltas': numeroDeFaltas,
      'sala': sala,
    };
  }

  static Disciplina? fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Disciplina(
      userId: map['id'],
      nomeDisciplina: map['nomeDisciplina'],
      nomeProfessor: map['nomeProfessor'],
      numeroDeFaltas: map['numeroDeFaltas'],
      sala: map['sala'],
    );
  }

  String toJson() => json.encode(toMap());

  static Disciplina? fromJson(String source) => fromMap(json.decode(source));

  Disciplina copyWith({
    String? id,
    String? nomeDisciplina,
    String? nomeProfessor,
    int? numeroDeFaltas,
    String? sala,
  }) {
    return Disciplina(
      userId: id ?? userId,
      nomeDisciplina: nomeDisciplina ?? this.nomeDisciplina,
      nomeProfessor: nomeProfessor ?? this.nomeProfessor,
      numeroDeFaltas: numeroDeFaltas ?? this.numeroDeFaltas,
      sala: sala ?? this.sala,
    );
  }

  // @override
  // String toString() {
  //   return 'Disciplina(id: $id, titulo: $titulo, nota: ($value) * $weight, data: $data, category: $category)';
  // }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Disciplina &&
        o.userId == userId &&
        o.nomeDisciplina == nomeDisciplina &&
        o.nomeProfessor == nomeProfessor &&
        o.numeroDeFaltas == numeroDeFaltas &&
        o.sala == sala;
  }

  @override
  int get hashCode {
    return
    userId.hashCode ^
    nomeDisciplina.hashCode ^
    nomeProfessor.hashCode ^
    numeroDeFaltas.hashCode ^
    sala.hashCode;
  }
}