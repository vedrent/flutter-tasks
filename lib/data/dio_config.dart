import 'package:dio/dio.dart';

Dio getHttpClient() {
  BaseOptions options = BaseOptions(
      baseUrl: "http://193.108.113.112:8080",
      responseType: ResponseType.plain,
      validateStatus: (code) {
        if (code == null) {
          return false;
        }
        return code >= 200;
      });

  return Dio(options);
}