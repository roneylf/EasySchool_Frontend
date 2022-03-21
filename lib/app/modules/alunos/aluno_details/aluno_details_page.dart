import 'package:easy_school_app/app/modules/alunos/aluno_details/aluno_detail_store.dart';
import 'package:easy_school_app/app/modules/cursos/cursos_store.dart';
import 'package:easy_school_app/app/modules/alunos/aluno_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../cursos/curso_model.dart';

class AlunosPageDetails extends StatefulWidget {
  AlunosPageDetails({Key? key, required this.aluno}) : super(key: key);

  final Aluno aluno;

  @override
  State<AlunosPageDetails> createState() => _AlunosPageDetailsState();
}

class _AlunosPageDetailsState extends State<AlunosPageDetails> {
  Aluno aluno = Aluno(nome: '');

  final store = Modular.get<AlunoDetailsStore>();

  final InputDecoration _inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(25.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(25.0),
    ),
    prefixIcon: Icon(
      Icons.people,
      color: Colors.grey.shade400,
      size: 10,
    ),
  );

  @override
  void initState() {
    aluno = widget.aluno;
    store.getCursos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: aluno.codigo != null
              ? Text('Aluno ${aluno.codigo}')
              : Text('Novo Aluno'),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: _inputDecoration.copyWith(labelText: "Nome"),
                onChanged: (value) {
                  setState(() {
                    aluno.nome = value;
                  });
                },
              ),
            )),
            Expanded(
                flex: 4,
                child: SelectCursos(
                  store: store,
                  aluno: aluno,
                )),
            Flexible(
                child: Container(
              child: Row(children: [MaterialButton(onPressed: (){
                store.postAluno(aluno);
              })],)
            ))
          ],
        ));
  }
}

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
