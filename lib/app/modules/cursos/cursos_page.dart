import 'package:flutter_modular/flutter_modular.dart';
import 'package:easy_school_app/app/modules/cursos/cursos_store.dart';
import 'package:flutter/material.dart';

class CursosPage extends StatefulWidget {
  final String title;
  const CursosPage({Key? key, this.title = 'CursosPage'}) : super(key: key);
  @override
  CursosPageState createState() => CursosPageState();
}

class CursosPageState extends State<CursosPage> {
  final CursosStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
