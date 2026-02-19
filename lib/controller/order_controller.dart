import 'dart:io';

import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/service/order_server.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OrderController extends GetxController{
var isLoading = false.obs;
final ImagePicker picker = ImagePicker();
Rx<File?> image = Rx<File?>(null);
  
  //Image Picker
  Future pickImage() async{
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null){
      image.value = File(pickedFile.path);
    }
  }

  //Place Order
  Future placeOrder(File file) async{
    try{
      var cartController = Get.find<CartController>();
      isLoading(true);
      var response = await OrderServer.placeOrder(file);

      if(response.statusCode == 200){
        Get.snackbar("Success", "Message goes here");
       cartController.getCartItems();
      }
    }finally{
      isLoading(false);
    }
  }
}