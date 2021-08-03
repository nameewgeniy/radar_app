import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio apiDio = Dio();

class Api {

  Future get({
    @required String method,
    Map<String, dynamic> queryParameters
  }) async {
    try {
      Map<String, dynamic> headers = {};
      final Response response = await apiDio.get(
        //"http://109.68.190.168:9667" + method,
        "http://192.168.0.107:9667" + method,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        return response.data["Data"];
      }

      throw response;
    } catch (error) {
      throw error;
    }
  }

  Future fetchFunds() async {
    return await Api().get(method: "/api/GetAllFunds");
  }

  Future fetchAssetsByFund(id) async {
    return await Api().get(method: "/api/assets-by-fund/$id");
  }

  Future fetchFundsStructure(range) async {
    return await Api().get(method: "/api/funds/structure/$range");
  }

  Future fetchBranch(range) async {
    return await Api().get(method: "/api/funds/structure/branch/$range");
  }
}