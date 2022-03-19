import 'package:easy_school_app/app/modules/cursos/cursos_store.dart';
import 'package:easy_school_app/app/modules/home/home_Page.dart';
import 'package:easy_school_app/app/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:easy_school_app/app/modules/alunos/alunos_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => AlunosStore()),
    Bind.lazySingleton((i) => CursosStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
