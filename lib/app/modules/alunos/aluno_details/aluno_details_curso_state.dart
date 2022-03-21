import 'package:mobx/mobx.dart';

import '../../cursos/curso_model.dart';

//usado em  AlunoPageDetails
class CursoState {

  Curso curso;
  
  @observable
  bool selected;

  @observable
  CursoStateType state = CursoStateType.none;

  @observable 
  bool sucess = false;

  @observable
  bool error = false;

  CursoState({required this.curso, this.selected = false});

}

enum CursoStateType {
  none,
  loading,
  success,
  error
}