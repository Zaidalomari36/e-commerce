import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/app_info.dart';
import 'package:myecomappflutter/confg/my_button.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/models/cart.dart';
import 'package:myecomappflutter/screens/user_location/userlocationscreen.dart';

class CheckOutCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
AppInfo.total=0.0;
    for(var c in carts)
      {
        AppInfo.total+=c.qty*c.product.price;
      }
    return Container(
      height:SizeConfig().getPropotionalHeight(120),
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig().getPropotionalWidth(20),),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Text("${AppInfo.total} JOD",style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 30
          ),),
          Spacer(),
          Container(
            width:SizeConfig().getPropotionalWidth(140),
              child: MyButton(text: "Confim",press: (){
                Navigator.pushNamed(context, UserLocationScreen.id);
              },),
          )
        ],
      )


    );
  }
}
