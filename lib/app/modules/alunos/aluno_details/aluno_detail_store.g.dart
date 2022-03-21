// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlunoDetailsStore on _AlunoDetailsStoreBase, Store {
  final _$cursosAtom = Atom(name: '_AlunoDetailsStoreBase.cursos');

  @override
  ObservableList<CursoState> get cursos {
    _$cursosAtom.reportRead();
    return super.cursos;
  }

  @override
  set cursos(ObservableList<CursoState> value) {
    _$cursosAtom.reportWrite(value, super.cursos, () {
      super.cursos = value;
    });
  }

  final _$loadingAtom = Atom(name: '_AlunoDetailsStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getCursosAsyncAction =
      AsyncAction('_AlunoDetailsStoreBase.getCursos');

  @override
  Future<dynamic> getCursos() {
    return _$getCursosAsyncAction.run(() => super.getCursos());
  }

  final _$selectCursoAsyncAction =
      AsyncAction('_AlunoDetailsStoreBase.selectCurso');

  @override
  Future<dynamic> selectCurso(CursoState curso, Aluno aluno) {
    return _$selectCursoAsyncAction.run(() => super.selectCurso(curso, aluno));
  }

  final _$postAlunoAsyncAction =
      AsyncAction('_AlunoDetailsStoreBase.postAluno');

  @override
  Future<dynamic> postAluno(Aluno aluno) {
    return _$postAlunoAsyncAction.run(() => super.postAluno(aluno));
  }

  final _$updateAlunoAsyncAction =
      AsyncAction('_AlunoDetailsStoreBase.updateAluno');

  @override
  Future<dynamic> updateAluno(Aluno aluno) {
    return _$updateAlunoAsyncAction.run(() => super.updateAluno(aluno));
  }

  final _$deleteAlunoAsyncAction =
      AsyncAction('_AlunoDetailsStoreBase.deleteAluno');

  @override
  Future<dynamic> deleteAluno(Aluno aluno) {
    return _$deleteAlunoAsyncAction.run(() => super.deleteAluno(aluno));
  }

  final _$_AlunoDetailsStoreBaseActionController =
      ActionController(name: '_AlunoDetailsStoreBase');

  @override
  void setSelectByAluno(Aluno aluno) {
    final _$actionInfo = _$_AlunoDetailsStoreBaseActionController.startAction(
        name: '_AlunoDetailsStoreBase.setSelectByAluno');
    try {
      return super.setSelectByAluno(aluno);
    } finally {
      _$_AlunoDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cursos: ${cursos},
loading: ${loading}
    ''';
  }
}
