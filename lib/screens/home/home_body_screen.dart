import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/size_config.dart';

import 'home_header.dart';
import 'our_categories.dart';
import 'our_products.dart';


class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig().getPropotionalHeight(20),),
              HomeHeader(),
              SizedBox(height: SizeConfig().getPropotionalHeight(20),),
             OurCategories(),
              SizedBox(height: SizeConfig().getPropotionalHeight(20),),
              OurProducts(),
            ],
          ),
        )
    );
  }
}

