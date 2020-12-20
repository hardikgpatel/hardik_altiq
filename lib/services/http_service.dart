import 'package:dio/dio.dart';
import 'dart:convert';

class HttpService {
  Dio _dio;

  HttpService() {
    BaseOptions options = new BaseOptions(
      baseUrl: 'https://api.npoint.io/',
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    _dio = Dio(options);
  }

  Future<dynamic> get({String path}) async {
    try {
      final response = await _dio.get(path);
      print('RAW Response detail ${response.statusCode} - $response');
      return response;
      //return ResponseModel.fromJson(json.decode(tmp.toString()));
    } on Exception catch (e) {
      print('Exception $e');
      return null;
    }
  }
}
