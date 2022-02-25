import 'dart:convert';
import 'package:catalogapp/core/model/catalog_list_response.dart';
import 'package:catalogapp/core/repository/catalogList/catalog_repo.dart';
import 'package:catalogapp/services/http_service.dart';
import 'package:catalogapp/services/http_service_impl.dart';
import 'package:get/get.dart';


class CatalogRepoImpl implements CatalogRepo {
  HttpService _httpService;

  CatalogRepoImpl(){
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<CatalogResponse> catalogListAPI() async {
    try {
      final response = await _httpService.catalogListAPIRequest();
      Map<String, dynamic> responseMap = Map.from(jsonDecode(response.toString()));
      return CatalogResponse.fromJson(responseMap);
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
  CatalogResponse phoneResponseFromJson(String str) => CatalogResponse.fromJson(json.decode(str));
}

