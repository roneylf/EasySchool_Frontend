import 'package:dio/dio.dart';

abstract class Request {
  Dio dio = Dio();
  Future<List?> get();
  Future? getById(int id);
  Future<int> post(Map<String, dynamic> body);
  Future<bool> put(Map<String, dynamic> body);
  Future<bool> delete(int id);
}
