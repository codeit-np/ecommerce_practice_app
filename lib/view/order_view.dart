import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    var cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: Obx((){
        return SingleChildScrollView(
        child: Column(
          children: [
            //Receipt w1
            controller.image.value != null ? Image.file(controller.image.value!) : Text("Please Upload your Paymet Receipt"),
            //Cart Items w2
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cartController.cartItems.value.data.length,
              itemBuilder: (BuildContext context, int index){
                var item = cartController.cartItems.value.data[index];
               return ListTile(
                title: Text("${item.productName}"),
               );

              }),

              // s3
              FilledButton(onPressed: (){
                controller.pickImage();
              }, child: Text("Pick Image")),

              FilledButton(onPressed: (){
                Loader.show(context);
                controller.placeOrder(controller.image.value!);
                Loader.hide();
              }, child: Text("Place Order"))
          ],
        ),
      );
      })
    );
  }
}