
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:myecomappflutter/confg/app_info.dart';
import 'package:myecomappflutter/confg/formerror.dart';
import 'package:myecomappflutter/confg/my_button.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/screens/home/home_screen.dart';
import 'package:myecomappflutter/screens/signup/signupscreen.dart';


class SignInForm extends StatefulWidget {

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String email="";
  String password="";
  bool vis=false;
  var errors=[];
  var formKey=GlobalKey<FormState>();
  var emailRegExp =RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]");

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
  login()async{
    var data={};
    data["email"]=email;
    data["password"]=password;

    var response=await post(Uri.parse(AppInfo.url+"login.php"),body: data);
    if(response.statusCode==200){
      formKey.currentState!.save();
      setState(() {
        vis=false;
      });
      var result=jsonDecode(response.body);
      if(result["userid"]==0)
        showMessage("LOGIN IS FAILED");
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
            FormError(errors: errors,),
            SizedBox(
              height: SizeConfig().getPropotionalHeight(30),
            ),
            MyButton(
              text: "Login",press: (){
                if(formKey.currentState!.validate())
                  {
                    formKey.currentState!.save();
                  }
                setState(() {
                  vis =true;
                });
                login();
            },
            ),
            Text("Don't Have account ?"),
            GestureDetector(
                child: Text("Click here",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                  ),),
            onTap: (){
Navigator.pushNamed(context,SignUpScreen.id);
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
        } else {
          return "";
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

}
