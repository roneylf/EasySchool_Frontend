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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
