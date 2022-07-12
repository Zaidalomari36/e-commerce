import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/screens/signin/signinform.dart';


class SignInBody extends StatefulWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
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
                  "SignIn Screen",
                  style: TextStyle(
                    fontSize: SizeConfig().getPropotionalWidth(30),
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF7643)
                  ),
                ),
                SignInForm(),
              ],
            ),
          ) ,
        ) );
  }
}
