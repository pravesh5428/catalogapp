import 'package:catalogapp/core/constant/url_constant.dart';
import 'package:catalogapp/services/http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



class HttpServiceImpl implements HttpService {
  Dio _dio;

  @override
  void init() {
    _dio = Dio(BaseOptions(baseUrl: URLConstant.baseUrl));
  }

  @override
  Future<Response> catalogListAPIRequest() async {
    Response response;
    try {
      response = await _dio.get(URLConstant.CatalogList);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

}