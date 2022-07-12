import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/app_info.dart';
import 'package:myecomappflutter/confg/my_button.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/screens/home/home_screen.dart';
import 'package:myecomappflutter/screens/signin/signinscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'splashcontent.dart';

class SplashBody extends StatefulWidget {

  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  int currentPage=0;

  var splashData= [
    {
    "text":"Welcome to My Orders App",
    "image":"assets/images/splash_1.png"
  }
  ,
    {
      "text":"Order anywhere anytime",
      "image":"assets/images/splash_2.png"
    }
    ,
    {
      "text":"Fast Delivery",
      "image":"assets/images/splash_3.png"
    }
  ];


  buildDot(int index)
  {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: SizeConfig().getPropotionalHeight(6),
      width: SizeConfig().getPropotionalWidth(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: currentPage==index?Color(0xFFFF7643) :
        Color(0x8FD8D8D8)

      ),
    );
  }




  checkLoggedUser()async{
    var sp=await SharedPreferences.getInstance();
    if((sp.getInt("id")??-1)>-1){
      AppInfo.user.id=sp.getInt("id")!;
      AppInfo.user.token=sp.getString("token")!;
      Navigator.pushNamed(context, HomeScreen.id);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  checkLoggedUser();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              /*Expanded(child: child,flex: 1,),
              Expanded(child: child,flex: 1,),
              Expanded(child: child,flex: 1,),*/
              Expanded(
                flex: 2,
                  child: PageView.builder(
                      onPageChanged: (value){
                        setState(() {
                          currentPage=value;
                        });
                        },
                    itemCount: splashData.length,
                    itemBuilder: (context,index)=>SplashContent(
                      image : splashData[index]["image"],
                        text: splashData[index]["text"]
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Padding(padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig().getPropotionalWidth(20)
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                            (index)=>buildDot(index),
                        ),
                      ),
                      Spacer(),
                      MyButton(
                      text: "Start",
                         press: (){
                        Navigator.pushNamed(context, SigninScreen.id);
                         },
                      ),
                      Spacer(),
                    ],
                  ),
                  )
              )
            ],
          ),
        )
    );
  }
}

