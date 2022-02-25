import 'package:badges/badges.dart';
import 'package:catalogapp/core/constant/colors_constant.dart';
import 'package:catalogapp/core/constant/route_constant.dart';
import 'package:catalogapp/feature/catalog/controller/catalog_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class CatalogView extends GetView<CatalogController> {
  const CatalogView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: secondryColor1,
      body: Obx(
        () => controller.isLoading.value == true
            ? const SizedBox(child: Center(child: CircularProgressIndicator()))
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: false,
                    pinned: true,
                    backgroundColor: secondryColor1,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Catalog App',
                              style: GoogleFonts.nunitoSans(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Trending Products',
                              style: GoogleFonts.nunitoSans(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(height * 0.17),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(fontSize: 14),
                                hintText: 'Search',
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(12),
                              ),
                              onChanged: (text) {
                                controller.runFilter(text);
                              }),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x198ba5b0),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: width * 0.25,
                                  height: height * 0.17,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: controller.filteredProductList[index]
                                                  .image ==
                                              null
                                          ? const NetworkImage(
                                              "http://placehold.jp/150x150.png")
                                          : NetworkImage(controller
                                              .filteredProductList[index]
                                              .image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: width * 0.55,
                                  height: height * 0.17,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.filteredProductList[index]
                                                    .name ??
                                                "",
                                            style: GoogleFonts.nunitoSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            controller.catalogResponse[index]
                                                    .description ??
                                                "",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(controller.filteredProductList[index]
                                              .price ??
                                              "",
                                            style: GoogleFonts.nunitoSans(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder(),
                                              primary: Colors.blueGrey,
                                              onPrimary:
                                                  Colors.white, // foreground
                                            ),
                                            onPressed: () {
                                              if(controller.filteredProductList[index].selected==false){
                                                controller.filteredProductList[index].selected=true;
                                                controller.selectedItemList.add({"id":controller.filteredProductList[index].id,"name":controller.filteredProductList[index].name,"description":controller.filteredProductList[index].description,"price":controller.filteredProductList[index].price});
                                                controller.totalAmount.add(controller.filteredProductList[index].price);
                                              }else{
                                                controller.filteredProductList[index].selected=false;
                                                controller.selectedItemList.removeWhere((element) => element['id'] == int.parse(controller.filteredProductList[index].id.toString()));
                                                controller.totalAmount.remove(controller.filteredProductList[index].price);
                                              }
                                              print("selectedItemList");
                                              print(controller.selectedItemList);
                                              controller.filteredProductList.refresh();
                                            },
                                            child: controller.filteredProductList[index]
                                                .selected==false?const Icon(
                                              Icons.shopping_cart_outlined,
                                              size: 18,
                                            ):const Icon(
                                              Icons.check,
                                              size: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: controller.filteredProductList.length,
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getTotalAmount();
          Get.toNamed(RouteConstant.carItemView);
        },
        backgroundColor: Colors.purple,
        child: Obx(()=> Badge(
              toAnimate: true,
              position: BadgePosition.topEnd(top: -20, end: -15),
              shape: BadgeShape.circle,
              badgeColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
              badgeContent: Text('${controller.selectedItemList.length}', style: TextStyle(color: Colors.white)),
              child: Icon(
                Icons.shopping_cart_outlined,
             ),
           ),
        ),
      ),
    );
  }

}
