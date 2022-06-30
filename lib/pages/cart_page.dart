import 'package:flutter/material.dart';
import 'package:flutter_catelog/utils/themes.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: const Key('50'),
      child: Scaffold(
        backgroundColor: MyTheme.creamColor,
        appBar: AppBar(
          title: Text("Cart"),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
