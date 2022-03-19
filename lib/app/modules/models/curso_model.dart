import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:easy_school_app/app/modules/models/aluno_model.dart';

class Curso {
  int? codigo;

  String descricao;

  String ementa;

  List<Aluno> alunos = [];

  Curso({
    this.codigo,
    required this.descricao,
    required this.ementa,
    required this.alunos,
  });

  Curso copyWith({
    int? codigo,
    String? descricao,
    String? ementa,
    List<Aluno>? alunos,
  }) {
    return Curso(
      codigo: codigo ?? this.codigo,
      descricao: descricao ?? this.descricao,
      ementa: ementa ?? this.ementa,
      alunos: alunos ?? this.alunos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'descricao': descricao,
      'ementa': ementa,
      'alunos': alunos.map((x) => x.toMap()).toList(),
    };
  }

  factory Curso.fromMap(Map<String, dynamic> map) {
    return Curso(
      codigo: map['codigo']?.toInt(),
      descricao: map['descricao'] ?? '',
      ementa: map['ementa'] ?? '',
      alunos: List<Aluno>.from(map['alunos']?.map((x) => Aluno.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Curso.fromJson(String source) => Curso.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Curso(codigo: $codigo, descricao: $descricao, ementa: $ementa, alunos: $alunos)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Curso &&
      other.codigo == codigo &&
      other.descricao == descricao &&
      other.ementa == ementa &&
      listEquals(other.alunos, alunos);
  }

  @override
  int get hashCode {
    return codigo.hashCode ^
      descricao.hashCode ^
      ementa.hashCode ^
      alunos.hashCode;
  }
}
