import 'package:easy_school_app/app/modules/services/requests.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../cursos/curso_model.dart';

class CursosRequest extends Request {
  final path = dotenv.env['BASE_URL'].toString() + 'cursos';

  @override
  Future<List<Curso>?> get() async {
    return dio.get(path).then((response) {
      List<Curso> cursos = [];
      response.data.forEach((curso) {
        cursos.add(Curso.fromMap(curso));
      });
      return cursos;
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
 
  }

  @override
  Future<Curso?> getById(int id) async {
    await dio.get(path + '/' + id.toString()).then((response) {
      return Curso.fromJson(response.data);
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
    await dio.put(path + '/' + body['codigo'], data: body).then((response) {
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
    await dio.delete(path + '/$id').then((value) {
      return true;
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
    return false;
  }
}
