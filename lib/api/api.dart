import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio apiDio = Dio();

class Api  {

  Future<Map<String, dynamic>> get({
    @required String method,
    Map<String, dynamic> queryParameters
  }) async {
    try {
      Map<String, dynamic> headers = {};
      final Response response = await apiDio.get(
        method,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) return response.data;
        throw response;
    } catch (error) {
      throw error;
    }
  }
}