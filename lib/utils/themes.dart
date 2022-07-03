import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: darkBluishColor,
      accentColor: darkBluishColor,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            fontSize: 22,
            color: Colors.black,
          )));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      buttonColor: lightBluishColor,
      accentColor: Colors.white,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            fontSize: 22,
            color: Colors.white,
          )));

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;

  static void lightStatusNavBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyTheme.creamColor,
      systemNavigationBarColor: MyTheme.creamColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  static void darkStatusNavBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyTheme.darkCreamColor,
      systemNavigationBarColor: MyTheme.darkCreamColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }
}
