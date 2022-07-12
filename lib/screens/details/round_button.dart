import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/size_config.dart';

class RoundButton extends StatelessWidget {
  final icon;
  final press;

  RoundButton({this.icon, this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig().getPropotionalHeight(40),
      width: SizeConfig().getPropotionalWidth(40),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 6),
            blurRadius: 10,
            color: Color(0xFFB0B0B0).withOpacity(0.2),
          ),
        ],
      ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}

