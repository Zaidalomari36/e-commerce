import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/screens/signup/sign_up_form.dart';


class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:SizedBox(
          width: double.infinity,
          child:Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig().getPropotionalWidth(20)
            ),
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig().getPropotionalHeight(30),
                ),
                Text(
                  "SignUp Screen",
                  style: TextStyle(
                      fontSize: SizeConfig().getPropotionalWidth(30),
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF7643)
                  ),
                ),
                SignUpForm(),
              ],
            ),
          ) ,
        ) );
  }
}
