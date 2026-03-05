import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/widgets/container_button_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsDetailsPopups extends StatelessWidget {
  final isStyle = TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18);
  List<Color> clrs = [Colors.red, Colors.blue, Colors.green, Colors.amber];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
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
                              SizedBox(width: 15),
                              Text("S", style: isStyle),
                              SizedBox(width: 30),
                              Text("M", style: isStyle),
                              SizedBox(width: 30),
                              Text("L", style: isStyle),
                              SizedBox(width: 30),
                              Text("XL", style: isStyle),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Row(
                              children: [
                                for (var i = 0; i < 4; i++)
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: clrs[i],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {},
                                child: Text("-", style: isStyle),
                              ),
                              SizedBox(width: 10),
                              Text("1"),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {},
                                child: Text("+", style: isStyle),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Payment", style: isStyle),
                      Text(
                        "\$40",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFDB3022),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen()));
                    },
                    child: ContainerButtonModel(
                      itext: "Checkout",
                      containerWidth: MediaQuery.of(context).size.width,
                      bgColor: Color(0xFFDB3022),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: ContainerButtonModel(
        itext: "Buy Now",
        containerWidth: MediaQuery.of(context).size.width / 1.28,
        bgColor: Color(0xFFDB3022),
      ),
    );
  }
}
