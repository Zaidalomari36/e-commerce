import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/screens/signin/signinbody.dart';


class SigninScreen extends StatefulWidget {
  static String id="signin";

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(child: SignInBody()),
    );
  }
}
