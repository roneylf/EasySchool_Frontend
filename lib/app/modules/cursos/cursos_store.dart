import 'package:mobx/mobx.dart';

part 'cursos_store.g.dart';

class CursosStore = _CursosStoreBase with _$CursosStore;
abstract class _CursosStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}