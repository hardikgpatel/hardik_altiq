import 'package:dio/dio.dart';
import 'dart:convert';

class ResponseModel {
  int statusCode;
  String statusMessage;
  Map<String, dynamic> responseData;

  ResponseModel({this.statusCode, this.responseData, this.statusMessage});

  ResponseModel.fromJson(json)
      : statusCode = json['statusCode'] as int,
        statusMessage = json['statusMessage'] as String,
        responseData = json['responsedata'];
}

class HttpService {
  Dio _dio;

  HttpService() {
    BaseOptions options = new BaseOptions(
      baseUrl: '',
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    _dio = Dio(options);
  }

  Future<ResponseModel> get({String path}) async {
    try {
      final tmp = await _dio.get(path);
      print('RAW reques detail ${tmp.request.path} - $tmp');
      print('RAW Response detail ${tmp.statusCode} - $tmp');
      return ResponseModel.fromJson(json.decode(tmp.toString()));
    } on Exception catch (e) {
      print('Exception $e');
      return null;
    }
  }

  Future<ResponseModel> post({String path, Map<String, dynamic> body}) async {
    try {
      final tmp = await _dio.post(path, data: body);
      print(
          'RAW Response detail ${tmp.request.data} for ${tmp.statusCode} - $tmp');
      return ResponseModel.fromJson(json.decode(tmp.toString()));
    } on Exception catch (e) {
      print('Exceptions $e');
      return null;
    }
  }
}
