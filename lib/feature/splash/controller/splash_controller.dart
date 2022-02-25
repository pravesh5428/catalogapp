import 'dart:async';
import 'package:catalogapp/core/constant/route_constant.dart';
import 'package:get/get.dart';


class SplashController extends GetxController {
  SplashController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    Timer(const Duration(seconds: 2),
            () => Get.toNamed(RouteConstant.catalogView));
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
