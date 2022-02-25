import 'package:dio/dio.dart';


abstract class HttpService {
  void init();

  Future<Response> catalogListAPIRequest() async {
    throw UnimplementedError();
  }
}