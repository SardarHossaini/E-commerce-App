import 'package:e_commerce_app/widgets/container_button_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsDetailsPopups extends StatelessWidget {
  final isStyle = TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        );
      },
      child: ContainerButtonModel(itext: "Buy Now", containerWidth: MediaQuery.of(context).size.width/1.5,bgColor: Color(0xFFDB3022),),
    );
  }
}
