import 'package:flutter/material.dart';
import 'package:myecomappflutter/confg/size_config.dart';

class ProductImage extends StatefulWidget {
final id;
final photo;
ProductImage({
  this.id,
  this.photo
});
  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeConfig().getPropotionalWidth(256),
          child: Hero(
            tag: widget.id,
            child: Image.network(widget.photo),
          ),
        ),
      ],
    );
  }
}
