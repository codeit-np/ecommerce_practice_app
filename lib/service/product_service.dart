import 'package:dio/dio.dart';
import 'package:ecommerce/utils/dio_connector.dart';

class ProductService {
  static Future<Response> fetchProducts() async{
    var response = await DioConnector.dio.get("products");
    return response;
  }
}