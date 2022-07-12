import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:myecomappflutter/confg/app_info.dart';
import 'package:myecomappflutter/confg/formerror.dart';
import 'package:myecomappflutter/confg/my_button.dart';
import 'package:myecomappflutter/confg/size_config.dart';
import 'package:myecomappflutter/models/user_address.dart';

class UserLocationScreen extends StatefulWidget {
static String id="userlocation";
  @override
  _UserLocationScreenState createState() => _UserLocationScreenState();
}

class _UserLocationScreenState extends State<UserLocationScreen> {
  @override
  var city =TextEditingController();
  var area =TextEditingController();
  var street =TextEditingController();
  var notes =TextEditingController();
  bool visible=false;
  var formKey=GlobalKey<FormState>();
List<String>errors=[];
  List<UserAddress> userAddresses=[];

  removeError(String error) {
    if(errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  addError(String error) {
    if(!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  addUserAddress()async{
    var data={};
data["userid"]=AppInfo.user.id.toString();
    data["token"]=AppInfo.user.token.toString();
data["lat"]=AppInfo.userAddress.lat.toString();
    data["lon"]=AppInfo.userAddress.lon.toString();
    data["city"]=AppInfo.userAddress.city;
    data["area"]=AppInfo.userAddress.area;
    data["street"]=AppInfo.userAddress.street;
    data["notes"]=AppInfo.userAddress.notes;
    var response=await post(Uri.parse(AppInfo.url+"add_address.php"),body: data);
 if(response.statusCode==200)
   {
     setState(() {
       visible=false;
     });
     Navigator.pop(context);
   }
  }

  getGeoAddress()async{
    var position=await Geolocator.getCurrentPosition(
        desiredAccuracy:LocationAccuracy.high);
    var place=await placemarkFromCoordinates(
        position.latitude, position.longitude,localeIdentifier: "en");
    AppInfo.userAddress.lat=position.latitude;
    AppInfo.userAddress.lon=position.longitude;
    AppInfo.userAddress.city=place[0].locality.toString();
    AppInfo.userAddress.area=place[0].subLocality.toString();
    AppInfo.userAddress.street=place[0].street.toString();
  }

  getUserAddresses() async{
    var response=await get(Uri.parse(AppInfo.url+
        "get_addresses.php?userid=${AppInfo.user.id}&token=${AppInfo.user.token}"));
  if(response.statusCode==200)
    {
      var addresses=jsonDecode(response.body);
      for(var adrs in addresses) {
        var ua = UserAddress();
        ua.id=adrs["id"];
        ua.lat=adrs["lat"];
        ua.lon=adrs["lon"];
        ua.city=adrs["city"];
        ua.area=adrs["area"];
        ua.street=adrs["street"];
        ua.notes=adrs["notes"];
        userAddresses.add(ua);
      }

    }
  }

  showAddressForm() async {
    showModalBottomSheet(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    backgroundColor:Color(0xFFFF7643),
      context: context,
      builder: (context){
       return SizedBox(
         width: double.infinity,
         child: Padding(
           padding: EdgeInsets.all(20),
           child: SingleChildScrollView(
             child: Column(
              children: [
                Form(
                  key: formKey,
                  child:Column(
                    children: [
                      buildCity(),
                      SizedBox(height:SizeConfig().getPropotionalHeight(16),),
                      buildArea(),
                      SizedBox(height:SizeConfig().getPropotionalHeight(16),),
                      buildStreet(),
                      SizedBox(height:SizeConfig().getPropotionalHeight(16),),
                      buildNotes(),
                      SizedBox(height:SizeConfig().getPropotionalHeight(16),),
                      FormError(errors: errors,),
                      SizedBox(height:SizeConfig().getPropotionalHeight(16),),
                      MyButton(text: "Add", press: (){
                        if(formKey.currentState!.validate())
                        {
                          formKey.currentState!.save();
                          setState(() {
                            visible=true;
                            addUserAddress();
                          });

                        }
                      }),
                      Visibility(
                        visible: visible,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: CircularProgressIndicator(
                            backgroundColor: Color(0xFFFF7643),
                          ),

                        ),
                      )
                    ],
                  ) ,
                ),
              ],
             ),
           ),
         ),
       );
      }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGeoAddress();
    getUserAddresses();
  }


@override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container();
  }
  buildCity(){
    return TextFormField(
      controller: city,
      onSaved:(value)=>AppInfo.userAddress.city=value!,
      onChanged: (value)
      {
        if(value.isNotEmpty) {
          removeError("please enter your city");
        }
      },
      validator:(value){
        if(value!.isEmpty) {
          addError("please enter your city");
        } else return null;

      },
      decoration:InputDecoration(
          focusColor: Color(0xFFFF7643),
          labelText: "City Name",
          hintText: "Enter Your city name",
          suffixIcon: Padding(
            padding: EdgeInsets.all(20),
            child:SvgPicture.asset("assets/images/Location.svg") ,

          )
      ) ,
    );
  }
  buildArea(){
    return TextFormField(
      controller: area,
      onSaved:(value)=>AppInfo.userAddress.area=value!,
      onChanged: (value)
      {
        if(value.isNotEmpty) {
          removeError("please enter your area");
        }
      },
      validator:(value){
        if(value!.isEmpty) {
          addError("please enter your area");
        } else return null;

      },
      decoration:InputDecoration(
        focusColor: Color(0xFFFF7643),
          labelText: "Area Name",
          hintText: "Enter Your area name",
          suffixIcon: Padding(
            padding: EdgeInsets.all(20),
            child:SvgPicture.asset("assets/images/Location.svg") ,

          )
      ) ,
    );
  }
  buildStreet(){
    return TextFormField(
      controller: street,
      onSaved:(value)=>AppInfo.userAddress.street=value!,
      onChanged: (value)
      {
        if(value.isNotEmpty) {
          removeError("please enter your street Name");
        }
      },
      validator:(value){
        if(value!.isEmpty) {
          addError("please enter your street Name");
        } else return null;

      },
      decoration:InputDecoration(
          focusColor: Color(0xFFFF7643),
          labelText: "street Name",
          hintText: "Enter Your street name",
          suffixIcon: Padding(
            padding: EdgeInsets.all(20),
            child:SvgPicture.asset("assets/images/Street.svg") ,

          )
      ) ,
    );
  }
  buildNotes(){
    return TextFormField(
      controller: notes,
      onSaved:(value)=>AppInfo.userAddress.notes=value!,
      onChanged: (value)
      {
        if(value.isNotEmpty) {
          removeError("please enter your flat number");
        }
      },
      validator:(value){
        if(value!.isEmpty) {
          addError("please enter your flat number");
        } else return null;

      },
      decoration:InputDecoration(
          focusColor: Color(0xFFFF7643),
          labelText: "Flat No",
          hintText: "Enter Your Flat No",
          suffixIcon: Padding(
            padding: EdgeInsets.all(20),
            child:SvgPicture.asset("assets/images/Flat.svg") ,

          )
      ) ,
    );
  }

}
