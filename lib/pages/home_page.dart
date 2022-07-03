import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/pages/cart_page.dart';
import 'package:flutter_catelog/utils/routes.dart';
import 'package:flutter_catelog/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catelog_header.dart';
import '../widgets/home_widgets/catelog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedJson = jsonDecode(catalogJson);
    var productData = decodedJson['products'];
    CatelogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness == Brightness.light
        ? MyTheme.lightStatusNavBar()
        : MyTheme.darkStatusNavBar();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: Theme.of(context).buttonColor,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
          heroTag: const Key('50'),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatelogHeader(),
                if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                  CatelogList().pOnly(top: 12).expand()
                else
                  const CircularProgressIndicator().centered().expand()
              ],
            ),
          ),
        ));
  }
}
