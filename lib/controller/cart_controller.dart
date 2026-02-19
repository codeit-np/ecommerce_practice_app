import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/model/success_model.dart';
import 'package:ecommerce/service/cart_server.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  var qty = 1.obs;
  var isLoading = false.obs;
  var result = SuccessModel(success: false, message: null).obs;
  var cartItems = CartModel(sucess: null, data: []).obs;

  Future addToCard(int productId) async{
    try{
      isLoading(true);
      var response = await CartServer.addToCard(productId, qty.value);
      if(response.statusCode == 200){
        result.value = SuccessModel.fromJson(response.data);
        if(result.value.success == true){
          // Item Added to Card
          Get.snackbar("Success", result.value.message!);
          getCartItems();
        }else{
          //Something went worng
           Get.snackbar("Error", "Someting Went Wrong!");
        }
      }
    }finally{
      
      isLoading(false);
    }
  }

  Future getCartItems() async{
    try{
      isLoading(true);
      var response = await CartServer.fetchCart();
      if(response.statusCode == 200){
        cartItems.value = CartModel.fromJson(response.data);
      }
    }finally{
      isLoading(false);
    }
  }

  void increment(){
    qty.value++;
    if(qty>10){
      qty.value = 10;
    }
  }

  void decrement(){
    qty.value--;
    if(qty <1){
      qty.value = 1;
    }
  }
}