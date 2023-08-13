import 'package:flutter/material.dart';

class AppColor {
  static const Color blue = Color(0xff32538d);
  static const Color offWhite = Color(0xffF9F8F6);
  static const Color white = Color(0xffFFFFFF);
  static const Color orange = Color(0xffed8a0a);
  static const Color honeydew = Color(0xffd9E5D6);
  static const Color vanilla = Color(0xffEDDEA4);
  static const Color tomato = Color(0xffF95738);
  static const Color moonStone = Color(0xff0FA3B1);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
