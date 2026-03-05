import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  List<String> imagesList = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
    "assets/images/image4.jpg",
  ];

  List<String> productTitle = ["Warm Zipper", "Knitted Woo!", "Zipper win", "Child win"];

  List<String> prices = ["\$400", "\$300", "\$450", "\$390"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: const Center(child: Text('Cart Screen')),
      ),
    );
  }
}
