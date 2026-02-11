import 'package:ecommerce/controller/auth_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(),permanent: true);
  }
}