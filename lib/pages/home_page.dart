import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/widgets/drawer.dart';
import 'package:flutter_catelog/widgets/item_widget.dart';

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

  loadData() async{
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedJson = jsonDecode(catalogJson);
    var productData = decodedJson['products'];
    CatelogModel.items = List.from(productData).map<Item>((item)=>Item.fromMap(item)).toList();
    setState(()=>{});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catelog App'),
      ),
      body: (CatelogModel.items != null && CatelogModel.items.isNotEmpty) ? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemCount: CatelogModel.items.length,
          itemBuilder: (context, index){
            final item = CatelogModel.items[index];
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
              clipBehavior: Clip.antiAlias,
              child: GridTile(
                header: Container(
                  padding: const EdgeInsets.all(12),
                  // decoration: const BoxDecoration(
                  //   color: Colors.deepPurple,
                  // ),
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ),
                footer: Text(item.price.toString()),
                child: Image.network(item.image),
              ),
            );
          }
      ) : const Center(
        child: CircularProgressIndicator(),
      ),
      drawer: MyDrawer(),
    );
  }
}
