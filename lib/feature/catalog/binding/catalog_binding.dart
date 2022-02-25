import 'package:catalogapp/core/repository/catalogList/catalog_repo_impl.dart';
import 'package:catalogapp/feature/catalog/controller/catalog_controller.dart';
import 'package:get/get.dart';


class CatalogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatalogController>(() => CatalogController());
    Get.put(CatalogRepoImpl());
  }
}
