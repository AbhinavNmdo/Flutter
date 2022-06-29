import 'package:flutter/material.dart';
import 'package:flutter_catelog/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';


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