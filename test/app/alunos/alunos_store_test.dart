import 'package:flutter_test/flutter_test.dart';
import 'package:easy_school_app/app/modules/alunos/alunos_store.dart';

void main() {
  late AlunosStore store;

  setUpAll(() {
    store = AlunosStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
