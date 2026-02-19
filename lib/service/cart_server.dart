import 'package:dio/dio.dart';
import 'package:ecommerce/controller/storage_controller.dart';
import 'package:ecommerce/utils/dio_connector.dart';

class CartServer {
  static Future<Response> addToCard(int productId,int qty) async{
    var token = StorageController().getToken();
    DioConnector.dio.options.headers['Authorization'] = "Bearer $token";
    var response = await DioConnector.dio.post("cart",queryParameters: {"product_id": productId,"qty" : qty});
    return response;
  }

  static Future<Response> fetchCart() async{
    var token = StorageController().getToken();
    DioConnector.dio.options.headers['Authorization'] = "Bearer $token";
    var response = await DioConnector.dio.get("carts");
    return response;
  }
}