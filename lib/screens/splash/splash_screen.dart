import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/screens/splash/splash_body.dart';

class SplashScreen extends StatelessWidget {
static String id="splash";

  @override
  Widget build(BuildContext context) {
SizeConfig().init(context);
    return Scaffold(
      body: SplashBody(),
    );
  }
}
