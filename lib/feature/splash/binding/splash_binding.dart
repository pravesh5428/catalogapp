import 'package:catalogapp/feature/catalog/controller/catalog_controller.dart';
import 'package:catalogapp/feature/splash/controller/splash_controller.dart';
import 'package:get/get.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<CatalogController>(() => CatalogController());
  }
}
