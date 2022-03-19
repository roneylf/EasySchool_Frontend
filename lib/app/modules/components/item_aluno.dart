import 'package:flutter/material.dart';

import '../models/aluno_model.dart';
import '../models/curso_model.dart';

class ItemAluno extends StatelessWidget {
  const ItemAluno({Key? key, required this.aluno}) : super(key: key);

  final Aluno aluno;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white10),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Código: ${aluno.codigo ?? "Não informado"}"),
              Text("Nome: " + aluno.nome),
              Wrap(children: [
                for (final curso in aluno.cursos)
                  tipCurso(
                    curso: curso,
                  )
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class tipCurso extends StatelessWidget {
  const tipCurso({Key? key, required this.curso}) : super(key: key);

  final Curso curso;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white10),
      child: Column(
        children: [
          Text("Nome:" + curso.descricao),
        ],
      ),
    );
  }
}
