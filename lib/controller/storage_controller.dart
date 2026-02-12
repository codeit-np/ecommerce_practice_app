import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {

final box = GetStorage();

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