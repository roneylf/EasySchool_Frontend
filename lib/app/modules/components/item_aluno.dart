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
        //height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text("Código: ${aluno.codigo ?? "Não informado"}"),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text("Nome:   " + aluno.nome),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Wrap(children: [
                  if (aluno.cursos.isEmpty)
                    tipCurso(
                      curso: Curso(descricao: "Sem cursos", ementa: ""),
                    ),
                  for (final curso in aluno.cursos)
                    tipCurso(
                      curso: curso,
                    )
                ]),
              )
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
      height: 20,
      width: curso.descricao.characters.length * 8.0,
      decoration: BoxDecoration(
      color: Colors.cyan.withOpacity(0.1),
        
          border: Border.all(
            color: Colors.cyan,
            width: 1,
          ),
          
          borderRadius: BorderRadius.circular(10), ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Center(child: Text(curso.descricao, style: TextStyle(fontSize: 8))),
      ),
    );
  }
}
