import 'package:catalogapp/core/constant/route_constant.dart';
import 'package:catalogapp/feature/catalog/binding/catalog_binding.dart';
import 'package:catalogapp/feature/catalog/view/cartitem.dart';
import 'package:catalogapp/feature/catalog/view/catalog_view.dart';
import 'package:catalogapp/feature/splash/binding/splash_binding.dart';
import 'package:catalogapp/feature/splash/view/splash_view.dart';
import 'package:get/get.dart';

List<GetPage> getPages = [
  GetPage(
      name: RouteConstant.catalogView,
      page: () =>  CatalogView(),
      binding: CatalogBinding()),
  GetPage(
    name: RouteConstant.splashView,
    page: () =>  SplashScreen(),
    binding: SplashBinding()),
/*  GetPage(
      name: RouteConstant.splashView,
      page: () =>  CartItem()),*/
];
