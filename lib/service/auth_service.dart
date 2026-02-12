import 'package:dio/dio.dart';
import 'package:ecommerce/utils/dio_connector.dart';

class AuthService {
  //Register
  static Future<Response> register(String name, String email, String password) async{
      var response = DioConnector.dio.post("register",queryParameters: {"name" :name, "email": email,"password" : password } );
      return response;
  }

  //login
  static Future<Response> login(String email,String password) async{
    var response = await DioConnector.dio.post("login",queryParameters: {"email" : email,"password" : password});
    return response;
  }
}