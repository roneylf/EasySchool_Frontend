import 'package:easy_school_app/app/modules/alunos/alunos_page.dart';
import 'package:easy_school_app/app/modules/home/navbar.dart';
import 'package:easy_school_app/app/modules/cursos/cursos_page.dart';
import 'package:easy_school_app/app/modules/home/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'EasySchool'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        if (store.currentPage == Pages.cursos) {
          return CursosPage();
        }
        return AlunosPage();
      }),
      bottomNavigationBar: Observer(builder: (_) {
        return Navbar(buttons: [
          ItemNavbar(
            text: 'Alunos',
            icon: Icons.people,
            selected: store.currentPage == Pages.alunos,
            onPressed: () {
              store.currentPage = Pages.alunos;
            },
          ),
          ItemNavbar(
            text: 'Cursos',
            icon: Icons.book,
            selected: store.currentPage == Pages.cursos,
            onPressed: () {
              store.currentPage = Pages.cursos;
            },
          ),
        ]);
      }),
    );
  }
}
