import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController with WidgetsBindingObserver {

final box = GetStorage();

 @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

   @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.detached || state == AppLifecycleState.inactive) {
      print("you are here. exit app");
      deleteToken();
    }
  }


  Future saveToken(String token) async{
    await box.write("token", token);
  }

  String? getToken(){
    return box.read("token");
  }

  void deleteToken(){
    box.erase();
  }
}