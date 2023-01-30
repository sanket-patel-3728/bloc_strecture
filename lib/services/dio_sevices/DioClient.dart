import 'package:dio/dio.dart';

import '../../constants/constants.dart';

class DioClient {
  static Dio? _dioClient;

  static Dio? getClient() {
    if (_dioClient == null) {
      initClient();
    }
    return _dioClient;
  }

  static Dio? initClient() {
    _dioClient = Dio(BaseOptions(
      baseUrl: APIConstants.BASE_URL,
    ));
    _dioClient!.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      print(response.requestOptions.uri);
      return handler.next(response);
    }, onError: (DioError e, handler) {
      print("Request : ${e.message}");
      return handler.next(e);
    }));
    return _dioClient;
  }
}
