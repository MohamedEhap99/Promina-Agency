import 'package:dio/dio.dart';
import 'package:gellary_task/shared/constants/strings.dart';

class DioHelper {
  static Dio? dio;

  /// To inialize Dio in main method
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await dio!.post(url, data: data);
  }

  static void setToken(String token) {
    dio!.options.headers.addAll({"Authorization": "Bearer $token"});
  }

  static void deleteToken() {
    dio!.options.headers.remove("Authorization");
  }
}
