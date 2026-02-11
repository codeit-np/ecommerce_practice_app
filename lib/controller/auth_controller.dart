import 'package:ecommerce/model/register_mode.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  var isLoggedIn = false.obs;
  var message = RegisterModel(success: false, token: null, message: null).obs;
  var isLoading = false.obs;

  //Text Editing Controller
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirm = TextEditingController();

  void checkAuth(){
    //Auth check logics goes here

    Future.delayed(Duration(seconds: 3),(){
      Get.offNamed(AppRoutes.login);
    });
  }

  //Register 
  Future register() async{
    try{
      isLoading(true);
        var response = await AuthService.register(name.text, email.text, password.text);
        print(response.data);
        if(response.statusCode == 200){
           message.value = RegisterModel.fromJson(response.data);
        }
    }finally{
      isLoading(false);
    }
  }


  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }
}