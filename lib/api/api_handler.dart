import 'dart:developer';
import 'dart:io';
import 'package:club/extra/app_variables.dart';
import 'package:club/extra/flutter_toast.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApiHandler {
  static ApiHandler handler = ApiHandler();
  late Dio dio, agoraDio;

  ApiHandler() {
    initDio();
  }

  void initDio() {
    dio = Dio();
    setHeaders();
    //todo arvind certificate connection issue
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return client;
      },
    );
    dio.options
      ..connectTimeout = const Duration(seconds: 60)
      ..receiveTimeout = const Duration(seconds: 60);
    dio.interceptors.add(
        LogInterceptor(responseBody: true, error: true, requestBody: true));
  }

  void setHeaders() {
    dio.options.headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'multipart/form-data'
    };
  }


  Future<dynamic> getApi(url, {queryParams}) async {
    try {
      initDio();
      final Response response =
      await dio.get(url, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> postApi(String url, data, {CancelToken? cancelToken}) async {
    try {
      initDio();
      final response =
          await dio.post(url, data: data, cancelToken: cancelToken);
      log("response ${response.toString()}");
      return response;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future _handleError(DioException e) async {
    if (e.error is SocketException) {
      Fluttertoast.showToast(msg: "Network error");
      debugPrint('SocketException ${e.error}');
    } else if (CancelToken.isCancel(e)) {
      throw ("cancel request");
    } else if (e.response!.statusCode == 401) {
      Fluttertoast.showToast(msg: "${e.response!.data["message"]}");
    } else if (e.response!.statusCode == 400) {
      Fluttertoast.showToast(msg: "${e.response!.data["error"]}");
    } else if (e.response!.statusCode == 404) {
      Fluttertoast.showToast(msg: e.response!.data['message']);
    } else if (e.response?.statusCode == 502 || e.response?.statusCode == 500) {
      Fluttertoast.showToast(msg: "Server error");
    } else if (e.response!.data['error'] != null) {
      Fluttertoast.showToast(msg: e.response!.data['message']);
    } else {
      FlutterToast.showToast("Something went wrong. please try again.");
    }
  }
}
