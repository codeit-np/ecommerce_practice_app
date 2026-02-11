import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Mero Cart"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Widget 1

            // Widgets 2
          ],
        ),
      ),
    ));
  }
}