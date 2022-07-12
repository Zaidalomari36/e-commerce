import 'package:myecomappflutter/models/product.dart';
import 'package:myecomappflutter/models/user.dart';
import 'package:myecomappflutter/models/user_address.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInfo{

  static String url="http://ordersapp.paproject.site/";
 static User user=new User();
  static Product product=new Product();
static double total=0.0;
  static UserAddress userAddress=new UserAddress();

 static saveUserInfo() async{

   var sp=await SharedPreferences.getInstance();
   sp.setInt("id", user.id);
   sp.setString("token", user.token);
 }
}