import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    var productController = Get.find<ProductController>();
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Mero Cart"),
        actions: [
          IconButton(onPressed: (){
            Get.defaultDialog(
              title: "Warning",
              content: Text("Are you sure, you want to logout?"),
              actions: [
                OutlinedButton(onPressed: (){
                  Get.back();
                }, child: Text("No")),
                FilledButton(onPressed: (){
                   authController.logOut();
                }, child: Text("Yes"))
              ]
            );
           
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Obx((){
        if(productController.isLoading.value == true){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return SingleChildScrollView(
        child: Column(
          children: [
            // Widget 1
            ListView.builder(
              itemCount: productController.products.value.data.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index){
                var product = productController.products.value.data[index];
                return ProductCard(imageUrl: "${product.image}", name: "${product.title}", price: double.parse(product.price.toString()));
              })
            // Widgets 2
          ],
        ),
      );
        }
      })
    ));
  }
}