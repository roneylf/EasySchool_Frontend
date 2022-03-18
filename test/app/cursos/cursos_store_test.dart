import 'package:flutter_test/flutter_test.dart';
import 'package:easy_school_app/app/modules/cursos/cursos_store.dart';

void main() {
  late CursosStore store;

  setUpAll(() {
    store = CursosStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
