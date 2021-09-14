import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:radar/models/Fund.dart';
import 'package:radar/models/FundStructure.dart';
import 'package:radar/models/FundsStructure.dart';

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
        "http://192.168.0.109:8080" + method,
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

  Future fetchFundStructure(id, range) async {
    var response = await Api().get(method: "/api/funds/assets/$id/$range");
    var fundStructure = <FundStructure>[];

    if (response != null) {
      response.forEach((element) =>
          fundStructure.add(FundStructure.fromMap(element))
      );
    }

    return fundStructure;
  }

  Future fetchFundsStructure(range, List ids) async {
    return await Api().get(method: "/api/funds/structure/type/$range?ids[]=" + ids.join("&ids[]="));
  }

  Future fetchBranch(range, List ids) async {
    return await Api().get(method: "/api/funds/structure/branch/$range?ids[]=" + ids.join("&ids[]="));
  }

  Future fetchNavByFundId(id, range) async {
    return await Api().get(method: "/api/assets/nav/$id/$range");
  }
}