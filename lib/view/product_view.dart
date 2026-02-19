import 'package:ecommerce/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductView extends GetView<CartController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var product = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("Product Page")),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                  ),
                ),
                Gap(10),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: FilledButton(
                      style:FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(14)
                        )
                      ),
                      onPressed: () {
                        Loader.show(context);
                        controller.addToCard(product.id);
                        Loader.hide();
                      },
                      child: Text("Add to Cart"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Image
              SizedBox(
                width: double.infinity,
                height: 350,
                child: Image.network("${product.image}", fit: BoxFit.cover),
              ),

              //Product Title and Price
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${product.title}",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),

                    Column(
                      children: [
                        Text(
                          "Rs.${product.price}",
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "-Rs.${product.discountAmount}",
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.red,
                              ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Product Descritpion
              Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Html(data: "${product.description}"),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Remove
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade600),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: IconButton(
                        onPressed: () {
                          controller.decrement();
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ),

                    Gap(10),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade600),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: Obx((){
                          return Text(
                          "${controller.qty}",
                          style: Theme.of(context).textTheme.headlineLarge,
                        );
                        })
                      ),
                    ),

                    Gap(10),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade600),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: IconButton(
                        onPressed: () {
                          controller.increment();
                        },
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
