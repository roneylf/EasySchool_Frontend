import 'package:easy_school_app/app/modules/components/item_aluno.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:easy_school_app/app/modules/alunos/alunos_store.dart';
import 'package:flutter/material.dart';

class AlunosPage extends StatefulWidget {
  final String title;
  const AlunosPage({Key? key, this.title = 'AlunosPage'}) : super(key: key);
  @override
  AlunosPageState createState() => AlunosPageState();
}

class AlunosPageState extends State<AlunosPage> {
  final AlunosStore store = Modular.get();

  @override
  void initState() {
    store.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: store.alunos.length,
          itemBuilder: (context, index) {
            return ItemAluno(aluno: store.alunos[index]);
          },
        );
      }),
    );
  }
}
