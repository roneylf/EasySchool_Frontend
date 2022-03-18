import 'dart:convert';

class Curso {
  int? codigo;

  String descricao;

  String ementa;

  Curso({
    this.codigo,
    required this.descricao,
    required this.ementa,
  });

  Curso copyWith({
    int? codigo,
    String? descricao,
    String? ementa,
  }) {
    return Curso(
      codigo: codigo ?? this.codigo,
      descricao: descricao ?? this.descricao,
      ementa: ementa ?? this.ementa,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'descricao': descricao,
      'ementa': ementa,
    };
  }

  factory Curso.fromMap(Map<String, dynamic> map) {
    return Curso(
      codigo: map['codigo']?.toInt(),
      descricao: map['descricao'] ?? '',
      ementa: map['ementa'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Curso.fromJson(String source) => Curso.fromMap(json.decode(source));

  @override
  String toString() =>
      'Curso(codigo: $codigo, descricao: $descricao, ementa: $ementa)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Curso &&
        other.codigo == codigo &&
        other.descricao == descricao &&
        other.ementa == ementa;
  }

  @override
  int get hashCode => codigo.hashCode ^ descricao.hashCode ^ ementa.hashCode;
}
