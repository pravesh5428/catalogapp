import 'package:catalogapp/core/model/catalog_list_response.dart';


abstract class CatalogRepo{
  Future<CatalogResponse> catalogListAPI();
}