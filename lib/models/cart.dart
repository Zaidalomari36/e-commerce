import 'package:myecomappflutter/models/product.dart';

class Cart{

   final Product product;
 final qty;
 final int srno;

Cart({
    required this.product,
  this.qty,
  required this.srno
});
}
List <Cart> carts=[];