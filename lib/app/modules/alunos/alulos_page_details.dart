import 'package:easy_school_app/app/modules/models/aluno_model.dart';
import 'package:flutter/material.dart';

class AlunosPageDetails extends StatefulWidget {
  AlunosPageDetails({Key? key, required this.aluno}) : super(key: key);

  final Aluno aluno;

  @override
  State<AlunosPageDetails> createState() => _AlunosPageDetailsState();
}

class _AlunosPageDetailsState extends State<AlunosPageDetails> {

  Aluno aluno = Aluno(nome: '');

  @override
  void initState() {
    aluno = widget.aluno;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}