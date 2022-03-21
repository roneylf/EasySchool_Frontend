import 'package:easy_school_app/app/modules/alunos/aluno_details/aluno_details_curso_state.dart';
import 'package:easy_school_app/app/modules/cursos/curso_model.dart';
import 'package:easy_school_app/app/modules/services/alunos_request.dart';
import 'package:easy_school_app/app/modules/services/curso_aluno_model.dart';
import 'package:easy_school_app/app/modules/services/cursoalunos_request.dart';
import 'package:easy_school_app/app/modules/services/cursos_request.dart';
import 'package:mobx/mobx.dart';

import '../aluno_model.dart';
part 'aluno_detail_store.g.dart';

class AlunoDetailsStore = _AlunoDetailsStoreBase with _$AlunoDetailsStore;

abstract class _AlunoDetailsStoreBase with Store {
  @observable
  ObservableList<CursoState> cursos = ObservableList<CursoState>();

  final curso_request = CursosRequest();
  final aluno_request = AlunosRequest();

  Aluno? aluno;

  @observable
  bool loading = false;

  @action
  Future getCursos() async {
    List<Curso>? cursos_list = await curso_request.get();
    loading = true;
    cursos.clear();
    if (cursos_list == null) {
      loading = false;
      return;
    }
    for (var i = 0; i < cursos_list.length; i++) {
      cursos.add(CursoState(cursos_list[i]));
    }
    loading = false;
  }

  @action
  void setSelectByAluno(Aluno aluno) {
    for (var curso in aluno.cursos) {
      cursos
          .firstWhere((element) => element.curso.codigo == curso.codigo)
          .selected = true;
    }
  }

  final curso_aluno_request = CursoAlunoRequest();
  @action
  Future selectCurso(CursoState curso, Aluno aluno) async {
    loading = true;

    int index = cursos
        .indexWhere((element) => element.curso.codigo == curso.curso.codigo);
    cursos[index].state = CursoStateType.loading;

    cursos[index].selected = !cursos[index].selected;

    if (aluno.codigo == null) {
      return;
    }

    if (cursos[index].selected) {
      await curso_aluno_request
          .post(CursoAluno(aluno: aluno, curso: curso.curso).toMap())
          .then((value) => {
                {cursos[index].state = CursoStateType.success}
              })
          .onError((error, stackTrace) => {
                {
                  cursos[index].state = CursoStateType.error,
                },
              });
    } else {
      await curso_aluno_request
          .deleteWhere(CursoAluno(aluno: aluno, curso: curso.curso));
    }
    loading = false;
  }

  @action
  Future addCurso(CursoState curso, Aluno aluno) async {
    loading = true;
    await curso_aluno_request
        .post(CursoAluno(aluno: aluno, curso: curso.curso).toMap())
        .then((value) => {cursos.add(curso)})
        .onError((error, stackTrace) => {});
    loading = false;
  }

  @action
  Future postAluno(Aluno aluno) async {
    return aluno_request
        .post(aluno.toMap())
        .then((value) async => {
              aluno.codigo = value,
              for (int i = 0; i < cursos.length; i++)
                {
                  if (cursos[i].selected) {await addCurso(cursos[i], aluno)}
                }
            })
        .catchError((error, stackTrace) => {
              print(error),
              print(stackTrace),
            });
  }

  @action
  Future updateAluno(Aluno aluno) async {
    return aluno_request
        .put(aluno.toMap())
        .then((value) async => {
              for (int i = 0; i < cursos.length; i++)
                {
                  if (cursos[i].selected) {await selectCurso(cursos[i], aluno)}
                }
            })
        .catchError((error, stackTrace) => {
              print(error),
              print(stackTrace),
            });
  }

  @action
  Future deleteAluno(Aluno aluno) async {
    return aluno_request
        .delete(aluno.codigo!)
        .then((value) async => {
              for (int i = 0; i < cursos.length; i++)
                {
                  if (cursos[i].selected) {await selectCurso(cursos[i], aluno)}
                }
            })
        .catchError((error, stackTrace) => {
              print(error),
              print(stackTrace),
            });
  }
}
