import 'package:dio/dio.dart';

class DioClient {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );
}
