import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatelogHeader(),
              if(CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                CatelogList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      )
    );
  }
}



class CatelogHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catelog App".text.bold.xl5.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}


class CatelogList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatelogModel.items.length,
      itemBuilder: (context, index){
        final catelog = CatelogModel.items[index];
        return CatelogItem(catelog: catelog);
      },
    );
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({super.key, required this.catelog})
      : assert(catelog!=null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatelogImage(image: catelog.image),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catelog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                catelog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catelog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.darkBluishColor
                        ),
                        shape: MaterialStateProperty.all(
                          StadiumBorder()
                        ),
                      ),
                      child: "Buy".text.make(),
                    )
                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          )
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}


class CatelogImage extends StatelessWidget {
  final String image;

  const CatelogImage({super.key, required this.image}) : assert(image!=null);

  @override
  Widget build(BuildContext context) {
    return Image.network(
        image
    ).box.p8.rounded.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
