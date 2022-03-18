import 'package:mobx/mobx.dart';

part 'alunos_store.g.dart';

class AlunosStore = _AlunosStoreBase with _$AlunosStore;
abstract class _AlunosStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}