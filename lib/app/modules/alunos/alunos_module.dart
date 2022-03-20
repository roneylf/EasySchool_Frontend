import 'package:easy_school_app/app/modules/alunos/alunos_Page.dart';
import 'package:easy_school_app/app/modules/alunos/alunos_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AlunosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AlunosStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AlunosPage()),
    
  ];
}
