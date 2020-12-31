import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static final Color appThemeColor = Colors.cyan;
  static final Color appColor = Colors.black;

  static String appName = "Aalgro Music";
  static String splashScreenTitle = "Splash Screen";

  // Image url's
  static String splashScreenImageUrl =
      "https://png.pngtree.com/png-clipart/20190520/original/pngtree-headphone-music-logo-and-icon-design-template-png-image_3555906.jpg";


  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
