import 'package:easy_school_app/app/modules/services/curso_aluno_model.dart';
import 'package:easy_school_app/app/modules/services/requests.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CursoAlunoRequest extends Request {
  final path = dotenv.env['BASE_URL'].toString() + 'cursoalunos';
  @override
  Future<List<CursoAluno>?> get() async {
    dio.get(path).then((response) {
      List<CursoAluno> cursoAlunos = [];
      response.data.forEach((cursoAluno) {
        cursoAlunos.add(CursoAluno.fromMap(cursoAluno));
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
    await dio.get(path + id.toString()).then((response) {
      return CursoAluno.fromJson(response.data);
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
    return null;
  }

  @override
  Future<int> post(Map<String, dynamic> body) async {
   return await dio.post(path, data: body).then((response) {
      return response.data['codigo'];
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
  }

  @override
  Future<bool> put(Map<String, dynamic> body) async {
    await dio
        .put(path + body['codigo'], data: body)
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
    await dio.delete(path + '/$id').then((response) {
      return true;
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
    return false;
  }

  Future<bool> deleteWhere (CursoAluno cursoAluno) async {
      await dio.delete(path , data: cursoAluno.toMap() ).then((response) {
      return true;
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
    return false;
  }
}
