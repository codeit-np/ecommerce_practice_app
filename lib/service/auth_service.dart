import 'package:dio/dio.dart';
import 'package:ecommerce/utils/dio_connector.dart';

class AuthService {
  static Future<Response> register(String name, String email, String password) async{
      var response = DioConnector.dio.post("register",queryParameters: {"name" :name, "email": email,"password" : password } );
      return response;
  }
}