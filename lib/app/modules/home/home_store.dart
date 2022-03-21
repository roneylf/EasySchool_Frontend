import 'package:easy_school_app/app/modules/alunos/aluno_model.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  Pages currentPage = Pages.alunos;
}

enum Pages { alunos, cursos }
