import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myecomappflutter/confg/app_info.dart';
import 'package:myecomappflutter/confg/bloc_provider.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/screens/details/product_details_screen.dart';
import 'package:myecomappflutter/screens/home/product_card.dart';
import 'package:provider/provider.dart';

class OurProducts extends StatelessWidget {
  late BLOCProvider bloc;
  Future<List<Map<String, dynamic>>> getProducts() async{
    List<Map<String, dynamic>> products =[];
    var response=await get(Uri.parse(AppInfo.url+"get_products.php?token=${
        AppInfo.user.token}&categoryid=${bloc.categoryid}"));
    if(response.statusCode==200)
    {
      var decodedData=jsonDecode(response.body);
      for(var d in decodedData)
      {
        products.add(
            {
              "id": d["id"],
              "name": d["name"],
              "price":d["price"],
              "photo":d["photo"],
              "details":d["details"]
            }
        );
      }
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
     bloc=Provider.of<BLOCProvider>(context);
     return Container(
       padding: EdgeInsets.all(SizeConfig().getPropotionalWidth(20)),
       child: SingleChildScrollView(
         scrollDirection: Axis.horizontal,
         child:

         FutureBuilder(
           future: getProducts(),
           builder: (BuildContext context,
               AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {


             if (snapshot.hasData) {
               List<ProductCard> cards = [];

               for (var c in snapshot.data!) {
                 var mycard = ProductCard(
                   id: c["id"],
                   name: c["name"],
                   price: c["price"],
                   photo: c["photo"],
                   press: () {
AppInfo.product.id=c["id"];
AppInfo.product.name=c["name"];
AppInfo.product.price=c["price"];
AppInfo.product.photo=c["photo"];
AppInfo.product.details=c["details"];
Navigator.pushNamed(context, ProductDetailsScreen.id);
                   },
                 );
                 cards.add(mycard);
               }
               return Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: cards,
               );
             } else {
               return CircularProgressIndicator();
             }
           },
         ),
       ),
     );
  }
}
