import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/size_config.dart';

class TopRoundCorner extends StatelessWidget {
final color;
final myWidget;

TopRoundCorner({
  this.color,
  this.myWidget
});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig().getPropotionalWidth(20)),
      padding: EdgeInsets.only(top: SizeConfig().getPropotionalWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
       color: color,
       borderRadius: BorderRadius.only(
         topLeft: Radius.circular(40),
         topRight: Radius.circular(40),
       ),
      ),
      child: myWidget,
    );
  }
}

