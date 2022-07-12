
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myecomappflutter/confg/app_info.dart';
import 'package:myecomappflutter/confg/bloc_provider.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/models/cart.dart';
import 'package:myecomappflutter/models/product.dart';
import 'package:provider/provider.dart';

import 'cart_body.dart';
import 'check_out_card.dart';
var bloc;
class CartScreen extends StatefulWidget {
  static String id="cart_screen";
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  getCart()async{

carts.clear();
var response=await get(Uri.parse(AppInfo.url+
    "show_cart.php?userid=${AppInfo.user.id}&token=${AppInfo.user.token}"));


if(response.statusCode==200)
  {
    var mycart=jsonDecode(response.body);
    for(var c in mycart)
      {
        var p=Product();
        p.id=c["id"];
        p.name=c["name"];
        p.price=c["price"];
        p.photo=AppInfo.url + "images/" + c["photo"];
        carts.add(
          Cart(
              product:p,
          qty: c["qty"],
            srno: c["srno"]
          )
        );
      }
    setState(() {
      carts;
      bloc.numOfItems=carts.length;
    //  print(bloc.numOfItems);
    });
  }
  }



@override
  void initState() {
    getCart();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc=Provider.of<BLOCProvider>(context);
    SizeConfig().init(context);
    return Scaffold(
      body:CartBody(),
      bottomNavigationBar:CheckOutCard() ,
    );
  }
}
