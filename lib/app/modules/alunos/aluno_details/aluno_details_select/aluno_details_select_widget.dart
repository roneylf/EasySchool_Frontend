import 'package:easy_school_app/app/modules/alunos/aluno_details/aluno_detail_store.dart';
import 'package:easy_school_app/app/modules/alunos/aluno_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SelectCursos extends StatefulWidget {
  SelectCursos({Key? key, required this.store, required this.aluno})
      : super(key: key);

  final AlunoDetailsStore store;
  final Aluno aluno;
  @override
  State<SelectCursos> createState() => _SelectCursosState();
}

class _SelectCursosState extends State<SelectCursos> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: widget.store.cursos.length,
        itemBuilder: (context, index) {
          final curso = widget.store.cursos[index];
          return Observer(builder: (_) {
            return CheckboxListTile(
              title: Text(curso.curso.descricao),
              value: widget.store.cursos[index].selected,
              onChanged: (value) {
                widget.store.selectCurso(curso, widget.aluno);
              },
            );
          });
        },
      );
    });
  }
}