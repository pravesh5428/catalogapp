import 'package:catalogapp/feature/catalog/controller/catalog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CartItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 110),
          child: Text('Cart',
              style: TextStyle(
                fontWeight:FontWeight.w600,
                color: Colors.grey[800],
          ),
          ),
        ),
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: Icon(Icons.arrow_back_ios,color:Colors.grey[800]),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: _CartList(),
                ),
              ),
              const Divider(height: 4, color: Colors.black),
              _CartTotal()
            ],
          ),
        ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catalogController = Get.find<CatalogController>();
    return Obx(()=>ListView.builder(
        itemCount: catalogController.selectedItemList.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              catalogController.totalAmount.remove(catalogController.selectedItemList[index]["price"]);
              catalogController.totalAmount.refresh();
              catalogController.getTotalAmount();
              catalogController.selectedItemList.removeWhere((element) => element['id'] == catalogController.selectedItemList[index]["id"]);
              catalogController.selectedItemList.refresh();
            },
          ),
          title: Text(
            catalogController.selectedItemList[index]["name"].toString(),
          ),
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catalogController = Get.find<CatalogController>();
    return Obx(()=> SizedBox(
        height: 100,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('\$${catalogController.totalPrice.value.toString()}',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.lightBlue
                ),
              ),
              const SizedBox(width: 24),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Buying not supported yet.')));
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.grey[800]
                ),
                child: const Text('BUY'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
