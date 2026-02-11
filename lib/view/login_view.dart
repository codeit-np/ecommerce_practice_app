import 'package:ecommerce/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //w1 Logo
                    Icon(Icons.shopping_bag, size: 100),
                    Gap(20),

                    //w2 Email Text Field
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email',
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),

                    Gap(10),
                    //w2 Password Text Field
                    TextFormField(
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
                        onPressed: () {},
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
