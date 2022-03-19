import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:easy_school_app/app/modules/models/curso_model.dart';

class Aluno {
  int? codigo;

  String nome;

  List<Curso>? cursos = [];

  Aluno({
    this.codigo,
    required this.nome,
     this.cursos,
  });

  Aluno copyWith({
    int? codigo,
    String? nome,
    List<Curso>? cursos,
  }) {
    return Aluno(
      codigo: codigo ?? this.codigo,
      nome: nome ?? this.nome,
      cursos: cursos ?? this.cursos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'nome': nome,
      //'cursos': cursos.map((x) => x.toMap()).toList(),
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      codigo: map['codigo']?.toInt(),
      nome: map['nome'] ?? '',
      //cursos: List<Curso>.from(map['cursos']?.map((x) => Curso.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Aluno.fromJson(String source) {
    return Aluno.fromMap(json.decode(source));
  }

  @override
  String toString() => 'Aluno(codigo: $codigo, nome: $nome, cursos: $cursos)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Aluno &&
      other.codigo == codigo &&
      other.nome == nome &&
      listEquals(other.cursos, cursos);
  }

  @override
  int get hashCode => codigo.hashCode ^ nome.hashCode ^ cursos.hashCode;
}
