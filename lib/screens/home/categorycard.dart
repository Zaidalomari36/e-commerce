import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myecomappflutter/confg/app_info.dart';
import 'package:myecomappflutter/confg/size_config.dart';

class CategoryCard extends StatelessWidget {

   final  id;
   final name;
   final photo;
   final  press;
   CategoryCard({this.id,
                 this.name,
                 this.photo,
                 this.press});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:press ,
      child: Container(
        width: SizeConfig().getPropotionalWidth(70),
        margin: EdgeInsets.all(SizeConfig().getPropotionalWidth(4)),
        child: Column(
          children: [
            Container(
              padding:EdgeInsets.all(SizeConfig().getPropotionalWidth(10)) ,
              width: SizeConfig().getPropotionalWidth(70),
              height: SizeConfig().getPropotionalHeight(70),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child:SvgPicture.network(AppInfo.url+"images/"+photo),
            ),
            SizedBox(height: SizeConfig().getPropotionalHeight(5),),
            Text("$name",
              textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFF7643),
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }
}

