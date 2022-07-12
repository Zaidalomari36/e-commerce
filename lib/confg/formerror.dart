import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myecomappflutter/confg/size_config.dart';

class FormError extends StatelessWidget {

  var errors;

  FormError({this.errors});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
          (index)=>Row(
            children: [
              SvgPicture.asset("assets/images/Error.svg",
              height: SizeConfig().getPropotionalHeight(16),
                width: SizeConfig().getPropotionalWidth(16),
              ) ,
SizedBox(width:SizeConfig().getPropotionalWidth(10) ,),
              Text(errors[index],style: TextStyle(color: Colors.red),)
            ],
          )
      ),
    );
  }
}
