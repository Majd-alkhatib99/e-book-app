import 'package:dio/dio.dart';

class ApiServes {
  static const String _baseUrl = 'https://www.googleapis.com/';
  static Dio? dio;

  static initial() {
    dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Map<String, dynamic>> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': '$token',
      'Content-Type': 'application/json'
    };
    var response = await dio!.get(endPoint, queryParameters: query);
    return response.data;
  }

  static Future<Map<String, dynamic>> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': '$token',
      'Content-Type': 'application/json'
    };
    var response = await dio!.post(url, data: data, queryParameters: query);
    return response.data;
  }

  static Future<Map<String, dynamic>> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/json'
    };
    var response =await dio!.put(url, data: data, queryParameters: query);
    return response.data;
  }

  static Future<Response> get({
    required String url,
    Map<String,dynamic>? query,
    String? token,
  })async
  {
    dio!.options.headers={

      'Authorization':'Bearer $token',
      'Content-Type':'application/json'
    };
    return await dio!.get(
        url,
        queryParameters: query
    );
  }

}
