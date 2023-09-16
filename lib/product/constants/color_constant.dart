import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

@immutable
class ColorBackgroundConstant {
  const ColorBackgroundConstant._();

  static Color purplePrimary = HexColor("#475AD7");
  static Color purpleDarker = HexColor("#2536A7");
  static Color white = Colors.white;
}

@immutable
class ColorTextConstant {
  const ColorTextConstant._();

  static Color white = Colors.white;
  static Color grey = Colors.grey;
  static Color black = Colors.black;
  static Color blackGrey = Colors.black54;
  static Color mainColor = HexColor("#475AD7");
}
