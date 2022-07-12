import 'package:flutter/material.dart';
import 'size_config.dart';

class MyButton extends StatelessWidget {
/*late String text;
late Function press;
MyButton(this.text,this.press);*/

  String text;
  var press;
MyButton({required this.text,required this.press});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig().getPropotionalHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Color(0xFFFF7643),
        onPressed: press,
        child:Text(
            text,
        style: TextStyle(
          fontSize: SizeConfig().getPropotionalWidth(18),
          color: Colors.white
        ),) ,
      ),
    );
  }
}
