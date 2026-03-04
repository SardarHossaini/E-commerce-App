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
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Size: ", style: isStyle),
                          SizedBox(height: 20),
                          Text("Color: ", style: isStyle),
                          SizedBox(height: 20),
                          Text("Total: ", style: isStyle),
                          SizedBox(height: 20),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 20),
                              Text("S", style: isStyle),
                              SizedBox(width: 20),
                              Text("M", style: isStyle),
                              SizedBox(width: 20),
                              Text("L", style: isStyle),
                              SizedBox(width: 20),
                              Text("XL", style: isStyle),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: ContainerButtonModel(
        itext: "Buy Now",
        containerWidth: MediaQuery.of(context).size.width / 1.5,
        bgColor: Color(0xFFDB3022),
      ),
    );
  }
}
