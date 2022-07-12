import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/size_config.dart';

class SplashContent extends StatelessWidget {

  var text;
  var image;

  SplashContent({required this.image,required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Spacer(),
      Text(
        "My Shop App",
        style:TextStyle(
        color:Color(0xFFFF7643),
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig().getPropotionalWidth(36)
        )
      ),
      Text(text,
      textAlign: TextAlign.center,
      ),
        Spacer(),
        Image.asset(image,
        height:SizeConfig().getPropotionalHeight(265),
        width: SizeConfig().getPropotionalWidth(235),
        )

      ],
    );
  }
}
