import 'package:flutter/material.dart';

class SizeConfig{
  static late MediaQueryData mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static late Orientation orientation;

  init(BuildContext context)
  {
    mediaQueryData=MediaQuery.of(context);
    screenHeight=mediaQueryData.size.height;
    screenWidth=mediaQueryData.size.width;
    orientation=mediaQueryData.orientation;
  }

  double getPropotionalHeight(double value){
return(value/812)*SizeConfig.screenHeight;
  }

  double getPropotionalWidth(double value){
    return(value/375)*SizeConfig.screenWidth;
  }
}