// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alunos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlunosStore on _AlunosStoreBase, Store {
  final _$alunosAtom = Atom(name: '_AlunosStoreBase.alunos');

  @override
  ObservableList<Aluno> get alunos {
    _$alunosAtom.reportRead();
    return super.alunos;
  }

  @override
  set alunos(ObservableList<Aluno> value) {
    _$alunosAtom.reportWrite(value, super.alunos, () {
      super.alunos = value;
    });
  }

  final _$_AlunosStoreBaseActionController =
      ActionController(name: '_AlunosStoreBase');

  @override
  void get() {
    final _$actionInfo = _$_AlunosStoreBaseActionController.startAction(
        name: '_AlunosStoreBase.get');
    try {
      return super.get();
    } finally {
      _$_AlunosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
alunos: ${alunos}
    ''';
  }
}
