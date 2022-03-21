import 'package:mobx/mobx.dart';

import '../../cursos/curso_model.dart';

import 'package:mobx/mobx.dart';
part 'aluno_details_curso_state.g.dart';

class CursoState = _CursoStateBase with _$CursoState;

abstract class _CursoStateBase with Store {
  _CursoStateBase(this.curso);

  Curso curso;

  @observable
  bool selected = false;

  @observable
  CursoStateType state = CursoStateType.none;

  @observable
  bool sucess = false;

  @observable
  bool error = false;
}

//usado em  AlunoPageDetails

enum CursoStateType { none, loading, success, error }
