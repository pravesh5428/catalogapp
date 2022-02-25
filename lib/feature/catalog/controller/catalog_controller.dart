import 'package:catalogapp/core/model/catalog_list_response.dart';
import 'package:catalogapp/core/repository/catalogList/catalog_repo.dart';
import 'package:catalogapp/core/repository/catalogList/catalog_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CatalogController extends GetxController {

  CatalogRepo _catalogRepo;
  CatalogController(){
    _catalogRepo= Get.find<CatalogRepoImpl>();
  }

  RxBool isLoading = false.obs;
  RxList<Datum> catalogResponse;
  RxList<Datum> filteredProductList = <Datum>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getCatalogList();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  getCatalogList() async {
    isLoading.toggle();
    final response = await _catalogRepo.catalogListAPI();
    if(response!= null) {
      isLoading.toggle();
      catalogResponse = response.data.obs;
    }
    else {
      RxList<Datum> emptyList = List.empty(growable: true);
      catalogResponse = emptyList;
    }
    filteredProductList.value = catalogResponse;
  }

  void runFilter(String enteredKeyword)async {
    if (enteredKeyword.isEmpty) {
      filteredProductList.value = catalogResponse;
    } else {
      filteredProductList.value = catalogResponse.where((product) => product.name.toLowerCase().toUpperCase().contains(enteredKeyword.toLowerCase().toUpperCase())).toList();
    }
  }

}