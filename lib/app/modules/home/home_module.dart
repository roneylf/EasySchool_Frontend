import 'package:easy_school_app/app/modules/alunos/aluno_details/aluno_detail_store.dart';
import 'package:easy_school_app/app/modules/alunos/aluno_details/aluno_details_page.dart';
import 'package:easy_school_app/app/modules/alunos/alunos_module.dart';
import 'package:easy_school_app/app/modules/cursos/cursos_store.dart';
import 'package:easy_school_app/app/modules/home/home_Page.dart';
import 'package:easy_school_app/app/modules/home/home_store.dart';
import 'package:easy_school_app/app/modules/alunos/aluno_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:easy_school_app/app/modules/alunos/alunos_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => AlunosStore()),
    Bind.lazySingleton((i) => CursosStore()),
    Bind.lazySingleton((i) => AlunoDetailsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => AlunosPageDetails(
              aluno: Aluno(nome: ''),
            )),
    ModuleRoute("/alunos", module: AlunosModule()),
  ];
}
