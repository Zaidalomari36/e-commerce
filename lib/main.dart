import 'package:flutter/material.dart';
import 'package:myecomappflutter/screens/cart/cart_screen.dart';
import 'package:myecomappflutter/screens/details/product_details_screen.dart';
import 'package:myecomappflutter/screens/home/home_screen.dart';
import 'package:myecomappflutter/screens/signin/signinscreen.dart';
import 'package:myecomappflutter/screens/signup/signupscreen.dart';
import 'package:myecomappflutter/screens/splash/splash_screen.dart';
import 'package:myecomappflutter/screens/user_location/userlocationscreen.dart';
import 'package:provider/provider.dart';

import 'confg/bloc_provider.dart';

void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_)=>BLOCProvider())
      ],
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

var routes={
  SplashScreen.id:(context)=>SplashScreen(),
  SigninScreen.id:(context)=>SigninScreen(),
  SignUpScreen.id:(context)=>SignUpScreen(),
  HomeScreen.id:(context)=>HomeScreen(),
  ProductDetailsScreen.id:(context)=>ProductDetailsScreen(),
  CartScreen.id:(context)=>CartScreen(),
  UserLocationScreen.id :(context)=>UserLocationScreen()
};

    return MaterialApp(
debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: SplashScreen.id,
    );
  }
}


