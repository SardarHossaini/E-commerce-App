import 'package:e_commerce_app/screens/navigation_screen.dart';
import 'package:e_commerce_app/widgets/container_button_model.dart';
import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset("assets/images/freed.png"),
              Text("Success!", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40)),
              Text("Your order wiil be deliverd soon."),
              Text("Thank You! for your choosing our app"),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ContainerButtonModel(
                itext: "Continue Shopping",
                containerWidth: MediaQuery.of(context).size.width,
                bgColor: Color(0xFFDB3022),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
