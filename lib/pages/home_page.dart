import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catelog/core/store.dart';
import 'package:flutter_catelog/models/cart.dart';
import 'dart:convert';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/utils/routes.dart';
import 'package:flutter_catelog/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catelog_header.dart';
import '../widgets/home_widgets/catelog_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/v3/b/62c7a3aa4bccf21c2ed44235";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedJson = jsonDecode(catalogJson);
    var productData = decodedJson['record']['products'];
    print(productData);
    CatelogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness == Brightness.light
        ? MyTheme.lightStatusNavBar()
        : MyTheme.darkStatusNavBar();

    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: (context, _, __) => FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute);
            },
            backgroundColor: Theme.of(context).buttonColor,
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
            heroTag: const Key('50'),
          ).badge(
              color: Vx.red600,
              size: 22,
              count: _cart.items.length,
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
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
