import 'dart:convert';

class Nota {
  int? id;
  String? titulo;
  String? value;
  String? weight;
  DateTime data;
  String? category;

  Nota({
    this.id,
    this.titulo,
    this.value,
    this.weight,
    required this.data,
    this.category,
  });

  String get loadDateString =>
      '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}';


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'value': value,
      'weight': weight,
      'data': data,
      'category': category,
    };
  }

  static Nota? fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Nota(
      id: map['id'],
      titulo: map['titulo'],
      value: map['value'],
      weight: map['weight'],
      data: DateTime.fromMillisecondsSinceEpoch(map['data']),
      category: map['category'],
    );
  }

  String toJson() => json.encode(toMap());

  static Nota? fromJson(String source) => fromMap(json.decode(source));

  Nota copyWith({
    int? id,
    String? titulo,
    String? value,
    String? weight,
    DateTime? data,
    String? category,
  }) {
    return Nota(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      value: value ?? this.value,
      weight: weight ?? this.weight,
      data: data ?? this.data,
      category: category ?? this.category,
    );
  }

  @override
  String toString() {
    return 'Nota(id: $id, titulo: $titulo, nota: ($value) * $weight, data: $data, category: $category)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Nota &&
        o.id == id &&
        o.titulo == titulo &&
        o.value == value &&
        o.weight == weight &&
        o.data == data &&
        o.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    titulo.hashCode ^
    value.hashCode ^
    weight.hashCode ^
    data.hashCode ^
    category.hashCode;
  }
}