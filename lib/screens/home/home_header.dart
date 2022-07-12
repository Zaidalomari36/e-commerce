import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/models/cart.dart';
import 'package:myecomappflutter/screens/cart/cart_screen.dart';

class HomeHeader extends StatelessWidget {
String search="";
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig().getPropotionalWidth(20)),
    child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
  searchField(),
  buildRoundIcon("assets/images/Cart.svg",
      (){
    Navigator.pushNamed(context, CartScreen.id);
      },carts.length),
  buildRoundIcon("assets/images/Bell.svg",(){},0 )

],
    ),
    );
  }
  searchField(){
return Container(
  width:SizeConfig.screenWidth*0.6,
  decoration: BoxDecoration(
    color: Colors.grey.withOpacity(0.1),
    borderRadius: BorderRadius.circular(15),
  ),
  child: TextField(
    onChanged:(value)=>search=value ,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig().getPropotionalWidth(20),
        vertical: SizeConfig().getPropotionalHeight(10),
      ),
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide:BorderSide(
          color: Color(0xFFFF7643)),
        borderRadius: BorderRadius.circular(15),
      ),
      hintText: "Search Product",
    prefixIcon: Icon(Icons.search,color:Color(0xFFFF7643) ,)
    ),
  ),
);
  }

buildRoundIcon(icn,press,num){
return GestureDetector(

  child:
  InkWell(

    borderRadius:BorderRadius.circular(100),

    child: Stack(

      overflow: Overflow.visible,

      children: [

        Container(

          padding: EdgeInsets.all(SizeConfig().getPropotionalWidth(12)),

          height: SizeConfig().getPropotionalHeight(48),

          width: SizeConfig().getPropotionalWidth(48),

          decoration: BoxDecoration(

            color: Colors.grey.withOpacity(0.3),

            shape: BoxShape.circle

          ),

          child: SvgPicture.asset(icn),

        ),

  Positioned(

  top: -3,

      right: 0,

    child: Container(

      height: SizeConfig().getPropotionalHeight(18),

      width: SizeConfig().getPropotionalWidth(18),

      decoration: BoxDecoration(

          color: Color(0xFFFF7643),

          shape: BoxShape.circle

      ),

  child: Center(

    child:Text("$num",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),) ,

  ),

    ),

  )

      ],

    ),

  ),
  onTap:press ,
);
}
}
