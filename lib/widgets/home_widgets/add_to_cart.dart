import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catelog/models/cart.dart';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatefulWidget {
  final catelog;
  const AddtoCart({Key? key, this.catelog}) : super(key: key);

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catelog);
    return ElevatedButton(
      onPressed: () {
        final _catelog = CatelogModel();
        if (!isInCart) {
          _cart.catelog = _catelog;
          _cart.add(widget.catelog);
          setState(() {});
        }
        setState(() {});
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isInCart
          ? const Icon(Icons.done)
          : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
