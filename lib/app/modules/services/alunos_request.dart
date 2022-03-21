import 'package:easy_school_app/app/modules/alunos/aluno_model.dart';
import 'package:easy_school_app/app/modules/services/requests.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AlunosRequest extends Request {
  final path = dotenv.env['BASE_URL'].toString() + 'alunos';

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

  @override
  Future<List<Aluno>?> get() async {

    return dio.get(path).then((response) {
      
      List<Aluno> alunos = [];
      response.data.forEach((aluno) {
        alunos.add(Aluno.fromMap(aluno));
     
      });
      return alunos;
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
  
  }

  @override
  Future<Aluno>? getById(int id) {
    dio.get(path + '/' + id.toString()).then((response) {
      return Aluno.fromJson(response.data);
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
        .put(path + '/' + body['codigo'].toString(), data: body)
        .then((response) {
      return true;
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
    return false;
  }
}
