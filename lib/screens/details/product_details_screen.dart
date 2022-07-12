import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/size_config.dart';

import 'details_body.dart';


class ProductDetailsScreen extends StatefulWidget {
  static String id="product_detail_screen";
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor:Color(0xFFF5F6F9) ,
      body: DetailsBody(),
    );
  }
}
