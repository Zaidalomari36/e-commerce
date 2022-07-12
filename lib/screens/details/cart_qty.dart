import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/bloc_provider.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/screens/details/round_button.dart';
import 'package:provider/provider.dart';


class CartQty extends StatefulWidget {

  @override
  _CartQtyState createState() => _CartQtyState();
}

class _CartQtyState extends State<CartQty> {
  @override
  Widget build(BuildContext context) {
    var bloc=Provider.of<BLOCProvider>(context);
    bloc.qty=1;
    return Container(
      margin: EdgeInsets.all(SizeConfig().getPropotionalWidth(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundButton(
            icon:Icons.remove,
            press: (){
              if(bloc.qty>1)
                bloc.qty--;
            },
          ),
          SizedBox(width: SizeConfig().getPropotionalWidth(10),),
          Text(
            "${bloc.qty}",
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          ),
          SizedBox(width: SizeConfig().getPropotionalWidth(10),),
          RoundButton(
            icon: Icons.add,
            press: (){
              bloc.qty++;
            },
          )
        ],
      ),
    );
  }
}
