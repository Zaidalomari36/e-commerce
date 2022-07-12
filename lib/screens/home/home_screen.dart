import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/size_config.dart';

import 'home_body_screen.dart';


class HomeScreen extends StatefulWidget {
  static String id="home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: HomeBodyScreen(),
    );
  }
}
