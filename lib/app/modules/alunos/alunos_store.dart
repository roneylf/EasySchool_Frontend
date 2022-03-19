import 'package:easy_school_app/app/modules/models/aluno_model.dart';
import 'package:easy_school_app/app/modules/services/alunos_request.dart';
import 'package:mobx/mobx.dart';

part 'alunos_store.g.dart';

class AlunosStore = _AlunosStoreBase with _$AlunosStore;

abstract class _AlunosStoreBase with Store {
  final AlunosRequest alunosRequest = AlunosRequest();

  @observable
  ObservableList<Aluno> alunos = ObservableList<Aluno>();

  @action
  void get() {
    alunosRequest.get().then((value) {
    
    
      alunos.clear();
      if (value != null) {
        for (var element in value) {
          alunos.add(element);
          print("Aluno: ${element.nome}");
        
        }
      }
    });
  }
}
