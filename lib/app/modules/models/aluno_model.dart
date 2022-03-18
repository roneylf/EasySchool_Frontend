import 'dart:convert';

class Aluno {
  int? codigo;

  String nome;

  Aluno({
    this.codigo,
    required this.nome,
  });

  Aluno copyWith({
    int? codigo,
    String? nome,
  }) {
    return Aluno(
      codigo: codigo ?? this.codigo,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'nome': nome,
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      codigo: map['codigo']?.toInt(),
      nome: map['nome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Aluno.fromJson(String source) => Aluno.fromMap(json.decode(source));

  @override
  String toString() => 'Aluno(codigo: $codigo, nome: $nome)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Aluno && other.codigo == codigo && other.nome == nome;
  }

  @override
  int get hashCode => codigo.hashCode ^ nome.hashCode;
}
