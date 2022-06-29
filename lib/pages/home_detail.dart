import 'package:flutter/material.dart';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catelog;

  const HomeDetailPage({super.key, required this.catelog})
      : assert(catelog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catelog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all(const StadiumBorder()),
              ),
              child: "Buy".text.make(),
            ).wh(100, 50)
          ],
        ).p20(),
      ),
      appBar: AppBar(),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catelog.id.toString()),
                    child: Image.network(catelog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Column(
                      children: [
                        catelog.name.text.xl4
                            .color(MyTheme.darkBluishColor)
                            .bold
                            .make(),
                        const HeightBox(10),
                        catelog.desc.text
                            .textStyle(context.captionStyle)
                            .make(),
                      ],
                    ).py64()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
