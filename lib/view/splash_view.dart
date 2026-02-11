import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag_outlined,size: 100,),
              Text("Mero Cart",style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.grey.shade600,
              
              ),)
            ],
          ),
        ),
      ),
    );
  }
}