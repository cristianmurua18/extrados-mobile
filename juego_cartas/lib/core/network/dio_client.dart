import 'package:dio/dio.dart';

final dioClient = Dio(
  BaseOptions(
    baseUrl: 'http://192.168.56.1:5053/api/',
    contentType: Headers.jsonContentType,
    headers: <String, String>{'Accept': 'application/json'},
  ),
);
