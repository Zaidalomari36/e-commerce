import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/models/cart.dart';

class CartItem extends StatelessWidget {
final Cart cart;
CartItem({required this.cart});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig().getPropotionalWidth(90),
          child: Container(
            padding: EdgeInsets.all(SizeConfig().getPropotionalWidth(10)),
            decoration: BoxDecoration(
              color: Color(0xfff4f6f9),
borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(cart.product.photo),
          ),
        ),
        SizedBox(
          width: SizeConfig().getPropotionalWidth(20),
        ),
        Column(
          children: [
            Text(cart.product.name),
            Text("${cart.product.price.toString()} JOD"),
            Text(cart.qty.toString()),
            Text("${cart.product.price* cart.qty} JOD",style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ],
    );
  }
}
