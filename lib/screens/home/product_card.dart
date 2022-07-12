import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/app_info.dart';
import 'package:myecomappflutter/confg/size_config.dart';


class ProductCard extends StatelessWidget {

  final id;
  final name;
  final price;
  final photo;
  final press;
  ProductCard({
    this .id,
    this.name,
    this.price,
    this.photo,
    this.press
});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.only(left: SizeConfig().getPropotionalWidth(20)),
    child: SizedBox(
        width: SizeConfig().getPropotionalWidth(150),
    child: GestureDetector(
    onTap: press,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.all(SizeConfig().getPropotionalWidth(20)),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child:Hero(
          tag: id.toString(),
          child:Image.network(AppInfo.url+"images/"+photo),
        ) ,
      ),
    SizedBox(
    height: SizeConfig().getPropotionalWidth(10),
    ),
      Text("$name",
        style: TextStyle(
            color: Color(0xFFFF7643),
            fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
      SizedBox(
        height: SizeConfig().getPropotionalWidth(10),
      ),
      Text("$price",style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 17
      ),)
    ],
    ),
    ),
    ),
    );
  }
}
