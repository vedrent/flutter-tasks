import 'package:dio/dio.dart';

Dio getHttpClient() {
  BaseOptions options = BaseOptions(
      baseUrl: "http://192.168.100.114:8080",
      responseType: ResponseType.plain,
      validateStatus: (code) {
        if (code == null) {
          return false;
        }
        return code >= 200;
      });

  return Dio(options);
}