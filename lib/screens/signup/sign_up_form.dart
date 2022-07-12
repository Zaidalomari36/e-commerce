import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:myecomappflutter/confg/app_info.dart';
import 'package:myecomappflutter/confg/app_info.dart';
import 'package:myecomappflutter/confg/formerror.dart';
import 'package:myecomappflutter/confg/my_button.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/screens/home/home_screen.dart';
import 'package:myecomappflutter/screens/signup/signupscreen.dart';

class SignUpForm extends StatefulWidget {

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  String email="";
  String password="";
  String name="";
  String mobile="";
  bool vis=false;
  var errors=[];
  var emailRegExp =RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]");
  var mobileRegExp =RegExp(r"07[0-9]{8}$");
  var formKey=GlobalKey<FormState>();

  addError(String error)
  {
    if(!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  removeError(String error)
  {
    if(errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }
  showMessage(msg){
    showDialog(context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            title: Text(msg),
            actions: [
              FlatButton(onPressed: (){
                Navigator.pop(context);
              }, child:Text("OK") )
            ],
          );
        }
    );
  }

  signUp()async{
    var data={};
    data["email"]=email;
    data["password"]=password;
    data["name"]=name;
    data["mobile"]=mobile;
    //print(data);
    var response=await post(Uri.parse(AppInfo.url+"signup.php"),body: data);
  if(response.statusCode==200){
    formKey.currentState!.save();
    setState(() {
      vis=false;
    });
    var result=jsonDecode(response.body);
    if(result["userid"]==0)
      showMessage("THE EMAIL IS ALREADY EXIST");
    else {
      AppInfo.user.id=result["userid"];
      AppInfo.user.token=result["token"];
      AppInfo.saveUserInfo();
Navigator.pushNamed(context, HomeScreen.id);
    }
  }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            buildEmail(),
            SizedBox(
              height: SizeConfig().getPropotionalHeight(30),
            ),
            buildPassword(),
            SizedBox(
              height: SizeConfig().getPropotionalHeight(30),
            ),
            buildName(),
            SizedBox(
              height: SizeConfig().getPropotionalHeight(30),
            ),
            buildMobile(),
            SizedBox(
              height: SizeConfig().getPropotionalHeight(30),
            ),
            FormError(errors: errors,),
            SizedBox(
              height: SizeConfig().getPropotionalHeight(30),
            ),
            MyButton(
              text: "Sign Up",press: (){
              if(formKey.currentState!.validate())
              {
                formKey.currentState!.save();
                setState(() {
                 vis=true;
                });
                signUp();
              }
            },
            ),
            Visibility(
              visible: vis,
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                child: CircularProgressIndicator(
                  backgroundColor: Color(0xFFFF7643),
                ),

              ),
            )
          ],
        ));
  }
  buildEmail(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved:(value)=>email=value!,
      onChanged: (value)
      {
        if(value.isNotEmpty) {
          removeError("please enter your email");
        } else if(emailRegExp.hasMatch(value)) {
          removeError("Invalid email");
        }
      },
      validator:(value){
        if(value!.isEmpty) {
          addError("please enter your email");
          return "" ;
        } else if(!emailRegExp.hasMatch(value)) {
          addError("Invalid email");
          return "" ;
        } else return null;

      },
      decoration:InputDecoration(
          labelText: "Email",
          hintText: "Enter Your Email",
          suffixIcon: Padding(
            padding: EdgeInsets.all(20),
            child:SvgPicture.asset("assets/images/Mail.svg") ,

          )
      ) ,
    );
  }

  buildPassword(){
    return TextFormField(
      obscureText: true,
      onSaved:(value)=>password=value!,
      onChanged: (value)
      {
        if(value.isNotEmpty) {
          removeError("please enter your password");
        }
      },
      validator:(value){
        if(value!.isEmpty) {
          addError("please enter your Password");
       return "";
        }
        else {
          return null;
        }

      },
      decoration:InputDecoration(
          labelText: "Password",
          hintText: "Enter Your Password",
          suffixIcon: Padding(
            padding: EdgeInsets.all(20),
            child:SvgPicture.asset("assets/images/Lock.svg") ,

          )
      ) ,
    );
  }

  buildName(){
    return TextFormField(
      onSaved:(value)=>name=value!,
      onChanged: (value)
      {
        if(value.isNotEmpty) {
          removeError("please enter your name");
        }
      },
      validator:(value){
        if(value!.isEmpty) {
          addError("please enter your name");
        } else return null;

      },
      decoration:InputDecoration(
          labelText: "Name",
          hintText: "Enter Your name",
          suffixIcon: Padding(
            padding: EdgeInsets.all(20),
            child:SvgPicture.asset("assets/images/User.svg") ,

          )
      ) ,
    );
  }

  buildMobile(){
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved:(value)=>mobile=value!,
      onChanged: (value)
      {
        if(value.isNotEmpty) {
          removeError("please enter your phone number");
        } else if(mobileRegExp.hasMatch(value)) {
          removeError("Invalid phone number");
        }
      },
      validator:(value){
        if(value!.isEmpty) {
          addError("please enter your phone number");
        } else if(!mobileRegExp.hasMatch(value)) {
          addError("Invalid phone number");
        } else return null;

      },
      decoration:InputDecoration(
          labelText: "Phone Number",
          hintText: "Enter Your Phone Number",
          suffixIcon: Padding(
            padding: EdgeInsets.all(20),
            child:SvgPicture.asset("assets/images/Phone.svg") ,

          )
      ) ,
    );
  }
}
