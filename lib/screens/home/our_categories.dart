import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myecomappflutter/confg/app_info.dart';
import 'package:myecomappflutter/confg/bloc_provider.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/screens/home/categorycard.dart';
import 'package:provider/provider.dart';

class OurCategories extends StatefulWidget {

  @override
  _OurCategoriesState createState() => _OurCategoriesState();
}

class _OurCategoriesState extends State<OurCategories> {

  Future<List<Map<String, dynamic>>> getCategories() async{
   List<Map<String, dynamic>> categories =[];
var response=await get(Uri.parse(AppInfo.url+"get_categories.php?token=${
    AppInfo.user.token}"));
 if(response.statusCode==200)
   {
     var decodedData=jsonDecode(response.body);
for(var d in decodedData)
  {
    categories.add(
      {
       "id": d["id"],
        "name": d["name"],
        "photo":d["photo"]
      }
    );
  }
   }
 return categories;
 }
  @override
  Widget build(BuildContext context) {

var bloc=Provider.of<BLOCProvider>(context);


    return Container(
      padding: EdgeInsets.all(SizeConfig().getPropotionalWidth(20)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:

        FutureBuilder(
          future: getCategories(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {


            if (snapshot.hasData) {
              List<CategoryCard> cards = [];

              for (var c in snapshot.data!) {
                var mycard = CategoryCard(
                  id: c["id"],
                  name: c["name"],
                  photo: c["photo"],
                  press: () {
                    bloc.categoryid = c["id"];
                  },
                );
                cards.add(mycard);
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: cards,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
