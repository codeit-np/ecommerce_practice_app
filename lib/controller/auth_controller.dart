import 'package:ecommerce/controller/storage_controller.dart';
import 'package:ecommerce/model/login_model.dart';
import 'package:ecommerce/model/register_mode.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var message = RegisterModel(success: false, token: null, message: null).obs;
  var loginMessage = LoginModel(success: false, token: null, message: null).obs;
  var isLoading = false.obs;

  //Text Editing Controller
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirm = TextEditingController();

  void checkAuth() {
    //Auth check logics goes here
    var token = StorageController().getToken();
    if (token != null) {
      //Home page ma send gara
      Future.delayed(Duration(seconds: 3), () {
        Get.offNamed(AppRoutes.home);
      });
    } else {
      //Login page ma send gara
      Future.delayed(Duration(seconds: 3), () {
        Get.offNamed(AppRoutes.login);
      });
    }
  }

  //Register
  Future register() async {
    try {
      isLoading(true);
      var response = await AuthService.register(
        name.text,
        email.text,
        password.text,
      );
      if (response.statusCode == 200) {
        message.value = RegisterModel.fromJson(response.data);
      }
    } finally {
      isLoading(false);
    }
  }

  //login
  Future login() async {
    try {
      isLoading(true);
      var response = await AuthService.login(email.text, password.text);
      if (response.statusCode == 200) {
        loginMessage.value = LoginModel.fromJson(response.data);

        if (loginMessage.value.success == true) {
          //Save Token and goto Home Page
          StorageController().saveToken(loginMessage.value.token!);
          Get.offNamed(AppRoutes.home);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void logOut(){
    StorageController().deleteToken();
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }
}
