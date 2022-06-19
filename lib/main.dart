import "package:flutter/material.dart";

import 'home_page.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  String name = 'Abhay';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
