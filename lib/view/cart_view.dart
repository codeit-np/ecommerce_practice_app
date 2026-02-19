import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx((){
              return controller.isLoading.value == true ? Center(child: LinearProgressIndicator(),) :
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.cartItems.value.data.length,
                itemBuilder: (BuildContext content,int index){
                  var product = controller.cartItems.value.data[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("${product.productImage}"),
                    ),
                    title: Text("${product.productName}"),
                    subtitle: Text("(${product.quantity}) x ${product.sellingPrice} = ${product.totalAmt}"),
                    trailing: IconButton(onPressed: (){
                      Get.defaultDialog(
                        title: "Warning",
                        content: Text("Do you want to delete?"),
                        actions: [
                          OutlinedButton(onPressed: (){
                            Get.back();
                          }, child: Text("No")),
                          FilledButton(onPressed: (){}, child: Text("Yes")),
                        ]
                      );
                    }, icon: Icon(Icons.delete)),
                  );
                });
              
            }),

            FilledButton(onPressed: (){
              Get.toNamed(AppRoutes.order);
            }, child: Text("Proceed to Checkout"))
          ],
        ),
      ),
    );
  }
}