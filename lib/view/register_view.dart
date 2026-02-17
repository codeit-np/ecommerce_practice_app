import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

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

                    //w2 Full Name
                    TextFormField(
                      controller: controller.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Full Name',
                        label: Text("Full Name"),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) => value!.isEmpty ? 'Name Required' : null,
                    ),

                    Gap(10),

                    //w2 Email Text Field
                    TextFormField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email',
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) => value!.isEmpty ? 'Email Required' : null,

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
                      validator: (value) => value!.isEmpty ? 'Password Required' : null,

                    ),

                     Gap(10),
                    //w2 Password Text Field
                    

                 

                    //w4 Login button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                          if(key.currentState!.validate()){
                            controller.register();
                          }
                        },
                        child: Text("Register"),
                      ),
                    ),

                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.login);
                          },
                          child: Text("Already have account: Login"))
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
