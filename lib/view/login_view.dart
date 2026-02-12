import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //w1 Logo
                    Icon(Icons.shopping_bag, size: 100),
                    Gap(20),

                    //w2 Email Text Field
                    TextFormField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email',
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) => value!.isEmpty ? 'Email required' : null,
                    ),

                    Gap(10),
                    //w2 Password Text Field
                    TextFormField(
                      controller: controller.password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your password',
                        label: Text("Password"),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility),
                        ),
                      ),
                      obscureText: true,
                      validator: (value) => value!.isEmpty ? 'Password required' : null,

                    ),

                    Gap(10),
                    //w3 Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text("Forgot Password: Click here")],
                    ),

                    Gap(10),

                    //w4 Login button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: FilledButton(
                        onPressed: () async {
                          if(key.currentState!.validate()){
                            Loader.show(context);
                            await controller.login();
                            Loader.hide();

                          }
                        },
                        child: Text("Login"),
                      ),
                    ),

                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.register);
                          },
                          child: Text("New user:Register"))
                        
                        ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
