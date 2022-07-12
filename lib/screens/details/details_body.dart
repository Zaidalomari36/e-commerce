
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myecomappflutter/confg/app_info.dart';
import 'package:myecomappflutter/confg/bloc_provider.dart';
import 'package:myecomappflutter/confg/my_button.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/screens/cart/cart_screen.dart';
import 'package:myecomappflutter/screens/details/product_image.dart';
import 'package:myecomappflutter/screens/details/top_round_corner.dart';
import 'package:provider/provider.dart';

import 'cart_qty.dart';

class DetailsBody extends StatefulWidget {

  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  late var bloc;



  addToCart() async {
    var data = {};
    data["userid"] = AppInfo.user.id.toString();
    data["productid"] = AppInfo.product.id.toString();
    data["qty"] = bloc.qty.toString();
    data["token"] = AppInfo.user.token;

    var response =
    await post(Uri.parse(AppInfo.url + "add_to_cart.php"), body: data);
    if (response.statusCode == 200)

      Navigator.pushNamed(context, CartScreen.id);
  }
  @override
  Widget build(BuildContext context) {
    bloc=Provider.of<BLOCProvider>(context);
    return ListView(
      children: [
        SizedBox(
          height: SizeConfig().getPropotionalHeight(20),
        ),
        ProductImage(
          id : AppInfo.product.id,
          photo: AppInfo.url+"images/"+AppInfo.product.photo
        ),
        SizedBox(
          height: SizeConfig().getPropotionalHeight(20),
        ),
        TopRoundCorner(
          color: Colors.white,
          myWidget: Container(
           padding: EdgeInsets.all(SizeConfig().getPropotionalWidth(10)),
            child: Column(
              children: [
                Text(AppInfo.product.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
                ),
                SizedBox(
                  height: SizeConfig().getPropotionalHeight(20),
                ),
                Text(AppInfo.product.details,),
                Text("price :"+AppInfo.product.price.toString()+"\$",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF7643)
                  ),
                ),
              ],
            ),
          ),
        ),
        CartQty(),
        SizedBox(
          height: SizeConfig().getPropotionalHeight(20),
        ),
        Container(
            child: MyButton(text: "Add To My Cart", press: (){
              addToCart();
            }),
        margin: EdgeInsets.symmetric(horizontal: 15),
        )
      ],
    );
  }
}
