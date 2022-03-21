import 'package:easy_school_app/app/modules/alunos/aluno_details/aluno_detail_store.dart';
import 'package:easy_school_app/app/modules/alunos/aluno_details/aluno_details_page.dart';
import 'package:easy_school_app/app/modules/alunos/alunos_Page.dart';
import 'package:easy_school_app/app/modules/alunos/alunos_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AlunosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AlunosStore()),
    Bind.lazySingleton((i) => AlunoDetailsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AlunosPage()),
      ChildRoute('/details', child: (_, args) => AlunosPageDetails(aluno: args.data)),
      
    
    
  ];
}
