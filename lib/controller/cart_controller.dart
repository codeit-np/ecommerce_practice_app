import 'package:get/get.dart';

class CartController extends GetxController{
  var qty = 1.obs;

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