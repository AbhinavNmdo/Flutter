import 'package:flutter/material.dart';
import 'package:flutter_catelog/home_widgets/catelog_image.dart';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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