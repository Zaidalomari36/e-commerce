import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/screens/signup/signupbody.dart';


class SignUpScreen extends StatefulWidget {
  static String id="signup";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
body:SingleChildScrollView(child: SignUpBody()) ,
    );
  }
}

