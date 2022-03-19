import 'dart:convert';

import 'package:easy_school_app/app/modules/models/aluno_model.dart';
import 'package:easy_school_app/app/modules/models/curso_model.dart';

class CursoAluno {
  Aluno aluno;

  Curso curso;

  CursoAluno({
    required this.aluno,
    required this.curso,
  });

  CursoAluno copyWith({
    Aluno? aluno,
    Curso? curso,
  }) {
    return CursoAluno(
      aluno: aluno ?? this.aluno,
      curso: curso ?? this.curso,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aluno': aluno.toMap(),
      'curso': curso.toMap(),
    };
  }

  factory CursoAluno.fromMap(Map<String, dynamic> map) {
    return CursoAluno(
      aluno: Aluno.fromMap(map['aluno']),
      curso: Curso.fromMap(map['curso']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CursoAluno.fromJson(String source) => CursoAluno.fromMap(json.decode(source));

  @override
  String toString() => 'CursoAluno(aluno: $aluno, curso: $curso)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CursoAluno &&
      other.aluno == aluno &&
      other.curso == curso;
  }

  @override
  int get hashCode => aluno.hashCode ^ curso.hashCode;
}
