import 'package:dio/dio.dart';

class DioMod {
  final Dio dio = new Dio();

  DioMod() {
    dio.options.baseUrl = "http://marketcafeglenallen.com/app/public";
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          return options;
        },
        onResponse: (Response response) async {
          return response;
        },
        onError: (DioError e) async {
          print("Error ${e.response}");

          return e;
        },
      ),
    );
  }

  getInstance() {
    return dio;
  }
}
