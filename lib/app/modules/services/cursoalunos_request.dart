import 'package:easy_school_app/app/modules/models/curso_aluno_model.dart';
import 'package:easy_school_app/app/modules/services/requests.dart';
import 'package:flutter/foundation.dart';

class CursoAlunoRequest extends Request {
  @override
  Future<List<CursoAluno>?> get() async {
    dio.get('/cursoalunos').then((response) {
      List<CursoAluno> cursoAlunos = [];
      response.data.forEach((cursoAluno) {
        cursoAlunos.add(CursoAluno.fromJson(cursoAluno));
      });
      return cursoAlunos;
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
    return null;
  }

  @override
  Future<CursoAluno?> getById(int id) async {
    await dio.get('/cursoalunos/' + id.toString()).then((response) {
      return CursoAluno.fromJson(response.data);
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
    return null;
  }

  @override
  Future<bool> post(Map<String, dynamic> body) async {
    await dio.post('/cursoalunos', data: body).then((response) {
      return true;
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
    return false;
  }

  @override
  Future<bool> put(Map<String, dynamic> body) async {
    await dio
        .put('/cursoalunos/' + body['codigo'], data: body)
        .then((response) {
      return true;
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
    return false;
  }

  @override
  Future<bool> delete(int id) async {
    await dio.delete('/cursoalunos/' + id.toString()).then((response) {
      return true;
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
    return false;
  }
}
