import 'package:easy_school_app/app/modules/cursos/cursos_Page.dart';
import 'package:easy_school_app/app/modules/cursos/cursos_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CursosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CursosStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CursosPage()),
  ];
}
