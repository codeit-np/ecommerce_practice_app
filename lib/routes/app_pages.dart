import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/view/cart_view.dart';
import 'package:ecommerce/view/home_view.dart';
import 'package:ecommerce/view/login_view.dart';
import 'package:ecommerce/view/order_view.dart';
import 'package:ecommerce/view/product_view.dart';
import 'package:ecommerce/view/register_view.dart';
import 'package:ecommerce/view/splash_view.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: ()=> SplashView()),
    GetPage(name: AppRoutes.login, page: ()=> LoginView()),
    GetPage(name: AppRoutes.register, page: ()=> RegisterView()),
    GetPage(name: AppRoutes.home, page: ()=> HomeView()),
    GetPage(name: AppRoutes.product, page: ()=> ProductView()),
    GetPage(name: AppRoutes.cart, page: ()=> CartView()),
    GetPage(name: AppRoutes.order, page: ()=> OrderView()),
  ];
}