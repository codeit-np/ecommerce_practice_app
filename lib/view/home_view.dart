import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    var productController = Get.find<ProductController>();
    var cartController = Get.find<CartController>();
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Mero Cart"),
        actions: [
          InkWell(
            onTap: (){
              cartController.getCartItems();
              Get.toNamed(AppRoutes.cart);
            },
            child: Icon(Icons.shopping_cart_outlined)),
            Obx((){
              return Text("${cartController.cartItems.value.data.length}");
            }),
          
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
                return ListTile(
                  onTap: (){
                      Get.toNamed(AppRoutes.product,arguments: product);
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("${product.image}"),
                  ),
                  title: Text("${product.title}"),
                  subtitle: Text("${product.price}"),
                  trailing: Icon(Icons.arrow_right_alt_rounded),
                );
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