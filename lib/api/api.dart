import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:radar/models/Fund.dart';
import 'package:radar/models/StructureItem.dart';

Dio apiDio = Dio();

class Api {

  Future get({
    @required String method,
    Map<String, dynamic> queryParameters
  }) async {
    try {
      Map<String, dynamic> headers = {};
      final Response response = await apiDio.get(
        "http://109.68.190.168:9667" + method,
        //"http://192.168.0.109:8080" + method,
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
    var response = await Api().get(method: "/api/funds/all");
    var funds = <Fund>[];

    if (response != null) {
      response.forEach(
              (map) => funds.add(Fund.fromMap(map))
      );
    }

    return funds;
  }

  Future fetchFundsStructureByType(List fundIds, range) async {
    return await Api().get(method: "/api/funds/structure/type/$range?ids[]=" + fundIds.join("&ids[]="));
  }

  Future fetchFundsStructureByBranch(List fundIds, range) async {
    return await Api().get(method: "/api/funds/structure/branch/$range?ids[]=" + fundIds.join("&ids[]="));
  }

  Future fetchNavByFundId(id, range) async {
    return await Api().get(method: "/api/assets/nav/$id/$range");
  }

  Future fetchAssetsByType(type, List fundIds) async {
    return await Api().get(method: "/api/assets/type/$type?ids[]=" + fundIds.join("&ids[]="));
  }

  Future fetchAssetsByBranch(branch, List fundIds) async {
    return await Api().get(method: "/api/assets/branch/$branch?ids[]=" + fundIds.join("&ids[]="));
  }
}