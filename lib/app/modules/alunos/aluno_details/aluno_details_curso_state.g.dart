// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno_details_curso_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CursoState on _CursoStateBase, Store {
  final _$selectedAtom = Atom(name: '_CursoStateBase.selected');

  @override
  bool get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(bool value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  final _$stateAtom = Atom(name: '_CursoStateBase.state');

  @override
  CursoStateType get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(CursoStateType value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$sucessAtom = Atom(name: '_CursoStateBase.sucess');

  @override
  bool get sucess {
    _$sucessAtom.reportRead();
    return super.sucess;
  }

  @override
  set sucess(bool value) {
    _$sucessAtom.reportWrite(value, super.sucess, () {
      super.sucess = value;
    });
  }

  final _$errorAtom = Atom(name: '_CursoStateBase.error');

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  @override
  String toString() {
    return '''
selected: ${selected},
state: ${state},
sucess: ${sucess},
error: ${error}
    ''';
  }
}
