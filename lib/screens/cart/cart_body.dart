import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:myecomappflutter/confg/app_info.dart';
import 'package:myecomappflutter/confg/bloc_provider.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/models/cart.dart';
import 'package:myecomappflutter/screens/cart/card_item.dart';
import 'package:provider/provider.dart';

class CartBody extends StatefulWidget {

  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override

  deleteFromCart(srno) async{
    var data={};
    data["srno"]=srno;
    data["token"]=AppInfo.user.token;
    post(Uri.parse(AppInfo.url+"delete_cart.php"),body: data);
  }


  Widget build(BuildContext context) {
    var bloc=Provider.of<BLOCProvider>(context);
    return Padding(
        padding:EdgeInsets.symmetric(
          horizontal: SizeConfig().getPropotionalWidth(20),),
    child: ListView.builder(
    itemCount:carts.length,
      itemBuilder: (context,index){
      return Padding(
          padding:EdgeInsets.symmetric(
            horizontal: SizeConfig().getPropotionalHeight(10),),
      child: Dismissible(
        key: Key(carts[index].product.id.toString()),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction){
deleteFromCart(carts[index].srno.toString());
          bloc.numOfItems--;
carts.removeAt(index);
        },
        background: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xffffe6e6)
          ),
          child:Row(
            children: [
              SvgPicture.asset('assets/images/Trash.svg'),
            ],
          ) ,
        ),
        child: CartItem(cart: carts[index],),
      ),
      );
      },
    ),
    );
  }
}
